 DATA_SECTION
//Bristol Bay red king crab model, 1968-2008
//
//  !!CLASS of stream post("eval.csv")
  init_int styr   //start year of the model
  init_int endyr  //end year of the model
// Data stuff only from here
  init_int nirec      //number of initial recruitments to estimate
  init_int nlenm      //number of length bins for males in the model
  init_int nlenf      //number of length bins for females in the model
  init_int nr         //number of length bins for recruits
  init_number slt     //length interval (mm)
  init_number ilen1   //minimum length (mm)
  init_int nobs_fish  //number of years of fishery retained length data
  init_ivector yrs_fish(1,nobs_fish) //years when have fishery retained length data
  init_vector nsamples_fish(1,nobs_fish) //nsamples weight for fish length comps needmatrix each year
  init_int nobs_fish_discf  //number of years of fishery female discard length data
  init_ivector yrs_fish_discf(1,nobs_fish_discf) //years when have fishery discard length data
  init_vector nsamples_fish_discf(1,nobs_fish_discf) //nsamples weight for disc. female length comps
  init_int nobs_fish_discm  //number of years of fishery male discard length data
  init_ivector yrs_fish_discm(1,nobs_fish_discm) //years when have fishery discard length data
  init_vector nsamples_fish_discm(1,nobs_fish_discm) //nsamples weight for disc. male length comps
  init_number nobs_trawl                       //number of years of trawl bycatch length data
  init_vector yrs_trawl(1,nobs_trawl)          //years when have trawl bycatch data
  init_matrix nsamples_trawl(1,2,1,nobs_trawl) //weight for trawl bycatch data
// !!cout<<nsamples_trawl<<endl;
  init_number nobs_srv1                        //number of years of biomass data
  init_ivector yrs_srv1(1,nobs_srv1)           //years when have biomass estimates
  init_matrix nsamples_srv1(1,2,1,nobs_srv1)   //weight for each length comp by sex for length data,female 1 and male 2
  init_matrix obs_p_srv1_len_f(1,nobs_srv1,1,nlenm)  //survey length data for female, year then bin
  init_3darray obs_p_srv1_len_m(1,2,1,nobs_srv1,1,nlenm)  //survey length data for male,newshell and oldshell, year then bin
  init_matrix obs_p_fish_ret(1,nobs_fish,1,nlenm)           //male retained fishery length data
//  init_matrix obs_p_fish_tot(1,nobs_fish_discm,1,nlenm)     //total pot male length data
  init_matrix obs_p_fish_discf(1,nobs_fish_discf,1,nlenm)   //female,discard length data
  init_matrix obs_p_fish_discm(1,nobs_fish_discm,1,nlenm)   //male,disc.length data
  init_3darray obs_p_trawl(1,2,1,nobs_trawl,1,nlenm)        //female and male trawl bycatch data
//  !!cout<<obs_p_trawl<<endl;
  init_vector catch_numbers(styr,endyr)                     //retained catch number of crab
//  !!cout<<catch_numbers<<endl;
  init_vector catch_ret(styr,endyr)                         //retained yield
  init_matrix catch_disc(1,2,styr,endyr) //estimated discard catch numbers female,male
  init_vector catch_trawl(styr,endyr)  //trawl bycatch numbers sex combined need to apply mort 80%
//  !!cout<<catch_trawl<<endl;
  init_vector obs_srv1(1,nobs_srv1)        //survey numbers
//  !!cout<<obs_srv1<<endl;
  init_matrix cv_srv1(1,2,1,nobs_srv1)     //survey cv
  init_matrix wt(1,2,1,nlenm)              //weight at length females,males
  init_vector length_bins(1,nlenm)
  init_matrix g(1,4,1,nlenm)         //growth increment per molt, females and males
  init_imatrix ggf(1,2,1,nlenm)      //minimum & maximum growth increment per molt, females
  init_imatrix ggm(1,2,1,nlenm)      //minimum & maximum growth increment per molt, males
  init_vector cm(styr,endyr)            //mid-points of catch from the survey
//  !!cout<<cm<<endl;
  init_matrix p68(1,3,1,nlenm)      //proportions of survey abundance in 1968, initial year.
  init_vector fc(styr,styr+4)       //proportion of foreign retained catch by year during 1968-1972
//  !!cout<<fc<<endl;
  init_vector s_bsfrf(1,nlenm) //catchability/selectivity from BSFRF surveys
//  !!cout<<s_bsfrf<<endl;
  init_int nobs_bsfrf  //number of years of BSFRF survey
//  !!cout<<nobs_bsfrf<<endl;
  init_ivector yrs_bsfrf(1,nobs_bsfrf) //years when having BSFRF survey
  init_vector obs_bsfrf(1,nobs_bsfrf) //mature male abundance from BSFRF surveys
  init_vector cv_bsfrf(1,nobs_bsfrf) //mature male abundance from BSFRF surveys
  init_vector q_bsfrf(1,2) //maximum catchability and Cv from BSFRF surveys
//  !!cout<<q_bsfrf<<endl;
//   !!exit(1);
// End of reading normal data file, and Open control file....

!!ad_comm::change_datafile_name("tanner.dat");
  init_int nobs_tc                          //number of years with tc observer data
  init_ivector yrs_tc(1,nobs_tc)               //years with tc observer data
  init_matrix nsamples_tc(1,2,1,nobs_tc)        //weight for each length comp by sex for length data,female 1 and male 2
  init_matrix obs_p_tc_len_f(1,nobs_tc,1,nlenm)  //survey length data for female, year then bin
  init_matrix obs_p_tc_len_m(1,nobs_tc,1,nlenm)  //survey length data for female, year then bin
  init_matrix catch_tc(1,2,1,nobs_tc)            //estimated discard rkc catch numbers female,male in the TC fishery
  init_number m_tc                               //discard handling mortality rate
  init_vector tc_e(styr,endyr)                   //potlift of the TC fishery
  init_vector tc_cm(styr,endyr)                  //time from the survey to the mid fishery of the Tanner crab fishery
//  !!cout<<tc_e<<endl;

!!ad_comm::change_datafile_name("size.dat");
  init_matrix obs_s_srv1(1,2,1,nobs_srv1)           //observed survey length data sample sizes for females and males
  init_vector obs_s_fish_ret(1,nobs_fish)           //male retained fishery length data sample sizes
  init_vector obs_s_fish_discf(1,nobs_fish_discf)   //female,discard length data sample sizes
  init_vector obs_s_fish_discm(1,nobs_fish_discm)   //male,disc.length data sample sizes
  init_matrix obs_s_trawl(1,2,1,nobs_trawl)           //observed trawl bycatch length data sample sizes for females and males
  init_matrix obs_s_tc(1,2,1,nobs_tc)               //observed Tanner crab fishery bycatch length data sample sizes for females and males

!!ad_comm::change_datafile_name("bbrkc.ctl");
  init_number alphar1              //female mean length of recruits (mm)
  init_number alphar2              //male mean length of recruits (mm)
  init_imatrix Mn(1,2,styr,endyr) //natural mortality year index for females then males
  init_ivector mo(styr,endyr)     //male molting probability year index
  init_int survsel_phase          //phase to estimate parameters for survey selectivties
  init_int nsellen  //selectivity is set to the selectivity at nselages-1 after age nselages
  init_int nsellen_srv1       //same as above for survey selectivities
  init_int phase_logistic_sel //phase to estimate selectivities using logistic function
  init_vector like_wght(1,7)  //likelihood weights for fishery length data, survey length, age data, catch likelihood, survey biomass likelihood,growth like
  init_number like_wght_rec
  init_number like_wght_sexr
  init_number like_wght_sel50

  init_number m_disc          //fraction of discards that die (.20)
  init_number m_trawl         //fraction of trawl discards that die(.8)
  init_number bycatch_w         //likelihood weight for bycatch biomass
  init_vector mat(1,nlenm)      //maturity vector
  init_vector flast(1,3)        //terminal year F for different maturity sizes
  init_number vb                //standard deviation of the terminal year total abundance
  init_number b35               //MMB at F35%
  init_vector fprj(1,3)         //F for projection, 1. 0, 2, F40%, 3, F35%
  init_number y_bsfrf           //1 or 0 for using or not using BSFRF data
  init_ivector ryear(1,2)       //years used for average recruitment

//  !!cout<<ryear<<endl;
//  !!cout<<"end of data reading"<<endl;
  int i                       //year
  int j                       //age
  int k                       //sex
  int iy
  int ii
  int m
  int ilen
  int ll
  int l
  int il2
//  !!CLASS ofstream report1("refp.out");

 LOCAL_CALCS
  // cout<<"to local calcs"<<endl;
   if(nsellen>nlenm) nsellen=nlenm;           //make sure nselages not greater than nages
   if(nsellen_srv1>nlenm) nsellen_srv1=nlenm; //same as above for survey
   obs_srv1=obs_srv1*1000000;                 //survey numbers read in are millions of crab
   catch_numbers=catch_numbers*1000000;       //total catch numbers read in are millions of crab
   catch_disc=catch_disc*1000000;             //total discard numbers read in are millions of crab
   catch_tc=catch_tc*1000000;                 //total discard numbers read in are millions of crab
   catch_trawl=catch_trawl*1000000;           //trawl trawl bycatch numbers read in are millions of crab
   wt=wt*.001;                                //change weights to tons
   catch_ret=catch_ret*907.18474/2.0;         //change retained catch from million lbs to tons

//   cout<<"end of local calcs"<<endl;
 END_CALCS

INITIALIZATION_SECTION
  mean_log_rec 16.5
  log_avg_fmort -1.5
//  log_avg_fmortdf -8.0
  log_avg_fmortt  -4.0
  log_avg_sel50  4.92
  moltp_am 0.125
  log_moltp_bm 4.952
//  srv1_slope 0.05
//  srv1_sel50 90.0
  fish_disc_slope_f 0.25
  log_fish_disc_sel50_f 4.6821
  fish_disc_slope_t 0.10
  log_fish_disc_sel50_t 5.0106
  qm2 0.896
//  qf3 0.774
//  qm3 0.896

PARAMETER_SECTION
//parameters to be estimated are all ones that begin with init_ and have a positive phase, negative phase means are fixed.
  init_bounded_number M0(0.1,0.26,-1)
  init_bounded_number Mm(0.184,1.0,6)
//  init_bounded_number Mm(0.138,1.0,6)
  init_bounded_number Mf(0.276,1.5,4)
  init_bounded_number Mm1(0.0,0.00000001,-1)
  init_bounded_number Mf1(0.0,0.082,4)
  matrix M(1,2,styr,endyr)                 //Natural mortality, females (1) and males (2)
//  init_bounded_vector sf(styr,endyr,0.8,1.0,5)    //Survey catchability adjsutment for females

  init_bounded_dev_vector first_males(1,nlenm,-0.01,0.01,-6)      //estimating deviations of first-year length compositions
  init_bounded_dev_vector first_females(1,nlenf,-0.01,0.01,-6)
  init_bounded_vector f_year(1,nlenm+nlenf-1,-5.0,5.0,6)            //estimating first-year length compositions
  vector f_year_p(1,nlenm+nlenf)
  vector f_year_e(1,nlenm+nlenf)

  init_bounded_vector log_betal(1,2,-0.67,1.32,4)  //growth parameter
  number betal                                   //growth parameter
  init_bounded_vector log_betar(1,2,-1.14,0.5,4)  //recruitment parameter
  number betar                                   //recruitment parameter
//    init_bounded_number qf2(0.6,1.0,survsel_phase+1)
  number qf2
//    init_bounded_number qm2(0.75,1.0,survsel_phase+3)
    init_bounded_number qm2(0.792,1.0,-1)
//    init_bounded_number qf3(0.6,1.0,survsel_phase+1)
//    init_bounded_number qm3(0.7,1.0,survsel_phase+1)
//    init_bounded_number qf2(0.6,0.9,-1)
//    init_bounded_number qm2(0.8,1.0,-1)
//    init_bounded_number qf3(0.6,0.9,-1)
//    init_bounded_number qm3(0.8,1.0,-1)
//      init_bounded_number a_bsfrf(0.0,0.4,-6)
     init_bounded_number a_bsfrf(0.0,0.4,6)

//molting probs for logistic curve
  init_bounded_vector moltp_am(1,2,0.01,0.2068,5)  //paramters for logistic function molting: males
  init_bounded_vector log_moltp_bm(1,2,4.467,5.619,5)
//  init_bounded_dev_vector molt50_dev(styr,endyr,-40,40,5)

  init_bounded_number n68(15.0,21.0,1)
  init_bounded_number mean_log_rec(13.0,18.0,1)
  init_bounded_dev_vector rec_devf(styr+1,endyr,-15,15,2)
  init_bounded_dev_vector rec_devm(styr+1,endyr,-15,15,2)

  init_bounded_number log_avg_sel50(4.78,5.05,phase_logistic_sel)
  init_bounded_dev_vector sel50_dev(styr,endyr,-30,30,-4)

  init_bounded_number log_avg_fmort(-4.0,0.0,1)
//  init_bounded_dev_vector fmort_dev(styr,endyr,-15.0,2.1,1)
//init_bounded_dev_vector fmort_dev(styr,endyr,-15.0,5.92598,1)
  init_bounded_dev_vector fmort_dev(styr,endyr,-15.0,2.42598,1)
//  init_bounded_number factor_fmortdf(0.01,0.10,1)
  init_bounded_number factor_fmortdf(0.001,0.10,1)
//  init_bounded_dev_vector fmortdf_dev(1990,endyr,-6,3.5,1)
  init_bounded_dev_vector fmortdf_dev(1990,endyr,-6,3.5,1)
//  init_bounded_number factor_fmortdm(0.1,0.9,1)
  init_bounded_dev_vector fmortdm_dev(1990,endyr,-7,7,-1)
  init_bounded_number log_avg_fmortt(-8.5,-1.0,1)
//  init_bounded_dev_vector fmortt_dev(styr,endyr,-10,10.0,1)
  init_bounded_dev_vector fmortt_dev(1976,endyr,-10,10.0,1)

  init_bounded_number fish_slope(.05,.7,phase_logistic_sel)
//init_bounded_number fish_slope1(.1,1.0,phase_logistic_sel)
  init_bounded_number ret_a(-0.40,0.0,4)
  init_bounded_number ret_b(0.0,0.005,4)
  init_bounded_number ret_c(-0.025,0.0,4)

  init_bounded_number fish_disc_slope_f(.05,.69,phase_logistic_sel)
  init_bounded_number log_fish_disc_sel50_f(4.24,4.61,phase_logistic_sel)
//  init_bounded_dev_vector fish_disc_sel50_dev_f(1,nobs_fish_discf,-30,30,phase_logistic_sel+1)
  init_bounded_dev_vector fish_disc_sel50_dev_f(1,nobs_fish_discf,-30,30,-1)

  init_bounded_number fish_disc_slope_t(.01,.2,phase_logistic_sel)
  init_bounded_number log_fish_disc_sel50_t(4.4,5.2,phase_logistic_sel)
//  init_bounded_dev_vector fish_disc_sel50_dev_tf(1,nobs_trawl,-30,30,phase_logistic_sel+1)
  init_bounded_dev_vector fish_disc_sel50_dev_tm(1,nobs_trawl,-30,30,-4)

//use these to estimate survey selectivities - same for males and females
//init_bounded_number log_srv1_sel50_m(4.09,5.8,survsel_phase)
//init_bounded_number srv1_slope_f(.01,.3,survsel_phase)
//init_bounded_number log_srv1_sel50_f(4.09,4.8,survsel_phase)
  init_bounded_number log_srv2_sel50_m(4.09,5.539,survsel_phase)
  init_bounded_number srv2_slope_f(.01,.33,survsel_phase)
  init_bounded_number log_srv2_sel50_f(4.09,4.7,survsel_phase)
  init_bounded_number log_srv3_sel50_m(4.09,5.1,survsel_phase)
  init_bounded_number srv3_slope_f(.01,.3,survsel_phase)
  init_bounded_number log_srv3_sel50_f(4.09,4.9,survsel_phase)
//init_bounded_number log_srv0_sel50_m(4.09,4.9,survsel_phase)
//init_bounded_number srv0_slope_f(.01,.3,survsel_phase)
//init_bounded_number log_srv0_sel50_f(4.00,5.2,survsel_phase)
  number srv1_slope_m

//high grading
  init_bounded_number hg1(0.057,0.500,-3)
  init_bounded_number hg2(0.001,0.087,-3)
  init_bounded_number hg3(0.001,0.0384,-3)
  init_bounded_number hg4(0.001,0.03875,-3)
  init_bounded_number hg5(0.001,0.0645,-3)
  init_bounded_number hg6(0.001,0.02964,-3)
  init_bounded_number hg7(0.001,0.02150,-3)
  init_bounded_number hg8(0.001,0.04709,-3)

  matrix sel(styr,endyr,1,nlenm)
  matrix sel_discf(styr,endyr,1,nlenm)
  matrix sel_fit(styr,endyr,1,nlenm)
  vector sel_ret(1,nlenm)
  vector sel_ret0(1,nlenm)
  vector mat1(1,nlenm)
  vector mat2(1,nlenm)
  vector ftem1(1,nlenm)                       //length specific F in the terminal year
  matrix sel_trawl_f(styr,endyr,1,nlenm)
  matrix sel_trawl_m(styr,endyr,1,nlenm)
//  matrix sel_srv1(1,2,1,nlenm)
  matrix sel_srv2(1,2,1,nlenm)
  matrix sel_srv3(1,2,1,nlenm)
//  matrix sel_srv0(1,2,1,nlenm)
  3darray sel_srv(1,2,styr,endyr,1,nlenm)
  matrix totn_srv1(1,2,styr,endyr)
  matrix totn_trawl(1,2,styr,endyr)
  vector explbiom(styr,endyr)
  vector pred_bio(styr,endyr)
  3darray pred_srv1(1,2,styr,endyr,1,nlenm)
  matrix  pred_p_fish(styr,endyr,1,nlenm)
  matrix  pred_p_fish_fit(styr,endyr,1,nlenm)
  matrix  pred_p_fish_discm(styr,endyr,1,nlenm)
  matrix  pred_p_fish_discf(styr,endyr,1,nlenm)
  3darray pred_p_trawl(1,2,styr,endyr,1,nlenm)
  3darray pred_p_srv1_len_m(1,2,styr,endyr,1,nlenm)
  matrix pred_p_srv1_len_f(styr,endyr,1,nlenm)
  vector pred_catch(styr,endyr)
  vector pred_catch_ret(styr,endyr)
  vector pred_catch_disc(styr,endyr)
  vector pred_catch_trawl(styr,endyr)
  matrix catch_male_ret(styr,endyr,1,nlenm)
  matrix catch_lmale(styr,endyr,1,nlenm)
  matrix catch_discp(styr,endyr,1,nlenm)
  matrix na(styr,endyr,1,nlenm)
  matrix na_f(styr,endyr,1,nlenm)
  3darray na_m(1,2,styr,endyr,1,nlenm)
  3darray len_len(1,4,1,nlenm,1,nlenm)    //length to length growth array
  matrix len_len0(1,nlenm,1,nlenm)          //length to length growth matrix for females
  matrix moltp(styr,endyr,1,nlenm)       //molting probabilities for male by length bin
  3darray Ftot(1,2,styr,endyr,1,nlenm)
  matrix F(styr,endyr,1,nlenm)
  matrix F_ret(styr,endyr,1,nlenm)
  matrix Fdiscm(styr,endyr,1,nlenm)
  matrix  Fdiscf(styr,endyr,1,nlenm)
  3darray Fdisct(1,2,styr,endyr,1,nlenm)
  3darray S(1,2,styr,endyr,1,nlenm)
  vector fmort(styr,endyr)
  vector fmortret(styr,endyr)
  vector fmortdf(styr,endyr)
  vector fmortdm(styr,endyr)
  vector fmortt(styr,endyr)
  vector fmort_dsisc(styr,endyr)
  vector fish_sel50(styr,endyr)
  vector ff_tem(1,13)
  sdreport_vector mbio215(styr,endyr)
  vector mbio2151(styr,endyr)
  vector mbio2152(styr,endyr)
  number rec_like
  number catch_like1
  number catch_like2
  number catch_liket
  number catch_likef
  matrix len_likeyr(1,3,1,nobs_srv1)
  vector len_like(1,7)
  vector sel_like(1,4)
  number sel_like_50m
  number surv_like
  number cpue_like
  number sexr_like
  3darray like_srv1_m(1,2,styr,endyr,1,nlenm)
  matrix like_srv1_f(styr,endyr,1,nlenm)
  number endbiom
//  sdreport_number mature1
//  sdreport_number mature2
  likeprof_number mature1
  likeprof_number mature2
  objective_function_value f

  matrix obs_p_fish_tot(1,nobs_fish_discm,1,nlenm)     //total pot male length data
  number maxsel_fish
  vector catch_tot(styr,endyr)
  vector legal_males(styr,endyr)
  vector legal_srv_males(styr,endyr)
  vector popn(styr,endyr)
  vector popn_fit(styr,endyr)
  3darray obs_srv1_num(1,2,1,nobs_srv1,1,nlenm)
  matrix tmpo(1,2,1,nobs_srv1)
  matrix tmpp(1,2,1,nobs_srv1)
  matrix obs_srv1_bioms(1,2,1,nobs_srv1)
  vector obs_srv1_biom(1,nobs_srv1)
  vector pred_srv1_biom(styr,endyr)
  matrix pred_srv1_bioms(1,2,styr,endyr)
  vector obs_catchdm_biom(1990,endyr)
  vector obs_catchdf_biom(1990,endyr)
  vector obs_catcht_biom(styr,endyr)
  vector obs_catchtot_biom(1990,endyr)
  vector tem_01(1,nobs_srv1)
  vector tem_02(styr,endyr)
  vector bio_01(1990,endyr)
  vector bio_02(1990,endyr)
  vector bio_03(styr,endyr)
  vector avgp(1,nlenm)
  vector avgpf(1,nlenm)
  vector avgpm(1,nlenm)
  vector sel_tem1(1,nlenm)
  vector sel_tem2(1,nlenm)
  matrix biom_tmp(1,2,1,nobs_srv1)

  number like_var_g
  number like_var_rec
  vector q_tem(styr,endyr)
  vector qf_tem(styr,endyr)
  matrix rec_len(1,2,1,nlenm)
  vector avg_rec(1,2)
  vector obs_lmales(1,nobs_srv1)
  vector obs_mmales(1,nobs_srv1)
  vector obs_mfemales(1,nobs_srv1)
  vector pre_mmales(styr,endyr)
  vector pre_mfemales(styr,endyr)
  matrix rec_dev(1,2,styr+1,endyr)
  3darray na_fishtime(1,2,styr,endyr,1,nlenm)
  vector popn_lmale(styr,endyr)
  vector popn_lmale_bio(styr,endyr)
  number sumrecf
  number sumrecm
  vector cv_rec(1,2)
  vector len_like_srv(1,3)
  vector tem_rf(styr,styr+5)
  vector tem_rm(styr,styr+5)
  vector catch_t(styr,endyr)
//  vector catch_f(styr,endyr)
  vector catch_m(styr,endyr)
  vector catch_r(styr,endyr)
  number t0
  number t1
  vector t11(1,70)
  number t2
  number t3
  number t4
  vector tt1(1,70)             //working vector
  vector tt2(1,nlenm)             //working vector
  matrix tt3(1,nlenm,1,55)        //working matrix
  matrix ttt(1,nlenm,1,nlenm+10)
  number tt4
  number tt5
  sdreport_number blast

  matrix ref_na_fishtime(1,100,1,nlenm)
  matrix ref_catch_male_ret(1,100,1,nlenm)
  matrix ref_catch_lmale(1,100,1,nlenm)
  matrix ref_na(1,100,1,nlenm)
  3darray ref_na_m(1,2,1,100,1,nlenm)
  vector ref_catch(1,100)
  vector ref_catch_ret(1,100)
  vector ref_catch_disc(1,100)
  vector ref_catch_m(1,100)
  number ref_F
  vector ref_Fret(1,nlenm)
  vector ref_Ftot(1,nlenm)
  vector ref_S(1,nlenm)
  vector ref_mbio(1,101)
  vector ref_mbio1(1,101)
  vector ref_mbio2(1,101)
  vector ref_mbio215(1,100)
  vector ref_mbio2151(1,100)
  vector ref_mbio2152(1,100)
  vector ref_totc(1,101)
  vector ref_catch_trawl(1,100)
  vector ref_retc(1,101)
  vector ref_moltp(1,nlenm)
  number eb35
  number f35
  number f40
  number i35
  number i40
  number ref_Ft
  number ref_Ftc
  vector ref_sel_fit(1,nlenm)
  vector ref_sel_ret(1,nlenm)
  vector ref_sel_trawl(1,nlenm)
  vector tem_S(1,nlenm)
  vector tem_Stc(1,nlenm)
  number ref_f
  number ofl_f
  vector ref_sel_f(1,nlenm)
  number ref_catch_f
  likeprof_number ofl_catch
  likeprof_number last_mmb

  matrix prj_na_fishtime(1,10,1,nlenm)
  matrix prj_catch_male_ret(1,10,1,nlenm)
  matrix prj_catch_lmale(1,10,1,nlenm)
  matrix prj_na(1,10,1,nlenm)
  matrix prj_na_f(1,10,1,nlenm)
  3darray prj_na_m(1,2,1,10,1,nlenm)
  matrix prj_catch(1,10,1,1000)
  matrix prj_catch_ret(1,10,1,1000)
  vector prj_catch_disc(1,10)
  vector prj_catch_m(1,100)
  number prj_F
  vector prj_Fret(1,nlenm)
  vector prj_Ft(1,nlenm)
  vector prj_Ftot(1,nlenm)
  vector prj_S(1,nlenm)
  vector prj_S0(1,nlenm)
  vector prj_Sf(1,nlenm)
  vector prj_Sret(1,nlenm)
  matrix prj_mbio215(1,10,1,1000)

  matrix prj_cf_totc(1,10,1,9)
  vector prj_catch_trawl(1,10)
  matrix prj_cf_retc(1,10,1,9)
  matrix prj_cf_mbio(1,10,1,9)
  vector prj_mean_mbio(1,10)
  vector prj_mean_retc(1,10)
  vector prj_mean_totc(1,10)
  number tt6
  number tt7
  number tt8
  number tt9
  number tt10
  number tt11
  vector www(1,1000)
  vector mate(1,nlenm)
  number b25

  init_bounded_number fish_tc_slope_f(.02,.4,phase_logistic_sel)
  init_bounded_number log_fish_tc_sel50_f(4.24,4.9,phase_logistic_sel)
  init_bounded_number fish_tc_slope_m(.05,.9,phase_logistic_sel)
//  init_bounded_number log_fish_tc_sel50_m(4.75,5.14,phase_logistic_sel)
  init_bounded_number log_fish_tc_sel50_m(4.25,5.14,phase_logistic_sel)
  init_bounded_vector log_Ftcm(1,nobs_tc,-7.0,1.0,2)
  init_bounded_vector log_Ftcf(1,nobs_tc,-7.0,1.0,2)
  vector Ftcf(styr,endyr)
  vector Ftcm(styr,endyr)
  3darray Stc(1,2,styr,endyr,1,nlenm)
  vector pred_catchtcm_biom(styr,endyr)
  vector pred_catchtcf_biom(styr,endyr)
  vector obs_catchtcm_biom(1,nobs_tc)
  vector obs_catchtcf_biom(1,nobs_tc)
  vector tem_catchtcm_biom(1,nobs_tc)
  vector tem_catchtcf_biom(1,nobs_tc)
  matrix  pred_p_tc_len_f(1,nobs_tc,1,nlenm)
  matrix  pred_p_tc_len_m(1,nobs_tc,1,nlenm)
  vector sel_tcf(1,nlenm)
  vector sel_tcm(1,nlenm)
  3darray na_fishtime_tc(1,2,styr,endyr,1,nlenm)
  number catch_like_tcm
  number catch_like_tcf
  number ttc
  number ttc1

  vector n_bsfrf(1,nobs_bsfrf)      //estimated mature males for BSFRF survey
  vector am_bsfrf(1,nlenm)          //estimated availability of males for BSFRF survey
  vector af_bsfrf(1,nlenm)          //estimated availability of females for BSFRF survey
  number bsfrf_like
  number q_like
  number q_tem1
  number q_tem2
  number q_tem3

  matrix size_srv(1,2,1,nobs_srv1)
  vector size_fish_ret(1,nobs_fish)
  vector size_fish_discf(1,nobs_fish_discf)
  vector size_fish_discm(1,nobs_fish_discm)
  matrix s_srv(1,2,1,nobs_srv1)
  vector s_fish(1,nobs_fish)
  vector s_fish_discf(1,nobs_fish_discf)
  vector s_fish_discm(1,nobs_fish_discm)
  matrix s_trawl(1,2,1,nobs_trawl)
  matrix s_tc(1,2,1,nobs_tc)
//  vector size_a(1,5)
//  vector size_b(1,5)

  matrix ep68(1,3,1,nlenm)
  number first_yr_like

//do likelihood profile on male M - need to estimate M in model to do this
//  likeprof_number lp_m
  likeprof_number lbio

PRELIMINARY_CALCS_SECTION
  cout<<"starting prelim calcs"<<endl;
 for (i=1;i<=nobs_srv1;i++)
 {
   s_srv(1,i) = 0.5*obs_s_srv1(1,i);
   if (s_srv(1,i)>nsamples_srv1(1,i)) s_srv(1,i) = nsamples_srv1(1,i);
   s_srv(2,i) = 0.5*obs_s_srv1(2,i);
   if (s_srv(2,i)>nsamples_srv1(2,i)) s_srv(2,i) = nsamples_srv1(2,i);
 }
 for (i=1;i<=nobs_fish;i++)
 {
   s_fish(i) = 0.1*obs_s_fish_ret(i);
   if (s_fish(i)>nsamples_fish(i))  s_fish(i) = nsamples_fish(i);
 }
 for (i=1;i<=nobs_fish_discm;i++)
 {
   s_fish_discm(i) = 0.1*obs_s_fish_discm(i);
   if (s_fish_discm(i)>nsamples_fish_discm(i)) s_fish_discm(i) = nsamples_fish_discm(i);
 }
 for (i=1;i<=nobs_fish_discf;i++)
 {
   s_fish_discf(i) = 0.1*obs_s_fish_discf(i);
   if (s_fish_discf(i)>nsamples_fish_discf(i)) s_fish_discf(i) = nsamples_fish_discf(i);
 }
 for (i=1;i<=nobs_trawl;i++)
 {
   s_trawl(1,i) = 0.1*obs_s_trawl(1,i);
   if (s_trawl(1,i)>nsamples_trawl(1,i)) s_trawl(1,i) = nsamples_trawl(1,i);
   s_trawl(2,i) = 0.1*obs_s_trawl(2,i);
   if (s_trawl(2,i)>nsamples_trawl(2,i)) s_trawl(2,i) = nsamples_trawl(2,i);
 }
 for (i=1;i<=nobs_tc;i++)
 {
   s_tc(1,i) = 0.1*obs_s_tc(1,i);
   if (s_tc(1,i)>nsamples_tc(1,i)) s_tc(1,i) = nsamples_tc(1,i);
   s_tc(2,i) = 0.1*obs_s_tc(2,i);
   if (s_tc(2,i)>nsamples_tc(2,i)) s_tc(2,i) = nsamples_tc(2,i);
 }

 q_tem1 = 0.03*0.03;                                  //variance estimates for maximum catchability
 q_tem2 = 0.0625*0.0625;
 q_tem3 = q_bsfrf(2)*q_bsfrf(2)*q_bsfrf(1)*q_bsfrf(1);
 mat1 = mat;
 mat1(12) = 0.0; mat1(13) = 0.0;
 mat2 = mat;
 mat2(10) = 1.0; mat2(11) = 1.0;
//get total catch - sum up catches mult by assumed mortality
 for(i=styr; i<=endyr; i++)
 {
   catch_trawl(i)=catch_trawl(i)*m_trawl;
   catch_disc(1,i)=catch_disc(1,i)*m_disc;
   catch_disc(2,i)=catch_disc(2,i)*m_disc;
   catch_tot(i)=catch_numbers(i)+catch_disc(2,i);
 }
 for(i=1; i<=nobs_tc; i++)
 {
    catch_tc(1,i)=catch_tc(1,i)*m_tc;
    catch_tc(2,i)=catch_tc(2,i)*m_tc;
 }

//total fishery length proportion of males
// for (i=1; i<= nobs_fish_discm; i++)
// {
//   for (j=1; j<=nlenm; j++)
//   {
//      obs_p_fish_tot(i,j)=(obs_p_fish_ret(29+i,j)*catch_numbers(yrs_fish_discm(i))+obs_p_fish_discm(i,j)*catch_disc(2,yrs_fish_discm(i)))/catch_tot(yrs_fish_discm(i));
//   }
// }
//trawl bycatch biomass
 for (i=1; i<= nobs_trawl; i++)
 {
   obs_catcht_biom(yrs_trawl(i))=(obs_p_trawl(1,i)*catch_trawl(yrs_trawl(i)))*wt(1)+(obs_p_trawl(2,i)*catch_trawl(yrs_trawl(i)))*wt(2);
 }
 avgpf=0;
 avgpm=0;
 for(i=1; i<= nobs_trawl; i++)
 {
   avgpf+=obs_p_trawl(1,i);
   avgpm+=obs_p_trawl(2,i);
 }
 avgpf=avgpf/nobs_trawl;
 avgpm=avgpm/nobs_trawl;
 obs_catcht_biom(1993)=avgpf*catch_trawl(1993)*wt(1)+avgpm*catch_trawl(1993)*wt(2);
//survey abundance by length and biomass
 obs_srv1_num.initialize();
 obs_srv1_biom.initialize();
 obs_srv1_bioms.initialize();
 for (i=1; i<=nobs_srv1; i++)
 {
   obs_srv1_num(1,i) += obs_p_srv1_len_f(i)*obs_srv1(i);
   obs_srv1_num(2,i) += (obs_p_srv1_len_m(1,i)+obs_p_srv1_len_m(2,i))*obs_srv1(i);
   obs_srv1_bioms(1,i) += obs_p_srv1_len_f(i)*obs_srv1(i)*wt(1);
   obs_srv1_bioms(2,i) += (obs_p_srv1_len_m(1,i)+obs_p_srv1_len_m(2,i))*obs_srv1(i)*wt(2);
   obs_srv1_biom(i) = obs_srv1_bioms(1,i)+obs_srv1_bioms(2,i);
 }

//total male survey length proportions. Combined data due to bad shell condition data
 for (i=1; i<= nobs_srv1; i++)
 {
   for (j=1; j<=nlenm; j++)
   {
      obs_p_srv1_len_m(1,i,j)= obs_p_srv1_len_m(1,i,j)+obs_p_srv1_len_m(2,i,j);
      obs_p_srv1_len_m(2,i,j) = 0.0;
   }
 }
 obs_catchdm_biom.initialize();
 obs_catchdf_biom.initialize();
 avgp.initialize();
 avgpf.initialize();
 for(i=1;i<=nobs_fish_discm;i++)
 {
//obs_p_fish_discm are proportional to total catch (retained+discard)
   obs_catchdf_biom(yrs_fish_discm(i))=catch_disc(1,yrs_fish_discm(i))*obs_p_fish_discf(i)*wt(1);
   obs_catchdm_biom(yrs_fish_discm(i))=catch_disc(2,yrs_fish_discm(i))*obs_p_fish_discm(i)*wt(2);
 }
 obs_catchdf_biom(1994)=1.87659459; obs_catchdf_biom(1995)=1.611640408; obs_catchdm_biom(1994)=3.81193721; obs_catchdm_biom(1995)=3.273734281;
// cout <<obs_catchdm_biom<<endl;exit(1);

 for(i=yrs_fish_discf(1);i<=endyr;i++)
 {
   obs_catchtot_biom(i)=obs_catchdm_biom(i)+catch_ret(i);
 }
 obs_catchtcm_biom.initialize();
 obs_catchtcf_biom.initialize();
 for(i=1;i<=nobs_tc;i++)
 {
   obs_catchtcf_biom(i)=catch_tc(1,i)*obs_p_tc_len_f(i)*wt(1);
   obs_catchtcm_biom(i)=catch_tc(2,i)*obs_p_tc_len_m(i)*wt(2);
 }

 q_tem = 1.0;     //setting maximum survey catchability to be 1 for all years until estimated later.
 qf_tem = 1.0;     //setting maximum survey catchability to be 1 for all years until estimated later.
// sel_srv1(1) = 1.0/(1.0+exp(-(0.354+0.0054*length_bins)));     //female survey catchability 1970-1972
// sel_srv1(2) = 1.0/(1.0+exp(-(-0.7366+0.0178*length_bins)));   //male survey catchability   1970-1972
 sel_srv2(1) = 1.0/(1.0+exp(-(0.354+0.0054*length_bins)));     //female survey catchability 1973-1981
 sel_srv2(2) = 1.0/(1.0+exp(-(-0.7366+0.0178*length_bins)));   //male survey catchability   1973-1981
 sel_srv3(1) = 1.0/(1.0+exp(-(0.354+0.0054*length_bins)));     //female survey catchability 1982-2008
 sel_srv3(2) = 1.0/(1.0+exp(-(-0.7366+0.0178*length_bins)));   //male survey catchability   1982-2008
// sel_srv0(1) = 1.0/(1.0+exp(-(0.354+0.0054*length_bins)));     //female survey catchability 1968-1969
// sel_srv0(2) = 1.0/(1.0+exp(-(-0.7366+0.0178*length_bins)));   //male survey catchability   1968-1969
 sel_ret=0.0;


//   exit(1);
  cout<<"end prelim calcs"<<endl;

PROCEDURE_SECTION
   get_moltingp_maturep();
//  cout<<" end of moltp "<<endl;
   get_growth();
//  cout<<" end of growth "<<endl;
   get_selectivity();
//  cout<<" end of sel "<<endl;
   get_mortality();
//  cout<<" end of mort "<<endl;
   get_numbers_at_len();
// cout<<" end of numbers at len "<<endl;
   get_catch_at_len();
// cout<<" end of catch at len "<<endl;
//first do without future projections
  if (current_phase()>5)
  {
   get_effective_sample_sizes();
  }
  if (sd_phase())
  {
   get_reference_points();
//   projection();
  }

  evaluate_the_objective_function();

FUNCTION get_growth
//estimate growth function
//   cout<<"to growth " <<endl;
  len_len.initialize();
  rec_len.initialize();
  t11.initialize();

//Return proporttions of recruits belonging to a length group.
//The gamma function is truncated and numerically simplified.
//females
      betar = mfexp(log_betar(1));
      ii = (nr-2)*slt;
      ilen = slt;
      t2 = 0.0;
      t4 = alphar1/betar;
      t3 = (t4-1.0)*log(alphar1)-alphar1/betar-t4*log(betar);
      for (j = 1; j<=ii;j++)
      {
        tt5 = double(j-1)+ilen1;
        t11(j) = (t4-1.0)*log(tt5)-tt5/betar-t4*log(betar)-t3;
        if (t11(j) < -1.0e30) t11(j)=-1.0e30;
        t11(j) = mfexp(t11(j));
        t2 = t2 + t11(j);
      }
      for (j=1;j<=nr-0;j++)
      {
        for (i=1;i<=ilen;i++) rec_len(1,j) += t11((j-1)*ilen+i)/t2;
      }
//males
      betar = mfexp(log_betar(2));
      ii = nr*slt;
      ilen = slt;
      t2 = 0.0;
      t4 = alphar2/betar;
      t3 = (t4-1.0)*log(alphar2)-alphar2/betar-t4*log(betar);
      for (j = 1; j<=ii;j++)
      {
        tt5 = double(j-1)+ilen1;
        t11(j) = (t4-1.0)*log(tt5)-tt5/betar-t4*log(betar)-t3;
        if (t11(j) < -1.0e30) t11(j)=-1.0e30;
        t11(j) = mfexp(t11(j));
        t2 = t2 + t11(j);
      }
      for (j=1;j<=nr;j++)
      {
        for (i=1;i<=ilen;i++) rec_len(2,j) += t11((j-1)*ilen+i)/t2;
      }

//growth matrix, given gamma function parameter, betal.
//females...68-82
   tt3.initialize();
   ttt.initialize();
   betal = mfexp(log_betal(1));
   for (j=1;j<=nlenf;j++)
   {
     tt1(j) = g(1,j)/betal;
     tt2(j) = 0.0;
     tt4 = (tt1(j)-1.0)*log(g(1,j))-g(1,j)/betal-tt1(j)*log(betal);
     for (i=ggf(1,j);i<=ggf(2,j);i++)
     {
       tt5 = double(i);
       tt3(j,i)=(tt1(j)-1.0)*log(tt5)-tt5/betal-tt1(j)*log(betal)-tt4;
       if (tt3(j,i) < -1.0e30) tt3(j,i) = -1.0e30;
       tt3(j,i) = mfexp(tt3(j,i));
       tt2(j) = tt2(j) + tt3(j,i);
     }
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=ggf(1,j);i<=ggf(2,j);i++) tt3(j,i) = tt3(j,i)/tt2(j);
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=j;i<=j+10;i++)
     {
       ii = (i-j)*slt;
       if (ii == 0)
       {
         ttt(j,i)=tt3(j,1)+tt3(j,2)+tt3(j,3)*0.5;
       }
       else
       {
         ttt(j,i) = tt3(j,ii-2)*0.5+tt3(j,ii-1)+tt3(j,ii)+tt3(j,ii+1)+tt3(j,ii+2)+tt3(j,ii+3)*0.5;
       }
     }
     for (i=nlenf+1;i<=nlenf+10;i++) ttt(j,nlenf) = ttt(j,nlenf) + ttt(j,i);
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=1; i<=nlenf;i++) len_len(1,j,i) = ttt(j,i);
   }
//females...83-93
   tt3.initialize();
   ttt.initialize();
   betal = mfexp(log_betal(1));
   for (j=1;j<=nlenf;j++)
   {
     tt1(j) = g(2,j)/betal;
     tt2(j) = 0.0;
     tt4 = (tt1(j)-1.0)*log(g(1,j))-g(1,j)/betal-tt1(j)*log(betal);
     for (i=ggf(1,j);i<=ggf(2,j);i++)
     {
       tt5 = double(i);
       tt3(j,i)=(tt1(j)-1.0)*log(tt5)-tt5/betal-tt1(j)*log(betal)-tt4;
       if (tt3(j,i) < -1.0e30) tt3(j,i) = -1.0e30;
       tt3(j,i) = mfexp(tt3(j,i));
       tt2(j) = tt2(j) + tt3(j,i);
     }
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=ggf(1,j);i<=ggf(2,j);i++) tt3(j,i) = tt3(j,i)/tt2(j);
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=j;i<=j+10;i++)
     {
       ii = (i-j)*slt;
       if (ii == 0)
       {
         ttt(j,i)=tt3(j,1)+tt3(j,2)+tt3(j,3)*0.5;
       }
       else
       {
         ttt(j,i) = tt3(j,ii-2)*0.5+tt3(j,ii-1)+tt3(j,ii)+tt3(j,ii+1)+tt3(j,ii+2)+tt3(j,ii+3)*0.5;
       }
     }
     for (i=nlenf+1;i<=nlenf+10;i++) ttt(j,nlenf) = ttt(j,nlenf) + ttt(j,i);
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=1; i<=nlenf;i++) len_len(2,j,i) = ttt(j,i);
   }

//females...94-08
   tt3.initialize();
   ttt.initialize();
   betal = mfexp(log_betal(1));
   for (j=1;j<=nlenf;j++)
   {
     tt1(j) = g(3,j)/betal;
     tt2(j) = 0.0;
     tt4 = (tt1(j)-1.0)*log(g(1,j))-g(1,j)/betal-tt1(j)*log(betal);
     for (i=ggf(1,j);i<=ggf(2,j);i++)
     {
       tt5 = double(i);
       tt3(j,i)=(tt1(j)-1.0)*log(tt5)-tt5/betal-tt1(j)*log(betal)-tt4;
       if (tt3(j,i) < -1.0e30) tt3(j,i) = -1.0e30;
       tt3(j,i) = mfexp(tt3(j,i));
       tt2(j) = tt2(j) + tt3(j,i);
     }
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=ggf(1,j);i<=ggf(2,j);i++) tt3(j,i) = tt3(j,i)/tt2(j);
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=j;i<=j+10;i++)
     {
       ii = (i-j)*slt;
       if (ii == 0)
       {
         ttt(j,i)=tt3(j,1)+tt3(j,2)+tt3(j,3)*0.5;
       }
       else
       {
         ttt(j,i) = tt3(j,ii-2)*0.5+tt3(j,ii-1)+tt3(j,ii)+tt3(j,ii+1)+tt3(j,ii+2)+tt3(j,ii+3)*0.5;
       }
     }
     for (i=nlenf+1;i<=nlenf+10;i++) ttt(j,nlenf) = ttt(j,nlenf) + ttt(j,i);
   }
   for (j=1;j<=nlenf;j++)
   {
     for (i=1; i<=nlenf;i++) len_len(3,j,i) = ttt(j,i);
   }
//   cout<< len_len(1)<<endl;
//Males...
   tt3.initialize();
   ttt.initialize();
   betal = mfexp(log_betal(2));
   for (j=1;j<=nlenm;j++)
   {
     tt1(j) = g(4,j)/betal;
     tt2(j) = 0.0;
     tt4 = (tt1(j)-1.0)*log(g(2,j))-g(2,j)/betal-tt1(j)*log(betal);
     for (i=ggm(1,j);i<=ggm(2,j);i++)
     {
       tt5 = double(i);
       tt3(j,i)=(tt1(j)-1.0)*log(tt5)-tt5/betal-tt1(j)*log(betal)-tt4;
       if (tt3(j,i) < -1.0e30) tt3(j,i) = -1.0e30;
       tt3(j,i) = mfexp(tt3(j,i));
       tt2(j) = tt2(j) + tt3(j,i);
     }
   }
   for (j=1;j<=nlenm;j++)
   {
     for (i=ggm(1,j);i<=ggm(2,j);i++) tt3(j,i) = tt3(j,i)/tt2(j);
   }
   for (j=1;j<=nlenm;j++)
   {
     for (i=j;i<=j+10;i++)
     {
       ii = (i-j)*slt;
       if (ii == 0)
       {
         ttt(j,i)=tt3(j,1)+tt3(j,2)+tt3(j,3)*0.5;
       }
       else
       {
         ttt(j,i) = tt3(j,ii-2)*0.5+tt3(j,ii-1)+tt3(j,ii)+tt3(j,ii+1)+tt3(j,ii+2)+tt3(j,ii+3)*0.5;
       }
     }
     for (i=nlenm+1;i<=nlenm+10;i++) ttt(j,nlenm) = ttt(j,nlenm) + ttt(j,i);
   }
   for (j=1;j<=nlenm;j++)
   {
     for (i=1; i<=nlenm;i++) len_len(4,j,i) = ttt(j,i);
   }

//   cout<< rec_len<<endl;
//   cout<< len_len(2)<<endl;
//   exit(1);

FUNCTION get_moltingp_maturep
//assuming a declining logistic function
// cout<<"to moltingp"<<endl;
// for(j=1;j<=nlenm;j++)
// {
//    moltp(j)=1-(1./(1.+mfexp(-1.*moltp_am*(length_bins(j)-mfexp(log_moltp_bm)))));
// }
 for (iy=styr;iy<=endyr;iy++)
 {
   for(j=1;j<=nlenm;j++)
   {
    moltp(iy,j)=1-(1./(1.+mfexp(-1.*moltp_am(mo(iy))*(length_bins(j)-mfexp(log_moltp_bm(mo(iy)))))));
   }
 }


FUNCTION get_selectivity
//cout<<"to begin of sel"<<endl;
  for (j=6;j<=13;j++) sel_ret0(j) = ret_a  + ret_b*length_bins(j);
  sel_ret0(14)=sel_ret0(13)+ret_c*5.0; sel_ret0(15)=sel_ret0(14)+ret_c*5.0; sel_ret0(16)=sel_ret0(15)+ret_c*5.0;
  for (j=6;j<=16;j++) if (sel_ret0(j) < 0.0) sel_ret0(j) = 0.0;
  for (j=6;j<=14;j++) sel_ret(j) = ret_a  + ret_b*length_bins(j);
  sel_ret(15)=sel_ret(14)+ret_c*5.0; sel_ret(16)=sel_ret(15)+ret_c*5.0;
  for (j=6;j<=16;j++) if (sel_ret(j) < 0.0) sel_ret(j) = 0.0;
  for (iy=styr;iy<=endyr;iy++)
  {
     fish_sel50(iy)=mfexp(log_avg_sel50)+sel50_dev(iy);
//logistic selectivity curve
     for (j=1;j<=nlenm;j++)
     {
       sel_fit(iy,j)=1./(1.+mfexp(-1.*fish_slope*(length_bins(j)-fish_sel50(iy))));
       sel(iy,j)=sel_ret(j)+sel_fit(iy,j);
     }
  }

// female discards ascending logistic curve and male curve for the TC fishery
  for (j=1;j<=nlenm;j++)
  {
     sel_tem1(j)=1./(1.+mfexp(-1.*fish_disc_slope_f*(length_bins(j)-mfexp(log_fish_disc_sel50_f))));
// trawl fishery selectivity
     sel_tem2(j)=1./(1.+mfexp(-1.*fish_disc_slope_t*(length_bins(j)-mfexp(log_fish_disc_sel50_t))));
     sel_tcf(j)=1./(1.+mfexp(-1.*fish_tc_slope_f*(length_bins(j)-mfexp(log_fish_tc_sel50_f))));
     sel_tcm(j)=1./(1.+mfexp(-1.*fish_tc_slope_m*(length_bins(j)-mfexp(log_fish_tc_sel50_m))));
  }
    maxsel_fish = max(sel_tem1);
    sel_tem1 = sel_tem1/maxsel_fish;
    maxsel_fish = max(sel_tem2);
    sel_tem2 = sel_tem2/maxsel_fish;
    maxsel_fish = max(sel_tcf);
    sel_tcf = sel_tcf/maxsel_fish;
    maxsel_fish = max(sel_tcm);
    sel_tcm = sel_tcm/maxsel_fish;
  for(iy=styr;iy<=endyr;iy++)
  {
     maxsel_fish=max(sel(iy));
     sel(iy)=sel(iy)/maxsel_fish;
     maxsel_fish=max(sel_fit(iy));
     sel_fit(iy)=sel_fit(iy)/maxsel_fish;
     if (iy==2005)  sel_fit(iy) = sel_fit(iy) - hg1*m_disc*sel_fit(iy);
     if (iy==2006)  sel_fit(iy) = sel_fit(iy) - hg2*m_disc*sel_fit(iy);
     if (iy==2007)  sel_fit(iy) = sel_fit(iy) - hg3*m_disc*sel_fit(iy);
     if (iy==2008)  sel_fit(iy) = sel_fit(iy) - hg4*m_disc*sel_fit(iy);
     if (iy==2009)  sel_fit(iy) = sel_fit(iy) - hg5*m_disc*sel_fit(iy);
     if (iy==2010)  sel_fit(iy) = sel_fit(iy) - hg6*m_disc*sel_fit(iy);
     if (iy==2011)  sel_fit(iy) = sel_fit(iy) - hg7*m_disc*sel_fit(iy);
     if (iy==2012)  sel_fit(iy) = sel_fit(iy) - hg8*m_disc*sel_fit(iy);
//     cout<<sel(2005)<<endl;
     for (j=1;j<=nlenm;j++)
     {
        if (sel(iy,j)<sel_fit(iy,j))
        {
           sel(iy,j)=sel_fit(iy,j);
           if (j<15) sel(iy,j)=sel_fit(iy,j)+0.005;
        }
     }
     sel_discf(iy) = sel_tem1;
     sel_trawl_f(iy) = sel_tem2;
     sel_trawl_m(iy) = sel_tem2;
  }
  for(iy=1;iy<=nobs_fish_discf;iy++)
  {
     t0=mfexp(log_fish_disc_sel50_f)+fish_disc_sel50_dev_f(iy);
     for (j=1;j<=nlenm;j++)
     {
       sel_discf(yrs_fish_discf(iy),j)=1./(1.+mfexp(-1.*fish_disc_slope_f*(length_bins(j)-t0)));
     }
     maxsel_fish = max(sel_discf(yrs_fish_discf(iy)));
     sel_discf(yrs_fish_discf(iy)) = sel_discf(yrs_fish_discf(iy))/maxsel_fish;
  }

  for(iy=1;iy<=nobs_trawl;iy++)
  {
     t2=mfexp(log_fish_disc_sel50_t)+fish_disc_sel50_dev_tm(iy);
     for (j=1;j<=nlenm;j++)
     {
       sel_trawl_m(yrs_trawl(iy),j)=1./(1.+mfexp(-1.*fish_disc_slope_t*(length_bins(j)-t2)));
     }
//     maxsel_fish = max(sel_trawl_f(yrs_trawl(iy)));
//     sel_trawl_f(yrs_trawl(iy)) = sel_trawl_f(yrs_trawl(iy))/maxsel_fish;
     maxsel_fish = max(sel_trawl_m(yrs_trawl(iy)));
     sel_trawl_m(yrs_trawl(iy)) = sel_trawl_m(yrs_trawl(iy))/maxsel_fish;
     sel_trawl_f(yrs_trawl(iy)) = sel_trawl_m(yrs_trawl(iy));
  }

 qf2 = qm2;
 srv1_slope_m = log(qm2/qf2*(1.0+exp(-1.0*srv2_slope_f*(67.5-mfexp(log_srv2_sel50_f))))-1.0)/(mfexp(log_srv2_sel50_m)-67.5);
 if (srv1_slope_m < 0.0) srv1_slope_m = srv2_slope_f;
 sel_srv2(1) = 1.0/(1.0+exp(-1.*srv2_slope_f*(length_bins-mfexp(log_srv2_sel50_f))));     //female survey catchability
 sel_srv2(2) = 1.0/(1.0+exp(-1.*srv1_slope_m*(length_bins-mfexp(log_srv2_sel50_m))));     //male survey catchability
 srv1_slope_m = log(qm2/qf2*(1.0+exp(-1.0*srv3_slope_f*(67.5-mfexp(log_srv3_sel50_f))))-1.0)/(mfexp(log_srv3_sel50_m)-67.5);
 if (srv1_slope_m < 0.0) srv1_slope_m = srv3_slope_f;
 sel_srv3(1) = 1.0/(1.0+exp(-1.*srv3_slope_f*(length_bins-mfexp(log_srv3_sel50_f))));     //female survey catchability
 sel_srv3(2) = 1.0/(1.0+exp(-1.*srv1_slope_m*(length_bins-mfexp(log_srv3_sel50_m))));     //male survey catchability
 maxsel_fish = max(sel_srv2(1));
 sel_srv2(1) = sel_srv2(1)*qf2/maxsel_fish;
 maxsel_fish = max(sel_srv2(2));
 sel_srv2(2) = sel_srv2(2)*qm2/maxsel_fish;
 maxsel_fish = max(sel_srv3(1));
 sel_srv3(1) = sel_srv3(1)*qf2/maxsel_fish;
 maxsel_fish = max(sel_srv3(2));
 sel_srv3(2) = sel_srv3(2)*qm2/maxsel_fish;
 if (current_phase()<survsel_phase)
 {
    sel_srv2(1) = 1.0/(1.0+exp(-(0.354+0.0054*length_bins)));
    sel_srv2(2) = 1.0/(1.0+exp(-(-0.7366+0.0178*length_bins)));
    sel_srv3(1) = 1.0/(1.0+exp(-(0.354+0.0054*length_bins)));
    sel_srv3(2) = 1.0/(1.0+exp(-(-0.7366+0.0178*length_bins)));
 }
 for(iy=styr;iy<=styr+6;iy++)
 {
   sel_srv(1,iy) = sel_srv2(1);
   sel_srv(2,iy) = sel_srv2(2);
             //   if (current_phase()>4) sel_srv(1,iy) = sel_srv(1,iy)*sf(iy);
 }
 for(iy=styr+7;iy<=endyr;iy++)
 {
   sel_srv(1,iy) = sel_srv3(1);
   sel_srv(2,iy) = sel_srv3(2);
             //   if (current_phase()>4) sel_srv(1,iy) = sel_srv(1,iy)*sf(iy);
 }
 if (current_phase()>survsel_phase)
 {
   am_bsfrf = elem_div(sel_srv(2,endyr),s_bsfrf);        //estimating availablity for BSFRF---future use.
   af_bsfrf = elem_div(sel_srv(1,endyr),s_bsfrf);
 }

FUNCTION get_mortality
//  cout<<"begin get mort "<<endl;
 M = M0;
 for (i=styr;i<=endyr;i++)
 {
    if (Mn(1,i)==2) M(1,i) = M0 + Mf;     //high natural mortality for females during the early 1980s
    if (Mn(2,i)==2) M(2,i) = M0 + Mm;     //high natural mortality for males during the early 1980s
    if (Mn(1,i)==3) M(1,i) = M0 + Mf1;     //high natural mortality for females during late 1970s, late 1980s and early 1990s
    if (Mn(2,i)==3) M(2,i) = M0 + Mm1;     //high natural mortality for males during late 1970s, late 1980s and early 1990s
 }

 fmort = mfexp(log_avg_fmort+fmort_dev);
 for (i=yrs_fish_discf(1); i<=endyr; i++) fmortdf(i)=mfexp(log_avg_fmort+fmort_dev(i)+fmortdf_dev(i))*factor_fmortdf;
 for (i=yrs_fish_discf(1); i<=endyr; i++) fmortdm(i)=mfexp(log_avg_fmort+fmort_dev(i)+fmortdm_dev(i));
 for (i=1; i<=13; i++) ff_tem(i) = fmortdf(yrs_fish_discf(i))/fmort(yrs_fish_discf(i));
 for (i=1; i<=12; i++)
 {
   for (j=i+1; j<=13; j++)
   {
     if (ff_tem(j) < ff_tem(i))
     {
       t0 = ff_tem(i);
       ff_tem(i) = ff_tem(j);
       ff_tem(j) = t0;
     }
   }
 }
 t0 = 0.0;
// for (i=6; i<=8; i++) t0 += ff_tem(i);
// t0 = t0/3.0; //average of ratios of female bycatcy mortality to total fishing mortality.
 t0 = ff_tem(7);
 for (i=1; i<=13; i++) ff_tem(i) = fmortdm(yrs_fish_discf(i))/fmort(yrs_fish_discf(i));
 for (i=1; i<=12; i++)
 {
   for (j=i+1; j<=13; j++)
   {
     if (ff_tem(j) < ff_tem(i))
     {
       t1 = ff_tem(i);
       ff_tem(i) = ff_tem(j);
       ff_tem(j) = t1;
     }
   }
 }
 t1 = 0.0;
// for (i=6; i<=8; i++) t1 += ff_tem(i);
  t1 = ff_tem(7);
// t1 = t1/3.0; //average of ratios of male bycatcy mortality to total fishing mortality.
//  cout<<" ratio of females to males fishing mortality:"<<" "<<t0<<endl;
 for (i=styr; i<yrs_fish_discf(1); i++)
 {
   fmortdf(i) = t0*fmort(i);   //assuming female bycatch mortality from 1975 to 1989.
   fmortdm(i) = t1*fmort(i);   //assuming male bycatch mortality from 1975 to 1989.
 }
 for (i=yrs_trawl(1); i<=endyr; i++) fmortt(i)=mfexp(log_avg_fmortt+fmortt_dev(i));
   fmortt(styr) = 0.0;     //no trawl bycatch before 1976.

 for (i=styr;i<=endyr;i++)
 {
//have discard mort for females and males, fishing F for males only
   Fdiscf(i)=sel_discf(i)*fmortdf(i);
   Fdisct(1,i)=sel_trawl_f(i)*fmortt(i);
   Fdisct(2,i)=sel_trawl_m(i)*fmortt(i);
   F(i) = sel_fit(i)*fmort(i)+sel_ret*fmortdm(i);
   if (i==2005)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg1*m_disc*sel_fit(i))*fmortdm(i);
   if (i==2006)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg2*m_disc*sel_fit(i))*fmortdm(i);
   if (i==2007)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg3*m_disc*sel_fit(i))*fmortdm(i);
   if (i==2008)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg4*m_disc*sel_fit(i))*fmortdm(i);
   if (i==2009)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg5*m_disc*sel_fit(i))*fmortdm(i);
   if (i==2010)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg6*m_disc*sel_fit(i))*fmortdm(i);
   if (i==2011)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg7*m_disc*sel_fit(i))*fmortdm(i);
   if (i==2012)  F(i) = sel_fit(i)*fmort(i)+(sel_ret+hg8*m_disc*sel_fit(i))*fmortdm(i);
   F_ret(i)=sel_fit(i)*fmort(i);
   Ftot(1,i)=Fdiscf(i) + Fdisct(1,i);
   Ftot(2,i)= F(i) + Fdisct(2,i);
   S(1,i)=mfexp(-1.0*Ftot(1,i));
   S(2,i)=mfexp(-1.0*Ftot(2,i));
 }

//Bycatch mortality from Tanner crab fishery
 for (i=1; i<=nobs_tc; i++)
 {
   Ftcm(yrs_tc(i)) = mfexp(log_Ftcm(i));
   Ftcf(yrs_tc(i)) = mfexp(log_Ftcf(i));
 }
  ttc = (Ftcm(1991)/tc_e(1991)+Ftcm(1992)/tc_e(1992)+Ftcm(1993)/tc_e(1993))/3.0;
  ttc1 = (Ftcf(1991)/tc_e(1991)+Ftcf(1992)/tc_e(1992)+Ftcf(1993)/tc_e(1993))/3.0;
 for (i=styr; i<1991; i++)
 {
   Ftcm(i) = ttc*tc_e(i);
   Ftcf(i) = ttc1*tc_e(i);
 }
 for (i=1994; i<=endyr; i++)
 {
   Ftcm(i) = ttc*tc_e(i);
   Ftcf(i) = ttc1*tc_e(i);
 }
// Ftcm(endyr) = (Ftcm(2006)+Ftcm(2007)+Ftcm(2008))/3.0;
// Ftcf(endyr) = (Ftcf(2006)+Ftcf(2007)+Ftcf(2008))/3.0;
 for (i=styr;i<=endyr;i++)
 {
   Stc(1,i)=mfexp(-1.0*Ftcf(i)*sel_tcf);
   Stc(2,i)=mfexp(-1.0*Ftcm(i)*sel_tcm);
 }


FUNCTION get_numbers_at_len
//  cout<<" begin get numbers at length"<<endl;
  int itmp;
  na_f.initialize();
  na_m.initialize();
  na.initialize();
  rec_dev(1)=rec_devf+rec_devm;
  rec_dev(2)=rec_devm;

//initial year
  if (current_phase()<6)
  {
    for (j=1; j<=nlenf; j++) ep68(1,j) = p68(1,j) + first_females(j);
    ep68(2) = p68(2)+first_males;
    ep68(3) = ep68(2)*elem_div(p68(3),p68(2));
    t0 = 0.0;
    for (j=1; j<=nlenm; j++)
    {
       if (ep68(1,j) < 0.0) ep68(1,j) = 0.0;
       if (j>16) ep68(1,j) = 0.0;
       if (ep68(2,j) < 0.0) ep68(2,j) = 0.0;
       if (ep68(3,j) < 0.0) ep68(3,j) = 0.0;
    }
    t0 = sum(ep68);
    ep68 = ep68/t0;
    t0 = sum(elem_div(ep68(1),sel_srv(1,styr)))+sum(elem_div(ep68(2),sel_srv(2,styr)))+sum(elem_div(ep68(3),sel_srv(2,styr)));
    na_f(styr) = mfexp(n68)*elem_div(ep68(1),sel_srv(1,styr))/t0;
    na_m(1,styr) = mfexp(n68)*elem_div(ep68(2),sel_srv(2,styr))/t0;
    na_m(2,styr) = mfexp(n68)*elem_div(ep68(3),sel_srv(2,styr))/t0;
    na(styr)     = na_m(1,styr)  + na_m(2,styr);
  }
  else
  {
    f_year_e(nlenm+nlenf) = mfexp(-sum(f_year));               //make sure the sum to be 0, or exp = 1
    for(j = 1; j < nlenm+nlenf; j++)
    {
      f_year_e(j) = mfexp(f_year(j));
    }
    f_year_p = f_year_e/sum(f_year_e);      //f_year_p is the estimated proportions of the first year population abundance.
//    cout<<f_year_p<<endl;
    t0 = mfexp(n68);
    for(j = 1; j <= nlenm; j++)
    {
      na_m(1,styr,j) = f_year_p(j)*t0;
      na_m(2,styr,j) = 0.0;                           //set first-year old-shell male abundance to be 0.0
    }
    for(j = nlenm+1; j <= nlenm+nlenf; j++) na_f(styr,j-nlenm) = f_year_p(j)*t0;
    na(styr)     = na_m(1,styr)  + na_m(2,styr);
//    cout<<na_f(styr)<<endl;
//    cout<<na(styr)<<endl;
  }

// Now do Recruitments..........
  for (i=styr+1;i<=endyr;i++)
  {
     na_f(i) += mfexp(mean_log_rec+rec_dev(1,i))*rec_len(1);
     na_m(1,i) += mfexp(mean_log_rec+rec_dev(2,i))*rec_len(2);
  }
// cout<<na_f<<endl;
// cout<<na_m(1)<<endl;
// cout<<"through all inital recruits"<<endl;
//numbers at length
 for (i=styr;i<endyr;i++)
 {
   if (i<1983)
   {
      len_len0 = len_len(1);
   }
   else if (i<1994)
   {
      len_len0 = len_len(2);
   }
   else if (i > 1993)
   {
      len_len0 = len_len(3);
   }
   dvar_vector tmpf = mfexp(-(1-tc_cm(i))*M(1,i))*elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(1,i))*elem_prod(S(1,i),mfexp(-cm(i)*M(1,i))*na_f(i)),Stc(1,i));
   na_f(i+1) +=  tmpf * len_len0;
   dvar_vector tmp = elem_prod(moltp(i)*mfexp(-(1-tc_cm(i))*M(2,i)),elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(S(2,i),mfexp(-cm(i)*M(2,i))*na(i)),Stc(2,i)));
   na_m(1,i+1) +=  tmp * len_len(4);
   na_m(2,i+1) = elem_prod((1.0-moltp(i))*mfexp(-(1-tc_cm(i))*M(2,i)),elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(S(2,i),mfexp(-cm(i)*M(2,i))*na(i)),Stc(2,i)));
   na(i+1)     = na_m(1,i+1)  + na_m(2,i+1);

//popn is exploitable numbers
   na_fishtime(1,i) = mfexp(-cm(i)*M(1,i))*na_f(i);
   na_fishtime(2,i) = mfexp(-cm(i)*M(2,i))*na(i);
   na_fishtime_tc(1,i) = elem_prod(na_fishtime(1,i),mfexp(-1.0*Fdiscf(i)))*mfexp(-(tc_cm(i)-cm(i))*M(1,i));
   na_fishtime_tc(2,i) = elem_prod(na_fishtime(2,i),mfexp(-1.0*F(i)))*mfexp(-(tc_cm(i)-cm(i))*M(2,i));
   popn_lmale(i) = na_fishtime(2,i)*sel(i);
   popn_lmale_bio(i) = elem_prod(na_fishtime(2,i),sel(i))*wt(2);
   popn_fit(i) = na_fishtime(2,i)*sel_fit(i);
   mbio215(i) = (elem_prod(mfexp(-(0.694-tc_cm(i))*M(2,i))*mat,elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(S(2,i),mfexp(-cm(i)*M(2,i))*na(i)),Stc(2,i))))*wt(2);
   mbio2151(i) = (elem_prod(mfexp(-(0.694-tc_cm(i))*M(2,i))*mat1,elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(S(2,i),mfexp(-cm(i)*M(2,i))*na(i)),Stc(2,i))))*wt(2);
   mbio2152(i) = (elem_prod(mfexp(-(0.694-tc_cm(i))*M(2,i))*mat2,elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(S(2,i),mfexp(-cm(i)*M(2,i))*na(i)),Stc(2,i))))*wt(2);
 }
   ftem1 = (sel_fit(endyr)+sel_ret)*flast(1);
   ftem1 = ftem1 + Fdisct(2,endyr);
   ftem1 = mfexp(-1.0*ftem1);
   mbio215(endyr) = (elem_prod(mfexp(-(0.694-tc_cm(endyr))*M(2,endyr))*mat,elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(ftem1,mfexp(-cm(endyr)*M(2,endyr))*na(endyr)),Stc(2,i))))*wt(2);
   ftem1 = (sel_fit(endyr)+sel_ret)*flast(2);
   ftem1 = ftem1 + Fdisct(2,endyr);
   ftem1 = mfexp(-1.0*ftem1);
   mbio2151(endyr) = (elem_prod(mfexp(-(0.694-tc_cm(endyr))*M(2,endyr))*mat1,elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(ftem1,mfexp(-cm(endyr)*M(2,endyr))*na(endyr)),Stc(2,i))))*wt(2);
   ftem1 = (sel_fit(endyr)+sel_ret)*flast(3);
   ftem1 = ftem1 + Fdisct(2,endyr);
   ftem1 = mfexp(-1.0*ftem1);
   mbio2152(endyr) = (elem_prod(mfexp(-(0.694-tc_cm(endyr))*M(2,endyr))*mat2,elem_prod(mfexp(-(tc_cm(i)-cm(i))*M(2,i))*elem_prod(ftem1,mfexp(-cm(endyr)*M(2,endyr))*na(endyr)),Stc(2,i))))*wt(2);

//  cout<<sel_ret<<endl;
//  cout<<sel_fit(endyr)<<endl;
//  cout<<Fdisct(2,endyr)<<endl;
// cout<<"through na"<<endl;
//  cout<<na<<endl;
//  cout<<na_f<<endl;
//  exit(1);
  na_fishtime(1,endyr) = mfexp(-cm(endyr)*M(2,endyr))*na_f(endyr);
  na_fishtime(2,endyr) = mfexp(-cm(endyr)*M(2,endyr))*na(endyr);
  na_fishtime_tc(1,endyr) = elem_prod(na_fishtime(1,endyr),mfexp(-1.0*Fdiscf(endyr)))*mfexp(-(tc_cm(endyr)-cm(endyr))*M(1,endyr));
  na_fishtime_tc(2,endyr) = elem_prod(na_fishtime(2,endyr),mfexp(-1.0*F(endyr)))*mfexp(-(tc_cm(endyr)-cm(endyr))*M(2,endyr));
  popn_lmale(endyr)  = na_fishtime(2,endyr)*sel(endyr);
  popn_lmale_bio(endyr)  = elem_prod(na_fishtime(2,endyr),sel(endyr))*wt(2);
  popn_fit(endyr)  = na_fishtime(2,endyr)*sel_fit(endyr);
 //predicted survey values
 for (i=styr;i<=endyr;i++)
 {
    totn_srv1(1,i) = na_f(i)*sel_srv(1,i);
    totn_srv1(2,i) = na(i)*sel_srv(2,i);
 }
    popn.initialize();
    explbiom.initialize();
    pred_bio.initialize();
    pred_srv1.initialize();
    pred_srv1_biom.initialize();
    pred_srv1_bioms.initialize();
// cout<<na<<endl;
 for (i=styr;i<=endyr;i++)
 {
// this is predicted survey in numbers not biomass-don't adjust by max selectivity
     pred_srv1(1,i) += elem_prod(na_f(i),sel_srv(1,i));
     pred_srv1(2,i) += elem_prod(na(i),sel_srv(2,i));
     pred_srv1_bioms(1,i)+=(na_f(i)*elem_prod(sel_srv(1,i),wt(1)));
     pred_srv1_bioms(2,i)+=(na(i)*elem_prod(sel_srv(2,i),wt(2)));
     pred_srv1_biom(i) = pred_srv1_bioms(1,i)+pred_srv1_bioms(2,i);
     explbiom(i) += na(i)*elem_prod(sel(i),wt(2));
     pred_bio(i) += na_f(i)*wt(1)+na(i)*wt(2);
     popn(i) = sum(na(i))+sum(na_f(i));
     pred_p_srv1_len_m(1,i)=elem_prod(sel_srv(2,i),na_m(1,i))/(totn_srv1(1,i)+totn_srv1(2,i));
     pred_p_srv1_len_m(2,i)=elem_prod(sel_srv(2,i),na_m(2,i))/(totn_srv1(1,i)+totn_srv1(2,i));
     pred_p_srv1_len_f(i)=elem_prod(sel_srv(1,i),na_f(i))/(totn_srv1(1,i)+totn_srv1(2,i));
 }
// compute mature abundance for comparing with BSFRF survey
 for (i=1;i<=nobs_bsfrf;i++) {   n_bsfrf(i)= na(yrs_bsfrf(i))*mat; }

//total male survey length proportions. Combined data due to bad shell condition data
  // for (i=styr; i<= styr+9; i++)
  // {
  //   for (j=1; j<=nlenm; j++)
  //   {
  //      pred_p_srv1_len_m(1,i,j) = pred_p_srv1_len_m(1,i,j)+pred_p_srv1_len_m(2,i,j);
  //   }
  // }
  pred_p_srv1_len_m(1) = pred_p_srv1_len_m(1)+pred_p_srv1_len_m(2);
  pred_p_srv1_len_m(2) = 0.0;
  endbiom=pred_bio(endyr);
// cout<<endbiom<<endl;
  lbio=mbio215(endyr);
// cout<<lbio<<endl;
  blast = popn(endyr);
  mature1 = popn_lmale(endyr);
  mature2 = popn_lmale_bio(endyr);
// cout<<blast<<endl;
// cout<<"end get numbers at age"<<endl<<na<<endl;

FUNCTION get_catch_at_len
 //cout<<" begin catch at len"<<endl;
 pred_catch.initialize();
 pred_catch_ret.initialize();
 pred_catch_disc.initialize();
 catch_r.initialize();
 catch_m.initialize();
// catch_f.initialize();
 for (i=styr;i<=endyr;i++)
 {
// take out catch all at once - survey is start, cm is midpoint of the
// catch(fishing season weighted by the catch), then rest of nat mort and growth.
    totn_trawl(1,i)= na_fishtime(1,i)*sel_trawl_f(i);                   //used for estimating proportion of trawl bycatch by length only.
    totn_trawl(2,i)= na_fishtime(2,i)*sel_trawl_m(i);
    catch_t(i) = totn_trawl(1,i)+totn_trawl(2,i);
    if (catch_t(i) < 0.000001) catch_t(i) = 0.000001;
    for (j = 1; j<= nlenm; j++)
    {
       catch_lmale(i,j) = na_fishtime(2,i,j)*(1.0-mfexp(-1.0*F(i,j)));
       pred_catch(i) += catch_lmale(i,j)*wt(2,j);
       catch_male_ret(i,j) = na_fishtime(2,i,j)*(1.0-mfexp(-1.0*F_ret(i,j)));
       catch_r(i) += catch_male_ret(i,j);
       pred_catch_ret(i) += catch_male_ret(i,j)*wt(2,j);
       catch_discp(i,j) = na_fishtime(1,i,j)*(1.0-mfexp(-1.0*Fdiscf(i,j)));
//       catch_f(i) += catch_discp(i,j);
       catch_m(i) += catch_lmale(i,j) - catch_male_ret(i,j);
    }
    pred_catch_disc(i) += catch_discp(i)*wt(1);
//  cout<<(1-mfexp(-1.0*Fdiscf(i)))<<endl;
//  cout<<(1-mfexp(-1.0*Fdisct(1,i)))<<endl;
//  cout<<catch_lmale(i)<<endl;
//  cout<<sel(i)<<endl;
//  cout<<pred_catch(i)<<endl;
//  cout<<na_fishtime(1,i)<<endl;
//  cout<<na_fishtime(2,i)<<endl;
   pred_catch_trawl(i)= na_fishtime(1,i)*elem_prod(1.0-exp(-1.0*Fdisct(1,i)),wt(1))+
                        na_fishtime(2,i)*elem_prod(1.0-exp(-1.0*Fdisct(2,i)),wt(2));
   pred_catchtcf_biom(i) = na_fishtime_tc(1,i)*elem_prod(1.0-Stc(1,i),wt(1));
   pred_catchtcm_biom(i) = na_fishtime_tc(2,i)*elem_prod(1.0-Stc(2,i),wt(2));
   pred_p_fish_fit(i)=elem_prod(sel_fit(i),na_fishtime(2,i))/popn_fit(i);
   pred_p_fish(i)=elem_prod(sel(i),na_fishtime(2,i))/popn_lmale(i);
   pred_p_fish_discm(i)=elem_prod((sel(i)-sel_fit(i)),na_fishtime(2,i))/((sel(i)-sel_fit(i))*na_fishtime(2,i));
   pred_p_fish_discf(i)=elem_prod(sel_discf(i),na_fishtime(1,i))/(na_fishtime(1,i)*sel_discf(i));
   pred_p_trawl(1,i)=elem_prod(sel_trawl_f(i),na_fishtime(1,i))/catch_t(i);
   pred_p_trawl(2,i)=elem_prod(sel_trawl_m(i),na_fishtime(2,i))/catch_t(i);
 }
 for (i=1;i<=nobs_tc;i++)
 {
   pred_p_tc_len_f(i) = elem_prod(sel_tcf,na_fishtime_tc(1,yrs_tc(i)))/(na_fishtime_tc(1,yrs_tc(i))*sel_tcf);
   pred_p_tc_len_m(i) = elem_prod(sel_tcm,na_fishtime_tc(2,yrs_tc(i)))/(na_fishtime_tc(2,yrs_tc(i))*sel_tcm);
 }

// cout<<popn_lmale<<endl;
// cout<<"end catch at len"<<endl;

FUNCTION get_reference_points
// cout<<"start reference points"<<endl;
  dvariable mr;
  ref_Ft = 0.0;
  ref_Ftc = 0.0;
  ref_sel_fit.initialize();
  ref_sel_ret.initialize();
  ref_moltp.initialize();
  ref_sel_trawl.initialize();

  mr = 0;
  for(i=ryear(1); i<=ryear(2); i++)
  {
     mr += mfexp(mean_log_rec+rec_dev(1,i))+mfexp(mean_log_rec+rec_dev(2,i));
  }
  mr = mr/((ryear(2)-ryear(1)+1.0)*2.0);           //mean recruitment for B35 estimation
// cout<<"mean mr= "<<mr<<endl;
  for (i = endyr-9; i<=endyr; i++)
  {
    ref_Ft += fmortt(i);
    ref_Ftc += Ftcm(i);
    for (k=1; k<=nlenm; k++)
    {
       ref_sel_trawl(k) += sel_trawl_m(i,k);
       ref_moltp(k) += moltp(i-1,k);
    }
  }
  for (i = endyr-2; i<=endyr-1; i++)
  {
    for (k=1; k<=nlenm; k++)
    {
      ref_sel_fit(k) += sel_fit(i,k);
      ref_sel_ret(k) += sel(i,k)-sel_fit(i,k);
    }
  }
  ref_Ft = ref_Ft/10.0;
  ref_Ftc = ref_Ftc/10.0;
  ref_sel_trawl = ref_sel_trawl/10.0;
  ref_moltp = ref_moltp/10.0;
  ref_sel_fit = ref_sel_fit/2.0;
  ref_sel_ret = ref_sel_ret/2.0;

  for (j = 1; j<= 101; j++)
 {
   ref_F = 0.01*j-0.01;
   ref_Ftot = ref_sel_trawl*ref_Ft +ref_sel_fit*ref_F+ref_sel_ret*ref_F;
   if (j==1) ref_Ftot = ref_sel_fit*ref_F+ref_sel_ret*ref_F;
   ref_Fret=ref_sel_fit*ref_F;
   ref_S = mfexp(-1.0*ref_Ftot);
   tem_S = ref_S;
   tem_Stc = mfexp(-1.0*ref_Ftc*sel_tcm);
   if (j==1)
   {
     tem_S = 1.0;
     tem_Stc = 1.0;
   }
   ref_catch.initialize();
   ref_catch_ret.initialize();
   ref_catch_m.initialize();
   ref_na_m.initialize();
   ref_na.initialize();
// cout<<ref_catch<<endl;
//initial year
   ref_na_m(1,1) = na_m(1,endyr);
   ref_na_m(2,1) = na_m(2,endyr);
   ref_na(1)     = ref_na_m(1,1)  + ref_na_m(2,1);

// Now do Recruitments..........
   for (i=2;i<=100;i++)
   {
      ref_na_m(1,i) += 1000000.0 *rec_len(2);
   }
//numbers at length
   for (i=1;i<100;i++)
   {
//     dvar_vector ref_tmp = elem_prod(ref_moltp*mfexp(-(1.0-tc_cm(endyr))*M(2,endyr)),elem_prod(mfexp(-(tc_cm(endyr)-cm(endyr))*M(2,endyr))*elem_prod(tem_S,mfexp(-cm(endyr)*M(2,endyr))*ref_na(i)),tem_Stc));
     dvar_vector ref_tmp = elem_prod(ref_moltp*mfexp(-(1.0-0.34)*M(2,endyr)),elem_prod(tem_S,mfexp(-0.34*M(2,endyr))*ref_na(i)));
     ref_na_m(1,i+1) +=  ref_tmp * len_len(4);
//     ref_na_m(2,i+1) = elem_prod((1.0-ref_moltp)*mfexp(-(1-tc_cm(endyr))*M(2,endyr)),elem_prod(mfexp(-(tc_cm(endyr)-cm(endyr))*M(2,endyr))*elem_prod(tem_S,mfexp(-cm(endyr)*M(2,endyr))*ref_na(i)),tem_Stc));
     ref_na_m(2,i+1) = elem_prod((1.0-ref_moltp)*mfexp(-(1-0.34)*M(2,endyr)),elem_prod(tem_S,mfexp(-0.34*M(2,endyr))*ref_na(i)));
     ref_na(i+1)     = ref_na_m(1,i+1)  + ref_na_m(2,i+1);
     ref_na_fishtime(i) = mfexp(-0.34*M(2,endyr))*ref_na(i);
//     ref_mbio215(i) = (elem_prod(mfexp(-(0.694-tc_cm(endyr))*M(2,endyr))*mat,elem_prod(mfexp(-(tc_cm(endyr)-cm(endyr))*M(2,endyr))*elem_prod(tem_S,mfexp(-cm(endyr)*M(2,endyr))*ref_na(i)),tem_Stc)))*wt(2);
//     ref_mbio215(i) = (elem_prod(mfexp(-(0.694-tc_cm(endyr))*M(2,endyr))*mat1,elem_prod(mfexp(-(tc_cm(endyr)-cm(endyr))*M(2,endyr))*elem_prod(tem_S,mfexp(-cm(endyr)*M(2,endyr))*ref_na(i)),tem_Stc)))*wt(2);
//     ref_mbio215(i) = (elem_prod(mfexp(-(0.694-tc_cm(endyr))*M(2,endyr))*mat2,elem_prod(mfexp(-(tc_cm(endyr)-cm(endyr))*M(2,endyr))*elem_prod(tem_S,mfexp(-cm(endyr)*M(2,endyr))*ref_na(i)),tem_Stc)))*wt(2);
     ref_mbio215(i) = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(tem_S,mfexp(-0.34*M(2,endyr))*ref_na(i))))*wt(2);
     ref_mbio2151(i) = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat1,elem_prod(tem_S,mfexp(-0.34*M(2,endyr))*ref_na(i))))*wt(2);
     ref_mbio2152(i) = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat2,elem_prod(tem_S,mfexp(-0.34*M(2,endyr))*ref_na(i))))*wt(2);
    for (k = 1; k<= nlenm; k++)
    {
       ref_catch_lmale(i,k) = ref_na_fishtime(i,k)*(1.0-ref_S(k));
       ref_catch(i) += ref_catch_lmale(i,k)*wt(2,k);
       ref_catch_male_ret(i,k) = ref_na_fishtime(i,k)*(1.0-mfexp(-1.0*ref_Fret(k)));
       ref_catch_ret(i) += ref_catch_male_ret(i,k)*wt(2,k);
    }
    ref_catch_m(i) = ref_catch(i) - ref_catch_ret(i);
    ref_catch_trawl(i)= ref_na_fishtime(i)*elem_prod(1.0-exp(-1.0*ref_sel_trawl*ref_Ft),wt(2));

   }
   ref_na_fishtime(99) = mfexp(-0.34*M(2,endyr))*ref_na(99);
   ref_mbio(j) = ref_mbio215(99)/1000.0;                    //kg/R
   ref_mbio1(j) = ref_mbio2151(99)/1000.0;
   ref_mbio2(j) = ref_mbio2152(99)/1000.0;
   ref_totc(j) = ref_catch(99)/1000.0;
   ref_retc(j) = ref_catch_ret(99)/1000.0;
 }
    i35 = 0;
    i40 = 0;
  for (j = 1; j<= 101; j++)
 {
    if (i35 < 1.0)
    {
      if (ref_mbio(j) <= 0.35*ref_mbio(1))
      {
         f35 = 0.01*j-0.01;
         eb35 = ref_mbio(j)*mr/1000.0;
         b25 = 0.25*eb35;
         i35 = 2.0;
      }
    }
    if (i40 < 1.0)
    {
      if (ref_mbio(j) <= 0.40*ref_mbio(1))
      {
         f40 = 0.01*j-0.01;
         i40 = 2.0;
      }
    }
 }
  ofstream report1("refp7513s1.out");
  report1 <<"Total MMB (>119mm) 2/15 as F = 0.00, 0.01, ... 1.0"<<endl;
  report1 << ref_mbio<<endl;
  report1 <<"Total MMB (>129mm) 2/15 as F = 0.00, 0.01, ... 1.0"<<endl;
  report1 << ref_mbio1<<endl;
  report1 <<"Total MMB (>109mm) 2/15 as F = 0.00, 0.01, ... 1.0"<<endl;
  report1 << ref_mbio2<<endl;
  report1 <<"Total catch as F = 0.00, 0.01, ... 1.0"<<endl;
  report1 << ref_totc<<endl;
  report1 <<"Retained catch as F = 0.00, 0.01, ... 1.0"<<endl;
  report1 << ref_retc<<endl;
  report1 <<"F35: "<<f35<<"  B35: "<<eb35<<" Mean R: "<<mr<<endl;
  report1 <<"F40: "<<f40<<endl;
  report1 <<"ref_Ft = (mean of 10 years)  "<<endl;
  report1 <<ref_Ft<<endl;
  report1 <<"ref_sel_trawl = (mean of 10 years)  "<<endl;
  report1 <<ref_sel_trawl<<endl;
  report1 <<"ref_sel_retained = (mean of 2 years)  "<<endl;
  report1 <<ref_sel_fit<<endl;
  report1 <<"ref_sel_discarded = (mean of 2 years)  "<<endl;
  report1 <<ref_sel_ret<<endl;
// cout<<"end of reference points"<<endl;
  ref_f = 0.0;
  ref_sel_f = 0.0;
  for (i = endyr-2; i<=endyr-1; i++)
  {
    ref_f += fmortdf(i);
    for (k=1; k<=nlenm; k++)
    {
      ref_sel_f(k) += sel_discf(i,k);
    }
  }
  ref_sel_f = ref_sel_f/2.0;
  ref_f = ref_f/2.0;
  report1 <<"ref_sel_disc_females = (mean of 2 years)  "<<endl;
  report1 <<ref_sel_f<<endl;
  ofl_f = f35;
  ref_Ftot = ref_sel_trawl*ref_Ft + ref_sel_fit*ofl_f+ref_sel_ret*ofl_f;
  ref_S = mfexp(-1.0*ref_Ftot);
  last_mmb = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(ref_S,mfexp(-0.34*M(2,endyr))*na(endyr))))*wt(2);
  if (last_mmb < eb35)
  {
     for (k = 1; k<10; k++)
     {
        ref_Ftot = ref_sel_trawl*ref_Ft + ref_sel_fit*ofl_f+ref_sel_ret*ofl_f;
        ref_S = mfexp(-1.0*ref_Ftot);
        last_mmb = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(ref_S,mfexp(-0.34*M(2,endyr))*na(endyr))))*wt(2);
        if (last_mmb < b25)
        {
           ofl_f = 0.0;
        }
        else
        {
            ofl_f = f35*(last_mmb/eb35-0.1)/0.9;
        }
     }
  }
   ref_Ftot = ref_sel_fit*ofl_f+ref_sel_ret*ofl_f;
   ref_Fret=ref_sel_fit*ofl_f;
   ref_S = mfexp(-1.0*ref_Ftot);
   ref_f = ref_f * ofl_f/f35;
   ref_catch(1) = 0.0;
   ref_catch_ret(1) = 0.0;
   for (k = 1; k<= nlenm; k++)
   {
      ref_catch_lmale(1,k) = na_fishtime(2,endyr,k)*(1.0-ref_S(k));
      ref_catch(1) += ref_catch_lmale(1,k)*wt(2,k);
      ref_catch_male_ret(1,k) = na_fishtime(2,endyr,k)*(1.0-mfexp(-1.0*ref_Fret(k)));
      ref_catch_ret(1) += ref_catch_male_ret(1,k)*wt(2,k);
   }
   ref_catch_m(1) = ref_catch(1) - ref_catch_ret(1);
   ref_catch_trawl(1)= na_fishtime(2,endyr)*elem_prod(1.0-exp(-1.0*ref_sel_trawl*ref_Ft),wt(2));
   ref_catch_trawl(1) += na_fishtime(1,endyr)*elem_prod(1.0-exp(-1.0*ref_sel_trawl*ref_Ft),wt(1));
   ref_catch_f = na_fishtime(1,endyr)*elem_prod(1.0-exp(-1.0*ref_sel_f*ref_f),wt(1));
   ref_catch(1) += ref_catch_f + ref_catch_trawl(1);
   ofl_catch = ref_catch(1);

   report1 <<"OFL =  "<<ref_catch(1)<<endl;
   report1 <<"Retained catch =  "<<ref_catch_ret(1)<<endl;
   report1 <<"Male pot bycatch =  "<<ref_catch_m(1)<<endl;
   report1 <<"Female pot bycatch =  "<<ref_catch_f<<endl;
   report1 <<"Trawl bycatch =  "<<ref_catch_trawl(1)<<endl;
   report1 <<"OFL F =  "<<ofl_f<<endl;
   report1 <<"MMB at terminal year =  "<<last_mmb<<endl;

//
//
FUNCTION projection


  mate = 0.0; mate(12)=1.0;mate(13)=1.2;mate(14)=1.4;mate(15)=1.6;mate(16)=1.8;mate(17)=2.1;mate(18)=2.4;mate(19)=2.7;mate(20)=3.0;

   random_number_generator r1(1000);
   random_number_generator r2(1100);

   dmatrix vu(2,10,1,1000);
   dvector vn(1,1000);
   vn.fill_randn(r1);
   vu.fill_randu(r2);
// cout<<vn<<endl;
// cout<<vu<<endl;

  ofstream report2("prj7513s1.out");
 for(int kk=1; kk<=3; kk++)         //F=0, F40%, & F35%
 {
   prj_Ft = ref_sel_trawl*ref_Ft;
   prj_Ftot = prj_Ft +ref_sel_fit*fprj(kk)+ref_sel_ret*fprj(kk);
   prj_S = mfexp(-1.0*prj_Ftot);
   prj_S0 = mfexp(-1.0*(prj_Ft));
   prj_catch.initialize();
   prj_catch_ret.initialize();
   for(j=1; j<=1000; j++)
   {
     prj_na_m.initialize();
     prj_na.initialize();
     t0 = vn(j)*vb+blast;            //selecting an abundance in terminal year
     t0 = t0/blast;
     prj_na_m(1,1) = t0*na_m(1,endyr);
     prj_na_m(2,1) = t0*na_m(2,endyr);
     prj_na(1)     = prj_na_m(1,1)  + prj_na_m(2,1);

// Now do Recruitments..........
     for (i=2;i<=10;i++)
     {
       int ii = (endyr-1984+1)*vu(i,j)+1.0/(endyr-1984+1);
       prj_na_m(1,i) += mfexp(mean_log_rec+rec_dev(2,1983+ii))*rec_len(2); //randomly select recruits from 1984-endyr.
     }
//numbers at length
     for (i=1;i<10;i++)
     {
       t2 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(prj_S0,mfexp(-0.34*M(2,endyr))*prj_na(i))))*wt(2);
       t3 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(prj_S,mfexp(-0.34*M(2,endyr))*prj_na(i))))*wt(2);
       if (t3 >= eb35)
       {
         t4 = fprj(kk);   //set F to be maximum.
       }
       else if (t2 < b25)
       {
         t4 = 0.0;        //set F to 0 when B below B25.
       }
       else
       {                 //need to iterate to find F
         t4 = fprj(kk)*(t3/eb35-0.1)/0.9;
         tt2 = mfexp(-1.0*(prj_Ft+ref_sel_fit*t4+ref_sel_ret*t4));
         t3 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(i))))*wt(2);
         t4 = fprj(kk)*(t3/eb35-0.1)/0.9;
         tt2 = mfexp(-1.0*(prj_Ft+ref_sel_fit*t4+ref_sel_ret*t4));
         t3 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(i))))*wt(2);
         t4 = fprj(kk)*(t3/eb35-0.1)/0.9;
       }
//     cout<<j<<" "<<i<<"  "<<t4<<endl;
       tt2 = mfexp(-1.0*(prj_Ft+ref_sel_fit*t4+ref_sel_ret*t4));
       prj_Sret=mfexp(-1.0*(ref_sel_fit*t4));
       dvar_vector prj_tmp = elem_prod(ref_moltp*mfexp(-(1.0-0.34)*M(2,endyr)),elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(i)));
       prj_na_m(1,i+1) +=  prj_tmp * len_len(4);
       prj_na_m(2,i+1) = elem_prod((1.0-ref_moltp)*mfexp(-(1-0.34)*M(2,endyr)),elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(i)));
       prj_na(i+1)     = prj_na_m(1,i+1)  + prj_na_m(2,i+1);
       prj_na_fishtime(i) = mfexp(-0.34*M(2,endyr))*prj_na(i);
       prj_mbio215(i,j) = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(i))))*wt(2);
       for (k = 1; k<= nlenm; k++)
       {
         prj_catch_lmale(i,k) = prj_na_fishtime(i,k)*(1.0-tt2(k));
         prj_catch(i,j) += prj_catch_lmale(i,k)*wt(2,k);
         prj_catch_male_ret(i,k) = prj_na_fishtime(i,k)*(1.0-prj_Sret(k));
         prj_catch_ret(i,j) += prj_catch_male_ret(i,k)*wt(2,k);
       }
     }
     t2 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(prj_S0,mfexp(-0.34*M(2,endyr))*prj_na(10))))*wt(2);
     t3 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(prj_S,mfexp(-0.34*M(2,endyr))*prj_na(10))))*wt(2);
     if (t3 >= eb35)
     {
       t4 = fprj(kk);   //set F to be maximum.
     }
     else if (t2 < b25)
     {
       t4 = 0.0;        //set F to 0 when B below B25.
     }
     else
     {                 //need to iterate to find F
       t4 = fprj(kk)*(t3/eb35-0.1)/0.9;
       tt2 = mfexp(-1.0*(prj_Ft+ref_sel_fit*t4+ref_sel_ret*t4));
       t3 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(10))))*wt(2);
       t4 = fprj(kk)*(t3/eb35-0.1)/0.9;
       tt2 = mfexp(-1.0*(prj_Ft+ref_sel_fit*t4+ref_sel_ret*t4));
       t3 = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(10))))*wt(2);
       t4 = fprj(kk)*(t3/eb35-0.1)/0.9;
     }
 //    cout<<j<<" "<<i<<"  "<<t4<<endl;
     tt2 = mfexp(-1.0*(prj_Ft+ref_sel_fit*t4+ref_sel_ret*t4));
     prj_Sret=mfexp(-1.0*(ref_sel_fit*t4));
     prj_na_fishtime(10) = mfexp(-0.34*M(2,endyr))*prj_na(10);
//     cout<<j<<" "<<i<<"  "<<tt2<<"  "<<prj_Sret<<endl;
     for (k = 1; k<= nlenm; k++)
     {
       prj_catch_lmale(10,k) = prj_na_fishtime(10,k)*(1.0-tt2(k));
       prj_catch(10,j) += prj_catch_lmale(10,k)*wt(2,k);
       prj_catch_male_ret(10,k) = prj_na_fishtime(10,k)*(1.0-prj_Sret(k));
       prj_catch_ret(10,j) += prj_catch_male_ret(10,k)*wt(2,k);
     }
     prj_mbio215(10,j) = (elem_prod(mfexp(-(0.694-0.34)*M(2,endyr))*mat,elem_prod(tt2,mfexp(-0.34*M(2,endyr))*prj_na(10))))*wt(2);
   }
//    cout<<wt(2)<<"  "<<wt<<" "<<wt(2,10)<<endl;
//    cout<<"catch: "<<prj_na_fishtime<<endl;
//    cout<<"catch: "<<prj_catch_ret<<endl;
//   prj_mean_mbio = colsum(prj_mbio215)/1000.0;
//   prj_mean_totc = colsum(prj_catch)/1000.0;
//   prj_mean_retc = colsum(prj_catch_ret)/1000.0;
   prj_mean_mbio = 0.0;
   prj_mean_totc = 0.0;
   prj_mean_retc = 0.0;
   for (i=1;i<=10;i++)
   {
      for(j=1; j<=1000; j++)
      {
         prj_mean_mbio(i) += prj_mbio215(i,j);
         prj_mean_totc(i) += prj_catch(i,j);
         prj_mean_retc(i) += prj_catch_ret(i,j);
      }
      prj_mean_mbio(i) = prj_mean_mbio(i)/1000.0;
      prj_mean_totc(i) = prj_mean_totc(i)/1000.0;
      prj_mean_retc(i) = prj_mean_retc(i)/1000.0;
   }
   report2 <<"MMB         Retained Catch         Total Catch for 10 years "<<endl;
   report2 <<prj_mean_mbio<<endl;
   report2 <<prj_mean_retc<<endl;
   report2 <<prj_mean_totc<<endl;
   for (i=1;i<=10;i++)
   {
    www = prj_mbio215(i);
    for (j=1; j<=999; j++)
    {
       for (k=j+1; k<=1000; k++)
       {
         if (www(k) < www(j))
         {
           t1 = www(j);
           www(j) = www(k);
           www(k) = t1;
         }
       }
    }
    prj_cf_mbio(i,1) = www(1);
    prj_cf_mbio(i,2) = www(25);
    prj_cf_mbio(i,3) = www(50);
    prj_cf_mbio(i,4) = www(100);
    prj_cf_mbio(i,5) = (www(500)+www(501))/2.0;
    prj_cf_mbio(i,6) = www(900);
    prj_cf_mbio(i,7) = www(950);
    prj_cf_mbio(i,8) = www(975);
    prj_cf_mbio(i,9) = www(1000);
    www = prj_catch(i);
    for (j=1; j<=999; j++)
    {
       for (k=j+1; k<=1000; k++)
       {
         if (www(k) < www(j))
         {
           t1 = www(j);
           www(j) = www(k);
           www(k) = t1;
         }
       }
    }
    prj_cf_totc(i,1) = www(1);
    prj_cf_totc(i,2) = www(25);
    prj_cf_totc(i,3) = www(50);
    prj_cf_totc(i,4) = www(100);
    prj_cf_totc(i,5) = (www(500)+www(501))/2.0;
    prj_cf_totc(i,6) = www(900);
    prj_cf_totc(i,7) = www(950);
    prj_cf_totc(i,8) = www(975);
    prj_cf_totc(i,9) = www(1000);
    www = prj_catch_ret(i);
    for (j=1; j<=999; j++)
    {
       for (k=j+1; k<=1000; k++)
       {
         if (www(k) < www(j))
         {
           t1 = www(j);
           www(j) = www(k);
           www(k) = t1;
         }
       }
    }
    prj_cf_retc(i,1) = www(1);
    prj_cf_retc(i,2) = www(25);
    prj_cf_retc(i,3) = www(50);
    prj_cf_retc(i,4) = www(100);
    prj_cf_retc(i,5) = (www(500)+www(501))/2.0;
    prj_cf_retc(i,6) = www(900);
    prj_cf_retc(i,7) = www(950);
    prj_cf_retc(i,8) = www(975);
    prj_cf_retc(i,9) = www(1000);
   }
   report2 <<"F = "<<fprj(kk)<<endl;
   report2 <<"MMB 0.001, 0.025, 0.05 0.1 0.5, 0.9 0.95, 0.975 1.0 for 10 years "<<endl;
   report2 <<prj_cf_mbio<<endl;
   report2 <<"Total yield 0.001, 0.025, 0.05 0.1 0.5, 0.9 0.95, 0.975 1.0 for 10 years "<<endl;
   report2 <<prj_cf_totc<<endl;
   report2 <<"Retained yield 0.001, 0.025, 0.05 0.1 0.5, 0.9 0.95, 0.975 1.0 for 10 years "<<endl;
   report2 <<prj_cf_retc<<endl;
 }
//now with state harvest strategy

FUNCTION get_effective_sample_sizes
  dvariable ts1, ts2, ts3, ts4, ts5, ts6;
  dvar_vector tss(1,nobs_srv1);
  int ii; int ij;
  for (i=1; i<= nobs_fish; i++)
  {
//  cout<<pred_p_fish<<endl;
//  exit(1);
    ii=yrs_fish(i);
    ts1 = 0.0; ts2 = 0.0;
    for (j=11; j<=nlenm; j++)       //no retained crabs in the first 10 length groups
    {
       ts1 += pred_p_fish_fit(ii,j)*(1.0-pred_p_fish_fit(ii,j));
       ts2 += (obs_p_fish_ret(i,j)-pred_p_fish_fit(ii,j))*(obs_p_fish_ret(i,j)-pred_p_fish_fit(ii,j));
    }
    size_fish_ret(i) = ts1/ts2;
    if (size_fish_ret(i) < 1.0) size_fish_ret(i) = 1.0;
  }
//  cout<<size_fish_ret<<endl;
  for (i=1; i<= nobs_fish_discm; i++)
  {
    ii=yrs_fish_discm(i);
    ij=nlenm - 4;
    ts1 = 0.0; ts2 = 0.0;
    for (j=1; j<=ij; j++)
    {
       ts1 += pred_p_fish_discm(ii,j)*(1.0-pred_p_fish_discm(ii,j));
       ts2 += (obs_p_fish_discm(i,j)-pred_p_fish_discm(ii,j))*(obs_p_fish_discm(i,j)-pred_p_fish_discm(ii,j));
    }
    size_fish_discm(i) = ts1/ts2;
    if (size_fish_discm(i) < 1.0) size_fish_discm(i) = 1.0;
  }
//  cout<<size_fish_discm<<endl;
  for (i=1; i<= nobs_fish_discf; i++)
  {
    ii=yrs_fish_discf(i);
    ts1 = 0.0; ts2 = 0.0;
    for (j=1; j<=nlenf; j++)
    {
       ts1 += pred_p_fish_discf(ii,j)*(1.0-pred_p_fish_discf(ii,j));
       ts2 += (obs_p_fish_discf(i,j)-pred_p_fish_discf(ii,j))*(obs_p_fish_discf(i,j)-pred_p_fish_discf(ii,j));
    }
    size_fish_discf(i) = ts1/ts2;
    if (size_fish_discf(i) < 1.0) size_fish_discf(i) = 1.0;
  }
//  cout<<size_fish_discf<<endl;
  for (i=1; i<=nobs_srv1; i++)
  {
    ii=yrs_srv1(i);
    ts1=0.0; ts2=0.0; ts3=0.0; ts4=0.0; ts5=0.0; ts6=0.0;
    for (j=1; j<=nlenm; j++)
    {
      if (j<=nlenf)
      {
        ts1 += pred_p_srv1_len_f(ii,j)*(1.0-pred_p_srv1_len_f(ii,j));
        ts2 += (obs_p_srv1_len_f(i,j)-pred_p_srv1_len_f(ii,j))*(obs_p_srv1_len_f(i,j)-pred_p_srv1_len_f(ii,j));
      }
      ts3 += (pred_p_srv1_len_m(2,ii,j)+pred_p_srv1_len_m(1,ii,j))*(1.0-pred_p_srv1_len_m(2,ii,j)-pred_p_srv1_len_m(1,ii,j));
      ts4 += (obs_p_srv1_len_m(2,i,j)+obs_p_srv1_len_m(1,i,j)-pred_p_srv1_len_m(1,ii,j)-pred_p_srv1_len_m(2,ii,j))*(obs_p_srv1_len_m(2,i,j)+obs_p_srv1_len_m(1,i,j)-pred_p_srv1_len_m(1,ii,j)-pred_p_srv1_len_m(2,ii,j));
//  cout<<"size_srv3"<<endl;
    }
//  cout<<"ts1= "<<ts1<<" "<<ts2<<" "<<ts3<<" "<<ts4<<endl;
    size_srv(1,i) = ts1/ts2;
    size_srv(2,i) = ts3/ts4;
  }


FUNCTION evaluate_the_objective_function
 //cout<<" to begin obj fun"<<endl;
 dvar_vector cv_tem(1,nobs_bsfrf);
 len_likeyr.initialize();
 len_like.initialize();
 len_like_srv.initialize();
 sel_like=0.;
 rec_like=.0;
 surv_like=.0;
 catch_like1=.0;
 catch_like2=.0;
 catch_likef=.0;
 catch_liket=.0;
 sexr_like.initialize();
 sumrecf.initialize();
 sumrecm.initialize();
 sel_like_50m.initialize();
 f=.0;
 if (active(rec_devf))
 {
//recruitment likelihood - norm2 is sum of square values
//cout<<"to rec_like"<<endl;
    rec_like = 0.5*like_wght_rec*norm2(rec_devf)+like_wght_rec*norm2(rec_devm);
    f += rec_like;
//    first_yr_like = 0.00*(norm2(first_males) + norm2(first_females));            //first year deviations
//    f  += first_yr_like;
    f += 0.2*norm2(fmortdf_dev)+ 0.1*norm2(fmortt_dev);
    for(i=styr+1; i<=endyr; i++)
    {
       sumrecf += mfexp(mean_log_rec+rec_devm(i)+rec_devf(i));
       sumrecm += mfexp(mean_log_rec+rec_devm(i));
    }
    sexr_like = square(log(sumrecf/(endyr-styr))-log(sumrecm/(endyr-styr)));
//    cout<<sexr_like<<endl;
    f += like_wght_sexr*sexr_like;
 }
 sel_like_50m = norm2(first_difference(sel50_dev))+norm2(first_difference(fish_disc_sel50_dev_f))+norm2(first_difference(fish_disc_sel50_dev_tm));
 f +=like_wght_sel50*sel_like_50m;
 int ii;
 int ij;
 int ik;
 for (i=1; i<= nobs_fish; i++)
 {
   ii=yrs_fish(i);
//fishery retained length likelihood
   for (j=11; j<=nlenm; j++)       //no retained crabs in the first 10 length groups
   {
//   t1 = pred_p_fish_fit(ii,j)*(1.0-pred_p_fish_fit(ii,j))+0.1/double(nlenm);
    t1 = obs_p_fish_ret(i,j)*(1.0-obs_p_fish_ret(i,j))+0.1/double(nlenm);
    len_like(1) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_fish(i)))+log(mfexp(-1.*square(obs_p_fish_ret(i,j)-pred_p_fish_fit(ii,j))*s_fish(i)/(2.0*t1))+0.01);
//len_like(1)-=nsamples_fish(i)*(1e-6+obs_p_fish_ret(i,j))*log(pred_p_fish_fit(ii,j)+1e-6);
   }
 }
// cout<<"retained length likelihood: "<<len_like(1)<<endl;
 for (i=1; i<= nobs_fish_discm; i++)
 {
   ij=yrs_fish_discm(i);
   ii=nlenm - 4;
   for (j=1; j<=ii; j++)
   {
//   t1 = pred_p_fish_discm(ij,j)*(1.0-pred_p_fish_discm(ij,j))+0.1/double(nlenm);
     t1 = obs_p_fish_discm(i,j)*(1.0-obs_p_fish_discm(i,j))+0.1/double(nlenm);
    len_like(2) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_fish_discm(i)))+log(mfexp(-1.*square(obs_p_fish_discm(i,j)-pred_p_fish_discm(ij,j))*s_fish_discm(i)/(2.0*t1))+0.01);
//len_like(2)-=nsamples_fish_discm(i)*(1e-6+obs_p_fish_tot(i,j))*log(pred_p_fish(ij,j)+1e-6);
   }
 }
// cout<<"male discard length likelihood: "<<len_like(2)<<endl;
 for (i=1; i<= nobs_fish_discf; i++)
 {
   ik=yrs_fish_discf(i);
   for (j=1; j<=nlenf; j++)
   {
//   t1 = pred_p_fish_discf(ik,j)*(1.0-pred_p_fish_discf(ik,j))+0.1/double(nlenf);
     t1 = obs_p_fish_discf(i,j)*(1.0-obs_p_fish_discf(i,j))+0.1/double(nlenf);
   len_like(3) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_fish_discf(i)))+log(mfexp(-1.*square(obs_p_fish_discf(i,j)-pred_p_fish_discf(ik,j))*s_fish_discf(i)/(2.0*t1))+0.01);
// len_like(3)-=nsamples_fish_discf(i)*(1e-6+obs_p_fish_discf(i,j))*log(pred_p_fish_discf(ik,j)+1e-6);
   }
 }
 for (i=1; i<= nobs_trawl; i++)
 {
   ij=yrs_trawl(i);
   for (j=1; j<=nlenf; j++)
   {
//   t1 = pred_p_trawl(1,ij,j)*(1.0-pred_p_trawl(1,ij,j))+0.1/double(nlenf);
     t1 = obs_p_trawl(1,i,j)*(1.0-obs_p_trawl(1,i,j))+0.1/double(nlenf);
    len_like(3) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_trawl(1,i)))+log(mfexp(-1.*square(obs_p_trawl(1,i,j)-pred_p_trawl(1,ij,j))*s_trawl(1,i)/(2.0*t1))+0.01);
   }
   for (j=1; j<=nlenm; j++)
   {
//   t1 = pred_p_trawl(2,ij,j)*(1.0-pred_p_trawl(2,ij,j))+0.1/double(nlenm);
     t1 = obs_p_trawl(2,i,j)*(1.0-obs_p_trawl(2,i,j))+0.1/double(nlenm);
     len_like(5) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_trawl(2,i)))+log(mfexp(-1.*square(obs_p_trawl(2,i,j)-pred_p_trawl(2,ij,j))*s_trawl(2,i)/(2.0*t1))+0.01);
// len_like(5)-=nsamples_trawl(k,i)*(1e-6+obs_p_trawl(k,i,j))*log(pred_p_trawl(k,ij,j)+1e-6);
   }
 }
// cout<<"female discard length likelihood: "<<len_like(3)<<endl;
// cout<<"trawl discard length likelihood: "<<len_like(5)<<endl;
//survey likelihood
 for (i=1; i<=nobs_srv1; i++)
 {
   ii=yrs_srv1(i);
   for (j=1; j<=nlenm; j++)
   {
     if (j<=nlenf)
     {
// cout<<pred_p_srv1_len_f(ii,j)<<endl;
//     t1 = pred_p_srv1_len_f(ii,j)*(1.0-pred_p_srv1_len_f(ii,j))+0.1/double(nlenf);
       t1 = obs_p_srv1_len_f(i,j)*(1.0-obs_p_srv1_len_f(i,j))+0.1/double(nlenf);
       like_srv1_f(ii,j) = (obs_p_srv1_len_f(i,j)-pred_p_srv1_len_f(ii,j))*sqrt(s_srv(1,i)/(2.0*t1));
       t0 = log(mfexp(-1.*square(obs_p_srv1_len_f(i,j)-pred_p_srv1_len_f(ii,j))*s_srv(1,i)/(2.0*t1))+0.01);
       len_likeyr(1,i) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_srv(1,i)))+t0;
       len_like(4) += len_likeyr(1,i);
       len_like_srv(1) += len_likeyr(1,i);
     }
// cout<<"survey length likelihood: female: "<<len_likeyr(1,i)<<endl;
// cout<<"survey length likelihood: t1: "<<t1<<endl;
//   t2 = pred_p_srv1_len_m(1,ii,j)*(1.0-pred_p_srv1_len_m(1,ii,j))+0.1/double(nlenm);
     t2 = obs_p_srv1_len_m(1,i,j)*(1.0-obs_p_srv1_len_m(1,i,j))+0.1/double(nlenm);
     like_srv1_m(1,ii,j) = (obs_p_srv1_len_m(1,i,j)-pred_p_srv1_len_m(1,ii,j))*sqrt(s_srv(2,i)/(2.0*t2));
     len_likeyr(2,i) += (-0.5)*log(6.29*t2)-log(sqrt(1.0/s_srv(2,i)))+log(mfexp(-1.*square(obs_p_srv1_len_m(1,i,j)-pred_p_srv1_len_m(1,ii,j))*s_srv(2,i)/(2.0*t2))+0.01);
     len_like(4) += len_likeyr(2,i);
     len_like_srv(2) += len_likeyr(2,i);
// len_likeyr(1,i)-=nsamples_srv1(1,i)*(1e-6+obs_p_srv1_len_f(i,j))*log(pred_p_srv1_len_f(ii,j)+1e-6);
// len_likeyr(2,i)-=nsamples_srv1(2,i)*(1e-6+obs_p_srv1_len_m(1,i,j))*log(pred_p_srv1_len_m(1,ii,j)+1e-6);
// len_likeyr(3,i)-=nsamples_srv1(2,i)*(1e-6+obs_p_srv1_len_m(2,i,j))*log(pred_p_srv1_len_m(2,ii,j)+1e-6);
   }
// cout<<"survey length likelihood: newshell male: "<<len_like(4)<<endl;
// cout<<"survey length likelihood: t2: "<<t1<<endl;
 }
// cout<<"finish len like 4"<<endl;

 for (i=1; i<= nobs_tc; i++)
 {
   for (j=1; j<=nlenf; j++)
   {
//   t1 = pred_p_tc_len_f(i,j)*(1.0-pred_p_tc_len_f(i,j))+0.1/double(nlenf);
     t1 = obs_p_tc_len_f(i,j)*(1.0-obs_p_tc_len_f(i,j))+0.1/double(nlenf);
     len_like(6) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_tc(1,i)))+log(mfexp(-1.*square(obs_p_tc_len_f(i,j)-pred_p_tc_len_f(i,j))*s_tc(1,i)/(2.0*t1))+0.01);
   }
   for (j=1; j<=nlenm; j++)
   {
//   t1 = pred_p_tc_len_m(i,j)*(1.0-pred_p_tc_len_m(i,j))+0.1/double(nlenm);
     t1 = obs_p_tc_len_m(i,j)*(1.0-obs_p_tc_len_m(i,j))+0.1/double(nlenm);
     len_like(7) += (-0.5)*log(6.29*t1)-log(sqrt(1.0/s_tc(2,i)))+log(mfexp(-1.*square(obs_p_tc_len_m(i,j)-pred_p_tc_len_m(i,j))*s_tc(2,i)/(2.0*t1))+0.01);
   }
 }

// cout<<"survey length likelihood: "<<len_like(4)<<endl;
 f-=like_wght(1)*len_like(1);     // Retained fishery
 f-=like_wght(2)*len_like(2);     // Discard males
 f-=like_wght(3)*len_like(3);     // Female
 f-=like_wght(4)*len_like(4);     // Survey
 f-=like_wght(7)*len_like(5);     // Trawl
 f-=like_wght(3)*len_like(6);     // Discard-TC, females
 f-=like_wght(2)*len_like(7);     // Discard-TC, males

//cout<<" f before survey = "<<f<<endl;
// Fit to indices (lognormal)
//weight each years estimate by 1/(2*variance) - use cv of biomass in sqrt(log(cv^2+1)) as sd of log(biomass)
//cout<<sel_srv1<<endl;
//  cout<<"predicted survey "<<pred_srv1<<endl;
//  cout<<"pred survey biomass: "<<pred_srv1_bioms<<endl;
//  cout<<"obs survey biomass: "<<obs_srv1_bioms<<endl;
 for(k=1;k<=2;k++)
 {
   for(i=1;i<=nobs_srv1;i++)
   {
      biom_tmp(k,i)=pred_srv1_bioms(k,yrs_srv1(i));
   }
 }
// cout<<biom_tmp<<endl;
// cout<<obs_srv1_bioms<<endl;
// cout<<pred_srv1_bioms<<endl;
//likelihood for survey biomass by sex
 for(k=1;k<=2;k++)
 {
   surv_like += norm2(elem_div(log(obs_srv1_bioms(k)+1.0)-log(biom_tmp(k)+1.0),
               sqrt(2.0)*sqrt(log(elem_prod(cv_srv1(k),cv_srv1(k))+1.0))));
 }

//likelihood for BSFRF survey abundance
 cv_tem(1) = (cv_bsfrf(1)+ a_bsfrf)*(cv_bsfrf(1)+ a_bsfrf);
 cv_tem(2) = (cv_bsfrf(2)+ a_bsfrf)*(cv_bsfrf(2)+ a_bsfrf);
 bsfrf_like = sum(log(sqrt(log((cv_tem+1.0)))))+norm2(elem_div(log(obs_bsfrf+0.001)-log(n_bsfrf/1000000.0+0.001),
              sqrt(2.0)*sqrt(log((cv_tem+1.0)))));

// q_like = pow((qm2-0.896),2)/(2.0*q_tem1)+pow((qf2-0.774),2)/(2.0*q_tem2)+y_bsfrf*pow((qm2-q_bsfrf(1)),2)/(2.0*q_tem3)+y_bsfrf*pow((qf2-q_bsfrf(1)),2)/(2.0*q_tem3);
// q_like = pow((qm2-0.896),2)/(2.0*q_tem1)+y_bsfrf*pow((qm2-q_bsfrf(1)),2)/(2.0*q_tem3);
 if (active(qm2))
 {
   q_like = pow((qm2-0.896),2)/(2.0*q_tem1);
   f += q_like;
 }

//  cout<<"survey biomass likelihood: "<<surv_like<<endl;
//  cout<<"to obj function"<<endl;
//survey abundance
 for(k=1;k<=2;k++)
 {
   for(i=1;i<=nobs_srv1;i++)
   {
     tmpo(k,i)=sum(obs_srv1_num(k,i));
     tmpp(k,i)=sum(pred_srv1(k,yrs_srv1(i)));
   }
 }
 for(i=yrs_trawl(1);i<=endyr;i++)
 {
    bio_03(i)=pred_catch_trawl(i);
 }
 for(i=yrs_fish_discf(1);i<=endyr;i++)
 {
    bio_01(i)=pred_catch_disc(i);
    bio_02(i)=pred_catch(i)-pred_catch_ret(i);
 }
 catch_like1 = norm2(log(obs_catchdm_biom+1.0)-log(bio_02+1.0));
 catch_likef = norm2(log(obs_catchdf_biom+1.0)-log(bio_01+1.0));
 catch_like2 = norm2(log(catch_ret+1.0)-log(pred_catch_ret+1.0));
 catch_liket = norm2(log(obs_catcht_biom+1.0)-log(bio_03+1.0));

 for(i=1;i<=nobs_tc;i++)
 {
    tem_catchtcf_biom(i)=pred_catchtcf_biom(yrs_tc(i));
    tem_catchtcm_biom(i)=pred_catchtcm_biom(yrs_tc(i));
 }
 catch_like_tcf = norm2(log(obs_catchtcf_biom+1.0)-log(tem_catchtcf_biom+1.0));
 catch_like_tcm = norm2(log(obs_catchtcm_biom+1.0)-log(tem_catchtcm_biom+1.0));

// cout<<"predicted TC male biom "<<tem_catchtcm_biom<<endl;
// cout<<"Observed TC male biom "<<obs_catchtcm_biom<<endl;
// cout<<"predicted TC female biom "<<tem_catchtcf_biom<<endl;
// cout<<"Observed TC female biom "<<obs_catchtcf_biom<<endl;

//  cout<<"end of objective function"<<endl;
//  cout<<"catch disc "<<catch_disc<<endl;
//  cout<<" pred catch disc "<<pred_catch_disc<<endl;
// cout<<"predicted catch "<<pred_catch_ret<<endl;
// cout<<"obs. catch "<<catch_ret<<endl;
// cout<<"catch like: "<<catch_like2<<endl;
// exit(1);
//  y_bsfrf = 0.0;
//  if (current_phase() < survsel_phase+5) y_bsfrf = 1;
//put in mult by more than other likehs to improve fit to survey biomass
 f += bycatch_w*catch_like1;
 f += like_wght(6)*catch_like2;
 f += 0.5*bycatch_w*catch_liket;
 f += bycatch_w*catch_likef;
 f += like_wght(5)*surv_like;
 f += bycatch_w*catch_like_tcf;
 f += bycatch_w*catch_like_tcm;
 f += like_wght(5)*2.0*cpue_like;
 if (current_phase()>survsel_phase) { f += y_bsfrf*bsfrf_like; }
// if (current_phase()>4) { f += norm2(sf-1.0)/(2.0*0.1*0.1); }

//if (active(rec_dev)) cout<<" Phase 1 "<<endl;
//if(active(srv1_slope)) cout<<" Phase 2 "<<endl;
//if(active(fmort_dev)) cout<<" Phase 3 "<<endl;
//if(active(moltp_af)) cout<<" Phase 4 "<<endl;
//cout<< " likelihoods "<<endl;
//  cout<<"catch like female"<<catch_likef<<endl;
// cout<<"rec_like"<<" len_like ret"<<" len_like m dis"<<" len_like f"<<" len_like survey"<<" len_like trawl"<<" TC_like freq."<<endl;
// cout<<rec_like<<"    "<< len_like(1)<<"   "<<len_like(2)<<"   "<<len_like(3)<<"   "<<len_like(4)<< "   "<<len_like(5)<<"   "<<len_like(6)+len_like(7)<<"  "<<endl;
// cout<<" Disc-males_bio"<<" Ret-catch_bio"<<" Disc-female-bio"<<" catch_liket"<<" survey-like"<<" TC-like"<<" Total"<<endl;
// cout<<catch_like1<<"   "<<catch_like2<<"   "<<catch_likef<<"   "<<catch_liket<<"   "<<surv_like<<"   "<<catch_like_tcf+catch_like_tcm<<"   "<<f<<endl;
// cout<<" BSFRF_like"<<" q_like"<<endl;
// cout<<bsfrf_like<<"   "<<q_like<<endl;
// cout<<"phase = "<<current_phase()<<endl;

REPORT_SECTION
   obs_lmales.initialize();
   obs_mmales.initialize();
   obs_mfemales.initialize();
   legal_males.initialize();
   legal_srv_males.initialize();
   pre_mmales.initialize();
   pre_mfemales.initialize();
   for(i=1;i<=nobs_srv1;i++)
    {
      for(j=15;j<=nlenm;j++)
        {
          obs_lmales(i)+=obs_srv1_num(2,i,j);
        }
      for(j=12;j<=nlenm;j++)
        {
          obs_mmales(i)+=obs_srv1_num(2,i,j);
        }
      for(j=6;j<=nlenf;j++)
        {
          obs_mfemales(i)+=obs_srv1_num(1,i,j);
        }
    }
     for(i=styr;i<=endyr;i++)
      {
        for(j=15;j<=nlenm;j++)
        {
          legal_males(i)+=na(i,j);
          legal_srv_males(i)+=na(i,j)*sel_srv(2,i,j)*q_tem(i);
        }
        for(j=12;j<=nlenm;j++)
        {
          pre_mmales(i)+=na(i,j)*sel_srv(2,i,j)*q_tem(i);
        }
        for(j=6;j<=nlenf;j++)
        {
          pre_mfemales(i)+=na_f(i,j)*sel_srv(1,i,j)*qf_tem(i);
        }
      }
  report << "observed retained catch biomass  : seq(1968,2008)" << endl;
  report << catch_ret << endl;
  report << "predicted retained catch biomass : seq(1968,2008)" << endl;
  report << pred_catch_ret<<endl;
  report << "observed discard male catch biomass : seq(1990,2008)" << endl;
  report << obs_catchdm_biom << endl;
  report << "predicted discard male catch biomass : seq(1990,2008)" << endl;
  report << bio_02<<endl;
  report << "observed female discard mortality biomass : seq(1990,2008)" << endl;
  report << obs_catchdf_biom << endl;
  report << "predicted female discard mortality biomass  : seq(1990,2008)" << endl;
  report << bio_01<<endl;
  report << "observed trawl catch biomass  : seq(1968,2008)"<<endl;
  report << obs_catcht_biom<<endl;
  report << "predicted trawl catch biomass : seq(1968,2008)"<<endl;
  report << bio_03<<endl;
//report << " Observed survey biomass: seq(1968,2008)"<<endl;
  tem_02.initialize();
  for(i=1;i<=nobs_srv1;i++) { tem_02(yrs_srv1(i))=obs_srv1_biom(i);}
  report << tem_02<<endl;
//report << "Predicted survey biomass: seq(1968,2008)"<<endl;
  report << pred_srv1_biom<<endl;
//report << " Observed survey numbers female: seq(1968,2008)"<<endl;
  report << tmpo(1)<<endl;
//report << "Predicted survey numbers female: seq(1968,2008)"<<endl;
  report << tmpp(1)<<endl;
//report << " Observed survey numbers male: seq(1968,2008)"<<endl;
  report << tmpo(2)<<endl;
//report << "Predicted survey numbers male: seq(1968,2008)"<<endl;
  report << tmpp(2)<<endl;
//    for(i=1;i<=nobs_srv1;i++) { tem_01(i)=pred_srv1_biom(yrs_srv1(i));}
//  report << tem_01<<endl;
//report << "Observed survey mature male abundance: seq(1968,2008)"<<endl;
  tem_02.initialize();
  for(i=1;i<=nobs_srv1;i++) { tem_02(yrs_srv1(i))=obs_mmales(i);}
  report << tem_02<<endl;
//report << "Predicted survey mature male abundance : seq(1968,2008) " << endl;
  report << pre_mmales<<endl;
//report << "Observed survey mature female abundance: seq(1968,2008)"<<endl;
  tem_02.initialize();
  for(i=1;i<=nobs_srv1;i++) { tem_02(yrs_srv1(i))=obs_mfemales(i);}
  report << tem_02<<endl;
//report << "Predicted survey mature female abundance : seq(1968,2008) " << endl;
  report << pre_mfemales<<endl;
//report << "molting probs male:'67.5-162.5'"<< endl;
  report << moltp(1975)<<endl;
  report << moltp(1982)<<endl;
  report << moltp(1987)<<endl;
//report<<" length - length transition matrix Females :'67.5-162.5'"<< endl;
  report<<len_len(2)<<endl;
//report<<" length - length transition matrix Males :'67.5-162.5'"<< endl;
  report<<len_len(4)<<endl;
  report << "estimated annual total fishing mortality : seq(1968,2008)" << endl;
  report << mfexp(log_avg_fmort+fmort_dev) << endl;
  report << "estimated number of recruitments female: seq(1968,2008)" << endl;
    for(i=styr+1; i<=endyr; i++)
    {
      report << mfexp(mean_log_rec+rec_dev(1,i))/1000000.0<<" ";
    }
  report <<endl<< "estimated number of recruitments male: seq(1968,2008)" << endl;
    for(i=styr+1; i<=endyr; i++)
    {
      report << mfexp(mean_log_rec+rec_dev(2,i))/1000000.0<<" " ;
    }
  report <<endl<< "estimated proportions of recruitments by length" << endl;
  report <<rec_len(1)<<"  "<<rec_len(2)<<endl;
  report <<mfexp(log_avg_sel50)+sel50_dev<<endl;
  report << "selectivity fishery total males: '67.5-162.5'"<< endl;
  report << sel(styr) << endl;
  report <<" Proportion difference between total males and retention males: '67.5-162.5'"<< endl;
  report <<sel_ret<<endl;
  report << "selectivity discard females: '67.5-162.5'"<< endl;
  report <<sel_discf(styr)<<endl;
  report << "selectivity trawl females:'67.5-162.5'"<< endl;
  report <<sel_trawl_f(styr)<<endl;
  report << "selectivity trawl males:'67.5-162.5'"<< endl;
  report <<sel_trawl_m(styr)<<endl;
//  report << "selectivity survey females (1970-72): '67.5-162.5'"<< endl;
//  report << sel_srv1(1) << endl;
//  report << "selectivity survey males (1970-72): '67.5-162.5'"<< endl;
//  report << sel_srv1(2) << endl;
  report << "selectivity survey females (1975-81): '67.5-162.5'"<< endl;
  report << sel_srv2(1) << endl;
  report << "selectivity survey males (1975-81): '67.5-162.5'"<< endl;
  report << sel_srv2(2) << endl;
  report << "selectivity survey females (1982-12): '67.5-162.5'"<< endl;
  report << sel_srv3(1) << endl;
  report << "selectivity survey males (1982-12): '67.5-162.5'"<< endl;
  report << sel_srv3(2) << endl;
  report <<"likelihood : 'rec_like','sexr_like','change_sel_like','len_like_ret','len_like_discmale','len_like_fem','len_like_surv','len_like_trawl','catch_disc-males','catch ret', 'catch fem','catch trawl', 'surv_like','total likelihood'"<<endl;
  report <<rec_like*like_wght_rec<<"  "<<sexr_like*like_wght_sexr<<"  "<<sel_like_50m<<"  "<<len_like<<" "<<catch_like1*bycatch_w<<" "<<catch_like2*like_wght(6)<<" "<<catch_likef*bycatch_w<<" "<<catch_liket*0.5*bycatch_w<<" "<<surv_like<<" "<<f<<endl;
  report <<"survey length likelihoods: 'female','new male','old male', Bycatch from TC, BSFRF like., q like."<<endl;
  report <<len_like_srv<<" "<<(catch_like_tcf+catch_like_tcm)*bycatch_w<<" "<<bsfrf_like<<" "<<q_like<<endl;
  report << "Availability of females for BSFRF survey: '67.5-162.5'"<< endl;
  report << af_bsfrf << endl;
  report << "Availability of males for BSFRF survey: '67.5-162.5'"<< endl;
  report << am_bsfrf << endl;
  report << "selectivity of TC bycatch: females: '67.5-162.5'"<< endl;
  report << sel_tcf << endl;
  report << "selectivity of TC bycatch: males: '67.5-162.5'"<< endl;
  report << sel_tcm << endl;
  report << "Pred. discard female biomass from TC fishery: "<< endl;
  report << pred_catchtcf_biom<< endl;
  report << "Pred. discard male biomass from TC fishery: "<< endl;
  report << pred_catchtcm_biom<< endl;
 report << "Observed Length Prop survey females: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_srv1; i++)
    {
        report << yrs_srv1(i) <<" " <<obs_p_srv1_len_f(i) << endl;
    }
  report << "Predicted length prop survey females: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_srv1; i++)
    {
        ii=yrs_srv1(i);
        report << ii << " " << pred_p_srv1_len_f(ii) << endl;
    }
  report << "Observed Length Prop survey males: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_srv1; i++)
    {
        report << yrs_srv1(i) <<" " <<obs_p_srv1_len_m(1,i) << endl;
    }
  report << "Predicted length prop survey males: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_srv1; i++)
    {
        ii=yrs_srv1(i);
        report << ii << " " << pred_p_srv1_len_m(1,ii) << endl;
    }
// report << "Observed Length Prop survey old males: 'year','67.5-162.5'" << endl;
//    for (i=1; i<=nobs_srv1; i++)
//    {
//       report << yrs_srv1(i) <<" " <<obs_p_srv1_len_m(2,i) << endl;
//    }
// report << "Predicted length prop survey old males: 'year','67.5-162.5'" << endl;
//    for (i=1; i<=nobs_srv1; i++)
//    {
//      ii=yrs_srv1(i);
//      report << ii << " " << pred_p_srv1_len_m(2,ii) << endl;
//    }
  report << "Observed Prop fishery ret males:'year','67.5-162.5'"<< endl;
      for (i=1; i<=nobs_fish; i++)
        {
          report << yrs_fish(i) << " " << obs_p_fish_ret(i) << endl;
        }
    report << "Predicted length prop fishery ret males : 'year','67.5-162.5'" << endl;
       for (i=1; i<=nobs_fish; i++)
        {
          ii=yrs_fish(i);
          report <<  ii  <<  " "  <<  pred_p_fish_fit(ii)  << endl;
        }
  report << "Observed Prop fishery discard males:'year','67.5-162.5'"<< endl;
      for (i=1; i<=nobs_fish_discm; i++)
        {
          report << yrs_fish_discm(i) << " " << obs_p_fish_discm(i) << endl;
        }
    report << "Predicted length prop fishery discard males : 'year','67.5-162.5'" << endl;
       for (i=1; i<=nobs_fish_discm; i++)
        {
          ii=yrs_fish_discm(i);
          report <<  ii  <<  " "  <<  pred_p_fish_discm(ii)  << endl;
        }
    report << "Observed length prop fishery discard all females : 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_fish_discf; i++)
    {
      report <<  yrs_fish_discf(i) <<  " "  <<  obs_p_fish_discf(i)  << endl;
    }
    report << "Predicted length prop fishery discard all females : 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_fish_discf; i++)
    {
      ii=yrs_fish_discf(i);
      report <<  ii  <<  " "  <<  pred_p_fish_discf(ii)  << endl;
    }
 report << "Observed Length Prop trawl bycatch females: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_trawl; i++)
    {
       report << yrs_trawl(i) <<" " <<obs_p_trawl(1,i) << endl;
    }
 report << "Predicted length prop trawl bycatch females: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_trawl; i++)
    {
      ii=yrs_trawl(i);
      report << ii << " " << pred_p_trawl(1,ii) << endl;
    }
 report << "Observed Length Prop trawl bycatch males: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_trawl; i++)
    {
       report << yrs_trawl(i) <<" " <<obs_p_trawl(2,i) << endl;
    }
 report << "Predicted length prop trawl bycatch males: 'year','67.5-162.5'" << endl;
    for (i=1; i<=nobs_trawl; i++)
    {
      ii=yrs_trawl(i);
      report << ii << " " << pred_p_trawl(2,ii) << endl;
    }
  report<<"Residuals of survey female length frequency"<<endl;
  for (i=1; i<=nobs_srv1; i++)
    {
      ii=yrs_srv1(i);
      report << ii << " " << like_srv1_f(ii) << endl;
    }
  report<<"Residuals of survey male length frequency"<<endl;
  for (i=1; i<=nobs_srv1; i++)
    {
      ii=yrs_srv1(i);
      report << ii << " " << like_srv1_m(1,ii) << endl;
    }
//  report<<"Residuals of survey oldshell male length frequency"<<endl;
//  for (i=1; i<=nobs_srv1; i++)
//    {
//      ii=yrs_srv1(i);
//      report << ii << " " << like_srv1_m(2,ii) << endl;
//    }
 report << "Estimated numbers of female crab by length: 'year','67.5-162.5'"<< endl;
     for(i=styr;i<=endyr;i++)
      {
       report << i<<" "<<na_f(i) << endl;
      }
 report << "Estimated numbers of new shell male crab by length: 'year','67.5-162.5'"<< endl;
     for(i=styr;i<=endyr;i++)
      {
        report << i<<" "<<na_m(1,i) << endl;
      }
 report << "Estimated numbers of old shell male crab by length: 'year','67.5-162.5'"<< endl;
     for(i=styr;i<=endyr;i++)
      {
        report << i<<" "<<na_m(2,i) << endl;
      }
  report << "Observed Survey Numbers by length females:  '67.5-162.5'"<< endl;
    for(i=1;i<=nobs_srv1;i++) { report<<yrs_srv1(i)<<" "<<obs_srv1_num(1,i) <<endl;}
  report << "Observed Survey Numbers by length males:  '67.5-162.5'"<< endl;
    for(i=1;i<=nobs_srv1;i++) { report<<yrs_srv1(i)<<" "<<obs_srv1_num(2,i) <<endl;}
  report << "Predicted Survey Numbers by length females: '67.5-162.5'"<< endl;
    for(i=1;i<=nobs_srv1;i++) { report<<yrs_srv1(i)<<" "<<pred_srv1(1,yrs_srv1(i)) <<endl;}
  report << "Predicted Survey Numbers by length males:  '67.5-162.5'"<< endl;
    for(i=1;i<=nobs_srv1;i++) { report<<yrs_srv1(i)<<" "<<pred_srv1(2,yrs_srv1(i)) <<endl;}
  report<<" observed number of legal males: seq(1968,2008)"<<endl;
  report<<yrs_srv1<<endl;
  report<<obs_lmales<<endl;
    for(i=1;i<=nobs_srv1;i++) { tem_01(i)=legal_srv_males(yrs_srv1(i));}
  report<<" Estimated survey numbers of legal males : seq(1968,2008) "<<endl;
  report<<tem_01<<endl;
  report<<" Pop estimate umnbers of legal males: seq(1968,2008)"<<endl;
  report<<legal_males<<endl;
  report << "Predicted Biomass : seq(1985,2004)" << endl;
  report << pred_bio << endl;
  report << "Predicted total population numbers: seq(1968,2008) "<<endl;
  report <<popn<<endl;
  report << "Predicted fishery total males:'year','67.5-162.5'"<< endl;
      for (i=1; i<=nobs_fish_discm; i++)
        {
          ii=yrs_fish_discm(i);
          report << yrs_fish_discm(i) << " " << pred_p_fish(ii) << endl;
        }
  report << "selectivity fishery total males: '67.5-162.5'"<< endl;
  report << sel << endl;
  report << "selectivity fishery ret males: '67.5-162.5'"<< endl;
  report << sel_fit << endl;
  report <<"likelihood weights: 'retained length','total catch length','female catch','survey length','survey biomass','catch biomass','trawl length'"<<endl;
  report <<like_wght<<endl;
  report <<"likelihood weights:  'rec devs','sex ratio','fishery 50%','fmort phase 1','fmort phase>1','fmort devs'"<<endl;
  report <<like_wght_rec<<"  "<<like_wght_sexr<<"  "<<like_wght_sel50<<endl;
  report<<"male total pot fishery exploitation rates"<<endl;
  report<<1-mfexp(-1.0*F)<<endl;
  report<<"numbers females at time of pop fishery"<<endl;
  report<<na_fishtime(1)<<endl;
  report<<"numbers males at time of pop fishery"<<endl;
  report<<na_fishtime(2)<<endl;
  report<<"total catch in numbers males"<<endl;
  report<<catch_lmale<<endl;
  report<<"retained catch in numbers males"<<endl;
  report<<catch_male_ret<<endl;
  report << "predicted discarded male biomass : seq(1968,2008)" << endl;
  report << pred_catch - pred_catch_ret<<endl;
  report << "predicted discarded female biomass : seq(1968,2008)" << endl;
  report << pred_catch_disc<<endl;
  report << "predicted trawl discarded biomass : seq(1968,2008)" << endl;
  report << pred_catch_trawl<<endl;
  report << "Male fishing mortality" << endl;
  report << fmort<<endl;
  report << "Discarded female fishing mortality" << endl;
  report << fmortdf<<endl;
  report << "Trawl fishing mortality" << endl;
  report << fmortt<<endl;
  report << "Discarded male fishing mortality" << endl;
  report << fmortdm<<endl;
  report << "Discarded male catch" << endl;
  report << catch_m/m_disc<<endl;
  report << "Retained catch" << endl;
  report << catch_r<<endl;
  report << "Natural mortality for males: " << endl;
  report << M << endl;
  report << "mbi0215 " <<mbio215<<endl;
  report << "mbio2151 " <<mbio2151<<endl;
  report << "mbio2512 " <<mbio2152<<endl;
//  report << "selectivity survey females (1968-69): '67.5-162.5'"<< endl;
//  report << sel_srv0(1) << endl;
//  report << "selectivity survey males (1968-69): '67.5-162.5'"<< endl;
//  report << sel_srv0(2) << endl;
  report << "Obs. discard female biomass from TC fishery: "<< endl;
  report << obs_catchtcf_biom<< endl;
  report << "Obs. discard male biomass from TC fishery: "<< endl;
  report << obs_catchtcm_biom<< endl;
  report << Ftcf<< endl;
  report << Ftcm<< endl;
  report << "Pred. discard female length frequency from TC fishery: "<< endl;
  report << pred_p_tc_len_f<< endl;
  report << "Obs. discard female length frequency from TC fishery: "<< endl;
  report << obs_p_tc_len_f<< endl;
  report << "Pred. discard male length frequency from TC fishery: "<< endl;
  report << pred_p_tc_len_m<< endl;
  report << "Obs. discard male length frequency from TC fishery: "<< endl;
  report << obs_p_tc_len_m<< endl;
  report << s_srv<< endl;
  report << s_fish<< endl;
  report << s_fish_discf<< endl;
  report << s_fish_discm<< endl;
  report << s_trawl<< endl;
  report << s_tc<< endl;
  report << size_srv<< endl;
  report << size_fish_ret<< endl;
  report << size_fish_discf<< endl;
  report << size_fish_discm<< endl;




RUNTIME_SECTION
//one number for each phase, if more phases then uses the last number
  maximum_function_evaluations 300,1000,1000,1000,3000,3000,3000
//  convergence_criteria 1,1,1,1,1e-3,1e-3,1e-3,1e-3
    convergence_criteria 1,1,1,1,0.0001 0.000001 0.000001 0.000001 1e-5,1e-5,1e-5,1e-5
TOP_OF_MAIN_SECTION
  arrmblsize = 1000000;
