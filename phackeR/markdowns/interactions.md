### p-hacking by flexability with interactions

Imagine if participants reported their gender as part of the questionnaire in our running example. Controling for covariates is recommended in randomized studies. It is also plausible that gender could moderate the effect of music on perceived age. Researchers could test a model that includes gender as a covariate and a secound model that includes a gender by music type interaction. What would happen if we fit both of these models any reported the results with the lowest p-value? 

#### Run simulations: flexability with interactions

Using the controls you can see the results form many independently ran studies, or the results of one study at a time. p-hackeR will test a model that controls for gender and a model with a gender by music interaction and report the lowest p-value.  

Collect Data to see how likely a false positive is! Remember that without any p-hacking we would only expect a false postie 5% of the time. See how felxability around interactions increases the rate of false posties. 