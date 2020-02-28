package model.bo;

import java.util.ArrayList;

import model.bean.EventBEAN;
import model.dao.EventDAO;

public class EventBO {
	EventDAO event=new EventDAO();
	public ArrayList<EventBEAN> getEvent() throws Exception{
		return event.getEvent();
	}
	
	//Them event
	public int insertEvent(String tenSuKien, String moTa, String anhSuKien) throws Exception{
		return event.insertEvent(tenSuKien, moTa, anhSuKien);
	}
	
	//Sua event
	public int updateEvent(long idSuKien, String tenSuKien, String moTa, String anhSuKien) throws Exception{
		return event.updateEvent(idSuKien, tenSuKien, moTa, anhSuKien);
	}
	
	//Xoa event
	public void deleteEvent(long idSuKien) throws Exception{
		event.deleteEvent(idSuKien);
	}
	
	// Dem so luong event
	public int countEvent() throws Exception {
		return event.countEvent();
	}
	
	// Lấy danh sách su kien THEO START
	public ArrayList<EventBEAN> getEvent(int startSuKien) throws Exception {
		return event.getEvent(startSuKien);
	}
}
