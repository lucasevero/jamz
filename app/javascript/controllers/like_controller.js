import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['like']
  connect() {
    console.log(this.likeTarget);
  }

  refresh(event) {
    console.log(event)
  }
}