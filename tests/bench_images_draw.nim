import benchy, chroma, pixie, random, vmath

block:
  let
    a = newImage(1000, 1000)
    b = newImage(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rgba(0, 255, 0, 255))

  timeIt "big-on-bigger NormalBlend":
    a.draw(b, translate(vec2(25, 25)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(1000, 1000)
    b = newImage(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rgba(0, 255, 0, 255))

  timeIt "scale x0.5":
    a.draw(b, translate(vec2(25, 25)) * scale(vec2(0.5, 0.5)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(1000, 1000)
    b = newImage(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rgba(0, 255, 0, 255))

  timeIt "scale x2":
    a.draw(b, translate(vec2(25, 25)) * scale(vec2(2, 2)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(1000, 1000)
    b = newImage(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rgba(0, rand(255).uint8, 0, 255))

  timeIt "smooth x-translate":
    a.draw(b, translate(vec2(25.2, 0)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(1000, 1000)
    b = newImage(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rgba(0, rand(255).uint8, 0, 255))

  timeIt "smooth y-translate":
    a.draw(b, translate(vec2(0, 25.2)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(1000, 1000)
    b = newImage(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rgba(0, rand(255).uint8, 0, 255))

  timeIt "smooth translate":
    a.draw(b, translate(vec2(25.2, 25.2)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(1000, 1000)
    b = newImage(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rgba(0, rand(255).uint8, 0, 255))

  timeIt "smooth rotate 45":
    a.draw(b, translate(vec2(0, 500)) * rotate(toRadians(45)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(1000, 1000)
    b = newMask(500, 500)
  a.fill(rgba(255, 0, 0, 255))
  b.fill(rand(255).uint8)

  timeIt "mask smooth rotate 45 deg":
    a.draw(b, translate(vec2(0, 500)) * rotate(toRadians(45)), NormalBlend)
    keep(b)

block:
  let
    a = newImage(100, 100)
    b = newImage(50, 50)

  timeIt "shadow no offset":
    b.fill(rgba(0, 0, 0, 255))
    a.draw(b, translate(vec2(25, 25)))

    let shadow = a.shadow(
      offset = vec2(0, 0),
      spread = 10,
      blur = 10,
      color = rgba(0, 0, 0, 255)
    )
    keep(shadow)

block:
  let
    a = newImage(100, 100)
    b = newImage(50, 50)

  timeIt "shadow with offset":
    b.fill(rgba(0, 0, 0, 255))
    a.draw(b, translate(vec2(25, 25)))

    let shadow = a.shadow(
      offset = vec2(10, 10),
      spread = 10,
      blur = 10,
      color = rgba(0, 0, 0, 255)
    )
    keep(shadow)
