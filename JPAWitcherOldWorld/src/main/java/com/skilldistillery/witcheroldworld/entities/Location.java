package com.skilldistillery.witcheroldworld.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class Location {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	@Column(name = "image_url")
	private String imageUrl;
	@ManyToMany(mappedBy = "locations", fetch = FetchType.EAGER)
    private List<Monster> monsters;
	@OneToMany(mappedBy = "location", fetch = FetchType.EAGER)
	private List<Player> players;

	public Location() {

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public List<Monster> getMonsters() {
		return monsters;
	}

	public void setMonsters(List<Monster> monsters) {
		this.monsters = monsters;
	}

	public List<Player> getPlayers() {
		return players;
	}

	public void setPlayers(List<Player> players) {
		this.players = players;
	}

	public void addMonster(Monster monster) {
		if(monsters == null) {
			monsters = new ArrayList<>();
		}
		
		if(!monsters.contains(monster)) {
			monsters.add(monster);
			monster.addLocation(this);
		}
	}
	
	public void removeMonster(Monster monster) {
		if(monsters != null && monsters.contains(monster)) {
			monsters.remove(monster);
			monster.removeLocation(this);
		}
	}

	public void addPlayer(Player player) {
	    if (players == null) {
	        players = new ArrayList<>();
	    }
	    if (!players.contains(player)) {
	        players.add(player);
	        player.setLocation(this);
	    }
	}

	public void removePlayer(Player player) {
	    if (players != null && players.contains(player)) {
	        players.remove(player);
	        if (player != null) {
	            player.setLocation(null);
	        }
	    }
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Location other = (Location) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Location ID: " + id + "|| Name: " + name + "|| Description: " + description
				+ "|| Monsters At Location: " + monsters.size() + "|| Players At Location: " + players.size();
	}

}
