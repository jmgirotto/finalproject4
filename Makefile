#create a master target to ensure everything gets made when running make
all: report/Report.html

report: report/Report.html

output: 
	mkdir -p output

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
	
report/Report.html: Report.Rmd output/figure1.rds output/table1.rds output/test1_result.rds \
output/test1_table.rds output/test2_result.rds output/test2_table.rds
	mkdir -p report
	Rscript -e 'rmarkdown::render("Report.Rmd", output_dir = "report")'

.PHONY: clean all run report
clean:
	rm -f output/*.rds && rm -rf report/
	
#docker
IMAGE = jmgirotto/report-image

run:
	mkdir -p report
	docker run --rm \
		-v "$$(pwd)/report:/home/rstudio/project/report" \
		$(IMAGE)
	