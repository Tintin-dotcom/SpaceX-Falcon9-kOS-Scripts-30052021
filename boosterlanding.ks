clearscreen.
wait until verticalspeed < -5.
toggle ag2.
rcs on.
sas off.
lock steering to srfRetrograde.
set runmode to "Re-entry".

until runmode = "Landed"{
	if runmode = "Re-entry" {
		if ship:velocity:surface:mag > 600 {
			toggle ag4.
			lock throttle to 1.
			set runmode to "Re-entry burn".
		}
	}
	else if runmode = "Re-entry burn" {
		if ship:velocity:surface:mag < 550 {
			lock throttle to 0.
			set runmode to "Landing burn Start".
		}
	}
	else if runmode = "Landing burn Start" {
		if alt:radar < 2855 {
			toggle ag5.
			lock throttle to 1.
			set runmode to "Landing burn".
		}
	}
	else if runmode = "Landing burn"{
		if alt:radar < 300 {
			toggle ag6.
			toggle gear.
			set runmode to "Landing legs deployed".
		}
	}
	else if runmode = "Landing legs deployed"{
		if verticalspeed > -3 {
			lock throttle to 0.65.
			lock steering to up.
		}
		else if verticalspeed < -6 {
			lock throttle to 1.
		}
		else {
			lock throttle to 0.73.
			lock steering to up.
		}
		if alt:radar < 27.5 {
			lock throttle to 0.
			set runmode to "Landed".
		}
	}
}
