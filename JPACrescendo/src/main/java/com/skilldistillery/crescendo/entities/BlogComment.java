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

	@Column(name = "blog_id")
	private int blogId;

	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	private int edited;

	@Column(name = "in_reply_id")
	private Integer inReplyId;
	
	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;
	
	

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

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BlogComment [id=").append(id).append(", body=").append(body).append(", blogId=").append(blogId)
				.append(", createdId=").append(createdAt).append(", edited=").append(edited).append(", creatorId=") 
				.append(", inReplyId=").append(inReplyId).append("]");
		return builder.toString();
	}

}
