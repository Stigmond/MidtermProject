package com.skilldistillery.crescendo.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
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

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
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
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "blog_has_genre",
	joinColumns = @JoinColumn(name = "blog_id"),
	inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List <Genre> genres;
	
	@OneToMany(mappedBy="blog", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
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
	public void addBlogComment(BlogComment blogComment) {
		if (blogComments == null) {
			blogComments = new ArrayList<>();
		}
		if (!blogComments.contains(blogComment)) {
			blogComments.add(blogComment);
			blogComment.setBlog(this);
		}
	}
	public void removeBlogComment(BlogComment blogComment) {
		if (blogComments != null && blogComments.contains(blogComment)) {
			blogComments.remove(blogComment);
			blogComment.setBlog(null);
		}
	}
	public void addGenre(Genre genre) {
		if (genres == null) {
			genres = new ArrayList<>();
		}
		if (!genres.contains(genre)) {
			genres.add(genre);
			genre.addBlog(this);
		}
	}
	public void removeGenre(Genre genre) {
		if (genres != null && genres.contains(genre)) {
			genres.remove(genre);
			genre.removeBlog(this);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Blog [id=").append(id).append(", title=").append(title).append(", creatorId=")
				.append(", createdAt=").append(createdAt).append(", body=").append(body).append(", headerMediaUrl=")
				.append(headerMediaUrl).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((body == null) ? 0 : body.hashCode());
		result = prime * result + ((createdAt == null) ? 0 : createdAt.hashCode());
		result = prime * result + edited;
		result = prime * result + ((headerMediaUrl == null) ? 0 : headerMediaUrl.hashCode());
		result = prime * result + id;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Blog other = (Blog) obj;
		if (body == null) {
			if (other.body != null)
				return false;
		} else if (!body.equals(other.body))
			return false;
		if (createdAt == null) {
			if (other.createdAt != null)
				return false;
		} else if (!createdAt.equals(other.createdAt))
			return false;
		if (edited != other.edited)
			return false;
		if (headerMediaUrl == null) {
			if (other.headerMediaUrl != null)
				return false;
		} else if (!headerMediaUrl.equals(other.headerMediaUrl))
			return false;
		if (id != other.id)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

}
