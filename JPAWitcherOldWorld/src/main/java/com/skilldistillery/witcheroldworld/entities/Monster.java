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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Monster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	private int health;
	private int damage;
	@Column(name = "experience_reward")
	private int experienceReward;
	@Column(name = "image_url")
	private String imageUrl;
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "monster_location", 
	joinColumns = @JoinColumn(name = "monster_id"), 
	inverseJoinColumns = @JoinColumn(name = "location_id"))
	private List<Location> locations;
	@OneToOne
	@JoinColumn(name = "player_id")
	private Player player;

	public Monster() {

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

	public int getHealth() {
		return health;
	}

	public void setHealth(int health) {
		this.health = health;
	}

	public int getDamage() {
		return damage;
	}

	public void setDamage(int damage) {
		this.damage = damage;
	}

	public int getExperienceReward() {
		return experienceReward;
	}

	public void setExperienceReward(int experienceReward) {
		this.experienceReward = experienceReward;
	}

	public List<Location> getLocations() {
		return locations;
	}

	public void setLocations(List<Location> locations) {
		this.locations = locations;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public void addLocation(Location location) {
		if (locations == null) {
			locations = new ArrayList<>();
		}

		if (!locations.contains(location)) {
			locations.add(location);
			location.addMonster(this);
		}
	}

	public void removeLocation(Location location) {
		if (locations != null && locations.contains(location)) {
			locations.remove(location);
			location.removeMonster(this);
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
		Monster other = (Monster) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Monster ID: " + id + "|| Name: " + name + "|| Health: " + health + "|| Damage: " + damage
				+ "|| Experience Points: " + experienceReward;
	}

}
