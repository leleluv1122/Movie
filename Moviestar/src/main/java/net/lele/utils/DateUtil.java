package net.lele.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	// 오늘날짜
	public String getDate() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd"); // 원래는 yyyy-MM-dd
		String now = dayTime.format(new Date(time));
		return now;
	}

	// 오늘날짜 + 시간
	public String getDateTime() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HHmmss");
		String now = dayTime.format(new Date(time));
		return now;
	}

	// 오늘 날짜와 시간(밀리초 단위)
	public String getTimeMillisecond() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		String now = dayTime.format(new Date(time));
		return now;
	}
}
