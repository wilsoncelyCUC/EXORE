import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["formPage", "nextButton", "prevButton", "submitButton"];

  connect() {
    this.showPage(0);  // Display the first question when the form is loaded
  }

  // This function is responsible for displaying the appropriate question based on the index
  showPage(index) {
    // Loop through each form page (question) and set its display style based on the current index.
    // If the current index matches the loop index, show the form page; otherwise, hide it.
    this.formPageTargets.forEach((page, i) => {
      page.style.display = i === index ? "block" : "none";
    });

    // If the current index is 0 (the first question), hide the "Previous" button.
    // Otherwise, display the "Previous" button as an inline element.
    this.prevButtonTarget.style.display = index === 0 ? "none" : "inline";

    // If the current index is the last question, hide the "Next" button.
    // Otherwise, display the "Next" button as an inline element.
    this.nextButtonTarget.style.display = index === this.formPageTargets.length - 1 ? "none" : "inline";

    // Display the "Submit" button on the last question page
    this.submitButtonTarget.style.display = index === this.formPageTargets.length - 1 ? "inline" : "none";
  }

  // This function is triggered when the "Next" button is clicked
  nextPage(event) {
    event.preventDefault(); // Prevent the default behavior (form submission)

    // Get the answer value from the clicked button (if available)
    const answerValue = event.target.dataset.answerValue;
    if (answerValue) {
      // Get the parameter name associated with the clicked button
      const paramName = event.target.dataset.paramName;

      // Find the hidden field in the form that corresponds to the parameter name
      const hiddenField = this.element.querySelector(`input[type="hidden"][name="criterium[${paramName}]"]`);
      // Set the hidden field value to the answer value from the clicked button
      hiddenField.value = answerValue;
    }

    // Get the index of the currently displayed form page (question)
    const currentPageIndex = this.formPageTargets.findIndex(page => page.style.display === "block");

    // Calculate the index for the next form page (question)
    const nextPageIndex = currentPageIndex + 1;

    // Call the showPage function to display the next question
    this.showPage(nextPageIndex);
  }

  prevPage(event) {
    event.preventDefault();

    const currentPageIndex = this.formPageTargets.findIndex(page => page.style.display === "block");
    const prevPageIndex = currentPageIndex - 1;

    this.showPage(prevPageIndex);
  }
}
