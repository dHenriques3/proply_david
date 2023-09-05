import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editbutton"
export default class extends Controller {
  static targets = ["editBtn", "docEditForm"]

  // shows the edit button on a card on event mouse over
  showbtn() {
    this.editBtnTarget.classList.remove("d-none")
  }

  // hides the edit button on a card on event mouseleave
  hidebtn() {
    this.editBtnTarget.classList.add("d-none")
  }

  // show Document edit form
  showdocform(){
    this.docEditFormTarget.classList.toggle("d-none")
  }
}
