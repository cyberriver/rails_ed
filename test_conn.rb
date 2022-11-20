require "pg"

begin
    con = PG.connect host: "localhost", port: 5432,
        dbname: "app_dev", user: "cyberriver",
        password: "qwerty"
    puts con.server_version
rescue PG::Error => e
    puts e.message
ensure
    con.close if con
end