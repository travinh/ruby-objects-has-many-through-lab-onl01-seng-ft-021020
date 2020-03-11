require_relative "./appointment.rb"

class Patient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select{ |app| app.patient == self }
  end

  def doctors
    appointments.map { |app| app.doctor }
  end

  def self.all
    @@all
  end

end