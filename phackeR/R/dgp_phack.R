#COMMENT: all scripts should generally start off with a comment describing the purpose, author(s), and any additional notes regarding structure/libraries
#In this situation, the purpose of this script is to create a data generating function to draw data to create sample simulations for our p-hacking program

#libraries 
library(parallel)

#COMMENT: explain functions created, such as the one below. We are creating a function to identify records that are "not in" type
`%notin%` <- Negate(`%in%`)
#COMMENT:Comments should be added in-line where possible to explain what the function seeks to do 
dgp <- function(n = 40, n2 = NULL, rho = .5, n.dependent = 1, type = NULL){
#what is the purpose of all the different parameters? There should be a description of the different parameters commented beside them
 #what is "A-D"??
  if('B' %in% type & is.null(n2)){n2 <- floor(n*.4)}
  Rho <- diag(nrow = n.dependent, ncol = n.dependent)
  Rho[lower.tri(Rho)] <- rho
  Rho[upper.tri(Rho)] <- rho
  sigmas <- rep(1, n.dependent)
  Sigma <- diag(sigmas) %*% Rho %*% diag(sigmas)
  Y <- MASS::mvrnorm(n = n, mu = rep(0, n.dependent), Sigma = Sigma, empirical = T)
  z <- rbinom(n, 1, .5)
  if('D' %in% type){z <- sample(c(-1, 0, 1), n, replace = T)}
  g <- rbinom(n, 1, .5)
  
  if(is.null(type)){
    coef(summary(lm(Y[, 1] ~ z)))[2, 4]
  }
  
  ps <-
    lapply(1:n.dependent, function(i) {
      fit <- coef(summary(lm(Y[, i] ~ z)))
      return(fit[which(str_detect(rownames(fit), 'z')), 4])
    })
  
  if ('D' %in% type & 'C' %notin% type) {
    ps_d <- list(
      lapply(1:n.dependent, function(i) {
        fit <- coef(summary(lm(Y[, i] ~ as.factor(z), subset = z != -1)))
        return(fit[which(str_detect(rownames(fit), 'z')), 4])
        
      }),
      lapply(1:n.dependent, function(i) {
        fit <- coef(summary(lm(Y[, i] ~ as.factor(z), subset = z != 0)))
        return(fit[which(str_detect(rownames(fit), 'z')), 4])
      }),
      lapply(1:n.dependent, function(i) {
        fit <-  coef(summary(lm(Y[, i] ~ as.factor(z), subset = z != 1)))
        return(fit[which(str_detect(rownames(fit), 'z')), 4])
      })
    )
    
    ps <- c(ps, ps_d)
  }

  
  if ('C' %in% type) {
    #COMMENt: what are the purposes of the 4 different "test 1" types? it is difficult to understand how the four different test types fall into place with this function
    test1 <-
      lapply(1:n.dependent, function(i) {
        fit <- coef(summary(lm(Y[, i] ~ g * z)))
        return(fit[which(str_detect(rownames(fit), 'z')), 4])
      })
    
    if ('D' %in% type) {
      test1.2 <-
        lapply(1:n.dependent, function(i) {
          fit <- coef(summary(lm(Y[, i] ~ g * as.factor(z), subset = z != -1)))
          return(fit[which(str_detect(rownames(fit), 'z')), 4])
        })
      
      test1.3 <-
        lapply(1:n.dependent, function(i) {
          fit <- coef(summary(lm(Y[, i] ~ g * as.factor(z), subset = z != 0)))
          return(fit[which(str_detect(rownames(fit), 'z')), 4])
        })
      
      test1.4 <-
        lapply(1:n.dependent, function(i) {
          fit <- coef(summary(lm(Y[, i] ~ g * as.factor(z), subset = z != 1)))
          return(fit[which(str_detect(rownames(fit), 'z')), 4])
        })
      
      test1 <- c(test1, test1.2, test1.3, test1.4)
    }
    
    test2 <-
      lapply(1:n.dependent, function(i) {
        fit <- coef(summary(lm(Y[, i] ~ z + g)))
        return(fit[which(str_detect(rownames(fit), 'z')), 4])
      })
    
    if ('D' %in% type) {
      test2.2 <-
        lapply(1:n.dependent, function(i) {
          fit <- coef(summary(lm(Y[, i] ~ as.factor(z) + g, subset = z != -1)))
          return(fit[which(str_detect(rownames(fit), 'z')), 4])
        })
      
      test2.3 <-
        lapply(1:n.dependent, function(i) {
          fit <- coef(summary(lm(Y[, i] ~ as.factor(z) + g, subset = z != 0)))
          return(fit[which(str_detect(rownames(fit), 'z')), 4])
        })
      
      test2.4 <-
        lapply(1:n.dependent, function(i) {
          fit <- coef(summary(lm(Y[, i] ~ as.factor(z) + g, subset = z != 1)))
          return(fit[which(str_detect(rownames(fit), 'z')), 4])
        })
      test2 <- c(test2, test2.2, test2.3, test2.4)
    }
    
    ps <- c(test1, test2)
  }
  
  
  if ('B' %in% type) {
    if (min(unlist(ps)) > .05) {
      Y <- #again, unclear what these variables are creating
        rbind(Y, MASS::mvrnorm(
          n = n2,
          mu = rep(0, n.dependent),
          Sigma = Sigma,
          empirical = T
        ))
      
      if ('D' %notin% type) {
        z <- c(z, rbinom(n2, 1, .5))
      } else{
        z <- c(z, sample(c(-1, 0, 1), n2, replace = T))
      }
      
      g <- c(g, rbinom(n2, 1, .5))
      
      
      ps <-
        lapply(1:n.dependent, function(i) {
          fit <- coef(summary(lm(Y[, i] ~ z)))
          return(fit[which(str_detect(rownames(fit), 'z')), 4])
        })
      
      if ('D' %in% type) {
        if ('C' %notin% type) {
          ps_d <- list(
            
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ z)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            }),
            
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ as.factor(z), subset = z != -1)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
              
            }),
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ as.factor(z), subset = z != 0)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            }),
            lapply(1:n.dependent, function(i) {
              fit <-  coef(summary(lm(Y[, i] ~ as.factor(z), subset = z != 1)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            })
          )
          
          ps <- c(ps, ps_d)
        }
      }
      
      if ('C' %in% type) {
        test1 <-
          lapply(1:n.dependent, function(i) {
            fit <- coef(summary(lm(Y[, i] ~ g * z)))
            return(fit[which(str_detect(rownames(fit), 'z')), 4])
          })
        
        if ('D' %in% type) {
          test1.2 <-
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ g * as.factor(z), subset = z != -1)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            })
          
          test1.3 <-
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ g * as.factor(z), subset = z != 0)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            })
          
          test1.4 <-
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ g * as.factor(z), subset = z != 1)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            })
          
          test1 <- c(test1, test1.2, test1.3, test1.4)
        }
        
        test2 <-
          lapply(1:n.dependent, function(i) {
            fit <- coef(summary(lm(Y[, i] ~ z + g)))
            return(fit[which(str_detect(rownames(fit), 'z')), 4])
          })
        
        if ('D' %in% type) {
          test2.2 <-
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ as.factor(z) + g, subset = z != -1)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            })
          
          test2.3 <-
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ as.factor(z) + g, subset = z != 0)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            })
          
          test2.4 <-
            lapply(1:n.dependent, function(i) {
              fit <- coef(summary(lm(Y[, i] ~ as.factor(z) + g, subset = z != 1)))
              return(fit[which(str_detect(rownames(fit), 'z')), 4])
            })
          test2 <- c(test2, test2.2, test2.3, test2.4)
        }
        
        ps <- c(test1, test2)
      }
      
    }
    
  }
  
  return(min(unlist(ps)))
}

# draw <-
#   mclapply(1:10000, function(i) {
#     dgp(type = c('D'))
#   },
#   mc.cores = detectCores())
# 
# sum(unlist(draw)<.05)
