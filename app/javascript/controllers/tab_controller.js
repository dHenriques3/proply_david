import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {
  static targets = ["taskButton", "docButton", "tenancyButton", "documents", "tasks", "tenancies"]

  connect() {
  }

  showdoc() {
    console.log("showdocs")
    // revelaing the documents tab.
    this.tasksTarget.classList.add("d-none")
    this.documentsTarget.classList.remove("d-none")
    // changing the task button color from primary to light
    this.taskButtonTarget.classList.remove("btn-primary")
    this.taskButtonTarget.classList.add("btn-light")
    // changing the tenancy button color from primary to light
    this.tenancyButtonTarget.classList.remove("btn-primary")
    this.tenancyButtonTarget.classList.add("btn-light")
    // changing the document button color from light to primary
    this.docButtonTarget.classList.remove("btn-light")
    this.docButtonTarget.classList.add("btn-primary")
    // changing the documents tab text color
    this.taskButtonTarget.classList.remove("text-light")
    this.tenancyButtonTarget.classList.remove("text-light")
    this.docButtonTarget.classList.add("text-light")

  }
  showtask() {
    console.log("showtasks")
    // revelaing the tasks tab.
    this.documentsTarget.classList.add("d-none")
    this.tasksTarget.classList.remove("d-none")
    // changing the document button color from primary to light
    this.docButtonTarget.classList.remove("btn-primary")
    this.docButtonTarget.classList.add("btn-light")
    // changing the tenancy button color from primary to light
    this.tenancyButtonTarget.classList.remove("btn-primary")
    this.tenancyButtonTarget.classList.add("btn-light")
    // changing the task button color from light to primary
    this.taskButtonTarget.classList.remove("btn-light")
    this.taskButtonTarget.classList.add("btn-primary")
    // changing the task button text color
    this.taskButtonTarget.classList.add("text-light")
    this.docButtonTarget.classList.remove("text-light")

  }

  showtenancy() {
    console.log("showtenancy")
    // revelaing the tasks tab.
    this.documentsTarget.classList.add("d-none")
    this.tasksTarget.classList.add("d-none")
    this.tenanciesTarget.classList.remove("d-none")
    // changing the document button color from primary to light
    this.docButtonTarget.classList.remove("btn-primary")
    this.docButtonTarget.classList.add("btn-light")
    // changing the tenency button color from light to primary
    this.tenancyButtonTarget.classList.remove("btn-light")
    this.tenancyButtonTarget.classList.add("btn-primary")
    // changing the task button color from light to primary
    this.taskButtonTarget.classList.remove("btn-primary")
    this.taskButtonTarget.classList.add("btn-light")
    // changing the task button text color
    this.tenancyButtonTarget.classList.add("text-light")
    this.docButtonTarget.classList.remove("text-light")
    this.taskButtonTarget.classList.remove("text-light")

  }
}
