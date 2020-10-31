package com.skilldistillery.crescendo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "album_has_genre")
public class AlbumHasGenre {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "genre_id")
	private int genreId;

	@Column(name = "album_id")
	private int albumId;

	public AlbumHasGenre() {
		super();
	}

	public AlbumHasGenre(int id, int genreId, int albumId) {
		super();
		this.id = id;
		this.genreId = genreId;
		this.albumId = albumId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
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
		builder.append("AlbumHasGenre [id=").append(id).append(", genreId=").append(genreId).append(", albumId=")
				.append(albumId).append("]");
		return builder.toString();
	}

}
