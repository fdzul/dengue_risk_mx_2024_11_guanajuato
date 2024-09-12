# Step 2. load the dataset ####
path_sinave <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/DGE/denv/2024/DENGUE2_.txt"

den2024 <- data.table::fread(path_sinave,
                             #select = vect_cols2,
                             encoding = "Latin-1",
                             quote="",
                             fill=TRUE)


x <- denhotspots::read_dengue_dataset(path = path_sinave,
                                      spatial_resolution = "country",
                                      status_caso = c(1, 2))

# Step 1. load the dataset 
source("~/Dropbox/r_developments/r_new_functions/3.Functions/static_bump_map.R")


library(sf)
static_bump_map(dataset = den2024,
                year = 2024,
                state = FALSE,
                cve_edo = "11",
                country_text_x = .01,
                country_text_y = 0.024,
                axis_start = 0.5,
                value_text = 0.37,
                size_text_value = 4,
                line_size = 2,
                size_text_country = 4,
                pal_vir = "viridis") 
