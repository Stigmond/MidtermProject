package com.skilldistillery.crescendo.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

	@Column(name = "creator_id")
	private int creatorId;

	@Column(name = "album_id")
	private int albumId;

	public AlbumComment() {
		super();
	}

	public AlbumComment(int id, String body, LocalDateTime createdAt, int edited, int creatorId, int albumId) {
		super();
		this.id = id;
		this.body = body;
		this.createdAt = createdAt;
		this.edited = edited;
		this.creatorId = creatorId;
		this.albumId = albumId;
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

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AlbumComment [id=").append(id).append(", body=").append(body).append(", createdAt=")
				.append(createdAt).append(", edited=").append(edited).append(", creatorId=").append(creatorId)
				.append(", albumId=").append(albumId).append("]");
		return builder.toString();
	}

}
