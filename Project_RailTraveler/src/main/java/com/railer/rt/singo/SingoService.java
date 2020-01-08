package com.railer.rt.singo;

import java.util.List;
import java.util.Map;

public interface SingoService {
	
	public void insertSingo(Singo dto);
	public List<Singo> singoList(Map<String,Object> map);
	public Singo findTargetReply(int targetNo);
	public int dataCount(Map<String,Object> map);
	

}