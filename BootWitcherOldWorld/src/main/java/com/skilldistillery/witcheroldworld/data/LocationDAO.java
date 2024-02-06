package com.skilldistillery.witcheroldworld.data;

import com.skilldistillery.witcheroldworld.entities.Location;

public interface LocationDAO {
    Location findById(int locationId);

}
