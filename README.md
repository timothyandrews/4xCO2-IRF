# 4xCO2-IRF

This repository calculates the TOA and surface radiative fluxes from the HadGEM3-GC3.1-LL amip r5i1p1f3 simulation, both for the advancing call to radiation, and the double (non-advancing) call with 4xCO2.  The difference between these fluxes gives the 4xCO2 instantaneous radiative forcing (IRF).

**Note: These are not our official CMIP6 numbers since the diagnostics have not yet gone through internal scientific review.**

Tim Andrews and Alejandro Bodas-Salecdo.

Met Office Hadley Centre.

November 2019.

## Data description

The simulation runs from Jan 1879 through to Dec 2014, i.e. 36 complete years (432 months).  The time coordinate is months since Jan 1979.

The variable names follow CMIP6 diagnostics:

| name | Description |
| ---- | ----------- |
| rsdt | TOA downwelling solar |
| rsut | TOA upwelling solar |
| rsutcs | TOA upwelling solar clear-sky |
| rsus | SRF upwelling solar |
| rsuscs | SRF upwelling solar clear-sky |
| rsds | SRF downwelling solar |
| rsdscs | SRF downwelling solar clear-sky |
| rlut | TOA upwelling LW |
| rlutcs | TOA upwelling LW clear-sky |
| rlus | SRF upwelling LW |
| rlds | SRF downwelling LW |
| rldscs | SRF downwelling LW |

The 4xCO2 calls to radiation follow the same names with "4co2" appended, except rsdt is not included since that is identical between both calls.

The difference between the 4co2 and standard fluxes give the 4xCO2 IRF.


## Data files

The data files have been produced using `idl_create_fluxes.pro`.

| Filename | Description |
| -------- | ----------- |
| `HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_FLUXES.csv` | Monthly global mean fluxes from amip run |
| `HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_4xCO2_FLUXES.csv` | Monthly global mean fluxes from 4xCO2 call |
| `HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_4xCO2_IRF_TOA_MONTHLY.csv` | Monthly global mean TOA 4xCO2 IRF (+ve down) |
| `HadGEM3-GC31-LL_amip_r5i1p1f3_gn_197901-201412_4xCO2_IRF_TOA_TIMEMEAN.csv` | Timemean TOA 4xCO2 IRF (+ve down) |


## 4xCO2 TOA IRF

The 4xCO2 time-mean TOA global-mean IRF (in Wm-2) are summarised to be:

| NET | LW | LWcs | LWcre | SW | SWcs | SWcre |
| --- | -- | ---- | ----- | -- | ---- | ----- |
| 4.35 | 4.00 | 5.23 | -1.23 | 0.35 | 0.22 | 0.13 |
