package com.skilldistillery.crescendo.entities;

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
import javax.persistence.OneToMany;

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

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "album_has_genre", joinColumns = @JoinColumn(name = "album_id"), inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List<Genre> genres;

	@OneToMany(mappedBy = "album", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<AlbumComment> albumComments;

	public List<AlbumComment> getAlbumComments() {
		return albumComments;
	}

	public void setAlbumComments(List<AlbumComment> albumComments) {
		this.albumComments = albumComments;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

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
	public void addAlbumComment(AlbumComment albumComment) {
		if (albumComments == null) {
			albumComments = new ArrayList<>();
		}
		if (!albumComments.contains(albumComment)) {
			albumComments.add(albumComment);
			albumComment.setAlbum(this);
		}
	}
	public void removeAlbumComment(AlbumComment albumComment) {
		if (albumComments != null && albumComments.contains(albumComment)) {
			albumComments.remove(albumComment);
			albumComment.setAlbum(null);
		}
	}
	public void addGenre(Genre genre) {
		if (genres == null) {
			genres = new ArrayList<>();
		}
		if (!genres.contains(genre)) {
			genres.add(genre);
			genre.addAlbum(this);
		}
	}
	public void removeGenre(Genre genre) {
		if (genres != null && genres.contains(genre)) {
			genres.remove(genre);
			genre.removeAlbum(null);
		}
	}
  
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Album [id=").append(id).append(", title=").append(title).append(", coverUrl=").append(coverUrl)
				.append(", artistId=").append(artistId).append(", description=").append(description)
				.append(", releaseYear=").append(releaseYear).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + artistId;
		result = prime * result + ((coverUrl == null) ? 0 : coverUrl.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + releaseYear;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Album other = (Album) obj;
		if (artistId != other.artistId)
			return false;
		if (coverUrl == null) {
			if (other.coverUrl != null)
				return false;
		} else if (!coverUrl.equals(other.coverUrl))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (releaseYear != other.releaseYear)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

}
