
for (p in 1:10) {
  print(p)
}


volumes = c(1.6, 3, 8)

for (volume in volumes) {
  mass <- 2.65 * volume ^ 0.9
  print(mass)
}


masses <- vector("numeric", length = length(volumes))

for (i in seq_along(volumes)) {
  masses[i] <- 2.65 * volumes[i] ^ 0.9
}

mass_lbs <- c(2.2, 3.5, 9.6, 1.2)
mass_kg <- vector("numeric", length(mass_lbs))

for (i in seq_along(mass_lbs)) {
  mass_kg[i] <- 2.2 * mass_lbs[i]
}
