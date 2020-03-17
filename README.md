# COVD-19
Data analysis of 2019 novel coronavirus COVD-19 outbreak in Wuhan, China

## The logic of this study
For those who don't have the time to read through the entire paper and figure out what is going on by themselves, here is a shorter version of the logic.

![logic](https://hvoltbb.github.io/pics/logic.png)

Wuhan is a huge city with tremendous traffic both domestically and internationally, and thus, difficult, if not impossible, to assess how many are infected there. What makes the problem more difficult is that the number of infected is __dynamical__, aka changing with time. In this case, the international traffic offers, in some sense, samples from this population. __These samples give us snapshot views of the dynamics in Wuhan__ and can help us understand the dynamics of the process.  Note that the disease is also dynamic once exported. As a result, we need to exclude secondary infections, aka human-to-human transmissions from the index patient once exported. Hence, for this analysis, a recent travel history from Wuhan is required for those exported cases. Secondary cases are nevertheless valid cases, but they wouldn't contribute to the analysis in this study for the same reason we are not using the confirmed cases in Wuhan: it is highly likely that those are underestimates because of the difficulties mentioned above.  

## Data and code
Three datasets are included here.
1. The international exported cases based on [Wu(2020)](https://doi.org/10.1016/S0140-6736(20)30260-9) with updated dates when the patient left Wuhan. Cases that are due to human-to-human infection after exportation are exluded.
2. The evacuee dataset. Evacuated individuals from Jan. 29 to Feb. 2, 2020 are included in the analysis. These individuals provide snapshot views of the infection status in Wuhan.
3. The real time daily heat index into/out of Wuhan during chunyun based on Baidu Migration (Baidu Tianyan in Chinese). The converstion factor was found to be 138,412.0099 based on OTG calibrated historical Tencent mobility data.

These datasets can be found in the [Data](https://github.com/HVoltBb/2019nCov/blob/master/data/) subfolder. There are additional planed evacuations in the near future. The infection status of these individuals will provide more information on the current status of the outbreak and the efficiency of the mitigation in place.

Datesets #1 and #2 will be updated when new information becomes available.

**This is a work in progress as more and more info is flowing in, and the dynamics are changing as China implements more mitigation measures to fight the disease. Updates and corrections from you are welcome.** 

For those with a sensored connection, the datasets are also made available through figshare with links listed below:
1. [Exported cases](https://doi.org/10.6084/m9.figshare.11859198.v1)
2. [Evacuee dataset](https://doi.org/10.6084/m9.figshare.11859207.v1)
3. [Real time traffic](https://doi.org/10.6084/m9.figshare.11859210.v1)

The versions on figshare will be updated sporadically following the versions here. For those who can view this text, you can forget about figshare and just use the files in the [Data](https://github.com/HVoltBb/2019nCov/blob/master/data/) subfolder. 

You are also welcome to suggest other data sources to aid the analysis.

The code is available [here](https://github.com/HVoltBb/2019nCov/blob/master/src/).

A preprint is available here \[[Link](https://www.medrxiv.org/content/10.1101/2020.02.15.20023440v2)\]. Currently, this study is not under review anywhere, because I am more interested in my own safety as this epidemic has spread to the state of Texas, where I am at right now. To cite this study, please use:


Evaluating new evidence in the early dynamics of the novel coronavirus COVID-19 outbreak in Wuhan, China with real time domestic traffic and potential asymptomatic transmissions. Can Zhou. medRxiv 2020.02.15.20023440; doi: https://doi.org/10.1101/2020.02.15.20023440
