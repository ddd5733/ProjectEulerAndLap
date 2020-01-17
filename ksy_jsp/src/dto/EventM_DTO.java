package dto;

public class EventM_DTO {
	String event_m_no,title,content,reg_id,reg_date,name,status;
	
public EventM_DTO(){}
	
	
	public EventM_DTO(String event_m_no,String title,String content,
				   String reg_id ,String reg_date,String name){
		this.event_m_no	   = event_m_no   ;
		this.title         = title      ;
		this.content       = content    ;
		this.reg_id        = reg_id     ;
		this.reg_date      = reg_date   ;
		this.name     		= name   ;
		}
	
	public EventM_DTO(String event_m_no,String title,String content,
			   String reg_id ,String reg_date,String name,String status){
	this.event_m_no	   = event_m_no   ;
	this.title         = title      ;
	this.content       = content    ;
	this.reg_id        = reg_id     ;
	this.reg_date      = reg_date   ;
	this.name     		= name   ;
	this.status     	= status   ;
	}



	public String getEvent_m_no() {
		return event_m_no;
	}


	public void setEvent_m_no(String event_m_no) {
		this.event_m_no = event_m_no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getReg_id() {
		return reg_id;
	}


	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
}
