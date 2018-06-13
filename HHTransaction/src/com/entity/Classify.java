package com.entity;

public class Classify {
    private int classifyId;     //类别id
    private String classifyName;//类别的名称
    
    
	
	public Classify() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Classify(int classifyId) {
		super();
		this.classifyId = classifyId;
	}
	public int getClassifyId() {
		return classifyId;
	}
	public void setClassifyId(int classifyId) {
		this.classifyId = classifyId;
	}
	public String getClassifyName() {
		return classifyName;
	}
	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}
    
    
    
}
