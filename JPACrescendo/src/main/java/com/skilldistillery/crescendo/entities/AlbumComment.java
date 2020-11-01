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

@Entity
@Table(name = "album_comment")
public class AlbumComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String body;

	@Column(name = "created_at")
	private LocalDateTime createdAt;

	private int edited;

	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "album_id")
	private Album album;

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public AlbumComment() {
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AlbumComment [id=").append(id).append(", body=").append(body).append(", createdAt=")
				.append(createdAt).append(", edited=").append(edited).append(", user=").append(user).append(", album=")
				.append(album).append("]");
		return builder.toString();
	}

}
