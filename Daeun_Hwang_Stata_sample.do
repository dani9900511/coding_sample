
*Stata Coding Sample
*Daeun Hwang, Seoul National University

*************************************************************************
*I wrote this code while assisting in research on the Ethiopian Women's Network, under the guidance of Professor Syngjoo Choi (Seoul National University), Seollee Park (Washington State University), and Hyuncheol Bryant Kim (Hong Kong University of Science and Technology).
*The first part of the code creates variables related to household decision-making power from the household survey, and the second part conducts the regression analysis.
*************************************************************************
**********1) Make variables related to household decision-making power**********


*s8 parta dictatorship variable
foreach i in educ_child use_contraceptives number_child major_goods health_expenditure visit_family buy_clothes your_money spouse_money relative_money {
	gen s8_dict_`i'_b = abs(s8_`i'_b - 5)
	gen s8_dict_`i'_f = abs(s8_`i'_f - 5)
	gen d_s8_dict_`i'_b = abs(d_s8_`i'_b - 5)
	gen d_s8_dict_`i'_f = abs(d_s8_`i'_f - 5)
	}

*s8 partb dictatorship variable
foreach i in buy_meat buy_vit_fruit buy_otr_fruit buy_egg buy_cereal buy_roots buy_dairy {
    gen s8_dict_`i'_b = abs(s8_`i'_b - 5)
	gen s8_dict_`i'_f = abs(s8_`i'_f - 5)
	gen d_s8_dict_`i'_b = abs(d_s8_`i'_b - 5)
	gen d_s8_dict_`i'_f = abs(d_s8_`i'_f - 5) 
}
*s8 dictatorship mean
egen s8_parta_dict_mean_b = rowmean(s8_dict_educ_child_b s8_dict_use_contraceptives_b s8_dict_number_child_b s8_dict_major_goods_b s8_dict_health_expenditure_b s8_dict_visit_family_b s8_dict_buy_clothes_b s8_dict_your_money_b s8_dict_spouse_money_b s8_dict_relative_money_b)
egen s8_parta_dict_mean_f = rowmean(s8_dict_educ_child_f s8_dict_use_contraceptives_f s8_dict_number_child_f s8_dict_major_goods_f s8_dict_health_expenditure_f s8_dict_visit_family_f s8_dict_buy_clothes_f s8_dict_your_money_f s8_dict_spouse_money_f s8_dict_relative_money_f)
egen d_s8_parta_dict_mean_b = rowmean(d_s8_dict_educ_child_b d_s8_dict_use_contraceptives_b d_s8_dict_number_child_b d_s8_dict_major_goods_b d_s8_dict_health_expenditure_b d_s8_dict_visit_family_b d_s8_dict_buy_clothes_b d_s8_dict_your_money_b d_s8_dict_spouse_money_b d_s8_dict_relative_money_b)
egen d_s8_parta_dict_mean_f = rowmean(d_s8_dict_educ_child_f d_s8_dict_use_contraceptives_f d_s8_dict_number_child_f d_s8_dict_major_goods_f d_s8_dict_health_expenditure_f d_s8_dict_visit_family_f d_s8_dict_buy_clothes_f d_s8_dict_your_money_f d_s8_dict_spouse_money_f d_s8_dict_relative_money_f)
egen s8_partb_dict_mean_b = rowmean(s8_dict_buy_meat_b s8_dict_buy_vit_fruit_b s8_dict_buy_otr_fruit_b s8_dict_buy_egg_b s8_dict_buy_cereal_b s8_dict_buy_roots_b s8_dict_buy_dairy_b)
egen s8_partb_dict_mean_f = rowmean(s8_dict_buy_meat_f s8_dict_buy_vit_fruit_f s8_dict_buy_otr_fruit_f s8_dict_buy_egg_f s8_dict_buy_cereal_f s8_dict_buy_roots_f s8_dict_buy_dairy_f)
egen d_s8_partb_dict_mean_b = rowmean(d_s8_dict_buy_meat_b d_s8_dict_buy_vit_fruit_b d_s8_dict_buy_otr_fruit_b d_s8_dict_buy_egg_b d_s8_dict_buy_cereal_b d_s8_dict_buy_roots_b d_s8_dict_buy_dairy_b)
egen d_s8_partb_dict_mean_f = rowmean(d_s8_dict_buy_meat_f d_s8_dict_buy_vit_fruit_f d_s8_dict_buy_otr_fruit_f d_s8_dict_buy_egg_f d_s8_dict_buy_cereal_f d_s8_dict_buy_roots_f d_s8_dict_buy_dairy_f)

*s8 simple mean
egen s8_parta_mean_b = rowmean(s8_educ_child_b s8_use_contraceptives_b s8_number_child_b s8_major_goods_b s8_health_expenditure_b s8_visit_family_b s8_buy_clothes_b s8_your_money_b s8_spouse_money_b s8_relative_money_b)
egen s8_parta_mean_f = rowmean(s8_educ_child_f s8_use_contraceptives_f s8_number_child_f s8_major_goods_f s8_health_expenditure_f s8_visit_family_f s8_buy_clothes_f s8_your_money_f s8_spouse_money_f s8_relative_money_f)
egen d_s8_parta_mean_b = rowmean(d_s8_educ_child_b d_s8_use_contraceptives_b d_s8_number_child_b d_s8_major_goods_b d_s8_health_expenditure_b d_s8_visit_family_b d_s8_buy_clothes_b d_s8_your_money_b d_s8_spouse_money_b d_s8_relative_money_b)
egen d_s8_parta_mean_f = rowmean(d_s8_educ_child_f d_s8_use_contraceptives_f d_s8_number_child_f d_s8_major_goods_f d_s8_health_expenditure_f d_s8_visit_family_f d_s8_buy_clothes_f d_s8_your_money_f d_s8_spouse_money_f d_s8_relative_money_f)
egen s8_partb_mean_b = rowmean(s8_buy_meat_b s8_buy_vit_fruit_b s8_buy_otr_fruit_b s8_buy_egg_b s8_buy_cereal_b s8_buy_roots_b s8_buy_dairy_b)
egen s8_partb_mean_f = rowmean(s8_buy_meat_f s8_buy_vit_fruit_f s8_buy_otr_fruit_f s8_buy_egg_f s8_buy_cereal_f s8_buy_roots_f s8_buy_dairy_f)
egen d_s8_partb_mean_b = rowmean(d_s8_buy_meat_b d_s8_buy_vit_fruit_b d_s8_buy_otr_fruit_b d_s8_buy_egg_b d_s8_buy_cereal_b d_s8_buy_roots_b d_s8_buy_dairy_b)
egen d_s8_partb_mean_f = rowmean(d_s8_buy_meat_f d_s8_buy_vit_fruit_f d_s8_buy_otr_fruit_f d_s8_buy_egg_f d_s8_buy_cereal_f d_s8_buy_roots_f d_s8_buy_dairy_f)

*creating s8 mean variable (parta+partb)
foreach i in b f {
	gen s8_dict_mean_`i' = s8_parta_dict_mean_`i' + s8_partb_dict_mean_`i'
	gen d_s8_dict_mean_`i' = d_s8_parta_dict_mean_`i' + d_s8_partb_dict_mean_`i'
	gen s8_mean_`i' = s8_parta_mean_`i' + s8_partb_mean_`i'
	gen d_s8_mean_`i' = d_s8_parta_mean_`i' + d_s8_partb_mean_`i'
}

*s11 fair gender norm variable
egen s11_malefair_b = anycount( s11_equal_educ_b s11_girl_school_nohelp_b s11_boy_need_school_b s11_boy_first_nomoney_b s11_women_care_child_b s11_politics_men_b s11_men_portect_women_b s11_women_rely_son_b s11_question_husband_b s11_decide_father_b), values(2)
egen s11_femalefair_b = anycount( s11_girl_work_outside_b s11_girl_same_chance_b s11_too_many_b s11_support_herself_b ), values(1)
egen s11_malefair_f = anycount( s11_equal_educ_f s11_girl_school_nohelp_f s11_boy_need_school_f s11_boy_first_nomoney_f s11_women_care_child_f s11_politics_men_f s11_men_portect_women_f s11_women_rely_son_f s11_question_husband_f s11_decide_father_f ), values(2)
egen s11_femalefair_f = anycount( s11_girl_work_outside_f s11_girl_same_chance_f s11_too_many_f s11_support_herself_f ), values(1)
egen d_s11_malefair_b = anycount( d_s11_equal_educ_b d_s11_girl_school_nohelp_b d_s11_boy_need_school_b d_s11_boy_first_nomoney_b d_s11_women_care_child_b d_s11_politics_men_b d_s11_men_portect_women_b d_s11_women_rely_son_b d_s11_question_husband_b d_s11_decide_father_b ), values(2)
egen d_s11_femalefair_b = anycount( d_s11_girl_work_outside_b d_s11_girl_same_chance_b d_s11_too_many_b d_s11_support_herself_b ), values(1)
egen d_s11_malefair_f = anycount( d_s11_equal_educ_f d_s11_girl_school_nohelp_f d_s11_boy_need_school_f d_s11_boy_first_nomoney_f d_s11_women_care_child_f d_s11_politics_men_f d_s11_men_portect_women_f d_s11_women_rely_son_f d_s11_question_husband_f d_s11_decide_father_f ), values(2)
egen d_s11_femalefair_f = anycount( d_s11_girl_work_outside_f d_s11_girl_same_chance_f d_s11_too_many_f d_s11_support_herself_f ), values(1)
gen s11_fair_b = s11_malefair_b+ s11_femalefair_b
gen s11_fair_f = s11_malefair_f+ s11_femalefair_f
gen d_s11_fair_b = d_s11_malefair_b+ d_s11_femalefair_b
gen d_s11_fair_f = d_s11_malefair_f+ d_s11_femalefair_f

*s8 perception gap variable
*=0 : no perception gap; >0 : positive perception gap - tendency to believe each decides ; <0 :negative perception gap - tendency to believe spouser decides
foreach i in educ_child use_contraceptives number_child major_goods health_expenditure visit_family buy_clothes your_money spouse_money relative_money {
	gen s8_gap_`i'_b = s8_`i'_b - d_s8_`i'_b
	gen s8_gap_`i'_f = s8_`i'_f - d_s8_`i'_f
	gen s8_gap_abs_`i'_b = abs(s8_`i'_b - d_s8_`i'_b)
	gen s8_gap_abs_`i'_f = abs(s8_`i'_f - d_s8_`i'_f)
	}
foreach i in buy_meat buy_vit_fruit buy_otr_fruit buy_egg buy_cereal buy_roots buy_dairy {
	gen s8_gap_`i'_b = s8_`i'_b - d_s8_`i'_b
	gen s8_gap_`i'_f = s8_`i'_f - d_s8_`i'_f
	gen s8_gap_abs_`i'_b = abs(s8_`i'_b - d_s8_`i'_b)
	gen s8_gap_abs_`i'_f = abs(s8_`i'_f - d_s8_`i'_f)
	}
foreach i in b f{
	egen s8_gap_mean_`i' = rowmean(s8_gap_educ_child_`i' s8_gap_use_contraceptives_`i' s8_gap_number_child_`i' s8_gap_major_goods_`i' s8_gap_health_expenditure_`i' s8_gap_visit_family_`i' s8_gap_buy_clothes_`i' s8_gap_your_money_`i' s8_gap_spouse_money_`i' s8_gap_relative_money_`i' s8_gap_buy_meat_`i' s8_gap_buy_vit_fruit_`i' s8_gap_buy_otr_fruit_`i' s8_gap_buy_egg_`i' s8_gap_buy_cereal_`i' s8_gap_buy_roots_`i' s8_gap_buy_dairy_`i')
	egen s8_gap_abs_mean_`i' = rowmean(s8_gap_abs_educ_child_`i' s8_gap_abs_use_contraceptives_`i' s8_gap_abs_number_child_`i' s8_gap_abs_major_goods_`i' s8_gap_abs_health_expenditure_`i' s8_gap_abs_visit_family_`i' s8_gap_abs_buy_clothes_`i' s8_gap_abs_your_money_`i' s8_gap_abs_spouse_money_`i' s8_gap_abs_relative_money_`i' s8_gap_abs_buy_meat_`i' s8_gap_abs_buy_vit_fruit_`i' s8_gap_abs_buy_otr_fruit_`i' s8_gap_abs_buy_egg_`i' s8_gap_abs_buy_cereal_`i' s8_gap_abs_buy_roots_`i' s8_gap_abs_buy_dairy_`i')
}
	

*s11 gender norm perception gap variable
*=0 : no perception gap; >0: wife has fairer gender norms than husband; <0: husband has fairer gender norms than wife
gen s11_fairgap_b = s11_fair_b - d_s11_fair_b
gen s11_fairgap_f = s11_fair_f - d_s11_fair_f
gen s11_fairgap_abs_b = abs(s11_fair_b - d_s11_fair_b)
gen s11_fairgap_abs_f = abs(s11_fair_f - d_s11_fair_f)

*s8_dict_mean s8_mean d_s8_dict_mean d_s8_mean s9_mean s9_father_mean d_s9_mean d_s9_father_mean s9_gap s9_gap_abs s9_task_allocation s9_satisfy_labor s9_partner_satisfy_labor s9_husband_cook s9_husband_feed s10_work s10_expenditure s10_health s10_feed s10_community s10_communicate_freq s12_partb_mean  s12_partc_mean d_s12_partc_mean s17_mean d_s17_mean 



*creating s9 variable
foreach i in b f {
	egen s9_mean_`i' = rowmean(s9_wash_`i' s9_repair_`i' s9_shop_`i' s9_clean_`i' s9_cook_`i' s9_farm_`i' s9_trade_`i' s9_water_`i' s9_fuel_`i' s9_cattle_`i' s9_feed_`i' s9_play_`i' s9_care_`i')
	egen s9_father_mean_`i' = rowmean(s9_husband_play_`i' s9_husband_care_`i' s9_husband_cook_`i' s9_husband_wash_`i' s9_husband_feed_`i' s9_husband_give_`i')
	egen d_s9_mean_`i' = rowmean(d_s9_wash_`i' d_s9_repair_`i' d_s9_shop_`i' d_s9_clean_`i' d_s9_cook_`i' d_s9_farm_`i' d_s9_trade_`i' d_s9_water_`i' d_s9_fuel_`i' d_s9_cattle_`i' d_s9_feed_`i' d_s9_play_`i' d_s9_care_`i')
	egen d_s9_father_mean_`i' = rowmean(d_s9_husband_play_`i' d_s9_husband_care_`i' d_s9_husband_cook_`i' d_s9_husband_wash_`i' d_s9_husband_feed_`i' d_s9_husband_give_`i')
}

**********2) Conduct regression analysis**********
global strata_var "keb_2 keb_3 keb_4 keb_5 keb_6"
global baseline_controls "mother_age_b oromo_b orthodox_b mom_married_b mother_work_b abletoread_id1_b abletowrite_id1_b sch_yrs_mother eligible_age fem_hhhead hhsize_b noofchild_b assetindex"
*baseline control for spillover (excluding eligible_age / no observation)
global baseline_controls_s "mother_age_b oromo_b orthodox_b mom_married_b mother_work_b abletoread_id1_b abletowrite_id1_b sch_yrs_mother fem_hhhead hhsize_b noofchild_b assetindex"
global anthro_controls "fem_hhhead oromo_b orthodox_b mother_age_b hhsize_b noofchild_b mom_married_b mother_work_b abletoread_id1_b abletowrite_id1_b sch_yrs_mother assetindex y1_b_childagenum*"
global baseline_controls_pe "fem_hhhead oromo_b orthodox_b mother_age_b s4c1_age_b s3_pregnant_b hhsize_b noofchild_b mom_married_b mother_work_b abletoread_id1_b abletowrite_id1_b sch_yrs_mother assetindex"
global garee_var "rural tot_pop_garee tot_hh_garee  elig_tot_garee mortality_garee migration_garee sex_garee married_garee amhara_garee oromo_garee amharic_garee oromigna_garee orthodox_garee protest_garee muslim_garee noedu_garee secsch_garee postsec_garee college_garee birth_garee asset_score trans_score roof_hh wall_hh"


***** making treatment variables
tab assignment, gen(g)
foreach i in 3 5 {
	gen g`i'_fa=(g`i'==1 & voucher_assgmt==0)
	gen g`i'_mo=(g`i'==1 & voucher_assgmt==1)
	replace g`i'_fa=. if assignment==.
	replace g`i'_mo=. if assignment==.
	}
	
forval i=1/6 {
	replace g`i'=. if assignment==.

	}


***** main analysis
	* eligible sample
foreach i in s13_tot_friend_ve s13_dum_friend_ve s13_dum_friend_1_ve s13_dum_friend_2_ve s13_dum_friend_3_ve s13_prop_friend_ve {
	reg `i'_f g1 g2 g3 g4 g5 `i' if eligible==1, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3=0} {g4=0} {g5=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
	outreg2 using "$table_dir/network_table1.xls", excel append dec(3) cttop("+ outcome_b") depvar keep(g1 g2 g3 g4 g5) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_boot, `B3', g4_boot, `B4', g5_boot, `B5') 
	reg `i'_f g1 g2 g3 g4 g5 `i' $strata_var if eligible==1, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3=0} {g4=0} {g5=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
	outreg2 using "$table_dir/network_table1.xls", excel append dec(3) cttop("+ outcome_b & strata") depvar keep(g1 g2 g3 g4 g5) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_boot, `B3', g4_boot, `B4', g5_boot, `B5') 
	reg `i'_f g1 g2 g3 g4 g5 `i' $strata_var $baseline_controls if eligible==1, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3=0} {g4=0} {g5=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
	outreg2 using "$table_dir/network_table1.xls", excel append dec(3) cttop("+ outcome_b & strata & controls") depvar keep(g1 g2 g3 g4 g5) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_boot, `B3', g4_boot, `B4', g5_boot, `B5') 
}


foreach i in s13_tot_friend_ve s13_dum_friend_ve s13_dum_friend_1_ve s13_dum_friend_2_ve s13_dum_friend_3_ve s13_prop_friend_ve {
	reg `i'_f g1 g2 g3_fa g3_mo g4 g5_fa g5_mo `i' if eligible==1, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3_fa=0} {g3_mo=0} {g4=0} {g5_fa=0} {g5_mo=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
		local B6=r(p_6)
		local B7=r(p_7)
	outreg2 using "$table_dir/network_table2.xls", excel append dec(3) cttop("+ outcome_b") depvar keep(g1 g2 g3_fa g3_mo g4 g5_fa g5_mo) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_fa_boot, `B3', g3_mo_boot, `B4', g4_boot, `B5', g5_boot_fa, `B6', g5_boot_mo, `B7') 
	reg `i'_f g1 g2 g3_fa g3_mo g4 g5_fa g5_mo `i' $strata_var if eligible==1, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3_fa=0} {g3_mo=0} {g4=0} {g5_fa=0} {g5_mo=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
		local B6=r(p_6)
		local B7=r(p_7)
	outreg2 using "$table_dir/network_table2.xls", excel append dec(3) cttop("+ outcome_b & strata") depvar keep(g1 g2 g3_fa g3_mo g4 g5_fa g5_mo) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_fa_boot, `B3', g3_mo_boot, `B4', g4_boot, `B5', g5_boot_fa, `B6', g5_boot_mo, `B7')
	reg `i'_f g1 g2 g3_fa g3_mo g4 g5_fa g5_mo `i' $strata_var $baseline_controls if eligible==1, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3_fa=0} {g3_mo=0} {g4=0} {g5_fa=0} {g5_mo=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
		local B6=r(p_6)
		local B7=r(p_7)
	outreg2 using "$table_dir/network_table2.xls", excel append dec(3) cttop("+ outcome_b & strata & controls") depvar keep(g1 g2 g3_fa g3_mo g4 g5_fa g5_mo) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_fa_boot, `B3', g3_mo_boot, `B4', g4_boot, `B5', g5_boot_fa, `B6', g5_boot_mo, `B7')
}

	* spillover sample
foreach i in s13_tot_friend_ve s13_dum_friend_ve s13_dum_friend_1_ve s13_dum_friend_2_ve s13_dum_friend_3_ve s13_prop_friend_ve {
	reg `i'_f g1 g2 g3 g4 g5 `i' if eligible==0, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3=0} {g4=0} {g5=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
	outreg2 using "$table_dir/network_table1_s.xls", excel append dec(3) cttop("+ outcome_b") depvar keep(g1 g2 g3 g4 g5) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_boot, `B3', g4_boot, `B4', g5_boot, `B5') 
	reg `i'_f g1 g2 g3 g4 g5 `i' $strata_var if eligible==0, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3=0} {g4=0} {g5=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
	outreg2 using "$table_dir/network_table1_s.xls", excel append dec(3) cttop("+ outcome_b & strata") depvar keep(g1 g2 g3 g4 g5) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_boot, `B3', g4_boot, `B4', g5_boot, `B5') 
	reg `i'_f g1 g2 g3 g4 g5 `i' $strata_var $baseline_controls_s if eligible==0, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3=0} {g4=0} {g5=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
	outreg2 using "$table_dir/network_table1_s.xls", excel append dec(3) cttop("+ outcome_b & strata & controls") depvar keep(g1 g2 g3 g4 g5) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_boot, `B3', g4_boot, `B4', g5_boot, `B5') 
}


foreach i in s13_tot_friend_ve s13_dum_friend_ve s13_dum_friend_1_ve s13_dum_friend_2_ve s13_dum_friend_3_ve s13_prop_friend_ve {
	reg `i'_f g1 g2 g3_fa g3_mo g4 g5_fa g5_mo `i' if eligible==0, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3_fa=0} {g3_mo=0} {g4=0} {g5_fa=0} {g5_mo=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
		local B6=r(p_6)
		local B7=r(p_7)
	outreg2 using "$table_dir/network_table2_s.xls", excel append dec(3) cttop("+ outcome_b") depvar keep(g1 g2 g3_fa g3_mo g4 g5_fa g5_mo) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_fa_boot, `B3', g3_mo_boot, `B4', g4_boot, `B5', g5_boot_fa, `B6', g5_boot_mo, `B7') 
	reg `i'_f g1 g2 g3_fa g3_mo g4 g5_fa g5_mo `i' $strata_var if eligible==0, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3_fa=0} {g3_mo=0} {g4=0} {g5_fa=0} {g5_mo=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
		local B6=r(p_6)
		local B7=r(p_7)
	outreg2 using "$table_dir/network_table2_s.xls", excel append dec(3) cttop("+ outcome_b & strata") depvar keep(g1 g2 g3_fa g3_mo g4 g5_fa g5_mo) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_fa_boot, `B3', g3_mo_boot, `B4', g4_boot, `B5', g5_boot_fa, `B6', g5_boot_mo, `B7')
	reg `i'_f g1 g2 g3_fa g3_mo g4 g5_fa g5_mo `i' $strata_var $baseline_controls_s if eligible==0, r cl(keb_garee_b)
		boottest {g1=0} {g2=0} {g3_fa=0} {g3_mo=0} {g4=0} {g5_fa=0} {g5_mo=0}, seed(20000)
		local B1=r(p_1)
		local B2=r(p_2)
		local B3=r(p_3)
		local B4=r(p_4)
		local B5=r(p_5)
		local B6=r(p_6)
		local B7=r(p_7)
	outreg2 using "$table_dir/network_table2_s.xls", excel append dec(3) cttop("+ outcome_b & strata & controls") depvar keep(g1 g2 g3_fa g3_mo g4 g5_fa g5_mo) nocons adds(g1_boot, `B1', g2_boot, `B2', g3_fa_boot, `B3', g3_mo_boot, `B4', g4_boot, `B5', g5_boot_fa, `B6', g5_boot_mo, `B7')
}


* regression - eligible group
foreach i in s10_mean d_s10_mean s8_dict_educ_child s8_dict_use_contraceptives s8_dict_number_child s8_dict_major_goods s8_dict_health_expenditure s8_dict_visit_family s8_dict_buy_clothes s8_dict_your_money s8_dict_spouse_money s8_dict_relative_money d_s8_dict_educ_child d_s8_dict_use_contraceptives d_s8_dict_number_child d_s8_dict_major_goods d_s8_dict_health_expenditure d_s8_dict_visit_family d_s8_dict_buy_clothes d_s8_dict_your_money d_s8_dict_spouse_money d_s8_dict_relative_money s11_fair d_s11_fair s8_gap_educ_child s8_gap_use_contraceptives s8_gap_number_child s8_gap_major_goods s8_gap_health_expenditure s8_gap_visit_family s8_gap_buy_clothes s8_gap_your_money s8_gap_spouse_money s8_gap_relative_money s11_fairgap s8_dict_buy_meat s8_dict_buy_vit_fruit s8_dict_buy_otr_fruit s8_dict_buy_egg s8_dict_buy_cereal s8_dict_buy_roots s8_dict_buy_dairy s8_parta_dict_mean d_s8_parta_dict_mean s8_partb_dict_mean d_s8_partb_dict_mean s8_parta_mean d_s8_parta_mean s8_partb_mean d_s8_partb_mean s8_educ_child s8_use_contraceptives s8_number_child s8_major_goods s8_health_expenditure s8_visit_family s8_buy_clothes s8_your_money s8_spouse_money s8_relative_money s8_buy_meat s8_buy_vit_fruit s8_buy_otr_fruit s8_buy_egg s8_buy_cereal s8_buy_roots s8_buy_dairy s8_gap_mean s8_gap_abs_mean s8_gap_abs_educ_child s8_gap_abs_use_contraceptives s8_gap_abs_number_child s8_gap_abs_major_goods s8_gap_abs_health_expenditure s8_gap_abs_visit_family s8_gap_abs_buy_clothes s8_gap_abs_your_money s8_gap_abs_spouse_money s8_gap_abs_relative_money s11_fairgap_abs s8_dict_mean s8_mean d_s8_dict_mean d_s8_mean s9_mean s9_father_mean d_s9_mean d_s9_father_mean s9_gap s9_gap_abs s9_task_allocation s9_satisfy_labor s9_partner_satisfy_labor s9_husband_cook s9_husband_feed s10_work s10_expenditure s10_health s10_feed s10_community s10_communicate_freq s12_partb_mean  s12_partc_mean d_s12_partc_mean {
	reg `i'_f g1_`j'_int g2_`j'_int g3_`j'_int g4_`j'_int g5_`j'_int g1 g2 g3 g4 g5 `i' `j'_dum_b if eligible==1, r cl(keb_garee_b)
	outreg2 using "$table_dir/network_hetero_table1_`j'.xls", excel append dec(3) cttop("+ outcome_b") depvar keep(g* `j'_dum_b) nocons 
	reg `i'_f g1_`j'_int g2_`j'_int g3_`j'_int g4_`j'_int g5_`j'_int g1 g2 g3 g4 g5 `i' `j'_dum_b $strata_var if eligible==1, r cl(keb_garee_b)
	outreg2 using "$table_dir/network_hetero_table1_`j'.xls", excel append dec(3) cttop("+ outcome_b & strata") depvar keep(g* `j'_dum_b) nocons 
	reg `i'_f g1_`j'_int g2_`j'_int g3_`j'_int g4_`j'_int g5_`j'_int g1 g2 g3 g4 g5 `i' `j'_dum_b $strata_var $baseline_controls if eligible==1, r cl(keb_garee_b)
	outreg2 using "$table_dir/network_hetero_table1_`j'.xls", excel append dec(3) cttop("+ outcome_b & strata & controls") depvar keep(g* `j'_dum_b) nocons 
}
}


