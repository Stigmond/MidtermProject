package com.skilldistillery.crescendo.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import com.skilldistillery.crescendo.entities.User;

public class UserDAOTest {

	public static void main(String[] args) {
	}

	@PersistenceContext
	private EntityManager em;

	@Transactional
	public User createUser(User user) {


		em.getTransaction().begin();

		em.persist(user);
		System.out.println(user);
		em.flush();

		em.getTransaction().commit();
		System.out.println(user);

		em.close();
		return user;
	}
}
