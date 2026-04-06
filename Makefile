#create a master target to ensure everything gets made when running make
all: Report.html

install:
	Rscript -e "renv::restore(prompt = FALSE)"

output/table1.rds: code/code_01.R
	Rscript code/code_01.R
	
output/figure1.rds: code/code_02.R
	Rscript code/code_02.R
	
#build the table first
output/test1_table.rds: code/code_03.R
	Rscript code/code_03.R

#then run the test and get the result, make sure to include the output as a
#dependency for it
output/test1_result.rds: code/code_03.1.R output/test1_table.rds
	Rscript code/code_03.1.R

output/test2_table.rds: code/code_04.R
	Rscript code/code_04.R

output/test2_result.rds: code/code_04.1.R output/test2_table.rds
	Rscript code/code_04.1.R
	
Report.html: Report.Rmd output/figure1.rds output/table1.rds output/test1_result.rds \
output/test1_table.rds output/test2_result.rds output/test2_table.rds
	Rscript -e 'rmarkdown::render("Report.Rmd")'

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Report.html