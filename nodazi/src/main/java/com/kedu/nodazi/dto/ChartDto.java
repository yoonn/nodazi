package com.kedu.nodazi.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ChartDto {
	
	private HashMap<String, Object> result;
	private List<HashMap<String, Object>> cols;
	private List<HashMap<String, Object>> rows;
	
	public ChartDto(){
		this.result = new HashMap<String, Object>();			//전체결과
		this.cols = new ArrayList<HashMap<String, Object>>();	//컬럼명 만들기
		this.rows = new ArrayList<HashMap<String, Object>>();	//로우 만들기
		
		this.result.put("cols", this.cols);
		this.result.put("rows", this.rows);
	}
	
	public void addColumn(String label, String type){
		addColumn("", label, "", type);
	}
	
	public void addColumn(String id, String label, String pattern, String type){
		
		HashMap<String, Object> col = new HashMap<String, Object>();
		
		col.put("id", id);
		col.put("label", label);
		col.put("pattern", pattern);
		col.put("type", type);
		
		this.cols.add(col);
	}
	
	public void addTooltip(){

		HashMap<String, Object> col = new HashMap<String, Object>();
		col.put("type", "string");
		col.put("role", "tooltip");
		
		this.cols.add(col);
	}
	
//	왜있는거지?
	public void addRow(String name, Object value){
		addRow(name, value, null);
	}
	
//	왜있는거지222?
	public void addRow(String name, Object value, String format){
		
		HashMap<String, Object> row = new HashMap<String, Object>();
		List<HashMap<String, Object>> cells = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> cell1 = new HashMap<String, Object>();
		cell1.put("v", name);
		
		HashMap<String, Object> cell2 = new HashMap<String, Object>();
		cell2.put("v", value);
		cell2.put("f", format);
		
		cells.add(cell1);
		cells.add(cell2);
		
		row.put("c", cells);
		this.rows.add(row);
	}
	
//	row 미리 생성
	public void createRows(int count){
		HashMap<String, Object> row = null;
		List<HashMap<String, Object>> cells = null;
		for(int i=0;i<count;i++){
			row = new HashMap<String, Object>();
			cells = new ArrayList<HashMap<String,Object>>();
			row.put("c", cells);
			this.rows.add(row);
		}
	}
	
//	format이 없는 경우, addCell() 호출
	public void addCell(int rowCount, Object value){
		addCell(rowCount, value, null);
	}
	
//	rowCount로 해당 row를 불러와서 값을 넣음
	public void addCell(int rowCount, Object value, String format){
		
		HashMap<String, Object> row = this.rows.get(rowCount);
		List<HashMap<String, Object>> cells = (List<HashMap<String, Object>>)row.get("c");
		
		HashMap<String, Object> cell = new HashMap<String, Object>();
		cell.put("v", value);
		cell.put("f", format);
		
		cells.add(cell);
	}
	
	public HashMap<String, Object> getResult(){
		return this.result;
	}
	
	public String toString(){
		return result.toString();
	}

}
