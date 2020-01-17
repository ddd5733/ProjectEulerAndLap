<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ page import="java.util.*,dao.Faq_DAO,dto.Faq_DTO,common.CommonUtil"%>
<%
	request.setCharacterEncoding("UTF-8");
	Faq_DAO dao  = new Faq_DAO();
	ArrayList<Faq_DTO> dtos = dao.getFaqList();	
	String twork ="del";
	
	
	//**************page start***************/	
		String tdCount ="5";				

		String r_page = CommonUtil.checkNull(request.getParameter("r_page"));		
		int			current_page;					// 현재페이지 번호
		int			total_page;						// 총페이지 수
		int			total_count;					// 총레코드 수
		int			for_count;						
		int			list_setup_count = 10;			// 한번에 출력될 List 수
		int			p_no;
		int			v_count;
		int			a_count;
		String		url				= null;	

		// 조회된 건수 구하기  total_count : 설정
		if(dtos == null) total_count =0;
		else total_count = dtos.size(); 


		// 페이지번호가 없으면 1페이지로 간주
		if(r_page.equals("")) current_page = 1;
		else current_page = Integer.parseInt(r_page);
	
		for_count		= list_setup_count;
		p_no			= list_setup_count;				// 페이지수가 10
		total_page = total_count / list_setup_count;		// 전체페이지수 계산 (if 23개 게시물이면 2)
	   
		if(current_page == 1) {
	v_count		= 0;
	a_count		= list_setup_count;
	for_count	= 0;
		} else{
	v_count		= 0;
	a_count		= p_no * current_page;
	for_count	= a_count - list_setup_count;
		}
		if(total_page * list_setup_count != total_count)   total_page = total_page +1;
	//**************page end***************/
%>
<style>
.fixx {
	float:right;
}
</style>

<!doctype html>
<html lang="ko">
		<!-- sub page start -->
		<div class="notice">
			<div class="sub-notice">
			<h2><a href="/notice/notice_r.jsp">NOTICE</a></h2>	
			<h2><a href="/event/event_r.jsp"> Event</a></h2>
			<h2 class="color"><a href="/faq/faq_r.jsp"><i class="fas fa-check"></i> FAQ</a></h2>	
			<h2><a href="/news/news_r.jsp"> NEWS</a></h2>	
		</div>
			
			<!-- fqa start-->
			<div class="faq-box">
<%	if ( total_count > 0 ){
		for(int k = 0 ; k < total_count ; k++ )	{
			if(v_count == for_count){ 

%>				
				<button class="accordion"><%=dtos.get(k).getTitle()%></button>
				<div class="text">
					<p><%=dtos.get(k).getContent()%></p>
					<div class="fixx">
					<a href="/faq/faq_u.jsp?t_faqNo=<%=dtos.get(k).getFaq_no()%>" > <i class="fas fa-wrench">Modify</i> </a>
					<a href="/faq/faq_proc.jsp?t_faqNo=<%=dtos.get(k).getFaq_no()%>&t_work=<%=twork%>" > <i class="fas fa-trash-alt">Delete</i> </a>
					</div>
				</div>
<%
				v_count = v_count + 1;
				for_count = for_count + 1;
			}else { 
				v_count = v_count + 1;
			}

			if(v_count == a_count)break; 
		}
	}else{	
%>
  			    <button class="accordion">doesn't have existing</button>
				<div class="text">
					<p>doesn't have existing</p>
				</div>
<%	
	} 
%>


				<div class="page-number">
<%
			url = "faq_r.jsp";		
			out.println(CommonUtil.pageList(current_page, total_page, url));
%>
				<div class="page-number">
				<a href="/faq/faq_w.jsp" class="btn-write">Write</a>
				</div>
				</div>
			
			</div>
		<!-- notice css end -->
		
		
		<!--  footer start  -->
		<%@ include file="/footer.jsp"%>
		</div>
	
		<script>
			$(document).ready(function() {
				$(".accordion").click(function() {
					$(".text").not($(this).next().slideToggle(250)).slideUp();
					$(this).siblings().removeClass("active");	
					$(this).toggleClass("active");	
				});
			});
		</script>
	
	</body>
</html>



