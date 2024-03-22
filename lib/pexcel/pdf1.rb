module Pexcel
  class Pdf1
      def self.create

    dirname = Rails.root.join('app', 'assets', 'images')
        Prawn::Font::AFM.hide_m17n_warning = true
        pdf = Prawn::Document.new(page_size: 'A4', page_layout: :landscape)
        pdf.font_families.update("Arial" => {
            :normal => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
            :italic => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
            :bold => Rails.root.join("app/assets/fonts/OpenSans-Bold.ttf"),
            :bold_italic => Rails.root.join("app/assets/fonts/OpenSans-Bold.ttf")
        })

        rev_row = [['TRDN xxx ', '  Rev. No. xxx ', ' Rev. Date xx/xx/xxx']]
        pdf.table(rev_row, :cell_style => {:borders => [], :padding => [0, 20, 10, 0]}) do
          column(0).style :width => 200
          column(1).style :width => 200
          column(3).style :width => 200
        end
        pdf.move_down(10)
          
        #booking_details = pdf.make_table(booking_data, :cell_style => {:borders => [], :padding => [5, 5, 5, 5]})

        pdf.font_size(16) do
          pdf.text "CLIENT’S COPY", align: :center, font_style: :bold
          pdf.fill_color "f70d1a"
          pdf.text "ACCN: AC_RDO_MMYYYY_XXXXXX", font_style: :bold
        end

        users_data = [['First Name', 'Last Name', 'ID', 'Role', 'Email']]
          User.all.each do |user|
            users_data << [user.first_name, user.last_name, user.id, user.role, user.email]
          end
    
          pdf.table(users_data, header: true, width: pdf.bounds.width) do |table|
            table.columns(0..4).align = :center
            table.row(0).font_style = :bold
            table.row(0).background_color = 'cccccc'
            table.cells.padding = [5, 5, 5, 5]
            table.cells.border_width = 0.5
            table.cells.border_color = '999999'
            table.cells.borders = [:bottom]
          end
        pdf.render_file "#{dirname}/RDMONTH-#{Date.today.strftime("%m%y")}.pdf"
    end
    end
end
