FactoryBot.define do
  factory :person, class: 'Person' do
    last_name { %w(Иванов Петров Васильев Ступин Харченко Прокопенко Козлов Лебедев).sample }
    first_name { %w(Иван Андрей Александр Евгений Стас Артем Илья).sample }
    middle_name { %w(Иванович Андреевич Анатольевич Владимирович Дмитриевич Вячеславович).sample }
    sex { 'male' }
  end

  factory :invalid_person, class: 'Person' do
    first_name { nil }
  end
end