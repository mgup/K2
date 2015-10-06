prawn_document do |pdf|
  fonts_path = Rails.root.join('app', 'assets', 'fonts')
  pdf.font_families.update(
    'PT Sans' => {
      normal: { file: "#{fonts_path}/PTSans/PTS55F.ttf", font: 'PT Sans' },
      # italic: { file: "#{fonts_path}/PTSans/PTS56F.ttf", font: 'PT Sans Italic' },
      bold: { file: "#{fonts_path}/PTSans/PTS75F.ttf", font: 'PT Sans Bold' }
      # bold_italic: { file: "#{fonts_path}/PTSans/PTS76F.ttf", font: 'PT Sans Bold Italic' }
    },
    'PT Mono' => {
      normal: { file: "#{fonts_path}/PTMono/PTM55F.ttf", font: 'PT Mono' }
      # bold: { file: "#{fonts_path}/PTMono/PTM75F.ttf", font: 'PT Mono Bold' }
    }
  )
  pdf.font('PT Sans')

  pdf.font_size(8)
  pdf.line_width = 0.5

  pdf.text 'Унифицированная форма Т-2', align: :right
  pdf.text 'Утверждена постановлением Госкомстата РФ', align: :right
  pdf.text 'от 5 января 2004 г. № 1', align: :right

  pdf.table([['', 'Код'], ['Форма по ОКУД', '0301002'], ['по ОКПО', '18922616']],
            position: :right) do
    cells.padding = [0, 2, 0, 2]
    cells.border_width = 0.5

    style(row(0), height: 12)
    style(row(1..2), height: 25, padding: [7, 5, 5, 5])

    style(column(0), borders: [:right], width: 66, align: :right)
    style(column(1), align: :center, width: 80)
  end

  y_position = pdf.cursor

  pdf.move_cursor_to 620
  pdf.bounding_box([0, 696], width: 400, height: 18) do
    pdf.font_size(7) do
      pdf.text 'федеральное государственное бюджетное образовательное '\
               'учреждение высшего профессионального образования'
      pdf.text 'Московский государственный университет печати имени '\
               'Ивана Федорова'
    end

    pdf.stroke_horizontal_rule
  end

  pdf.move_cursor_to(y_position - 10)

  pdf.table([
              [
                'Дата составления',
                'Табельный номер',
                'Идентификационный номер налогоплательщика',
                'Номер страхового свидетельства государственного пенсионного '\
                'страхования',
                'Алфавит',
                'Характер работы',
                'Вид работы (основная, по совместительству)',
                'Пол (мужской, женский)'
              ],
              [
                '', '', '', '',
                @user.last_name.first,
                '',
                '',
                @user.male? ? 'мужской' : 'женский'
              ]
            ], column_widths: [52, 47, 103, 123, 25, 42],
               cell_style: { align: :center }) do
    cells.border_width = 0.5

    style(row(1), font: 'PT Mono')
  end

  pdf.move_down 25

  pdf.text 'ЛИЧНАЯ КАРТОЧКА', align: :center, size: 14, style: :bold
  pdf.text 'работника', align: :center, size: 12, style: :bold

  pdf.bounding_box([0, 530],
                   width: pdf.bounds.width, height: 530) do
    pdf.text 'I. ОБЩИЕ СВЕДЕНИЯ', align: :center, size: 10, style: :bold

    pdf.move_down 10

    pdf.table([['Трудовой договор', 'номер', ''], ['', 'дата', '']],
              position: 308) do
      cells.padding = [0, 2, 0, 2]
      cells.border_width = 0.5

      style(row(0..1), height: 12)

      style(column(0), borders: [:right], width: 69)
      style(column(1), align: :right, width: 40)
      style(column(2), width: 100, font: 'PT Mono', size: 10, align: :center)
    end

    pdf.move_down 10

    pdf.text '1. '\
           'Фамилия ___________________________________________ '\
           'Имя ___________________________________________ '\
           'Отчество ___________________________________________'

    pdf.font('PT Mono') do
      pdf.text_box @user.last_name, size: 10, font: 'PT Mono', align: :center,
                   overflow: :shrink_to_fit,
                   at: [43, 475], width: 138, height: 10
      pdf.text_box @user.first_name, size: 10, font: 'PT Mono', align: :center,
                   overflow: :shrink_to_fit,
                   at: [202, 475], width: 138, height: 10
      pdf.text_box @user.patronymic, size: 10, font: 'PT Mono', align: :center,
                   overflow: :shrink_to_fit,
                   at: [378, 475], width: 138, height: 10
    end
  end
end
