package com.skilldistillery.crescendo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Album {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	@Column(name = "cover_url")
	private String coverUrl;

	@Column(name = "artist_id")
	private int artistId;

	private String description;

	@Column(name = "release_year")
	private int releaseYear;

	public Album() {
		super();
	}

	public Album(int id, String title, String coverUrl, int artistId, String description, int releaseYear) {
		super();
		this.id = id;
		this.title = title;
		this.coverUrl = coverUrl;
		this.artistId = artistId;
		this.description = description;
		this.releaseYear = releaseYear;
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

	public String getCoverUrl() {
		return coverUrl;
	}

	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}

	public int getArtistId() {
		return artistId;
	}

	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Album [id=").append(id).append(", title=").append(title).append(", coverUrl=").append(coverUrl)
				.append(", artistId=").append(artistId).append(", description=").append(description)
				.append(", releaseYear=").append(releaseYear).append("]");
		return builder.toString();
	}

}
