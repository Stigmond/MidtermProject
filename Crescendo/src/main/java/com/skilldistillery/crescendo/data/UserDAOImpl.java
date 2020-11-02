package com.skilldistillery.crescendo.data;

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
		// update the "local" Customer object
		em.flush();
		return user;
	}

	@Transactional
	@Override
	public User updateUser(int id, User user) {
		User dbuser = em.find(User.class, id);
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
}
