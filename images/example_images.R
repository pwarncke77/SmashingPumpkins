

library(pacman)
p_load(devtools)
p_load(tidyverse)
p_load(SmashingPumpkins)

# remove.packages("SmashingPumpkins")
# devtools::install_github("pwarncke77/SmashingPumpkins")


png("gish.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("gish"))
dev.off()

png("gish_dark.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("gish_dark"))
dev.off()

png("gish_light.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("gish_light"))
dev.off()

png("simamese_dream.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("simamese_dream"))
dev.off()

png("simamese_dream_dark.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("simamese_dream_dark"))
dev.off()

png("simamese_dream_light.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("simamese_dream_light"))
dev.off()

png("simamese_dream_re.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("simamese_dream_re"))
dev.off()

png("mellon_collie.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("mellon_collie"))
dev.off()

png("mellon_collie_dark.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("mellon_collie_dark"))
dev.off()

png("mellon_collie_light.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("mellon_collie_light"))
dev.off()

png("adore.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("adore"))
dev.off()

png("zeitgeist.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("zeitgeist"))
dev.off()

png("oceania.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("oceania"))
dev.off()

png("cyr.png", width = 800, height = 200)
SmashingPumpkins::print_palette(SmashingPumpkins::pumpkins_palette("cyr"))
dev.off()



