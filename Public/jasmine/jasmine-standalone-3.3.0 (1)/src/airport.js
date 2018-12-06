class Airport {
	constructor() {
		this.landedPlanes = []
	}
	land(plane) {
		this.landedPlanes.push(plane)
	}
	takeOff(plane) {
		this.landedPlanes.pop
	}

};

