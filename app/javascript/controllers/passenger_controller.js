import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {

  static targets = ["passengerFields", "passengerInfo", "passengerOutput", "passengerHeader"]
  static values = { passengerCount: Number }
  connect() {
    console.log(this.passengerCountValue)
  }

  add(e){
    e.preventDefault;

    this.passengerCountValue++;
    const content = this.passengerFieldsTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString());
    this.passengerOutputTarget.insertAdjacentHTML('beforeend', content);
    this.passengerHeaderTargets[this.passengerCountValue-1].textContent = `Details for passenger ${this.passengerCountValue}`;

    console.log(this.passengerInfoTargets);
  }

  delete(){
    if(this.passengerCountValue > 1){
      this.passengerCountValue--;
      this.passengerInfoTargets[this.passengerCountValue].remove();
      //this.passengerInfoTarget.remove();
    }
    console.log(this.passengerInfoTargets);
  }
}
