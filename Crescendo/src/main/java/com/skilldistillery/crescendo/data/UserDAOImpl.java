package com.skilldistillery.crescendo.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.crescendo.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User getTestUser() {
		return em.find(User.class, 1);
	}

	@Transactional
	@Override
	public User createUser(User user) {

		em.persist(user);
		em.flush();
		return user;
	}

	@Transactional
	@Override
	public User updateUser(User user) {
		User dbuser = em.find(User.class, user.getId());
		User newuser = user;

		dbuser.setAvatarUrl(newuser.getAvatarUrl());
		dbuser.setFirstName(newuser.getFirstName());
		dbuser.setLastName(newuser.getLastName());
		dbuser.setUsername(newuser.getUsername());
		dbuser.setPassword(newuser.getPassword());
		dbuser.setBody(newuser.getBody());

		em.flush();
		em.close();
		return dbuser;
	}

	@Override
	public User attemptLogin(String username, String password) {
		String query = "SELECT u FROM User u WHERE username = :name AND password = :password";
		List <User> validUsers = em 
				.createQuery(query)
				.setParameter("name", username)
				.setParameter("password", password)
				.getResultList();
		return (validUsers.size() == 0) ? null : validUsers.get(0);
	}

	

}
