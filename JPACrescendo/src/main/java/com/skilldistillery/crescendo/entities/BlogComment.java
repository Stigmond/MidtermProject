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

	@Column(name = "creator_id")
	private int creatorId;

	@Column(name = "in_reply_id")
	private Integer inReplyId;

	public BlogComment() {
		super();
	}

	public BlogComment(int id, String body, int blogId, LocalDateTime createdId, int edited, int creatorId,
			Integer inReplyId) {
		super();
		this.id = id;
		this.body = body;
		this.blogId = blogId;
		this.createdAt = createdId;
		this.edited = edited;
		this.creatorId = creatorId;
		this.inReplyId = inReplyId;
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

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public Integer getInReplyId() {
		return inReplyId;
	}

	public void setInReplyId(Integer inReplyId) {
//		this.inReplyId = inReplyId;
		this.inReplyId = (inReplyId == null) ? 0 : inReplyId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BlogComment [id=").append(id).append(", body=").append(body).append(", blogId=").append(blogId)
				.append(", createdId=").append(createdAt).append(", edited=").append(edited).append(", creatorId=")
				.append(creatorId).append(", inReplyId=").append(inReplyId).append("]");
		return builder.toString();
	}

}
