####-----------helper.sh-------------#######

#data-hold to store html docs
mkdir data-hold
cd data-hold

#curl our files
#TX -->
curl -s http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html\
>tx1974-current.html
curl -s http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html\
> tx1923-1973.html
#FL -->
curl -s http://www.dc.state.fl.us/activeinmates/deathrowroster.asp\
> fl1.html
curl -s http://www.dc.state.fl.us/oth/deathrow/execlist.html\
> fl2.html
curl -s http://www.dc.state.fl.us/oth/deathrow/execlist2.html\
> fl3.html
#CA -->
curl -s http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf\
> ca.pdf

#Return to parent
cd ..
