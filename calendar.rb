# frozen_string_literal: true

require 'date'
# Integer class to count values of given number
class Integer
  def num_digits
    Math.log10(self).to_i + 1
  end
end
# Event class to handle all details about event
class Event
  @event_record = {}
  def add_Event(date, name, des)
    if @event_record.to_s.length.zero?
      @event_record = {}
      @event_record[date] = name, des
    else
      add_multiple_events(date, name, des)
    end
    p @event_record
  end

  def add_multiple_events(date, name, des)
    @event_record.dup.each do |key, value|
      if key == date
        @a = []
        @a[0] = name
        @a[1] = des
        @event_record[key] = value, @a
      else
        @event_record[date] = name, des
      end
    end
  end

  def remove_event(date)
    if @event_record.to_s.size.zero?
      puts '-----------No single Event has booked----------'
    elsif !@event_record.key?(date)
      puts "      ----------No event on #{date} has been recorded-----------\n\n"
    elsif @event_record[date][0].class == Array
      remove_multiple_events(date)
    else
      @event_record.delete(date)
    end
    p @event_record
  end

  def remove_multiple_events(date)
    puts 'Please eneter title of your event:'
    print 'Title:'
    @title = gets.chomp
    puts 'Please enter description of your event:'
    print 'Description:'
    @description = gets.chomp
    @count = 0
    while @count < @event_record[date].length
      if @event_record[date][@count][0] == @title && @event_record[date][@count][1] == @description
        @event_record[date].delete_at(@count)
      end
      @count += 1
    end
    p @event_record
  end

  def update_event(date)
    if @event_record.to_s.size.zero?
      puts 'No single event to be update'
    elsif !@event_record.key?(date)
      puts "        ---------No event on #{date} to be update--------------\n\n"
    elsif @event_record[date][0].class == Array
      update_multiple_events(date)
    else
      puts 'Please enter updation title of your event:'
      print 'Title:'
      @title = gets.chomp
      puts 'Please enter updation description of your event'
      print 'Description:'
      @description = gets.chomp
      @event_record[date] = @title, @description
    end
  end

  def update_multiple_events(date)
    puts "      ----------You have #{@event_record[date].length} events on #{date}--------------"
    puts 'Please enter title of event you want to update:'
    print 'Title:'
    @title = gets.chomp
    puts 'Please enter description of event you want to update'
    print 'Description:'
    @description = gets.chomp
    @count = 0
    while @count < @event_record[date].length
      if @event_record[date][@count][0] == @title && @event_record[date][@count][1] == @description
        puts 'Please enter updation title:'
        print 'Title:'
        @updated_title = gets.chomp
        puts 'Please enter updation description:'
        print 'Description:'
        @updated_description = gets.chomp
        @event_record[date][@count] = @updated_title, @updated_description
      end
      @count += 1
    end
    p @event_record
  end
  def detail_specific_date(date)
    if @event_record.to_s.length.zero?
      puts '      ----------No single event has been recorded-------------'
    elsif !@event_record.key?(date)
      puts "      -------------No event has been recorded on #{date} --------------------\n\n"
    elsif @event_record[date][0].class == Array
      detail_events(date)
    else
      puts '               Deatil of event/events '
      puts "         Date of your event is:#{date}"
      puts "         Title of your event is:#{@event_record[date][0]}"
      puts "         Description of your event is:#{@event_record[date][1]}"
    end
  end
  def detail_events(date)
    @count = 0
    puts "       ----------------You have #{@event_record[date].length} events on #{date} date-----------------"
    while @count< @event_record[date].length
      puts "Date of event is:#{date}"
      puts "Event title:#{@event_record[date][@count][0]}"
      puts "Event Description is:#{@event_record[date][@count][1]}"
      @count += 1
    end
  end
  def month_detail
    if @event_record.to_s.length.zero?
      puts '      -----------------You have no any single event record untill now------------------'
    else
      @event_record.each do |key, value|
        if value[0].class == Array
          detail_events(key)
        else
          puts "Event date is:#{key}"
          puts "Event title is:#{@event_record[key][0]}"
          puts "Event description is:#{@event_record[key][1]}"
        end
      end
    end
  end
  def display_calendar
    date = Date.parse('01/08/2020')
    count = 1
    puts '                     -----------    '
    puts '                     August 2020'
    puts '          SAT   SUN   MON  TUE  WED  THU  FRI'
    puts '        ---------------------------------------'
    print '      '
    while date.day != 31
      if date.saturday?
        print "    #{date.day}"
      elsif date.sunday?
        if date.day.num_digits == 1
          print "     #{date.day}"
        elsif date.day.num_digits == 2
          print "    #{date.day}"
        end
      elsif date.monday?
        if date.day.num_digits == 1
          print "     #{date.day}"
        elsif date.day.num_digits == 2 && date.day == 10
          print "     #{date.day}"
        else
          print "    #{date.day}"
        end
      elsif date.tuesday?
        if date.day.num_digits == 1
          print "     #{date.day}"
        elsif date.day.num_digits == 2
          print "    #{date.day}"
        end
      elsif date.wednesday?
        if date.day.num_digits == 1
          print "     #{date.day}"
        elsif date.day.num_digits == 2
          print "    #{date.day}"
        end
      elsif date.thursday?
        if date.day.num_digits == 1
          print "     #{date.day}"
        elsif date.day.num_digits == 2
          print "    #{date.day}"
        end
      elsif date.friday?
        if date.day.num_digits == 1
          print "     #{date.day}"
        elsif date.day.num_digits == 2
          print "    #{date.day}"
        end
      end
      date += 1
      count += 1
      if count == 8
        puts "\n"
        print '      '
        count = 1
      end
    end
    puts "\n\n"
  end

  def month_view
    date = Date.parse('01/08/2020')
    count = 1
    puts '                     -----------    '
    puts '                     August 2020'
    puts '          SAT   SUN   MON  TUE  WED  THU  FRI'
    puts '        ---------------------------------------'
    print '           '
    while date.day != 31
      if date.saturday?
        if @event_record.key?(date.day) && date.day.num_digits == 1
          print "#{date.day}(#{@event_record[date.day].length})  "
        elsif date.day.num_digits == 1
          print "#{date.day}    "
        elsif @event_record.key?(date.day) && date.day.num_digits == 2
          print "#{date.day}(#{@event_record[date.day].length})"
        elsif date.day.num_digits == 2
          print "#{date.day}   "
        end
      elsif date.sunday?
        if date.day.num_digits == 1 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length})  "
        elsif date.day.num_digits == 1
          print "#{date.day}     "
        elsif date.day.num_digits == 2 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length}) "
        elsif date.day.num_digits == 2
          print "#{date.day}    "
        end
      elsif date.monday?
        if date.day.num_digits == 1 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length})  "
        elsif date.day.num_digits == 1
          print "#{date.day}     "
        elsif date.day.num_digits == 2 && @event_record.key?(date.day) && date.day == 10
          print "#{date.day}(#{@event_record[date.day].length}) "
        elsif date.day.num_digits == 2
          print "#{date.day}    "
        else
          print "#{date.day}    "
        end
      elsif date.tuesday?
        if date.day.num_digits == 1 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length})  "
        elsif date.day.num_digits == 1
          print "#{date.day}    "
        elsif date.day.num_digits == 2 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length}) "
        elsif date.day.num_digits == 2
          print "#{date.day}   "
        end
      elsif date.wednesday?
        if date.day.num_digits == 1 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length})  "
        elsif date.day.num_digits == 1
          print "#{date.day}     "
        elsif date.day.num_digits == 2 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length}) "
        elsif date.day.num_digits == 2
          print "#{date.day}    "
        end
      elsif date.thursday?
        if date.day.num_digits == 1 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length})  "
        elsif date.day.num_digits == 1
          print "#{date.day}     "
        elsif date.day.num_digits == 2 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length}) "
        elsif date.day.num_digits == 2
          print "#{date.day}    "
        end
      elsif date.friday?
        if date.day.num_digits == 1 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length})  "
        elsif date.day.num_digits == 1
          print "#{date.day}     "
        elsif date.day.num_digits == 2 && @event_record.key?(date.day)
          print "#{date.day}(#{@event_record[date.day].length}) "
        elsif date.day.num_digits == 2
          print "#{date.day}    "
        end
      end
      date += 1
      count += 1
      if count == 8
        puts "\n"
        print '           '
        count = 1
      end
    end
    puts "\n\n"
  end
end
event_date = 0
e = Event.new
e.display_calendar
while event_date != 7
  puts 'Enter 1 to book an event'
  puts 'Enter 2 to update an existing event'
  puts 'Enter 3 to delete an event'
  puts 'Enter 4 to view event against specific date'
  puts 'Enter 5 to view monthly events report'
  puts 'Enter 6 if you want to see monthly events in calendar view'
  puts 'Enter 7 if you want to do nothing'
  event_date = gets.chomp
  event_date = event_date.to_i
  if event_date == 1
    puts 'Please choose event date from given calander'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    puts 'Please Specify title for your event'
    print 'Title:'
    event_title = gets.chomp
    puts 'Please enter description of your event'
    print 'Description:'
    event_description = gets.chomp
    puts '     ***Thank you for evaluating information about your event***'
    puts "\n"
    e.add_Event(event_day, event_title, event_description)
  end
  if event_date == 2
    puts 'Please enter date whose event to be change'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    e.update_event(event_day)
  end
  if event_date == 3
    puts 'Enter Date to delete event of specific date'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    e.remove_event(event_day)
  end
  if event_date == 4
    puts 'Enter date to view event details'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    e.detail_specific_date(event_day)
  end
  if event_date == 5
    puts '        -------------Detail of monthly events-----------------'
    e.month_detail
  end
  if event_date == 6
    puts '             -------------Monthly events in form of calendar is----------------'
    e.month_view
  end
end
