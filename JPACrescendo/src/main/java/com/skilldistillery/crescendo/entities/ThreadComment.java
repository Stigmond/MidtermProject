package com.skilldistillery.crescendo.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "thread_comment")
public class ThreadComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String body;

	@Column(name = "thread_id")
	private int threadId;

	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	private int edited;

	@Column(name = "creator_id")
	private int creatorId;

	public ThreadComment() {
		super();
	}

	public ThreadComment(int id, String body, int threadId, LocalDateTime createdAt, int edited, int creator) {
		super();
		this.id = id;
		this.body = body;
		this.threadId = threadId;
		this.createdAt = createdAt;
		this.edited = edited;
		this.creatorId = creator;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getThreadId() {
		return threadId;
	}

	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public int getEdited() {
		return edited;
	}

	public void setEdited(int edited) {
		this.edited = edited;
	}

	public int getCreator() {
		return creatorId;
	}

	public void setCreator(int creator) {
		this.creatorId = creator;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ThreadComment [id=").append(id).append(", body=").append(body).append(", threadId=")
				.append(threadId).append(", createdAt=").append(createdAt).append(", edited=").append(edited)
				.append(", creator=").append(creatorId).append("]");
		return builder.toString();
	}

}
