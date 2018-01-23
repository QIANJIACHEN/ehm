package com.cea.ehm.util;

import java.security.MessageDigest;

/**
 * MD5加密 (32位小写)
 */
public class MD5Util {

	public static String getCode(String str) {
		MessageDigest md5;
		try {
			md5 = MessageDigest.getInstance("MD5");
			byte[] md5Bytes = md5.digest(str.getBytes());
			StringBuffer hexValue = new StringBuffer();
			for (int i = 0; i < md5Bytes.length; i++) {
				int val = ((int) md5Bytes[i]) & 0xff;
				if (val < 16)
					hexValue.append("0");
				hexValue.append(Integer.toHexString(val));
			}
			str = hexValue.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

}
