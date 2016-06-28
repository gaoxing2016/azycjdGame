package com.anzhi.web.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sun.swing.internal.plaf.metal.resources.metal;

/**
 * Sha1散列算法
 * 
 * @author 13101255
 *
 */
public class Sha1HashArithmetic 
{
	//密钥缓存
	public static Map<String,String> KEYMAP = new HashMap<String, String>();
	
	private List<String> paraml = null; 
	
	public Sha1HashArithmetic(List<String> paraml)
	{
		this.paraml = paraml;
	}
	
	/**
	 * 使用方法形参集合
	 * 
	 * @param nParamL 需要进行散列的参数集合
	 * @return 散列值
	 * @throws NoSuchAlgorithmException
	 */
	public String sha1Hash(List<String> nParamL)throws NoSuchAlgorithmException
	{
		MessageDigest sha1 = MessageDigest.getInstance("sha-1");
		
		if (null != nParamL && !nParamL.isEmpty())
		{
			for (String param : nParamL)
			{
				byte[] bs;
				try {
					bs = param.getBytes("utf-8");
					sha1.update(bs);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		byte[] r = sha1.digest();
		//散列结果的字节数组，转16进制字符串
		return printHexString(r);
	}


	/**
	 * 使用构造方法中的参数集合
	 * 
	 * @return 散列值
	 * @throws NoSuchAlgorithmException
	 */
	public String sha1Hash()throws NoSuchAlgorithmException
	{
		return sha1Hash(paraml);
	}
	
	/**
	 * 字节数组转16进制字符串
	 * 
	 * @param b 字节数组
	 * @return 16进制字符串
	 */
	private String printHexString(byte[] b) {

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			String hex = Integer.toHexString(b[i] & 0xFF);
			if (hex.length() == 1) {
				hex = '0' + hex;
			}
			sb.append(hex);
		}
		return sb.toString();
	}
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
		//4b5e7e1cbb1e0da17e0a9e70a5e3676147890b1f
		//4b5e7e1cbb1e0da17e0a9e70a5e3676147890b1f
		//4b5e7e1cbb1e0da17e0a9e70a5e3676147890b1f
		List<String> ls=new ArrayList<String>();
		ls.add("17967第一章	空蒙旖梦 ，留恋飘絮3X045Ij1vPHOi12wx03L6b6fq");
		Sha1HashArithmetic sha1=new Sha1HashArithmetic(ls);
		String selfDS=sha1.sha1Hash();
		System.out.println(selfDS);
		byte[] b="最后岁月酿成花".getBytes();
		System.out.println(b);
	}
}
