package com.cea.ehm.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * load properties file
 */
public class PropertiesUtil {
	private static final Logger logger = Logger.getLogger(PropertiesUtil.class);
	private static Properties loginPro = new Properties();

	static {
		InputStream input = null;
		input = PropertiesUtil.class.getClassLoader().getResourceAsStream("login.properties");
		try {
			loginPro.load(input);
			if (input != null) {
				input.close();
			}
		} catch (IOException e) {
			logger.debug(e);
		}
	}

	public static String getFromLoginPro(String key) {
		String result = loginPro.getProperty(key);
		if (result != null) {
			result = result.trim();
		}
		return result;
	}

}
