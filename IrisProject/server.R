
library(shiny)

# Define server logic for Iris project

shinyServer(function(input,output){
    library(rpart)
    
    vars<-names(iris)
    vars<-setdiff(vars,c("Species","Sepal.Length","Sepal.Width"))
    fmla<-as.formula(paste("Species",paste(vars,collapse = "+"),sep="~"))
    modeliris<-rpart(fmla,data = iris)
    
    predspecies<-reactive({
        
        PetalLength<-input$petalLength
        PetalWidth<-input$petalWidth
        
        df<-data.frame(Petal.Length=PetalLength,Petal.Width=PetalWidth)
        classvector<-predict(modeliris,df,type="vector")
        
        
        if(classvector == 1){irisclass<-"setosa"}
        
        if(classvector == 2){irisclass<-"versicolor"}
        
        if(classvector == 3){irisclass<-"virginica"}
        
        irisclass
    })
    
    output$text1=renderText(predspecies())
    
})

