package com.skilldistillery.witcheroldworld.data;

import com.skilldistillery.witcheroldworld.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	
	User create(User user);

	
	

}
