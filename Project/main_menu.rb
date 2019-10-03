# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'passenger_train.rb'
require_relative 'passengervagon.rb'
require_relative 'cargovagon.rb'
require_relative 'main_menu.rb'
require_relative 'class_menu.rb'

class Mainmenu
  def run
    rr = Menu.new
    loop do
      text1
      users_string = gets.chomp!
      case users_string
      when '1'
        text2
        users_string = gets.chomp!

        case users_string
        when '4'
          rr.create_route

        when '3'
          rr.create_station

        when '2'
          rr.create_vagon

        when '1'
          rr.create_train

        end

      when '0'

        break

      when '2'
        text3
        users_string = gets.chomp!
        case users_string
        when '1'
          rr.add_car
       end

        case users_string

        when '2'
          rr.delete_car

        when '3'
          rr.add_station

        when '4'
          rr.delete_station

        when '5'
          rr.accelerate

        when '6'
          rr.slow_down

        when '7'
          rr.add_route

        when '8'
          rr.move_forward

        when '9'
          rr.get_back

      end

      when '3'
        text4
        users_string = gets.chomp

        case users_string

        when '1'
          text5
          users_string = gets.chomp

          case users_string

          when '1'
            rr.current_speed

          when '2'
            rr.curr_station

          when '3'
            rr.traintype

          when '4'
            rr.trainnumber

          when '5'
            rr.vagonlist
          end

        when '2'
          rr.list_of_trains

        when '3'
          rr.allstations

        end

      end
    end
  end

  private

  def text1
    puts 'Выберите действие'
    puts '1. Создать объект '
    puts '2. Совершить действия с созданными объектами'
    puts '3. Вывести данные об объектах'
    puts '0. Закончить программу'
  end

  def text2
    puts '1. Создать поезд'
    puts '2. Создать вагон'
    puts '3. Создать станцию'
    puts '4. Создать маршрут'
    puts '0. Назад'
    end

  def text3
    puts '1. Добавить вагон к поезду'
    puts '2. Отцепить вагон от поезда'
    puts '3. Добавить станцию к маршруту'
    puts '4. Удалить станцию из маршрута'
    puts '5. Набрать скорость'
    puts '6. Сбросить скорость'
    puts '7. Принять маршрут'
    puts '8. Переместиться на следующую станцию '
    puts '9. Переместиться на предыдущую станцию'
    puts '0. Назад'
  end

  def text4
    puts '1. Поезд'
    puts '2. Станция'
    puts '3. Маршрут'
    puts '0. Назад'
  end

  def text5
    puts '1. Скорость'
    puts '2. Текущая станция'
    puts '3. Тип поезда'
    puts '4. Номер'
    puts '5. список вагонов'
    puts '0. Назад'
  end
end
