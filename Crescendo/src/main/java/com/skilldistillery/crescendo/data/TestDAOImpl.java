package com.skilldistillery.crescendo.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.crescendo.entities.User;

@Service
@Transactional
public class TestDAOImpl implements TestDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User getTestUser() {
		return em.find(User.class, 1);
	}

}
