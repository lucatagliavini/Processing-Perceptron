
// Funzione della LINEA:
float function(float x) {
  // y = mx + b
  return 0.9 * x + 0.5; 
}

// Classe che rappresenta il punto:
class Point {
  float x;
  float y;
  float bias;
  float label;
  
  // Creo il costruttore coi dati specificati. */
  Point(float x, float y) {
    this.x = x;
    this.y = y;
    this.bias = 1.0;
    this.setPointLabel();
  }
  
  // Creo un punto con i dati richiesti:
  Point() {
    // Inizializzo i dati:
    this.x = random(-1.0, 1.0);
    this.y = random(-1.0, 1.0);
    this.bias = 1.0;
    this.setPointLabel();
  }
  
  
  /** Il metodo serve per settare la label. */
  void setPointLabel() {
    // La linea da imparare:
    if ( this.y > function(this.x) ) {
      this.label = 1.0;
    }
    else {
      this.label = -1.0;  
    }
  }
  
  
  /** Dati in formato array. */
  float[] getInputs() {
    return new float[] {this.x, this.y, this.bias};
  }
  
  
  /** Restituisco la label. */
  float getLabel() {
    return this.label;
  }
  
  
  /** Mapping dei pixel X: */
  float getPixelX() {
    return map(this.x, -1.0, 1.0, 0, width);
  }
  
  
  /** Mapping del pixel Y: */
  float getPixelY() {
    return map(this.y, -1.0, 1.0, height, 0);
  }
  
  /** Disegno il punto. */
  void show() {
    stroke(0);
    if (this.label == 1) {
      fill(255);
    }
    else {
      fill(0);
    }
    
    // Mapping dei punti sullo schermo:
    ellipse(this.getPixelX(), this.getPixelY(), 32, 32);
  }
}
