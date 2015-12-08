prawn_document do |pdf|
  fonts_path = Rails.root.join('app', 'assets', 'fonts')
  pdf.font_families.update(
    'PT Sans' => {
      normal: { file: "#{fonts_path}/PTSans/PTS55F.ttf", font: 'PT Sans' },
      bold: { file: "#{fonts_path}/PTSans/PTS75F.ttf", font: 'PT Sans Bold' }
    },
    'PT Mono' => {
      normal: { file: "#{fonts_path}/PTMono/PTM55F.ttf", font: 'PT Mono' }
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
                @employee.last_name.first,
                '',
                '',
                @employee.male? ? 'мужской' : 'женский'
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
      pdf.text_box @employee.last_name, size: 10, font: 'PT Mono', align: :center,
                   overflow: :shrink_to_fit,
                   at: [43, 475], width: 138, height: 10
      pdf.text_box @employee.first_name, size: 10, font: 'PT Mono', align: :center,
                   overflow: :shrink_to_fit,
                   at: [202, 475], width: 138, height: 10
      pdf.text_box @employee.patronymic, size: 10, font: 'PT Mono', align: :center,
                   overflow: :shrink_to_fit,
                   at: [378, 475], width: 138, height: 10
    end

    pdf.move_down 16

    pdf.text '2. Дата рождения _________________________________________________________________________________________________________________'

    pdf.move_down 10

    pdf.text '3. Место рождения ________________________________________________________________________________________________________________'

    pdf.move_down 10

    pdf.text '4. Гражданство ____________________________________________________________________________________________________________________'

    pdf.move_down 10

    pdf.text '5. Знание иностранного языка'

    pdf.move_down 30

    pdf.text '6. Образование ___________________________________________________________________________________________________________________'

    pdf.bounding_box([0, 461],
                     width: pdf.bounds.width, height: 530) do
      data = [
        ['', 'код'],
        ['', l(@employee.birthdate)],
        ['по ОКАТО', ''],
        ['по ОКИН', "02#{@employee.citizenship.id}"],
        ['по ОКИН', ''],
        ['по ОКИН', ''],
        ['по ОКИН', "30 #{@employee.education_level.id}"]
      ]
      @employee.foreign_languages.each_with_index do |fl, i|
        data[4 + i][1] = "04 #{fl.language.id.to_s.rjust(3, '0')}; 05#{fl.language_proficiency.id}"
      end

      pdf.table(data, position: :right, column_widths: [38, 50]) do
        cells.padding = [2, 0, 1, 0]
        cells.border_width = 0.5

        style(row(0), height: 12)
        style(row(2..6), height: 20, valign: :center)

        style(column(0), borders: [:right])
        style(column(1), font: 'PT Mono', size: 7, align: :center)
      end
    end

    pdf.bounding_box([109, 398],
                     width: 324, height: 530) do
      data = @employee.foreign_languages.map do |fl|
        [fl.language.name, '', fl.language_proficiency.name]
      end
      (2 - data.size).times { data << ['', '', ''] }

      pdf.table(data, column_widths: [110, 14, 200]) do
        cells.padding = [0, 0, 2, 0]
        cells.border_width = 0.5

        style(row(0..1), height: 20, valign: :bottom, align: :center,
              font: 'PT Mono', size: 10, borders: [:bottom])
        style(column(1), borders: [])
      end
    end

    pdf.font('PT Mono') do
      pdf.text_box l(@employee.birthdate, format: :long), size: 10,
                   font: 'PT Mono', align: :center,
                   overflow: :shrink_to_fit,
                   at: [64, 448], width: 375

      pdf.text_box @employee.birthplace, size: 10, font: 'PT Mono',
                   align: :center, overflow: :shrink_to_fit,
                   at: [69, 428], width: 370

      pdf.text_box @employee.citizenship.name, size: 10, font: 'PT Mono',
                   align: :center, overflow: :shrink_to_fit,
                   at: [55, 407], width: 378

      pdf.text_box @employee.education_level.name, size: 10, font: 'PT Mono',
                   align: :center, overflow: :shrink_to_fit,
                   at: [57, 347], width: 374
    end

    pdf.bounding_box([0, 325], width: pdf.bounds.width) do
      @employee.education_documents.each do |document|
        pdf.table([
                    [
                      { content: 'Наименование образовательного учреждения',
                        rowspan: 2 },
                      { content: 'Документ об образовании', colspan: 3 },
                      { content: 'Год окончания', rowspan: 2 },
                      ''
                    ],
                    [
                      'наименование', 'серия', 'номер', ''
                    ],
                    [
                      document.institution, document.name, document.series, document.number, document.year_of_ending, ''
                    ],
                    [
                      'Квалификация по документу об образовании',
                      { content: 'Направление или специальность по документу',
                        colspan: 4 },
                      ''
                    ],
                    [
                      document.qualification,
                      {
                        content: document.direction.present? ?
                          document.direction.name : '',
                        colspan: 3
                      },
                      'Код по ОКСО',
                      document.direction.present? ?
                        document.direction.full_code : ''
                    ]
                  ], column_widths: [212, 80, 44, 88, 49, 50]) do
          cells.padding = [0, 2, 0, 2]
          cells.border_width = 0.5

          style(row(2), font: 'PT Mono', size: 10, height: 12, overflow: :shrink_to_fit)
          style(row(4), height: 12)
          style(row(4).columns(0..3), font: 'PT Mono', size: 10,
                overflow: :shrink_to_fit)
          style(row(4).columns(5), font: 'PT Mono', size: 7, align: :center)

          style(row(0..3).columns(5), borders: [:left])
          # style(row(4).columns(2..4), borders: [:top, :bottom, :left])
          # style(row(4).columns(4), borders: [:top, :right, :bottom])
        end

        pdf.move_down 10
      end
    end
  end
end
