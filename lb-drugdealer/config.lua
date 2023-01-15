Config = {}

Config.Locations = {        -- Locations of where the ped spawns. Chosen randomly every night at 22:00. Add as many as you like.
    [1] = vector4(-314.55, -1650.65, 30.85, 296.58),
    [2] = vector4(255.33, -1607.81, 30.52, 257.31),
    [3] = vector4(341.42, -1270.68, 31.09, 91.95),
    [4] = vector4(-156.28, -670.97, 33.5, 342.29),
    [5] = vector4(76.99, -871.88, 30.51, 56.77),
    [6] = vector4(-676.25, -995.57, 16.94, 230.28),
    [7] = vector4(-43.74, -1248.33, 28.34, 254.19),
    [8] = vector4(360.78, -1233.7, 31.51, 69.67),
    [9] = vector4(1004.5, -1573.01, 29.81, 6.29),
    [10] = vector4(871.63, -158.14, 77.34, 196.98),
    [11] = vector4(179.05, 293.17, 106.37, 336.12),
    [12] = vector4(-1518.39, 406.2, 106.88, 224.41),
    [13] = vector4(-1981.62, 203.78, 85.6, 136.78),
    [14] = vector4(-1952.47, -278.09, 40.97, 82.27),
    [15] = vector4(-1945.94, -547.59, 13.73, 132.09),
    [16] = vector4(-1477.58, -677.67, 28.04, 114.52),
    [17] = vector4(-787.36, -912.13, 17.09, 269.44),
    [18] = vector4(140.47, -286.61, 49.45, 32.48),
    [19] = vector4(262.42, 750.58, 198.7, 23.5),
    [20] = vector4(20.59, 338.08, 110.49, 125.43),
}

Config.BossModel = "csb_ortega" -- Starting Ped

Config.BossCoords = vector4(-909.8, -450.02, 38.61, 119.7)

Config.Model = 'cs_manuel' -- The model of the ped.

---------------------
-- SHOP OPEN/CLOSE --
---------------------

Config.Open = 20
Config.Close = 7 

Config.Items = {
    ["meth"] = {
        ["price"] = math.random(100, 150)
    },
    ["coke"] = {
        ["price"] = math.random(100, 150)
    },
    ["lsd"] = {
        ["price"] = math.random(100, 150)
    },
    ["heroin"] = {
        ["price"] = math.random(100, 150)
    },
    ["marijuana"] = {
        ["price"] = math.random(100, 150)
    },
    ["joint"] = {
        ["price"] = math.random(100, 150)
    },
    ["moonshine"] = {
        ["price"] = math.random(100, 150)
    },
}
