package com.skilldistillery.crescendo.entities;

import java.util.HashMap;
import java.util.Map;

public enum SearchType {
	KEYWORD("keyword"),
	USERNAME("username");
	
	private String type;
	
	SearchType (String type){
		this.type = type;
	} 
	public String getType() {
		return type;
	}
	
	private static final Map<String, SearchType> lookup = new HashMap<>();
	
	static {
		for(SearchType type: SearchType.values()) {
			lookup.put(type.getType(), type);
		}
	}
	public static SearchType get(String type) {
		return lookup.get(type);
	}

}
