package common;
import java.util.*;
import java.io.*;

import java.text.*;
public class CommonUtil{
Scanner sc = new Scanner(System.in);
public static String file_dir_notice = "C:\\Users\\admin\\Desktop\\김성용_eclipse_source\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ksy_jsp\\file_room\\notice";

public static String file_dir_news = "C:/Users/admin/Desktop/김성용_eclipse_source/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ksy_jsp/file_room/news";	
	//입력값 숫자만 받기
	public int inputNumberOnly() {
		int number=0;
		while(true) {
			try{
				number = sc.nextInt();
				break;
			}
			catch(InputMismatchException e){
				sc = new Scanner(System.in);
				System.out.println(" 숫자만 입력해주세요 ");
				System.out.print(" 다시입력 : ");
			}
			catch(Exception e){
			}
		}
		return number;
	}
	
	//스트링값 숫자만 받기
	public int stringintcheck(String munja) {
		int number=0;
		while(true) {
			try{
				number = sc.nextInt();
				break;
			}
			catch(InputMismatchException e){
				sc = new Scanner(System.in);
				System.out.println(" 숫자만 입력해주세요 ");
				System.out.print(" 다시입력 : ");
			}
			catch(Exception e){
			}
		}
		return number;
	}
	
	// 입력 날짜 - 제거 인트 형변환
	public static int StiWithout(String checkDate){
		int	dayday = Integer.parseInt(checkDate.replace("-" , ""));
		
		return dayday;
	}
	
	// 날짜형식 검사 -없이
	public static boolean checkDateWithout(String checkDate){
		SimpleDateFormat dateFormat = 
			new SimpleDateFormat("yyyyMMdd");
		boolean checkD = true;
		dateFormat.setLenient(false);
		try{
			dateFormat.parse(checkDate);
		}catch(ParseException e){
			checkD = false;
		}
		return checkD;
	}	
	
	//잘라서 년월구하기
	public static String getTodayWithoutUnderBar(){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String today = sdf.format(date);
			return today;
		}
		
	//오늘날짜
	public static String getToday(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = sdf.format(date);
		return today;
	}
	//제조일자검사 yyyyMM형
	public static boolean checkYm(String checkDate){
		SimpleDateFormat dateFormat = 
			new SimpleDateFormat("yyyyMM");
		boolean checkD = true;
		dateFormat.setLenient(false);
		try{
			dateFormat.parse(checkDate);
		}catch(ParseException e){
			checkD = false;
		}
		return checkD;
	}	
	
	
	// 날짜형식 검사
	public static boolean checkDate(String checkDate){
		SimpleDateFormat dateFormat = 
			new SimpleDateFormat("yyyy-MM-dd");
		boolean checkD = true;
		dateFormat.setLenient(false);
		try{
			dateFormat.parse(checkDate);
		}catch(ParseException e){
			checkD = false;
		}
		return checkD;
	}	
	// 부족한 자리수 만큼 채우기 왼쪽채우기
	public static String getLPad(String str, int size, String strFillText) {
        for(int i = (str.getBytes()).length; i < size; i++) {
            str = strFillText + str;
        }
        return str;
    }
	// 부족한 자리수 만큼 채우기 양쪽채우기
	public static String getCPad(String str, int size, String strFillText) {
        int intPadPos = 0;
        for(int i = (str.getBytes()).length; i < size; i++) {
            if(intPadPos == 0) {
                str += strFillText;
                intPadPos = 1;
            } else {
                str = strFillText + str;
                intPadPos = 0;
            }
        }
        return str;
    }
	// 부족한 자리수 만큼 채우기 오른쪽채우기
	public static String getRPad(String str, int size, String strFillText) {
        for(int i = (str.getBytes()).length; i < size; i++) {
            str += strFillText;
        }
        return str;
        
    }

	// null 검사
	public static String checkNull(String sValue){
		String result="";
		if(sValue != null) result = sValue;
		return result;
	}
	
	// 페이지
	public static String pageList(int current_page,int totalpage){
		int pagenumber;    //화면에 보여질 페이지 인덱스수
		int startpage;     //화면에 보여질 시작 페이지 번호
		int endpage;       //화면에 보여질 마지막 페이지 번호
		int curpage;       //이동하고자 하는 페이지 번호
		
		String strList=""; //리턴될 페이지 인덱스 리스트
		
		pagenumber = 5;   //한 화면의 페이지 인덱스수
		
		//시작 페이지 번호 구하기
		startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
		//마지막 페이지 번호 구하기
		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
		//총페이지수가 마지막 페이지 번호가 됨
		
		if(totalpage <= endpage)  endpage = totalpage;
					
		//첫번째 페이지 인덱스 화면이 아닌경우
		if(current_page > pagenumber){
			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
			strList = strList +"<a href=javascript:gopage("+curpage+")><i class='fa fa-angle-double-left'></i></a>";//첫화살표
		}
						
		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
		curpage = startpage;
		while(curpage <= endpage){
			if(curpage == current_page){
				strList = strList +"<a href='' class='active'>["+current_page+"]</a>";
			} else {
				strList = strList +"<a href=javascript:gopage("+curpage+")><font color=#666699>["+curpage+"]</font></a>";//2나 다음 페이지를 눌렀을때페이지에서 r의 함수로 보내준다
			}
			curpage++;
		}
		//뒤에 페이지가 더 있는 경우
		if(totalpage > endpage){
			curpage = endpage+1;
			strList = strList + "<a href=javascript:gopage("+curpage+")><i class='fa fa-angle-double-right'></i></a>";//마지만 화살표
		}
		
		return strList;
	}	
	
	// 페이지
		public static String pageList_saving(int current_page,int totalpage, String list_url){
			int pagenumber;    //화면에 보여질 페이지 인덱스수
			int startpage;     //화면에 보여질 시작 페이지 번호
			int endpage;       //화면에 보여질 마지막 페이지 번호
			int curpage;       //이동하고자 하는 페이지 번호
			
			String strList=""; //리턴될 페이지 인덱스 리스트
			
			pagenumber = 5;   //한 화면의 페이지 인덱스수
			
			//시작 페이지 번호 구하기
			startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
			//마지막 페이지 번호 구하기
			endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
			//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
			//총페이지수가 마지막 페이지 번호가 됨
			
			if(totalpage <= endpage)  endpage = totalpage;
						
			//첫번째 페이지 인덱스 화면이 아닌경우
			if(current_page > pagenumber){
				curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
				strList = strList +"<a href='"+list_url+"&r_page="+curpage+"'><i class='fa fa-angle-double-left'></i></a>";
			}
							
			//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
			curpage = startpage;
			while(curpage <= endpage){
				if(curpage == current_page){
					strList = strList +"<a href='' class='active'>["+current_page+"]</a>";
				} else {
					strList = strList +"<a href='"+list_url+"&r_page="+curpage+"'><font color=#666699>["+curpage+"]</font></a>";
				}
				curpage++;
			}
			//뒤에 페이지가 더 있는 경우
			if(totalpage > endpage){
				curpage = endpage+1;
				strList = strList + "<a href='"+list_url+"&r_page="+curpage+"'><i class='fa fa-angle-double-right'></i></a>";
			}
			
			return strList;
		}	
	
}

