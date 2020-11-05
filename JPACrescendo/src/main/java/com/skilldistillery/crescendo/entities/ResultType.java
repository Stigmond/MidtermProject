package com.skilldistillery.crescendo.entities;

import java.util.HashMap;
import java.util.Map;

public enum ResultType {

	BLOG("blog"), 
	BLOG_COMMENT("blogComment"),
	ALBUM("album"),
	ALBUM_COMMENT("albumComment"), 
	TOPIC("topic"),
	TOPIC_COMMENT("topicComment");
	
	private String type;
	
	ResultType(String type){
		this.type = type;
	}
	public String getType() {
		return type;
	}
private static final Map<String, ResultType> lookup = new HashMap<>();
	
	static {
		for(ResultType type: ResultType.values()) {
			lookup.put(type.getType(), type);
		}
	}
	public static ResultType get(String type) {
		return lookup.get(type);
	}
	
}
