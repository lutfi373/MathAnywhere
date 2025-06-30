document.addEventListener("DOMContentLoaded", function () {
    const contentDiv = document.getElementById("content"); // Target content div

    function loadContent(targetPage) {
        fetch(targetPage)
            .then(response => {
                if(!reponse.ok){
                    throw new Error("Failed to load content");
                }
                return response.text();
            })
            .then(data =>{
                contentDiv.innerHTML = data;
                attachPopupEvents()
            })
            .catch(error => console.error("error loading content:", error));
    }

    // Sidebar Navigation - Dynamic Content Loading
    document.querySelectorAll("nav ul li a").forEach(link => {
        link.addEventListener("click", function (event) {
            event.preventDefault(); // Prevent default page navigation

            let targetPage = this.getAttribute("href"); // Get the href link

            fetch(targetPage)
                .then(response => response.text()) // Convert response to text
                .then(data => {
                    contentDiv.innerHTML = data; // Insert fetched content
                    attachPopupEvents(); // Reattach popup functionality after loading new content
                })
                .catch(error => console.error("Error loading content:", error));
        });
    });

    // Popup Handling
    function attachPopupEvents() {
        const triggers = document.querySelectorAll(".popup-trigger");
        const closeButtons = document.querySelectorAll(".close-popup");

        triggers.forEach(trigger => {
            trigger.addEventListener("click", function () {
                const targetId = trigger.getAttribute("data-target");
                document.getElementById(targetId).style.display = "block";
            });
        });

        closeButtons.forEach(button => {
            button.addEventListener("click", function () {
                this.parentElement.parentElement.style.display = "none";
            });
        });
    }

    // Initial attachment for popups on first page load
    attachPopupEvents();
});
