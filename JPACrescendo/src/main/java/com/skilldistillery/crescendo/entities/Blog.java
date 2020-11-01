package com.skilldistillery.crescendo.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Blog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;
	
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
	
	@ManyToMany
	@JoinTable(name = "blog_has_genre",
	joinColumns = @JoinColumn(name = "blog_id"),
	inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List <Genre> genres;
	
	@OneToMany(mappedBy="blog")
	private List <BlogComment> blogComments;
	
	public Blog() {
		super();
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


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

	public List<BlogComment> getBlogComments() {
		return blogComments;
	}

	public void setBlogComments(List<BlogComment> blogComments) {
		this.blogComments = blogComments;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Blog [id=").append(id).append(", title=").append(title).append(", creatorId=")
				.append(", createdAt=").append(createdAt).append(", body=").append(body).append(", headerMediaUrl=")
				.append(headerMediaUrl).append("]");
		return builder.toString();
	}

}
