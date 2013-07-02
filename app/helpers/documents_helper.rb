# encoding: utf-8
module DocumentsHelper
  def dlevel_title(dlevel)
    case dlevel
    when 1
      'Стратегии, Политики'
    when 2
      'Положения, Описания процесса'
    when 3
      'Регламенты, Инструкции'
    when 4
      'Свидетельства: Акты, Протоколы, Журналы'
    else
      dlevel
    end
  end

  def place_title(place)
    case place
    when 'ЮР01'
      'Положения об отделах, Должностные инструкции'
    when 'ЮР02'
      'Служба внутреннего контроля'
    when 'ЮР03'
      'Риски'
    when 'ЮР04'
      'Кредиты'
    when 'ЮР05'
      'Бухгалтерия'
    when 'ЮР06'
      'Валюта'
    when 'ЮР07'
      'ПОДФТ'
    when 'ЮР08'
      'Управление ИТ'
    when 'ЮР09'
      'Депозиты'
    when 'ЮР10'
      'Отдел ФЛ'
    when 'ЮР11'
      'Прочие'
    when 'ЮР12'
      'Трудовая деятельность'
    when 'ЮР13'
      'ПДн'
    when 'ЮР14'
      'Охрана труда'
    when 'ЮР15'
      'Касса'
    when 'ЮР16'
      'Отдел Э и ХО'
    when 'ЮР17'
      'Распоряжения'
    end
  end



end
