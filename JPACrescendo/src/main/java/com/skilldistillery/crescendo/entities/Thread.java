package com.skilldistillery.crescendo.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
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
public class Thread {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	@Column(name = "created_at")
	@CreationTimestamp
	private LocalDateTime createdAt;

	@OneToMany(mappedBy = "thread")
	private List<ThreadComment> threadComments;

	public List<ThreadComment> getThreadComments() {
		return threadComments;
	}

	public void setThreadComments(List<ThreadComment> threadComments) {
		this.threadComments = threadComments;
	}

	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;

	@ManyToMany
	@JoinTable(name = "thread_has_genre", joinColumns = @JoinColumn(name = "genre_id"), inverseJoinColumns = @JoinColumn(name = "thread_id"))
	private List<Genre> genres;

	public Thread() {
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
	public void addGenre(Genre genre) {
		if (genres == null) {
			genres = new ArrayList<>();
		}
		if (!genres.contains(genre)) {
			genres.add(genre);
			genre.addThread(this);
		}
	}
	public void removeGenre(Genre genre) {
		if (genres != null && genres.contains(genre)) {
			genres.remove(genre);
			genre.removeThread(null);
		}
	}
	public void addThreadComment(ThreadComment threadComment) {
		if (threadComments == null) {
			threadComments = new ArrayList<>();
		}
		if (!threadComments.contains(threadComment)) {
			threadComments.add(threadComment);
			threadComment.setThread(this);
		}
	}
	public void removeThreadComment(ThreadComment threadComment) {
		if (threadComments != null && threadComments.contains(threadComment)) {
			threadComments.remove(threadComment);
			threadComment.setThread(null);
		}
	}

	@Override
	public String toString() {
		return "Thread [id=" + id + ", title=" + title + ", createdAt=" + createdAt + ", user=" + user + "]";
	}

}
