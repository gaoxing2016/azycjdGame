package com.anzhi.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.util.Hex;
import com.anzhi.web.util.ImageUtil;
import com.anzhi.web.util.Sha1HashArithmetic;

public class AddBookSuNing{
	
	private static final boolean hexcase = false;  
    private static final String b64pad = "=";  
    private static final int chrsz = 8;
	//生产环境品牌编码：X043	
	//生产环境供应商密钥：AVHvC0s0H530e6191268
	private String supplyId="X045";
	private String key="Ij1vPHOi12wx03L6b6fq";
	private String synEbookBooksInfo="http://58.240.86.161/esbadapter/EbookArticleContentMgmt_ALL/synEbookBooksInfo";
	private String synEbookChapterContent="http://58.240.86.161/esbadapter/EbookArticleContentMgmt_ALL/synEbookChapterContent";
	private String synEbookBooksCover="http://58.240.86.161/esbadapter/EbookArticleContentMgmt_ALL/synEbookBooksCover";
	private String submitEbookChapter="http://58.240.86.161/esbadapter/EbookArticleContentMgmt_ALL/submitEbookChapter";
	
	public AddBookSuNing(AnzhiNovel an,List<AnzhiChapter> chapterList,int freeChapter,String authorSummary,String path){
		synEbookBooksInfo(an,freeChapter,authorSummary);
		synEbookChapterContent(chapterList);
		synEbookBooksCover(an,path);
		submitEbookChapter(an,chapterList);
	}
	
	public void synEbookChapterContent(List<AnzhiChapter> chapterList){
		Element Resource=this.addElement("Resource", null);
		for(int i=chapterList.size()-1;i>=0;i--){
			AnzhiChapter ac=chapterList.get(i);
			Element Book=this.addElement("Book", null);
			Book.add(this.addElement("bookId", ac.getNovelId(),false));
			Book.add(this.addElement("supplyId", supplyId,false));
			Book.add(this.addElement("chapterNo",(i+1),false));
			Book.add(this.addElement("chapterName",ac.getChapterTitle(),false));
			Book.add(this.addElement("content",ac.getChapterTitle()+"\r\n"+ac.getChapterContent(),false));
			
			String d=(ac.getNovelId()+ac.getChapterTitle()+supplyId+(i+1)+key);
			List<String> ls=new ArrayList<String>();
			ls.add(d);
			try {
				Sha1HashArithmetic sha1=new Sha1HashArithmetic(ls);
				String selfDS=sha1.sha1Hash();
				Book.add(this.addElement("digitalSignature", selfDS,false));
				//System.out.println(selfDS);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Resource.add(Book);
		}
		sendHttp(synEbookChapterContent, Resource.asXML());
	}
	
	public void synEbookBooksCover(AnzhiNovel an,String path){
		Element Resource=this.addElement("Resource", null);
		Element Book=this.addElement("Book", null);
		Book.add(this.addElement("bookId", an.getId(),false));
		Book.add(this.addElement("supplyId", supplyId,false));
		ImageUtil ii=new ImageUtil();
		if(an.getNovelImg()!=null){
			String imgTypeArr=an.getNovelImg();
			String imgType=imgTypeArr.substring(imgTypeArr.lastIndexOf(".")+1,imgTypeArr.length());
			String bs=ii.convertImageToByte(path+an.getNovelImg(), imgType);
			Book.add(this.addElement("imgContent", bs,false));
		}
		
		
		
		String d=(supplyId+key);
		List<String> ls=new ArrayList<String>();
		ls.add(d);
		try {
			Sha1HashArithmetic sha1=new Sha1HashArithmetic(ls);
			String selfDS=sha1.sha1Hash();
			Book.add(this.addElement("digitalSignature", selfDS,false));
			//System.out.println(selfDS);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Resource.add(Book);	
		sendHttp(synEbookBooksCover, Resource.asXML());
	}
	
	public void submitEbookChapter(AnzhiNovel an,List<AnzhiChapter> chapterList){
		Element Resource=this.addElement("Resource", null);
		Element Book=this.addElement("Book", null);
		Book.add(this.addElement("bookId", an.getId(),false));
		Book.add(this.addElement("supplyId", supplyId,false));
		int endId=chapterList.size();
		Book.add(this.addElement("chapterNums",endId,false));
		
		String d=(an.getId()+supplyId+endId+key);
		List<String> ls=new ArrayList<String>();
		ls.add(d);
		try {
			Sha1HashArithmetic sha1=new Sha1HashArithmetic(ls);
			String selfDS=sha1.sha1Hash();
			Book.add(this.addElement("digitalSignature", selfDS,false));
			//System.out.println(selfDS);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Resource.add(Book);
		sendHttp(submitEbookChapter, Resource.asXML());
	}
	
	public void synEbookBooksInfo(AnzhiNovel an,int freeChapter,String authorSummary){
		Element Resource=this.addElement("Resource", null);
		Element Book=this.addElement("Book", null);
		Book.add(this.addElement("bookId", an.getId(),false));
		Book.add(this.addElement("bookName", an.getNovelTitle(),false));
		Book.add(this.addElement("author", an.getAuthorWriterName(),false));
		Book.add(this.addElement("bookState", an.getAuthorizationLevel()==0?2:1,false));
		Book.add(this.addElement("description", an.getVote(),false));
		Book.add(this.addElement("coverUrl", "http://www.azycjd.com/"+an.getNovelImg(),false));
		Book.add(this.addElement("supplyId", supplyId,false));
		Book.add(this.addElement("categ", getNovelTypeNo(an.getNovelType()),false));
		Book.add(this.addElement("newCateg", getNovelClassId(an.getNovelType()),false));
		Book.add(this.addElement("local", 1,false));
		Book.add(this.addElement("pricingMode", 1,false));
		Book.add(this.addElement("freeChapter",freeChapter,false));
		Book.add(this.addElement("paperPrice", 0.04,false));
		Book.add(this.addElement("deadline", "2017-01-01",false));
		Book.add(this.addElement("authorSummary", authorSummary,false));
		Book.add(this.addElement("mediaComment", "",false));
		String d=(an.getId()+an.getNovelTitle()+supplyId+key);
		List<String> ls=new ArrayList<String>();
		ls.add(d);
		try {
			Sha1HashArithmetic sha1=new Sha1HashArithmetic(ls);
			String selfDS=sha1.sha1Hash();
			Book.add(this.addElement("digitalSignature", selfDS,false));
			//System.out.println(selfDS);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Resource.add(Book);	
		sendHttp(synEbookBooksInfo, Resource.asXML());
	}
	
	public String shaHash(String str){
		try {
			MessageDigest sha1=MessageDigest.getInstance("sha-1");
			if(str!=null){
				sha1.update(str.getBytes());
			}
			byte[] r=sha1.digest();
			Hex h=new Hex();
			return h.encodeHexStr(r);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	public String printHexString(byte[] b) {
		String a = "";
		for (int i = 0; i < b.length; i++) {
			String hex = Integer.toHexString(b[i] & 0xFF);
			if (hex.length() == 1) {
				hex = '0' + hex;
			}

			a = a + hex;
		}

		return a;
	}
	// 加密  
    public String getBase64(String str) {  
        byte[] b = null;  
        String s = null;  
        try {  
            b = str.getBytes("utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        if (b != null) {  
            s = new BASE64Encoder().encode(b);  
        }  
        return s;  
    }  
  
    // 解密  
    public String getFromBase64(String s) {  
        byte[] b = null;  
        String result = null;  
        if (s != null) {  
            BASE64Decoder decoder = new BASE64Decoder();  
            try {  
                b = decoder.decodeBuffer(s);  
                result = new String(b, "utf-8");  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        return result;  
    }  
	
	public String getNovelClassId(String novelType){
		String tadutype="140200,现代修真;150400,异能超能;150500,帮派江湖;150600,都市逆袭;151000,校园异能;150800,现实百态;150900,乡村情缘;110400,异界争霸;170200,穿越重生;220100,未来世界;220200,星际战争;220400,末日危机;220600,数字生命;220700,进化变异;110100,东方玄幻;110300,远古神话;140400,洪荒封神;220500,古武机甲;120100,西方奇幻;120200,领主贵族;120300,亡灵异族;120400,魔法校园;130100,传统武侠;130200,浪子异侠;140300,奇幻修真;160100,战争幻想;160200,谍战特工;160300,军旅生涯;160400,抗战烽火;210100,侦探推理;210400,悬疑探险;150100,官场风云;240400,弈林春秋;130300,国术武技;230100,虚拟网游;230200,电子竞技;230300,游戏生涯;230400,游戏异界;240100,体育竞技;240200,篮球运动;240300,足球运动;150300,豪门恩怨;150700,娱乐明星;260200,现代言情;150200,商战职场;220300,时空穿梭;260300,穿越重生;170100,架空历史;170300,历史传记;110200,异界大陆;260100,古代言情;140100,古典仙侠;260400,青春校园;210200,恐怖惊悚;210300,灵异奇谈;250100,动漫同人;250200,武侠同人;250300,影视同人;250400,游戏同人;260500,耽美同人;";
		String[] arr=tadutype.split(";");
		if(novelType.equals("")){
			return "";
		}
		String id=1+"";
		String[] nt=novelType.split("/");
		String[] nt3=null;
		if(nt.length!=0){
			String[] nt1=nt[0].split("@");
			if(nt1.length!=0){
				nt3=nt1[1].split(";");
			}
		}
		if(nt3!=null){
			for(int i=0;i<arr.length;i++){
				String[] tmp=arr[i].split(",");
				boolean con=true;
				for(int j=0;j<nt3.length;j++){
					if(nt3[j].equals(tmp[1])){
						id=tmp[0];
						con=false;
						break;
					}
				}
				if(!con){
					break;
				}
			}
		}
		
		return id;
	}
	
	public String getNovelTypeNo(String novelType){
		if(novelType.indexOf("玄幻")!=-1){
			return "R9000155";
		}else if(novelType.indexOf("奇幻")!=-1){
			return "R9000156";
		}else if(novelType.indexOf("武侠")!=-1){
			return "R9000157";
		}else if(novelType.indexOf("仙侠")!=-1){
			return "R9000158";
		}else if(novelType.indexOf("都市")!=-1){
			return "R9000159";
		}else if(novelType.indexOf("言情")!=-1){
			return "R9000160";
		}else if(novelType.indexOf("军事")!=-1){
			return "R9000161";
		}else if(novelType.indexOf("悬疑")!=-1){
			return "R9000162";
		}else if(novelType.indexOf("历史")!=-1){
			return "R9000163";
		}else if(novelType.indexOf("游戏")!=-1){
			return "R9000164";
		}else if(novelType.indexOf("科幻")!=-1){
			return "R9000165";
		}else if(novelType.indexOf("竞技")!=-1){
			return "R9000166";
		}else{
			return "R9000157";
		}
	}
	
	
	public void sendHttp(String urlStr,String xmlInfo){
		try {
            URL url = new URL(urlStr);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setDoOutput(true);
            con.setRequestProperty("Cache-Control", "no-cache");
            con.setRequestProperty("Content-Type", "text/xml");
            con.setRequestProperty("Charsert", "UTF-8");
            
            con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setRequestMethod("POST");

            
            OutputStreamWriter out = new OutputStreamWriter(con
                    .getOutputStream(),"utf-8");  
           
            xmlInfo="<?xml version='1.0' encoding='UTF-8'?>"+xmlInfo;
            out.write(xmlInfo);
            out.flush();
            out.close();
            
            BufferedReader br = new BufferedReader(new InputStreamReader(con
                    .getInputStream()));
            String line = "";
            for (line = br.readLine(); line != null; line = br.readLine()) {
                System.out.println(new String(line.getBytes(),"utf-8"));
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	
	
	// 得到字符串SHA-1值的方法  
    public  String hex_sha1(String s) {  
        s = (s == null) ? "" : s;  
        return binb2hex(core_sha1(str2binb(s), s.length() * chrsz));  
    }  
  
    public  String b64_hmac_sha1(String key, String data) {  
        return binb2b64(core_hmac_sha1(key, data));  
    }  
  
    public  String b64_sha1(String s) {  
        s = (s == null) ? "" : s;  
        return binb2b64(core_sha1(str2binb(s), s.length() * chrsz));  
    }  
  
    private  String binb2b64(int[] binarray) {  
        String tab = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz0123456789+/";  
        String str = "";  
        binarray = strechbinarray(binarray, binarray.length * 4);  
  
        for (int i = 0; i < binarray.length * 4; i += 3) {  
            int triplet = (((binarray[i >> 2] >> 8 * (3 - i % 4)) & 0xff) << 16)  
                    | (((binarray[i + 1 >> 2] >> 8 * (3 - (i + 1) % 4)) & 0xff) << 8)  
                    | ((binarray[i + 2 >> 2] >> 8 * (3 - (i + 2) % 4)) & 0xff);  
  
            for (int j = 0; j < 4; j++) {  
                if (i * 8 + j * 6 > binarray.length * 32) {  
                    str += b64pad;  
                } else {  
                    str += tab.charAt((triplet >> 6 * (3 - j)) & 0x3f);  
                }  
            }  
        }  
  
        return cleanb64str(str);  
    }  
  
    private  String binb2hex(int[] binarray) {  
        String hex_tab = hexcase ? "0123456789abcdef" : "0123456789abcdef";  
        String str = "";  
  
        for (int i = 0; i < binarray.length * 4; i++) {  
            char a = (char) hex_tab.charAt((binarray[i >> 2] >> ((3 - i % 4) * 8 + 4)) & 0xf);  
            char b = (char) hex_tab.charAt((binarray[i >> 2] >> ((3 - i % 4) * 8)) & 0xf);  
            str += (new Character(a).toString() + new Character(b).toString());  
        }  
  
        return str;  
    }  
  
    private  String binb2str(int[] bin) {  
        String str = "";  
        int mask = (1 << chrsz) - 1;  
  
        for (int i = 0; i < bin.length * 32; i += chrsz) {  
            str += (char) ((bin[i >> 5] >>> (24 - i % 32)) & mask);  
        }  
  
        return str;  
    }  
  
    private  int bit_rol(int num, int cnt) {  
        return (num << cnt) | (num >>> (32 - cnt));  
    }  
  
    private  String cleanb64str(String str) {  
        str = (str == null) ? "" : str;  
        int len = str.length();  
  
        if (len <= 1) {  
            return str;  
        }  
  
        char trailchar = str.charAt(len - 1);  
        String trailstr = "";  
  
        for (int i = len - 1; i >= 0 && str.charAt(i) == trailchar; i--) {  
            trailstr += str.charAt(i);  
        }  
  
        return str.substring(0, str.indexOf(trailstr));  
    }  
  
    private  int[] complete216(int[] oldbin) {  
        if (oldbin.length >= 16) {  
            return oldbin;  
        }  
  
        int[] newbin = new int[16 - oldbin.length];  
  
        for (int i = 0; i < newbin.length; newbin[i] = 0, i++)  
            ;  
  
        return concat(oldbin, newbin);  
    }  
  
    private  int[] concat(int[] oldbin, int[] newbin) {  
        int[] retval = new int[oldbin.length + newbin.length];  
  
        for (int i = 0; i < (oldbin.length + newbin.length); i++) {  
            if (i < oldbin.length) {  
                retval[i] = oldbin[i];  
            } else {  
                retval[i] = newbin[i - oldbin.length];  
            }  
        }  
  
        return retval;  
    }  
  
    private  int[] core_hmac_sha1(String key, String data) {  
        key = (key == null) ? "" : key;  
        data = (data == null) ? "" : data;  
        int[] bkey = complete216(str2binb(key));  
  
        if (bkey.length > 16) {  
            bkey = core_sha1(bkey, key.length() * chrsz);  
        }  
  
        int[] ipad = new int[16];  
        int[] opad = new int[16];  
  
        for (int i = 0; i < 16; ipad[i] = 0, opad[i] = 0, i++)  
            ;  
  
        for (int i = 0; i < 16; i++) {  
            ipad[i] = bkey[i] ^ 0x36363636;  
            opad[i] = bkey[i] ^ 0x5c5c5c5c;  
        }  
  
        int[] hash = core_sha1(concat(ipad, str2binb(data)), 512 + data.length() * chrsz);  
  
        return core_sha1(concat(opad, hash), 512 + 160);  
    }  
  
    private  int[] core_sha1(int[] x, int len) {  
        int size = (len >> 5);  
        x = strechbinarray(x, size);  
        x[len >> 5] |= 0x80 << (24 - len % 32);  
        size = ((len + 64 >> 9) << 4) + 15;  
        x = strechbinarray(x, size);  
        x[((len + 64 >> 9) << 4) + 15] = len;  
  
        int[] w = new int[80];  
        int a = 1732584193;  
        int b = -271733879;  
        int c = -1732584194;  
        int d = 271733878;  
        int e = -1009589776;  
  
        for (int i = 0; i < x.length; i += 16) {  
            int olda = a;  
            int oldb = b;  
            int oldc = c;  
            int oldd = d;  
            int olde = e;  
  
            for (int j = 0; j < 80; j++) {  
                if (j < 16) {  
                    w[j] = x[i + j];  
                } else {  
                    w[j] = rol(w[j - 3] ^ w[j - 8] ^ w[j - 14] ^ w[j - 16], 1);  
                }  
  
                int t = safe_add(safe_add(rol(a, 5), sha1_ft(j, b, c, d)), safe_add(safe_add(e, w[j]), sha1_kt(j)));  
  
                e = d;  
                d = c;  
                c = rol(b, 30);  
                b = a;  
                a = t;  
            }  
  
            a = safe_add(a, olda);  
            b = safe_add(b, oldb);  
            c = safe_add(c, oldc);  
            d = safe_add(d, oldd);  
            e = safe_add(e, olde);  
        }  
  
        int[] retval = new int[5];  
  
        retval[0] = a;  
        retval[1] = b;  
        retval[2] = c;  
        retval[3] = d;  
        retval[4] = e;  
  
        return retval;  
    }  
  
    private  void dotest() {  
        String key = "key";  
        String data = "data";  
        System.out.println("hex_sha1(" + data + ")=" + hex_sha1(data));  
        System.out.println("b64_sha1(" + data + ")=" + b64_sha1(data));  
        System.out.println("str_sha1(" + data + ")=" + str_sha1(data));  
        System.out.println("hex_hmac_sha1(" + key + "," + data + ")=" + hex_hmac_sha1(key, data));  
        System.out.println("b64_hmac_sha1(" + key + "," + data + ")=" + b64_hmac_sha1(key, data));  
        System.out.println("str_hmac_sha1(" + key + "," + data + ")=" + str_hmac_sha1(key, data));  
    }  
  
    public  String hex_hmac_sha1(String key, String data) {  
        return binb2hex(core_hmac_sha1(key, data));  
    }  
  
    private  int rol(int num, int cnt) {  
        return (num << cnt) | (num >>> (32 - cnt));  
    }  
  
    private  int safe_add(int x, int y) {  
        int lsw = (int) (x & 0xffff) + (int) (y & 0xffff);  
        int msw = (x >> 16) + (y >> 16) + (lsw >> 16);  
  
        return (msw << 16) | (lsw & 0xffff);  
    }  
  
    private  int sha1_ft(int t, int b, int c, int d) {  
        if (t < 20)  
            return (b & c) | ((~b) & d);  
  
        if (t < 40)  
            return b ^ c ^ d;  
  
        if (t < 60)  
            return (b & c) | (b & d) | (c & d);  
  
        return b ^ c ^ d;  
    }  
  
    private  int sha1_kt(int t) {  
        return (t < 20) ? 1518500249 : (t < 40) ? 1859775393 : (t < 60) ? -1894007588 : -899497514;  
    }  
  
    private  boolean sha1_vm_test() {  
        return hexcase ? hex_sha1("abc").equals("a9993e364706816aba3e25717850c26c9cd0d89d") : hex_sha1("abc").equals(  
                "a9993e364706816aba3e25717850c26c9cd0d89d");  
    }  
  
    public  String str_hmac_sha1(String key, String data) {  
        return binb2str(core_hmac_sha1(key, data));  
    }  
  
    public  String str_sha1(String s) {  
        s = (s == null) ? "" : s;  
  
        return binb2str(core_sha1(str2binb(s), s.length() * chrsz));  
    }  
  
    private  int[] str2binb(String str) {  
        str = (str == null) ? "" : str;  
  
        int[] tmp = new int[str.length() * chrsz];  
        int mask = (1 << chrsz) - 1;  
  
        for (int i = 0; i < str.length() * chrsz; i += chrsz) {  
            tmp[i >> 5] |= ((int) (str.charAt(i / chrsz)) & mask) << (24 - i % 32);  
        }  
  
        int len = 0;  
        for (int i = 0; i < tmp.length && tmp[i] != 0; i++, len++)  
            ;  
  
        int[] bin = new int[len];  
  
        for (int i = 0; i < len; i++) {  
            bin[i] = tmp[i];  
        }  
  
        return bin;  
    }  
  
    private static int[] strechbinarray(int[] oldbin, int size) {  
        int currlen = oldbin.length;  
  
        if (currlen >= size + 1) {  
            return oldbin;  
        }  
  
        int[] newbin = new int[size + 1];  
        for (int i = 0; i < size; newbin[i] = 0, i++)  
            ;  
  
        for (int i = 0; i < currlen; i++) {  
            newbin[i] = oldbin[i];  
        }  
  
        return newbin;  
    }  
    
    /**
	 * addElement(String name,Object obj,boolean isCadta) 方法的重写
	 * @param name
	 * @param obj
	 * @return
	 */
	public Element addElement(String name,Object obj){
		return this.addElement(name, obj, true);
	}
	
	/**
	 * 创建一个节点
	 * @param name 节点名称
	 * @param obj 节点的object值
	 * @param isCadta 是否是cdata
	 * @return
	 */
	public Element addElement(String name,Object obj,boolean isCadta){
		Element e=DocumentHelper.createElement(name);
		if(obj!=null){
			if(isCadta){
				e.addCDATA(obj.toString());
			}else{
				e.setText(obj.toString());
			}
		}
		return e;
	}
}
