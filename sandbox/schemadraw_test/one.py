# import schemdraw
# import schemdraw.elements as elm

# with schemdraw.Drawing() as d:
#     d += elm.Line().right()  # Początkowy odcinek przewodu
#     d += elm.Dot()  # Węzeł początkowy
#     start_pos = d.here  # Zapisz aktualną pozycję
#     d.push()
#     d += elm.Line().up().length(1.5)
#     d += elm.Resistor().right().label('R1')
#     d += elm.Line().down().length(1.5)
#     d.pop()
#     d.push()
#     d += elm.Resistor().right().label('R2')
#     d.pop()
#     d += elm.Line().down().length(1.5)
#     d += elm.Resistor().right().label('R3')
#     d += elm.Line().up().length(1.5)
#     d += elm.Dot()  # Węzeł końcowy
#     d += elm.Line().right()  # Końcowy odcinek przewodu


import matplotlib.pyplot as plt
import schemdraw
import schemdraw.elements as elm

# Tworzenie pierwszego schematu
with schemdraw.Drawing() as d1:
    d1 += elm.SourceV().up()
    d1 += elm.Resistor().right().label('R1')
    d1 += elm.Resistor().down().label('R2')
    d1 += elm.Resistor().left().label('R3')
    d1 += elm.Line().up()

# Tworzenie drugiego schematu
with schemdraw.Drawing() as d2:
    d2 += elm.SourceV().up()
    d2 += elm.Resistor().right().label('R_eq')
    d2 += elm.Line().down()
    d2 += elm.Line().left()
    d2 += elm.Line().up()

# Tworzenie wykresu z dwoma schematami obok siebie
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))

# Wyświetlanie pierwszego schematu
ax1.imshow(d1.get_imagedata())
ax1.axis('off')  # Ukrycie osi

# Wyświetlanie drugiego schematu
ax2.imshow(d2.get_imagedata())
ax2.axis('off')  # Ukrycie osi

# Wyświetlenie wykresu
plt.show()
