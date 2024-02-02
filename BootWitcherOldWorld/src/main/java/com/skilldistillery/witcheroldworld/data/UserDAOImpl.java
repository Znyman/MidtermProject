package com.skilldistillery.witcheroldworld.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.witcheroldworld.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String jpqlQ = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";

		User u = em.createQuery(jpqlQ, User.class).setParameter("username", username).setParameter("password", password)
				.getSingleResult();

		return u;
	}

	@Override
	public User create(User user) {
		em.persist(user);
		return user;
//Comment
	}

}
