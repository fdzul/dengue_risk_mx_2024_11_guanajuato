
# Step 1. calculate the risk ####
source("~/Dropbox/hotspots_vector_2024/3.Functions/bivariate_map.R")
source("~/Dropbox/hotspots_vector_2024/3.Functions/risk.R")

risk <- risk(betas = denmex::eggs_betas_11_guanajuato,
             hotspots = hotspotsdata::hotspots_hex,
             cve_edo = "11",
             locality = "Leon de Aldama")

x <- risk |>
    dplyr::filter(epi_cluster == 4)
mapview::mapview(x)

head(risk)
# Step 2. map ####
bivariate_map(data = risk, 
              x_leg = 0.67, 
              y_leg = 0.65,
              leg_scale = 0.9,
              size_lab = 7,
              static_map = TRUE) # “terrain”, “satellite”, “roadmap”, “hybrid”
bivariate_map(data = risk, 
              x_leg = 0.67, 
              y_leg = 0.65,
              leg_scale = 0.9,
              size_lab = 7,
              static_map = FALSE)
