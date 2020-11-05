package com.skilldistillery.crescendo.entities;

import java.util.HashMap;
import java.util.Map;

public enum GoodType {

	instrument("instrument"), record("record");

	private String type;

	GoodType(String type) {
		this.type = type;
	}

	public String getType() {
		return this.type;
	}
	
private static final Map<String, GoodType> lookup = new HashMap<>();
	
	static {
		for(GoodType type: GoodType.values()) {
			lookup.put(type.getType(), type);
		}
	}
	public static GoodType get(String type) {
		return lookup.get(type);
	}
}
