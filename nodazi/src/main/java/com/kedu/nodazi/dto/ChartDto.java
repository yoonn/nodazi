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
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 컬럼의 이름과 데이터 타입만 추가
	 * 2. 처리내용	: 같은 클래스에 overriding된  addColumn을 호출
	 * </pre>
	 * @Method Name : addColumn
	 * @param		  label
	 * @param		  type
	 *****************************************************/
	public void addColumn(String label, String type){
		addColumn("", label, "", type);
	}
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 컬럼의 이릅, id, pattern, 데이터 타입을 추가
	 * 2. 처리내용	: 컬럼의 리스트인 cols에 컬럼을 추가
	 * </pre>
	 * @Method Name : addColumn
	 * @param		  id
	 * @param		  label
	 * @param		  pattern
	 * @param		  type
	 *****************************************************/
	public void addColumn(String id, String label, String pattern, String type){
		
		HashMap<String, Object> col = new HashMap<String, Object>();
		
		col.put("id", id);
		col.put("label", label);
		col.put("pattern", pattern);
		col.put("type", type);
		
		this.cols.add(col);
	}
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: tooltip에 해당하는 row를 추가
	 * 2. 처리내용	: tooltip의 형태를 추가해주는 것으로 매개변수를 받지 않는다.
	 * </pre>
	 * @Method Name : addTooltip
	 *****************************************************/
	public void addTooltip(){

		HashMap<String, Object> col = new HashMap<String, Object>();
		col.put("type", "string");
		col.put("role", "tooltip");
		
		this.cols.add(col);
	}
	
	{
//	왜있는거지?
	/*public void addRow(String name, Object value){
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
	}*/
	}
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 매개변수인 갯수만큼 row들을 미리 생성
	 * 2. 처리내용	: 차트에 들어갈 데이터의 갯수에 해당하는 row를 데이터 없이 형태만 미리 생성
	 * </pre>
	 * @Method Name : createRows
	 * @param		  count
	 *****************************************************/
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
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: row에 데이터를 추가
	 * 2. 처리내용	: rowCount에 해당하는 row를 불러와서 값을 첫번째 컬럼부터 차례대로 추가, 같은 클래스에 overriding된 addCell을 호출 
	 * </pre>
	 * @Method Name : addCell
	 * @param		  rowCount
	 * @param		  value
	 *****************************************************/
	public void addCell(int rowCount, Object value){
		addCell(rowCount, value, null);
	}
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: row에 데이터를 추가
	 * 2. 처리내용	: rowCount에 해당하는 row를 불러와서 값을 첫번째 컬럼부터 차례대로 추가
	 * </pre>
	 * @Method Name : addCell
	 * @param		  rowCount
	 * @param		  value
	 * @param		  format
	 *****************************************************/
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
