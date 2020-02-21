library(deSolve)

flow = read.csv('RealtimeTraffic.csv', as.is=TRUE)
wc=which(flow$direction==1)
cw=which(flow$direction==0)
fctr = (9*487310 + 40*810500 + 9*502013 + 40*717226)/sum(flow[,4]) # 138412.0099 individual

wFlow = function(t){
  fctr = 138412.01
  if(t<31){
    Lwc=502013
    Lcw=487310
  }else if(t<=32){
    Lwc = fctr*flow[wc,3][1]
    Lcw = fctr*flow[cw,3][1]
  }else if(t<=33){
    Lwc = fctr*flow[wc,3][2]
    Lcw = fctr*flow[cw,3][2]
  }else if(t<=34){
    Lwc = fctr*flow[wc,3][3]
    Lcw = fctr*flow[cw,3][3]
  }else if(t<=35){
    Lwc = fctr*flow[wc,3][4]
    Lcw = fctr*flow[cw,3][4]
  }else if(t<=36){
    Lwc = fctr*flow[wc,3][5]
    Lcw = fctr*flow[cw,3][5]
  }else if(t<=37){
    Lwc = fctr*flow[wc,3][6]
    Lcw = fctr*flow[cw,3][6]
  }else if(t<=38){
    Lwc = fctr*flow[wc,3][7]
    Lcw = fctr*flow[cw,3][7]
  }else if(t<=39){
    Lwc = fctr*flow[wc,3][8]
    Lcw = fctr*flow[cw,3][8]
  }else if(t<=40){
    Lwc = fctr*flow[wc,3][9]
    Lcw = fctr*flow[cw,3][9]
  }else if(t<=41){
    Lwc = fctr*flow[wc,3][10]
    Lcw = fctr*flow[cw,3][10]
  }else if(t<=42){
    Lwc = fctr*flow[wc,3][11]
    Lcw = fctr*flow[cw,3][11]
  }else if(t<=43){
    Lwc = fctr*flow[wc,3][12]
    Lcw = fctr*flow[cw,3][12]
  }else if(t<=44){
    Lwc = fctr*flow[wc,3][13]
    Lcw = fctr*flow[cw,3][13]
  }else if(t<=45){
    Lwc = fctr*flow[wc,3][14]
    Lcw = fctr*flow[cw,3][14]
  }else if(t<=46){
    Lwc = fctr*flow[wc,3][15]
    Lcw = fctr*flow[cw,3][15]
  }else if(t<=47){
    Lwc = fctr*flow[wc,3][16]
    Lcw = fctr*flow[cw,3][16]
  }else if(t<=48){
    Lwc = fctr*flow[wc,3][17]
    Lcw = fctr*flow[cw,3][17]
  }else if(t<=49){
    Lwc = fctr*flow[wc,3][18]
    Lcw = fctr*flow[cw,3][18]
  }else if(t<=50){
    Lwc = fctr*flow[wc,3][19]
    Lcw = fctr*flow[cw,3][19]
  }else if(t<=51){
    Lwc = fctr*flow[wc,3][20]
    Lcw = fctr*flow[cw,3][20]
  }else if(t<=52){
    Lwc = fctr*flow[wc,3][21]
    Lcw = fctr*flow[cw,3][21]
  }else if(t<=53){
    Lwc = fctr*flow[wc,3][22]
    Lcw = fctr*flow[cw,3][22]
  }else if(t<=54){
    Lwc = fctr*flow[wc,3][23]
    Lcw = fctr*flow[cw,3][23]
  }else if(t<=55){
    Lwc = fctr*flow[wc,3][24]
    Lcw = fctr*flow[cw,3][24]
  }else if(t<=56){
    Lwc = fctr*flow[wc,3][25]
    Lcw = fctr*flow[cw,3][25]
  }else if(t<=57){
    Lwc = fctr*flow[wc,3][26]
    Lcw = fctr*flow[cw,3][26]
  }else if(t<=58){
    Lwc = fctr*flow[wc,3][27]
    Lcw = fctr*flow[cw,3][27]
  }else{
    Lwc = 0
    Lcw = 0
  }
  return(list(Lwc = Lwc, Lcw = Lcw))
}

rhs_m3 = function(t, states, params){
  if(t<=31){
    z=43*2
  }else{
    z=0
  }
  Lwi = 3633
  Liw = 3546
  
  tmp = wFlow(t)
  Lwc = tmp$Lwc
  Lcw = tmp$Lcw
  
  if(t>=54){
    Lwi=Lwi*(1-1/(1+exp(54.5-t)))
    Liw=Liw*(1-1/(1+exp(54.5-t)))
  }
  
  Ds = 8.4
  De = 3*multplr
  Dei = 3 - De
  Di = Ds - 3
  
  with(as.list(c(states, params)), {
    N = S + E + EI + I + R
    dS = -S/N*(R0/Di*(EI+I) + z) + Liw +Lcw - (Lwi + Lwc)*S/N
    dE = S/N*(R0/Di*(EI+I) + z) - E/De - (Lwi + Lwc)*E/N
    dEI = E/De - EI/Dei - (Lwi + Lwc)*EI/N
    dI = EI/Dei - I/Di - (Lwi + Lwc)*I/N
    dR = I/Di
    dlam = Lwi/N*(E+EI+I)
    list(c(dS, dE, dEI, dI, dR, dlam, dcumI=E/De - (Lwi/N + Lwc/N)*EI, dcumE=Lwc/N*(E+EI+I)))
  })
}

rhs_bs = function(t, states, params){
  if(t<=31){
    z=43*2
  }else{
    z=0
  }
  Lwi = 3633
  Liw = 3546
  
  tmp = wFlow(t)
  Lwc = tmp$Lwc
  Lcw = tmp$Lcw
  
  if(t>=54){
    Lwi=Lwi*(1-1/(1+exp(54.5-t)))
    Liw=Liw*(1-1/(1+exp(54.5-t)))
  }
  
  Ds = 8.4
  De = 3
  Di = Ds - De
  
  with(as.list(c(states, params)), {
    N = S + E + I + R
    dS = -S/N*(R0/Di*I + z) + Liw +Lcw - (Lwi + Lwc)*S/N
    dE = S/N*(R0/Di*I + z) - E/De - (Lwi + Lwc)*E/N
    #    dEI = E/De - EI/Dei - (Lwi/N + Lwc/N)*EI
    dI = E/De - I/Di - (Lwi + Lwc)*I/N
    dR = I/Di
    dlam = Lwi/N*(E+I)
    list(c(dS, dE, 0, dI, dR, dlam, dcumI=E/De - (Lwi/N + Lwc/N)*I, dcumE=Lwc/N*(E+I)))
  })
}

JoWu = read.csv('CaseExp.csv', as.is = TRUE)

dec1 = as.Date('2019-12-01')

exportDate= rep(dec1,dim(JoWu)[1])
for(i in 1:dim(JoWu)[1]){
  if(JoWu[i,4] != ""){
    exportDate[i] = as.Date(JoWu[i, 4], format = "%m/%d/%y")
  }else if (JoWu[i,2] != ""){
    exportDate[i] = as.Date(JoWu[i,2], format = "%m/%d/%y")
    cat('s;\t')
  }else{
    exportDate[i] = as.Date(JoWu[i,3], format = "%m/%d/%y")
    cat('c;\t')
  }
}
exportDateRel = exportDate - dec1
xd = table(exportDateRel)
days = as.numeric(names(xd))

evac = read.csv(file = 'Evacuee.csv')
indx = which(!is.na(evac$Infected))
dates = as.Date(paste0(evac$Date, '/2020'), format = '%m/%d/%Y')
datesRel = as.numeric(dates - dec1)

## Bootstrap sample
states = c(S = 14e6, E=0, EI=0, I=0, R=0, cum=0, cum = 0, cum = 0)
dat= read.csv('postr0b.csv', header=FALSE)
num = 100
indks = sample(1:dim(dat)[1], size = num, replace = FALSE)
m_p = matrix(0, nrow = length(days), ncol = num)
m_b = matrix(0, nrow = length(indx), ncol = num)

for(i in 1:num){
  params = c(R0=dat[indks[i],1], a1=1, a2=1)
  out = deSolve::ode(y=states, times=0:68, func=rhs_bs, parms = params, method='lsoda')
  lam = out[days,7] - out[days-1,7]
  p = out[datesRel[indx],3]/sum(out[datesRel[indx], c(2:4, 6)])
  
  m_p[,i] = rpois(n = length(lam), lambda = lam)
  m_b[,i] = rbinom(n = length(indx), size = evac[indx,3], prob = p)
}

write.csv(file = 'simP.csv', x= t(m_p))
write.csv(file = 'simB.csv', x= t(m_b))

## WAIC calc
simWAIC = matrix(0, 100, 2)

dat2 = read.csv('simR0.csv', header = FALSE)
dat2m= read.csv('simM.csv', header=FALSE)
dat = read.csv('simR0bb.csv', header=FALSE)

m = dat2m
r0= dat
ll = matrix(0, 33, num)

for(j in 1:dim(dat2m)[1]){
  params = c(R0=mean(unlist(r0[j,])), a1=1, a2=1)
  multplr = mean(unlist(dat2m[j,]))
  out = ode(y=states, times=0:68, func=rhs_bs, parms = params, method='lsoda')
  lam = out[days,7] - out[days-1,7]
  p = (out[datesRel[indx],3] + out[datesRel[indx],4])/sum(out[datesRel[indx], c(2:4,6)])
  llmean=sum(dpois(x = m_p[,j], lambda = lam, log = TRUE)) + sum(dbinom(m_b[,j], evac[indx,3], p, TRUE))
  
  for(i in 1:num){
    multplr = m[j,i]
    params = c(R0=r0[j,i], a1=1, a2=1)
    out = ode(y=states, times=0:68, func=rhs_bs, parms = params, method='lsoda')
    lam = out[days,7] - out[days-1,7]
    p = (out[datesRel[indx],3] + out[datesRel[indx],4])/sum(out[datesRel[indx], c(2:4,6)])
    ll[,i] = c(dpois(x = m_p[,j], lambda = lam, log = TRUE), dbinom(m_b[,j], evac[indx,3], p, TRUE))
  }
  simWAIC[j,2] = -2*llmean + 2*sum(apply(ll, 1, var))
  cat(j,'>')
}