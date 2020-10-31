package com.skilldistillery.crescendo.entities;

public enum GoodType {

	instrument("instrument"), record("record");

	private String type;

	GoodType(String type) {
		this.type = type;
	}

	public String getType() {
		return this.type;
	}
}
