package com.skilldistillery.crescendo.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "thread_comment")
public class ThreadComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String body;

	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	private int edited;

	@ManyToOne
	@JoinColumn(name = "thread_id")
	private Thread thread;

	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ThreadComment() {
		super();
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

	public Thread getThread() {
		return thread;
	}

	public void setThread(Thread thread) {
		this.thread = thread;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ThreadComment [id=").append(id).append(", body=").append(body).append(", createdAt=")
				.append(createdAt).append(", edited=").append(edited).append(", thread=").append(thread)
				.append(", user=").append(user).append("]");
		return builder.toString();
	}

}
