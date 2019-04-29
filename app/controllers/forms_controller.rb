require 'faker'

class FormsController < ApplicationController
  def index
    create_fake_db("Teacher")
    create_fake_db("Tutor")
    create_fake_db("Parent")
    redirect_to '/'
  end

  def teacher
  end

  def parent
  end

  def tutor

      session[:q_page] = 0
      @q_page = 0
      render 'tutor'
  end

  def teacher_submit
    name = params[:question][:teacher_name]
    phone = params[:question][:phone]
    email = params[:question][:email]
    class_name = params[:question][:class_name]
    school_name = params[:question][:school_name]
    grade = params[:question][:grade]
    time_availability = params[:question][:time_availability]
    start_date = params[:question][:start_date]
    end_date = params[:question][:end_date]
    instruments = params[:question][:instruments]
    comment = params[:question][:comment]
    teacher = Teacher.new
    teacher.attributes = {name: name, phone: phone,
      email: email, class_name: class_name, school_name: school_name,
      grade: grade, time_availability: time_availability, start_date: start_date,
    end_date: end_date, instruments: instruments, comment: comment}
    teacher.save!
    render 'thank_you'
  end

  def parent_submit
    name = params[:question][:name]
    phone = params[:question][:phone]
    email = params[:question][:email]
    address = params[:question][:address]
    piano = params[:question][:piano]
    grade = params[:question][:grade]
    instruments = params[:question][:instruments]
    experiences = params[:question][:experiences]
    pastapp = params[:question][:pastapp]
    lunch = params[:question][:lunch]
    parent = Parent.new
    parent.attributes = {name: name, phone: phone,
      email: email, address: address, piano: piano,
      grade: grade, instruments: instruments, experiences: experiences,
    pastapp: pastapp, lunch: lunch}
    parent.save!
    render 'thank_you'
  end

  def tutor_submit
    name = params[:question][:name]
    phone = params[:question][:phone]
    email = params[:question][:email]
    sid = params[:question][:sid]
    year = params[:question][:year]
    major = params[:question][:major]
    minor = params[:question][:minor]
    experiences = params[:question][:experiences]
    in_class = params[:question][:in_class]
    instruments = params[:question][:instruments]
    time_availability = params[:question][:time_availability]
    preferred_grade = params[:question][:preferred_grade]
    private = params[:question][:private]
    piano = params[:question][:piano]
    returning = params[:question][:returning]
    prev_again = params[:question][:prev_again]
    interview_time = params[:question][:interview_time]

    tutor = Tutor.new
    tutor.attributes = {name: name, phone: phone,
      email: email, sid: sid, year: year,
      major: major, minor: minor, experiences: experiences,
    in_class: in_class, instruments: instruments, time_availability: time_availability,
   preferred_grade: preferred_grade, private: private, piano: piano, returning: returning,
   prev_again: prev_again, interview_time: interview_time}
    tutor.save!
    render 'thank_you'
  end

  def create_fake_db (type_of_person)
      days_list = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
      times_list = ["1:00 PM, 1:15 PM", "1:30 PM", "1:45 PM", "2:00 PM, 2:15 PM", "2:30 PM", "2:45 PM", "3:00 PM"]
      instruments_list = ["Ukelele", "Guitar", "Piano", "Violin", "Viola"]
      if type_of_person == "Tutor"
          for n in 0..100
              name = Faker::Name.name
              # phone = Faker::PhoneNumber.phone_number
              email = Faker::Internet.email
              # class_name = Faker::Job.title
              # school_name = Faker::Company.name
              # grade = Faker::Number.number(1)
              days = []
              start_times = []
              end_times = []
              for i in 0...2
                  days[i] = days_list.sample
                  time1 = Time.parse(times_list.sample).strftime("%H:%M")
                  time2 = Time.parse(times_list.sample).strftime("%H:%M")
                  if time1 < time2
                      start_times[i] = time1
                      end_times[i] = time2
                  else
                      start_times[i] = time2
                      end_times[i] = time1
                  end
              end
              instrument = instruments_list.sample


              # time_availability = params[:question][:time_availability]
              # start_date = params[:question][:start_date]
              # end_date = params[:question][:end_date]
              # instruments = params[:question][:instruments]
              # comment = params[:question][:comment]
              # teacher = Teacher.new
              # teacher.attributes = {name: name, phone: phone,
              #   email: email, class_name: class_name, school_name: school_name,
              #   grade: grade, time_availability: time_availability, start_date: start_date,
              # end_date: end_date, instruments: instruments, comment: comment}

              tutor = Tutor.new
              tutor.attributes = {:name => name, :email => email, :instruments => instrument, :time_availability => days.zip(start_times.zip(end_times))}
              tutor.save!
          end
      elsif type_of_person == "Teacher"
          for n in 0..100
              name = Faker::Name.name
              # phone = Faker::PhoneNumber.phone_number
              email = Faker::Internet.email
              # class_name = Faker::Job.title
              # school_name = Faker::Company.name
              # grade = Faker::Number.number(1)
              days = []
              start_times = []
              end_times = []
              for i in 0...2
                  days[i] = days_list.sample
                  time1 = Time.parse(times_list.sample).strftime("%H:%M")
                  time2 = Time.parse(times_list.sample).strftime("%H:%M")
                  if time1 < time2
                      start_times[i] = time1
                      end_times[i] = time2
                  else
                      start_times[i] = time2
                      end_times[i] = time1
                  end
              end
              instrument = instruments_list.sample


              # time_availability = params[:question][:time_availability]
              # start_date = params[:question][:start_date]
              # end_date = params[:question][:end_date]
              # instruments = params[:question][:instruments]
              # comment = params[:question][:comment]
              # teacher = Teacher.new
              # teacher.attributes = {name: name, phone: phone,
              #   email: email, class_name: class_name, school_name: school_name,
              #   grade: grade, time_availability: time_availability, start_date: start_date,
              # end_date: end_date, instruments: instruments, comment: comment}

              teacher = Teacher.new
              teacher.attributes = {:name => name, :email => email, :instruments => instrument, :time_availability => days.zip(start_times.zip(end_times))}
              teacher.save!
          end
      else
          for n in 0..100
              name = Faker::Name.name
              # phone = Faker::PhoneNumber.phone_number
              email = Faker::Internet.email
              # class_name = Faker::Job.title
              # school_name = Faker::Company.name
              # grade = Faker::Number.number(1)
              days = []
              start_times = []
              end_times = []
              for i in 0...2
                  days[i] = days_list.sample
                  time1 = Time.parse(times_list.sample).strftime("%H:%M")
                  time2 = Time.parse(times_list.sample).strftime("%H:%M")
                  if time1 < time2
                      start_times[i] = time1
                      end_times[i] = time2
                  else
                      start_times[i] = time2
                      end_times[i] = time1
                  end
              end
              instrument = instruments_list.sample


              # time_availability = params[:question][:time_availability]
              # start_date = params[:question][:start_date]
              # end_date = params[:question][:end_date]
              # instruments = params[:question][:instruments]
              # comment = params[:question][:comment]
              # teacher = Teacher.new
              # teacher.attributes = {name: name, phone: phone,
              #   email: email, class_name: class_name, school_name: school_name,
              #   grade: grade, time_availability: time_availability, start_date: start_date,
              # end_date: end_date, instruments: instruments, comment: comment}

              parent = Parent.new
              parent.attributes = {:name => name, :email => email, :instruments => instrument, :time_availability => days.zip(start_times.zip(end_times))}
              parent.save!
          end
  end
end

  #returns -1 if t1 < t2, 0 if t1 == t2, 1 if t1 > t2
  def compare_time(t1, t2)
      hour, min = t.split(':')
  end
end
