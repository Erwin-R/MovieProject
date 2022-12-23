const toggleBtn = document.getElementById("review-button");
const divWriteReview = document.querySelector(".review-form");

// toggle comment form/button text when someone clicks on "Write a Review"
toggleBtn.addEventListener("click", () => {
    if(divWriteReview.style.display === "none"){
        divWriteReview.style.display = "block";
        toggleBtn.innerHTML="Cancel Review"
    } else{
        divWriteReview.style.display = "none";
        toggleBtn.innerHTML="Write a Review"
    }
})