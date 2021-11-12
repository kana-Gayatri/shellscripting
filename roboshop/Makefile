#help:
#	@IFS=$$'\n' ; \
#        help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
#        for help_line in $${help_lines[@]}; do \
#            IFS=$$'#' ; \
#            help_split=($$help_line) ; \
#            help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
#            help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
#            printf "%-15s %s\n" $$help_command $$help_info ; \
#        done
#

git-pull:
	@echo -------+ Pulling Git Code +--------
	@git pull &>/dev/null ;

frontend: git-pull ## Setup frontend Component
	@sudo bash Components/frontend.sh


#cart: git-pull ## Setup Cart Component
#	@sudo bash Components/cart.sh
#
#
#catalogue: git-pull ## Setup Catalogue Component
#	@sudo bash Components/catalogue.sh
#
#user: git-pull ## Setup User Component
#	@sudo bash Components/user.sh
#
#shipping: git-pull ## Setup shipping Component
#	@sudo bash Components/shipping.sh
#
#payment: git-pull ## Setup Payment Component
#	@sudo bash Components/payment.sh
#
#frontend: git-pull ## Setup Frontend Component
#	@sudo bash Components/frontend.sh
#
#mysql: git-pull ## Setup Mysql Component
#	@sudo bash Components/mysql.sh
#
#redis: git-pull ## Setup Redis Component
#	@sudo bash Components/redis.sh
#
#rabbitmq: git-pull ## Setup Rabbitmq Component
#	@sudo bash Components/rabbitmq.sh
#
#mongodb: git-pull ## Setup Mongodb Component
#	@sudo bash Components/mongodb.sh
#
