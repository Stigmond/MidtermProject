package com.skilldistillery.crescendo.entities;

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
	
	public void addBlog(Blog blog) {
		if (blogs == null) {
			blogs = new ArrayList<>();
		}
		if (!blogs.contains(blog)) {
			blogs.add(blog);
			blog.addGenre(this);
		}
	}
	public void removeBlog(Blog blog) {
		if (blogs != null && blogs.contains(blog)) {
			blogs.remove(blog);
			blog.removeGenre(this);
		}
	}
	public void addThread(Thread thread) {
		if (threads == null) {
			threads = new ArrayList<>();
		}
		if (!threads.contains(thread)) {
			threads.add(thread);
			thread.addGenre(this);
		}
	}
	public void removeThread(Thread thread) {
		if (threads != null && threads.contains(thread)) {
			threads.remove(thread);
			thread.removeGenre(this);
		}
	}
	public void addAlbum(Album album) {
		if (albums == null) {
			albums = new ArrayList<>();
		}
		if (!albums.contains(album)) {
			albums.add(album);
			album.addGenre(this);
		}
	}
	public void removeAlbum(Album album) {
		if (albums != null && albums.contains(album)) {
			albums.remove(album);
			album.removeGenre(this);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Genre [id=").append(id).append(", name=").append(name).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Genre other = (Genre) obj;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

}
