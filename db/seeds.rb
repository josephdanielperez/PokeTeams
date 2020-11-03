u1 = User.create(username:"AshKetchum", email:"ash@pokemon.com", password: "ChampionRed")
u2 = User.create(username:"GaryOak", email:"gary@pokemon.com", password: "RivalBlue")

t1 = Team.create(name: "Ash's Team", pokemon_1: "Pikachu", pokemon_2: "Pidgeotto", pokemon_3: "Butterfree", pokemon_4: "Bulbasaur", pokemon_5: "Charizard", pokemon_6: "Squirtle")
t2 = Team.create(name: "Gary's Team", pokemon_1: "Eevee", pokemon_2: "Blastoise", pokemon_3: "Arcanine", pokemon_4: "Fearow", pokemon_5: "Nidoking", pokemon_6: "Golem")

u1.teams << t1
u2.teams << t2