module  Pexcel
  class Sheets
      def self.create
      excel_obj = Spreadsheet::Workbook.new # We have created a new object of the Spreadsheet book

          #sheet = book.create_worksheet(name: 'First sheet') # We are creating new sheet in the Spreadsheet(We can create multiple sheets in one Spreadsheet book)
    sheet = excel_obj.create_worksheet :name => "New Work Sheet"
    header_row_count = 0
    bold = Spreadsheet::Format.new :weight => :bold
    border = Spreadsheet::Format.new :top => :thin,
                                     :right => :thin,
                                     :left => :thin,
                                     :bottom => :thin
    bold_border = Spreadsheet::Format.new :weight => :bold,
                                          :top => :thin,
                                          :right => :thin,
                                          :left => :thin,
                                          :bottom => :thin
    4.times do |x| sheet.row(header_row_count).set_format(x , bold) end
        4.times do |x| sheet.row(header_row_count).set_format(x , bold_border) end
          # syntax to create new row is as the following:
          # sheet.row(row_number).push(column first', 'column second', 'column third')

          # Let's create first row as the following.
          # sheet.row(0).push('Test Name', 'Test country', 'Test city', 'Test profession') # Number of arguments will be number of columns
          # sheet.row(1).push('riya', 'india', 'delhi', 'Engineer') # Number of arguments will be number of columns sheet.row(2).push('priya', 'US', 'new york', 'Teacher') # Number of arguments will be number of columns
          # sheet.row(3).push('navya', 'india', 'kanpur', 'SoftwareEngineer') 
          user_list=User.pluck(:id,:role,:first_name,:last_name)
          sheet.row(0).push("ID", "role", "First Name", "Last Name") 
          puts user_list
          user_list.each_with_index{
              |u,i|
              sheet.row(i+1).push(u[0],u[1],u[2],u[3],u[4]) 
          }
          excel_obj.write Rails.root.join('app','assets','images','user_list.xls')

        end
      end
  end