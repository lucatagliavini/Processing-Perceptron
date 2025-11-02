/** ALGORITMO:
  Il Perceptrone è un concetto matematico sviluppato intorno agli anni 50,
  serve per trainare un algoritmo su dati ed eseguire previsioni sulla base
  del proprio pregresso.
  E' la base del SUPERVISED learning.

  - 0. Forniamo al Perceptrone degli INPUTS.
  - 1. Per ogni INPUT, moltiplicalo per il suo PESO.
  - 2. Somma tutti gli input pesati.
  - 3. Calcola l'OUTPUT basandosi sulla funzione di "attivazione".
  - 4. Calcoliamo l'ERRORE (Era una previsione corretta o no?)
  - 5. Sistemiamo i pesi sulla base dell'errore.
  
  - START di nuovo al punto 0.
  
  Concetto di apprendimento:
  --------------------------
  dW = ERROR * INPUT
  W(new) = W(old) + dW * LEARNING_RATE

*/
class Perceptron {
  // Inputs:
  float[] weights;
  float learning_rate;
  
  
  /** Costruttore: */
  Perceptron(int numInputs, float learning_rate) {
      // Associamo il numero di pesi pari agli inputs:
      this.weights = new float[numInputs];
      this.learning_rate = learning_rate;
      this.randomInitWeights();
  }
  
  
  // Inizializzazione dei pesi:
  void randomInitWeights() {
    // Inizializzazione a caso tra -1.0 e 1.0
    for(int i=0; i<this.weights.length; i++) {
      this.weights[i] = random(-1.0, 1.0);
    }
  }
  
  
  // Funzione di attivazione:
  float activate(float value) {
    if (value >= 0.0) return 1.0;
    else return -1.0;
  }
  
  
  // La funzione di output:
  float getPrevision(float[] inputs) { 
    float sum = 0.0;
    // Sommiamo gli input pesati:
    for (int i=0; i<this.weights.length; i++) {
      sum += inputs[i] * this.weights[i];
    }
    // Applichiamo la funzione di attivazione:
    float output = this.activate(sum);
    return output;
  }
  
  
  // Funzione di training:
  void doTraining(float[] inputs, float target) {
    float output = this.getPrevision(inputs);
    float error = target - output;
    
    // Aggiustiamo tutti i pesi:
    for (int i=0; i<this.weights.length; i++) {
      this.weights[i] += error * inputs[i] * this.learning_rate;
    }
  }
  
  
  /** Prevedi output funzione. */
  float guessY(float x) {
    float m = this.weights[0] / this.weights[1];
    float b = this.weights[2] / this.weights[1];
    return -(m * x + b);
  }
}
