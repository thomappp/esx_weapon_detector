Config = {

    Dev = false,

    Detectors = {

        -- Police Station
        {
            Name = "Police main entrance",
            Coords = vector3(434.83, -981.92, 29.68),
            Radius = 2.5,
            Bypass = { "police" }
        },

        {
            Name = "Police secondary entrance",
            Coords = vector3(468.62, -1014.43, 25.38),
            Radius = 2.5,
            Bypass = { "police" }
        },

        -- Main Bank
        {
            Name = "Principal bank",
            Coords = vector3(233.29, 215.89, 106.28),
            Radius = 2.5,
            Bypass = { "police" }
        }

        --[[

            Add here the locations of your detectors with their parameters following the template 

            {
                Name = "String" -- The name of the detector
                Coords = vector3(number, number, number), -- The coordinates of the detector
                Radius = number, -- The radius of the detector
                Bypass = { "string", "string", ... } -- Jobs that bypass detector verification and receive notification of detections
            }

        ]]
    }
}
