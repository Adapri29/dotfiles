hl.config({
    animations = {
        enabled = true,
    },
})

-- En hyprlang era:  bezier = myBezier, 0.05, 0.9, 0.1, 1.05
-- Los cuatro numeros son los dos puntos de control de la curva,
-- ahora agrupados por pares.
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- En hyprlang era:  animation = windows, 1, 7, myBezier
--                              leaf   on speed curva
hl.animation({ leaf = "windows",    enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
