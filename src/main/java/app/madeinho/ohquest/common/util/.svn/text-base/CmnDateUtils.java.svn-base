/*
 * Copyright (c) Abacus. All rights reserved.
 */
package app.madeinho.ohquest.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang.StringUtils;

/**
 *
 * @author "YangByeongSub"
 * @since
 *
 */
public class CmnDateUtils {
	static public String addDate(int day){
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
		cal.add(Calendar.DATE, day);
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addDate(String dateStr, int day){
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
        Date date = null ;
        try {
        	if(!StringUtils.isEmpty(dateStr)){
        		date = (Date)formatter.parse(dateStr);
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
		if(date == null)
			cal.add(Calendar.DATE, day);
		else{
			cal.setTime(date);
			cal.add(Calendar.DATE, day);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addDate(String dateStr, int day, String pattern){
        DateFormat formatter = new SimpleDateFormat(pattern); 
        Date date = null ;
        try {
        	if(!StringUtils.isEmpty(dateStr)){
        		date = (Date)formatter.parse(dateStr);
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
		if(date == null)
			cal.add(Calendar.DATE, day);
		else{
			cal.setTime(date);
			cal.add(Calendar.DATE, day);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addDate(Date date, int day){
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
		if(date == null)
			cal.add(Calendar.DATE, day);
		else{
			cal.setTime(date);
			cal.add(Calendar.DATE, day);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addDate(Date date, int day, String pattern){
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat(pattern) ;
		if(date == null)
			cal.add(Calendar.DATE, day);
		else{
			cal.setTime(date);
			cal.add(Calendar.DATE, day);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addMonth(int month){
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
		cal.add(Calendar.MONTH, month);
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addMonth(String dateStr, int month){
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
        Date date = null ;
        try {
        	if(!StringUtils.isEmpty(dateStr)){
        		date = (Date)formatter.parse(dateStr);
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
		if(date == null)
			cal.add(Calendar.MONTH, month);
		else{
			cal.setTime(date);
			cal.add(Calendar.MONTH, month);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addMonth(String dateStr, int month, String pattern){
        DateFormat formatter = new SimpleDateFormat(pattern); 
        Date date = null ;
        try {
        	if(!StringUtils.isEmpty(dateStr)){
        		date = (Date)formatter.parse(dateStr);
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat(pattern) ;
		if(date == null)
			cal.add(Calendar.MONTH, month);
		else{
			cal.setTime(date);
			cal.add(Calendar.MONTH, month);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addMonth(Date date, int month){
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
		if(date == null)
			cal.add(Calendar.MONTH, month);
		else{
			cal.setTime(date);
			cal.add(Calendar.MONTH, month);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public String addMonth(Date date, int month, String pattern){
		Calendar cal = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat(pattern) ;
		if(date == null)
			cal.add(Calendar.MONTH, month);
		else{
			cal.setTime(date);
			cal.add(Calendar.MONTH, month);
		}
        String date1 = sdf.format(cal.getTime());		
        return date1;
	}
	static public int dateDiff(String beginDateStr, String endDateStr ){
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
        Date beginDate = null ;
        Date endDate = null ;
        try {
        	if(!StringUtils.isEmpty(beginDateStr)){
        		beginDate = (Date)formatter.parse(beginDateStr);
        	}
        	if(!StringUtils.isEmpty(endDateStr)){
        		endDate = (Date)formatter.parse(endDateStr);
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		long diff = endDate.getTime() - beginDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        
        return (int)diffDays ;
	}
	
	static public int dateDiff(Date beginDate, Date endDate ){
		long diff = endDate.getTime() - beginDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        
        return (int)diffDays ;
	}
	
	static public int dateDiff(Date beginDate, Date endDate, TimeSpan timeSpan ){
		long diff = endDate.getTime() - beginDate.getTime();
		long diffDays =0l;
		if(timeSpan == TimeSpan.DAY){
			diffDays = diff / (24 * 60 * 60 * 1000);
		}else if(timeSpan == TimeSpan.HOUR){
			diffDays = diff / (60 * 60 * 1000);
		}else if(timeSpan == TimeSpan.MINUTE){
			diffDays = diff / (60 * 1000);
		}else if(timeSpan == TimeSpan.SECOND){
			diffDays = diff / (1000);
		}
        
        return (int)diffDays ;
	}
	static public String getStrDateFormat(Date date){
		return getStrDateFormat(date, "yyyy-MM-dd");				
	}
	static public String getStrDateFormat(Date date, String dateFormat ){
		if(date == null) return "";
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat) ;
		return sdf.format(date);				
	}
	static public Date getDate(String dateStr, String pattern){
		DateFormat formatter = new SimpleDateFormat(pattern); 
        Date date = null ;
        try {
        	if(!StringUtils.isEmpty(dateStr)){
        		date = (Date)formatter.parse(dateStr);
        	}
		} catch (ParseException e) {
			e.printStackTrace();
		}		
        return date;		
	}
}
