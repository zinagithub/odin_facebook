const friendButtonTransition = () => {
	const buttons = document.getElementsByClassName("cancle-friendship");
	for (let i = 0; i<buttons.length; i++) {
		buttons[i].addEventListener("mouseover", function() {
			buttons[i].defaultValue = "Cancle?";
			buttons[i].classList.remove("btn-success");
			buttons[i].classList.add("btn-danger");

		})
		buttons[i].addEventListener("mouseout", function() {
			buttons[i].defaultValue = "Friend";
			buttons[i].classList.remove("btn-danger");
			buttons[i].classList.add("btn-success");
		});
	};
};

const pendingFriendButtonTransition = () => {
	const buttons = document.getElementsByClassName("pending-friend");
	for (let i = 0; i<buttons.length; i++) {
		buttons[i].addEventListener("mouseover", function() {
			buttons[i].innerHTML = "Go to pending requests";

		});
		buttons[i].addEventListener("mouseout", function() {
			buttons[i].innerHTML = "Pending friend";
		});
	};
};

document.addEventListener("turbolinks:load", function() { friendButtonTransition() })
document.addEventListener("turbolinks:load", function() { pendingFriendButtonTransition() })