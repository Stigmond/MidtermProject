package com.skilldistillery.crescendo.entities;

import java.util.List;

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
public class Genre {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@ManyToMany
	@JoinTable(name = "blog_has_genre", joinColumns = @JoinColumn(name = "genre_id"), inverseJoinColumns = @JoinColumn(name = "blog_id"))
	private List<Blog> blogs;

	@ManyToMany
	@JoinTable(name = "thread_has_genre", joinColumns = @JoinColumn(name = "thread_id"), inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List<Thread> threads;

	@ManyToMany
	@JoinTable(name = "album_has_genre", joinColumns = @JoinColumn(name = "genre_id"), inverseJoinColumns = @JoinColumn(name = "album_id"))
	private List<Album> albums;

	public List<Album> getAlbums() {
		return albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}

	public Genre() {
		super();
	}

	public Genre(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public List<Thread> getThreads() {
		return threads;
	}

	public void setThreads(List<Thread> threads) {
		this.threads = threads;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Genre [id=").append(id).append(", name=").append(name).append("]");
		return builder.toString();
	}

}
