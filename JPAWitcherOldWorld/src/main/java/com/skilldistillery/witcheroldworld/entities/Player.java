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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Player {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	@Column(name = "current_health")
	private int currentHealth;
	@Column(name = "max_health")
	private int maxHealth;
	@Column(name = "experience_level")
	private int experienceLevel;
	@Column(name = "image_url")
	private String imageUrl;

	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;

	@OneToMany(mappedBy = "player", fetch = FetchType.EAGER)
	private List<Weapon> weapons;

	@OneToMany(mappedBy = "player", fetch = FetchType.EAGER)
	private List<Armor> armors;

	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	@OneToOne(mappedBy = "player")
	private Monster monster;
	
	
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

	public int getCurrentHealth() {
		return currentHealth;
	}

	public void setCurrentHealth(int currentHealth) {
		this.currentHealth = currentHealth;
	}

	public int getMaxHealth() {
		return maxHealth;
	}

	public void setMaxHealth(int maxHealth) {
		this.maxHealth = maxHealth;
	}

	public int getExperienceLevel() {
		return experienceLevel;
	}

	public void setExperienceLevel(int experienceLevel) {
		this.experienceLevel = experienceLevel;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public List<Weapon> getWeapons() {
		return weapons;
	}

	public void setWeapons(List<Weapon> weapons) {
		this.weapons = weapons;
	}

	public List<Armor> getArmors() {
		return armors;
	}

	public void setArmors(List<Armor> armors) {
		this.armors = armors;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Monster getMonster() {
		return monster;
	}

	public void setMonster(Monster monster) {
		this.monster = monster;
	}

	public void addWeapon(Weapon weapon) {
		if (weapons == null) {
			weapons = new ArrayList<>();
		}

		if (!weapons.contains(weapon)) {
			weapons.add(weapon);
			if (weapon.getPlayer() != null && weapon.getPlayer().equals(this)) {
				weapon.getPlayer().removeWeapon(weapon);
			}
			weapon.setPlayer(this);
		}
	}

	public void removeWeapon(Weapon weapon) {
		if (weapons != null && weapons.contains(weapon)) {
			weapons.remove(weapon);
			weapon.setPlayer(null);
		}
	}

	public void addArmor(Armor armor) {
		if (armors == null) {
			armors = new ArrayList<>();
		}

		if (!armors.contains(armor)) {
			armors.add(armor);
			if (armor.getPlayer() != null) {
				armor.getPlayer().removeArmor(armor);
			}
			armor.setPlayer(this);
		}
	}

	public void removeArmor(Armor armor) {
		if (armors != null && armors.contains(armor)) {
			armors.remove(armor);
			armor.setPlayer(null);
		}
	}

	@Override
	public String toString() {
		return "Player [id=" + id + ", name=" + name + ", description=" + description + ", currentHealth="
				+ currentHealth + ", maxHealth=" + maxHealth + ", experienceLevel=" + experienceLevel + ", imageUrl="
				+ imageUrl + ", location=" + location + ", user=" + user + "]";
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
		Player other = (Player) obj;
		return id == other.id;
	}

}
