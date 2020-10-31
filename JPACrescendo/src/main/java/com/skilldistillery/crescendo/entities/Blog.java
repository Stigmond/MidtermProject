package com.skilldistillery.crescendo.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Blog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	@Column(name = "creator_id")
	private int creatorId;
	
	private int edited;

	public int getEdited() {
		return edited;
	}

	public void setEdited(int edited) {
		this.edited = edited;
	}


	@Column(name = "created_at")
	@CreationTimestamp
	private LocalDateTime createdAt;

	private String body;

	@Column(name = "header_media_url")
	private String headerMediaUrl;


	public Blog() {
		super();
	}

	public Blog(int id, String title, int creatorId, LocalDateTime createdAt, String body, String headerMediaUrl,
			int edited) {
		super();
		this.id = id;
		this.title = title;
		this.creatorId = creatorId;
		this.createdAt = createdAt;
		this.body = body;
		this.headerMediaUrl = headerMediaUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getHeaderMediaUrl() {
		return headerMediaUrl;
	}

	public void setHeaderMediaUrl(String headerMediaUrl) {
		this.headerMediaUrl = headerMediaUrl;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Blog [id=").append(id).append(", title=").append(title).append(", creatorId=").append(creatorId)
				.append(", createdAt=").append(createdAt).append(", body=").append(body).append(", headerMediaUrl=")
				.append(headerMediaUrl).append("]");
		return builder.toString();
	}

}
