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
@Table(name = "blog_comment")
public class BlogComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String body;

	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	private int edited;

	@Column(name = "in_reply_id")
	private Integer inReplyId;
	
	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name= "blog_id")
	private Blog blog;
	
	

	public BlogComment() {
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


	public LocalDateTime getCreatedId() {
		return createdAt;
	}

	public void setCreatedId(LocalDateTime createdId) {
		this.createdAt = createdId;
	}

	public int getEdited() {
		return edited;
	}

	public void setEdited(int edited) {
		this.edited = edited;
	}

	public Integer getInReplyId() {
		return inReplyId;
	}

	public void setInReplyId(Integer inReplyId) {
//		this.inReplyId = inReplyId;
		this.inReplyId = (inReplyId == null) ? 0 : inReplyId;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	@Override
	public String toString() {
		return "BlogComment [id=" + id + ", body=" + body + ", createdAt=" + createdAt + ", edited=" + edited
				+ ", inReplyId=" + inReplyId + ", user=" + user + ", blog=" + blog + "]";
	}

	
}
