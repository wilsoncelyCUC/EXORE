// Import the Stimulus Controller class
import { Controller } from "@hotwired/stimulus";

// Define the TabsController class extending the imported Controller class
export default class extends Controller {
  // Define the targets that this controller will work with
  static targets = ["tab", "content"];

  // This method is called when the controller is connected to the DOM
  connect() {
    // Show the first tab when the controller is connected
    this.showTab(0);

  }

  // This method is called when a tab is clicked
  changeTab(event) {
    // Prevent the default link behavior (e.g., navigating to the href)
    event.preventDefault();
    // Show the clicked tab and its associated content
    this.showTab(this.tabTargets.indexOf(event.currentTarget));
    console.log("Clicked tab index:", this.tabTargets.indexOf(event.currentTarget));
  }

  // This method shows the tab with the given index and hides the others
  showTab(index) {
    // Loop through each tab element and its corresponding content
    this.tabTargets.forEach((tab, i) => {
      // If the current index matches the given index, add the "tab-active" class
      // and show the content, otherwise remove the "tab-active" class and hide the content
      tab.classList.toggle("tab-active", i === index);
      if (i === index) {
        console.log("Showing tab content:", i);
        this.contentTargets[i].removeAttribute("hidden");
        this.contentTargets[i].style.display = "block";

      } else {
        console.log("Hiding tab content:", i);
        this.contentTargets[i].setAttribute("hidden", true);
        this.contentTargets[i].style.display = "none";

      }
    });
  }
}
