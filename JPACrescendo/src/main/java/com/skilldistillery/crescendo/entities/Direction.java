package com.skilldistillery.crescendo.entities;

import java.util.HashMap;
import java.util.Map;

public enum Direction {
	
	BUY("buy"),
	SELL("sell"),
	TRADE("trade");
	
	private String type;
	
	Direction(String type){
		this.type = type;
	}
	public String getType() {
		return type;
	}

private static final Map<String, Direction> lookup = new HashMap<>();
	
	static {
		for(Direction type: Direction.values()) {
			lookup.put(type.getType(), type);
		}
	}
	public static Direction get(String type) {
		return lookup.get(type);
	}
}
