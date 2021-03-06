require_all 'app'

User.create(username: "rockerguy", email: "RG@gmail.com", password: "rockon")
User.create(username: "folkhero", email: "FH@gmail.com", password: "soundofsilence")
Manufacturer.create(name: "Gibson")
Manufacturer.create(name: "Fender")
Manufacturer.create(name: "Vox")
Manufacturer.create(name: "Boss")
Manufacturer.create(name: "Ibanez")
Manufacturer.create(name: "Electro Harmonix")
Manufacturer.create(name: "Orange")
Guitar.create(model: "Les Paul", category: "Electric", user_id: "1", manufacturer_id: "1")
Guitar.create(model: "Jem", category: "Electric", user_id: "1", manufacturer_id: "5")
Guitar.create(model: "Dreadnought", category: "Acoustic", user_id: "2", manufacturer_id: "1")
Guitar.create(model: "Telecaster Slimline", category: "Semi-Hollow", user_id: "2", manufacturer_id: "2")
Guitar.create(model: "Stratocaster", category: "Electric", user_id: "1", manufacturer_id: "2")
Pedal.create(name: "Big Muff", effect_type: "Fuzz", power_supply: "9v Battery or EH AC Adaptor", user_id: "1", manufacturer_id: "6")
Pedal.create(name: "Boss", effect_type: "Tuner", power_supply: "Standard AC Adaptor", user_id: "1", manufacturer_id: "4")
Pedal.create(name: "Boss", effect_type: "Chorus", power_supply: "Standard AC Adaptor", user_id: "2", manufacturer_id: "4")
Amp.create(name: "Rocker", power_type: "Tube", watts: "15", channels: "2", num_speakers: "1", speaker_size: "10", user_id: "1", manufacturer_id: "7")
Amp.create(name: "Twin Reverb", power_type: "Tube", watts: "85", channels: "2", num_speakers: "2", speaker_size: "12", user_id: "1", manufacturer_id: "2")
Amp.create(name: "AC10", power_type: "Solid State", watts: "10", channels: "1", num_speakers: "1", speaker_size: "10", user_id: "2", manufacturer_id: "3")
