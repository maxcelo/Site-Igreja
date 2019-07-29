namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Adicionando admin padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Adicionando custom user...") { %x(rails dev:add_default_user) }
      show_spinner("Adicionando igrejas...") { %x(rails dev:add_churchs) }
      show_spinner("Adicionando positions...") { %x(rails dev:add_positions) }
      # show_spinner("xxxxxxxx...") { %x(rails dev:xxxxxxx) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    User.create!(
      name: 'Admin',
      role: :admin,
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona o custom user"
  task add_default_user: :environment do
    User.create!(
      name: 'Teste',
      role: 0,
      email: 'teste@teste.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona cargos"
  task add_churchs: :environment do
    file_name = 'positions.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)
    
    File.open(file_path, 'r').each do |line|
      Position.create!(description: line.strip)
    end
  end

  desc "Adiciona igrejas"
  task add_positions: :environment do
    file_name = 'churches.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)
    
    File.open(file_path, 'r').each do |line|
      Church.create!(description: line.strip)
    end
  end


  private
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
