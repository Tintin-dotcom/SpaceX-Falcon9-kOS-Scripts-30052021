clearscreen.
wait 4.
lock throttle to 1.
set inclination to 33.
set tAp to 250000.
set tPe to 200000.
set runmode to "Liftoff".
set fairing to "no".
rcs off.
sas off.
stage.
wait 1.

until runmode = "Done" {
	if runmode = "Liftoff" {
		stage.
		wait 2.
		set runmode to "First Stage Ascent".
	}
	else if runmode = "First Stage Ascent" {
		if alt:radar > 87 and alt:radar < 200 {
			sas on.
		}
		if alt:radar > 22500 {
			sas on.
			rcs off.
		}
		else if alt:radar > 20000 {
			sas off.
			rcs on.
		}
		if ship:stagedeltav(ship:stagenum):current < 360 {
			lock throttle to 0.
			sas off.
			rcs on.
			print "MECO!!!".
			wait 1.
			stage.
			wait 1.
			lock throttle to 1.
			set runmode to "Second Stage Ascent".
		}
		turn(inclination).
	}
	else if runmode = "Second Stage Ascent" {
		if alt:radar > 60000 and fairing = "no" {
			stage.
			set fairing to "yes".
		}
		if ship:apoapsis > tAp {
			rcs on.
			lock throttle to 0.
			wait 1.
			set runmode to "Orbital insertion".
		}
		turn(inclination).
	}
	else if runmode = "Orbital insertion" {
		if eta:apoapsis < 15 {
			lock throttle to 1.
		}
		if ship:periapsis > tPe {
			lock throttle to 0.
			set runmode to "Spin-up".
		}
		turn(inclination).
	}
	else if runmode = "Spin-up" {
		lock shipheading to heading.
		spin(shipheading).
		wait 3.
		stage.
		set runmode to "De-orbit".
	}
	else if runmode = "De-orbit" {
		wait 20.
		lock steering to retrograde.
		lock throttle to 1.
		if ship:periapsis < 50000 {
			lock throttle to 0.
			set runmode to "Done".
		}
	}
		
	printVesselStats().
}

function printVesselStats {
	clearscreen.
	print "Second stage telemetry:" at(1, 4).
	print "Altitude above sea level: " + round(ship:altitude) + "m" at(10, 5).
	print "Current apoapsis: " + round(ship:apoapsis) + "m" at (10, 6).
	print "Current periapsis: " + round(ship:periapsis) + "m" at (10, 7).
	print "Orbital velocity: " + round(ship:velocity:orbit:mag * 3.6) + "km/h" at(10, 9).
}

function turn {
	parameter heading.
	if alt:radar < 20000 {
		lock angle to 1200000/alt:radar.
		if angle > 90 {
			lock angle to 90.
		}
		if angle < 1 {
			lock angle to 0.
		}
		lock steering to heading(heading, angle).
	}
	else if alt:radar > 60000 {
		lock steering to prograde.
	}
	else{
		lock angle to 94 - 1.03287 * alt:radar^.409511.
		lock steering to heading(heading, angle).
	}
}

function spin {
	parameter heading.
	if heading >= 0 {
		lock steering to heading(heading - 10, 0).
	}
}
		lock steering to heading(350, 0).
	}
}
