#========================
# SONGS
#========================

tmp_dir = Rails.root.join("tmp")


rock = Category.create(name: "Rock")
rock.image.attach(io: File.open("#{tmp_dir}/seed_files/rock.png"), filename: "rock.png")

blues = Category.create(name: "Blues")
blues.image.attach(io: File.open("#{tmp_dir}/seed_files/blues.png"), filename: "blues.png")

country = Category.create(name: "Country")
country.image.attach(io: File.open("#{tmp_dir}/seed_files/country.png"), filename: "country.png")

jazz = Category.create(name: "Jazz")
jazz.image.attach(io: File.open("#{tmp_dir}/seed_files/jazz.png"), filename: "jazz.png")


# ANDREW HOWS

andrew_howes = Artist.create(name: "Andrew Howes")
andrew_howes.photo.attach(io: File.open("#{tmp_dir}/seed_files/andrew_howes.jpg"), filename: "andrew_howes.jpg")

gubernator = andrew_howes.albums.create(title: "Gubernator", date: Time.strptime("18/05/2015", "%d/%m/%Y"), category: rock)
gubernator.cover.attach(io: File.open("#{tmp_dir}/seed_files/gubernator.jpg"), filename: "gubernator.jpg")

dumb_luck = gubernator.songs.create(title: "Dumb Luck", played_count: Random.rand(1000))
dumb_luck.file.attach(io: File.open("#{tmp_dir}/seed_files/musics/dumb_luck.mp3"), filename: "dumb_luck.mp3")
helmsman = gubernator.songs.create(title: "Helmsman", played_count: Random.rand(1000))
helmsman.file.attach(io: File.open("#{tmp_dir}/seed_files/musics/helmsman.mp3"), filename: "helmsman.mp3")
crimea = gubernator.songs.create(title: "Crimea", played_count: Random.rand(1000))
crimea.file.attach(io: File.open("#{tmp_dir}/seed_files/musics/crimea.mp3"), filename: "crimea.mp3")
traitors_gate = gubernator.songs.create(title: "Traitors Gate", played_count: Random.rand(1000))
traitors_gate.file.attach(io: File.open("#{tmp_dir}/seed_files/musics/traitors_gate.mp3"), filename: "traitors_gate.mp3")

#========================
# USERS
#========================

freddie_mercury = User.create(name: "Freddie Mercury", email: "freddie@mercury.com", password: "dev@123456", password_confirmation: "dev@123456")
freddie_mercury.favorites.create(favoritable: dumb_luck)
freddie_mercury.favorites.create(favoritable: helmsman)
