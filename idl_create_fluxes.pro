PRO idl_create_fluxes
 
 ;define directories where flux data is located, note 4x is for the second call diagnostics with 4xCO2
 dir1x='/project/champ/data/CMIP6/CMIP/MOHC/HadGEM3-GC31-LL/amip/r5i1p1f3/Amon/'
 dir4x='/net/spice/scratch/hadac/amip-cfmip3/nc/u-bh859/'

 ; Load in the first (1xCO2) call fluxes and calculate global-mean
 rsdt=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rsdt/gn/v20191001/rsdt_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsut=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rsut/gn/v20191001/rsut_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsutcs=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rsutcs/gn/v20191001/rsutcs_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsus=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rsus/gn/v20191001/rsus_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsuscs=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rsuscs/gn/v20191001/rsuscs_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsds=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rsds/gn/v20191001/rsds_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsdscs=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rsdscs/gn/v20191001/rsdscs_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rlut=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rlut/gn/v20191001/rlut_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rlutcs=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rlutcs/gn/v20191001/rlutcs_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rlus=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rlus/gn/v20191001/rlus_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rlds=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rlds/gn/v20191001/rlds_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rldscs=PP_AREA_AVG(PPA(NCASSOC(dir1x+'rldscs/gn/v20191001/rldscs_Amon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)

 ; write the 1x fluxes to a csv file
 t=INDGEN(432)  ; time,t, equals months since Jan 1979.
 headers=['month','rsdt','rsut','rsutcs','rsus','rsuscs','rsds','rsdscs','rlut','rlutcs','rlus','rlds','rldscs,']
 data_to_write=TRANSPOSE([[t],[rsdt],[rsut],[rsutcs],[rsus],[rsuscs],[rsds],[rsdscs],[rlut],[rlutcs],[rlus],[rlds],[rldscs]])
 WRITE_CSV_DATA,data_to_write,headers,filename='HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_FLUXES.csv'

 ; Load in the second (4xCO2) call fluxes and calculate global-mean
 rsut4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rsut4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsutcs4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rsutcs4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rsus4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rsu4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),SS(lblev=1),/ALL),/BOX)
 rsuscs4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rsucs4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),SS(lblev=1),/ALL),/BOX)
 rsds4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rsd4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),SS(lblev=1),/ALL),/BOX)
 rsdscs4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rsdcs4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),SS(lblev=1),/ALL),/BOX)
 rlut4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rlut4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rlutcs4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rlutcs4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),/ALL),/BOX)
 rlus4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rlu4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),SS(lblev=1),/ALL),/BOX)
 rlds4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rld4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),SS(lblev=1),/ALL),/BOX)
 rldscs4co2=PP_AREA_AVG(PPA(NCASSOC(dir4x+'rldcs4co2_CFmon_HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412.nc',/IGNORE),SS(lblev=1),/ALL),/BOX)

 ; write the 4x fluxes to a csv file
 t=INDGEN(432)  ; time,t, equals months since Jan 1979.
 headers=['month','rsut4co2','rsutcs4co2','rsus4co2','rsuscs4co2','rsds4co2','rsdscs4co2','rlut4co2','rlutcs4co2','rlus4co2','rlds4co2','rldscs4co2,']
 data_to_write=TRANSPOSE([[t],[rsut4co2],[rsutcs4co2],[rsus4co2],[rsuscs4co2],[rsds4co2],[rsdscs4co2],[rlut4co2],[rlutcs4co2],[rlus4co2],[rlds4co2],[rldscs4co2]])
 WRITE_CSV_DATA,data_to_write,headers,filename='HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_4xCO2_FLUXES.csv'

 ; Create monthly TOA 4xCO2 instantaneous RF, all fluxes +ve down.
 irf4co2_toa_NET=(rsdt-rsut4co2-rlut4co2)-(rsdt-rsut-rlut)
 irf4co2_toa_LW=-1*(rlut4co2-rlut)
 irf4co2_toa_LWcs=-1*(rlutcs4co2-rlutcs)
 irf4co2_toa_LWcre=irf4co2_toa_LW-irf4co2_toa_LWcs
 irf4co2_toa_SW=(rsdt-rsut4co2)-(rsdt-rsut)
 irf4co2_toa_SWcs=(rsdt-rsutcs4co2)-(rsdt-rsutcs)
 irf4co2_toa_SWcre=irf4co2_toa_SW-irf4co2_toa_SWcs

 ; write the TOA monthly 4xCO2 IRF to a csv file
 t=INDGEN(432)  ; time,t, equals months since Jan 1979.
 headers=['month','NET_4xCO2_IRF_TOA','LW_4xCO2_IRF_TOA','LWcs_4xCO2_IRF_TOA','LWcre_4xCO2_IRF_TOA','SW_4xCO2_IRF_TOA','SWcs_4xCO2_IRF_TOA','SWcre_4xCO2_IRF_TOA,']
 data_to_write=TRANSPOSE([[t],[irf4co2_toa_NET],[irf4co2_toa_LW],[irf4co2_toa_LWcs],[irf4co2_toa_LWcre],[irf4co2_toa_SW],[irf4co2_toa_SWcs],[irf4co2_toa_SWcre]])
 WRITE_CSV_DATA,data_to_write,headers,filename='HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_4xCO2_IRF_TOA_MONTHLY.csv'

 ; Create time-mean TOA 4xCO2 instantaneous RF, all fluxes +ve down.
 irf4co2_toa_mean_NET=MEAN(irf4co2_toa_NET)
 irf4co2_toa_mean_LW=MEAN(irf4co2_toa_LW)
 irf4co2_toa_mean_LWcs=MEAN(irf4co2_toa_LWcs)
 irf4co2_toa_mean_LWcre=MEAN(irf4co2_toa_LWcre)
 irf4co2_toa_mean_SW=MEAN(irf4co2_toa_SW)
 irf4co2_toa_mean_SWcs=MEAN(irf4co2_toa_SWcs)
 irf4co2_toa_mean_SWcre=MEAN(irf4co2_toa_SWcre)

 ; write the TOA time-mean 4xCO2 IRF to a csv file
 headers=['NET_4xCO2_IRF_TOA','LW_4xCO2_IRF_TOA','LWcs_4xCO2_IRF_TOA','LWcre_4xCO2_IRF_TOA','SW_4xCO2_IRF_TOA','SWcs_4xCO2_IRF_TOA','SWcre_4xCO2_IRF_TOA,']
 data_to_write=TRANSPOSE([[irf4co2_toa_mean_NET],[irf4co2_toa_mean_LW],[irf4co2_toa_mean_LWcs],[irf4co2_toa_mean_LWcre],[irf4co2_toa_mean_SW],[irf4co2_toa_mean_SWcs],[irf4co2_toa_mean_SWcre]])
 WRITE_CSV_DATA,data_to_write,headers,filename='HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_4xCO2_IRF_TOA_TIMEMEAN.csv'

 STOP

END
