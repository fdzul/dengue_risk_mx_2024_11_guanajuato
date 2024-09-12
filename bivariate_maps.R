
# Step 1. calculate the risk ####
source("~/Dropbox/hotspots_vector_2024/3.Functions/bivariate_map.R")
source("~/Dropbox/hotspots_vector_2024/3.Functions/risk.R")

risk <- risk(betas = denmex::eggs_betas_11_guanajuato,
             hotspots = hotspotsdata::hotspots_hex,
             cve_edo = "11",
             locality = "Leon de Aldama")

alto <- risk |>
    dplyr::filter(epi_cluster == 3 & entomo_cluster >= 1)
muy_alto <- risk |>
    dplyr::filter(epi_risk %in% c("Alto", 
                                  "Muy Alto",
                                  "Medio") & entomo_risk %in% c("Alto", "Muy Alto",
                                                                "Medio"))

mapview::mapview(risk,
                 legend = FALSE) +
mapview::mapview(muy_alto,
                     col.region = "red",
                     color = "white",
                 legend = FALSE) +
mapview::mapview(alto,
                 col.region = "orange",
                 color = "white",
                 legend = FALSE)

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
