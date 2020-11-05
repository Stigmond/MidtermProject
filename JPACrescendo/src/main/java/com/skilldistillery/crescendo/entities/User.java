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
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private int enabled;
	private String role;

	@Column(name = "created_at")
	private LocalDateTime createdAt;

	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;

	private String body;

	@Column(name = "avatar_url")
	private String avatarUrl;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<Blog> blogs;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<Trade> trades;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<Topic> threads;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<BlogComment> blogComments;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<AlbumComment> albumComments;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<TopicComment> threadComments;

	public List<TopicComment> getThreadComments() {
		return threadComments;
	}

	public void setThreadComments(List<TopicComment> threadComments) {
		this.threadComments = threadComments;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((avatarUrl == null) ? 0 : avatarUrl.hashCode());
		result = prime * result + ((body == null) ? 0 : body.hashCode());
		result = prime * result + ((createdAt == null) ? 0 : createdAt.hashCode());
		result = prime * result + enabled;
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + id;
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		User other = (User) obj;
		if (avatarUrl == null) {
			if (other.avatarUrl != null)
				return false;
		} else if (!avatarUrl.equals(other.avatarUrl))
			return false;
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
		if (enabled != other.enabled)
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (id != other.id)
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		} else if (!role.equals(other.role))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public List<Trade> getTrades() {
		return trades;
	}

	public void setTrades(List<Trade> trades) {
		this.trades = trades;
	}

	public List<Topic> getThreads() {
		return threads;
	}

	public void setThreads(List<Topic> threads) {
		this.threads = threads;
	}

	public List<BlogComment> getBlogComments() {
		return blogComments;
	}

	public void setBlogComments(List<BlogComment> blogComment) {
		this.blogComments = blogComment;
	}

	public List<AlbumComment> getAlbumComments() {
		return albumComments;
	}

	public void setAlbumComments(List<AlbumComment> albumComments) {
		this.albumComments = albumComments;
	}

	public void addBlog(Blog blog) {
		if (blogs == null) {
			blogs = new ArrayList<>();
		}
		if (!blogs.contains(blog)) {
			blogs.add(blog);
			blog.setUser(this);
		}
	}
	public void removeBlog(Blog blog) {
		if (blogs != null && blogs.contains(blog)) {
			blogs.remove(blog);
			blog.setUser(null);
		}
	}
	
	public void addTrade(Trade trade) {
		if (trades == null) {
			trades = new ArrayList<>();
		}
		if (!trades.contains(trade)) {
			trades.add(trade);
			trade.setUser(this);
		}
	}
	public void removeTrade(Trade trade) {
		if (trades != null && trades.contains(trade)) {
			trades.remove(trade);
			trade.setUser(null);
		}
	}
	public void addThread(Topic thread) {
		if (threads == null) {
			threads = new ArrayList<>();
		}
		if (!threads.contains(thread)) {
			threads.add(thread);
			thread.setUser(this);
		}
	}
	public void removeThread(Topic thread) {
		if (threads != null && threads.contains(thread)) {
			threads.remove(thread);
			thread.setUser(null);
		}
	}
	public void addBlogComment(BlogComment blogComment) {
		if (blogComments == null) {
			blogComments = new ArrayList<>();
		}
		if (!blogComments.contains(blogComment)) {
			blogComments.add(blogComment);
			blogComment.setUser(this);
		}
	}
	public void removeBlogComment(BlogComment blogComment) {
		if (blogComments != null && blogComments.contains(blogComment)) {
			blogComments.remove(blogComment);
			blogComment.setUser(null);
		}
	}
	public void addAlbumComment(AlbumComment albumComment) {
		if (albumComments == null) {
			albumComments = new ArrayList<>();
		}
		if (!albumComments.contains(albumComment)) {
			albumComments.add(albumComment);
			albumComment.setUser(this);
		}
	}
	public void removeAlbumComment(AlbumComment albumComment) {
		if (albumComments != null && albumComments.contains(albumComment)) {
			albumComments.remove(albumComment);
			albumComment.setUser(null);
		}
	}
	public void addThreadComment(TopicComment threadComment) {
		if (threadComments == null) {
			threadComments = new ArrayList<>();
		}
		if (!threadComments.contains(threadComment)) {
			threadComments.add(threadComment);
			threadComment.setUser(this);
		}
	}
	public void removeThreadComment(TopicComment threadComment) {
		if (threadComments != null && threadComments.contains(threadComment)) {
			threadComments.remove(threadComment);
			threadComment.setUser(null);
		}
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [username=").append(username).append(", firstName=").append(firstName)
				.append(", lastName=").append(lastName).append("]");
		return builder.toString();
	}

	
	}


