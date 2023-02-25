import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["entries", "pagination"]

  initialize() {

    let options = {
      rootMargin: '200px'
    }

    this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries), options)
  }

  connect() {
    this.intersectionObserver.observe(this.paginationTarget)
  }
  
  disconnect() {
    this.intersectionObserver.unobserve(this.paginationTarget)
  }
  
  processIntersectionEntries(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        console.log('loading more')
        this.loadMore()
      }
    })
  }

  loadMore() {

    let next_page = this.paginationTarget.querySelector("a[rel='next']")
    if (next_page == null){ 
      this.addFinishedLoadingNotice()
      return 
    }
    let url = next_page.href

    if(!url.includes('.json')){
      url = url.split("?")
      url = url[0] + ".json?" + url[1]
    }


    fetch(url)
    .then((response) => response.json())
    .then((data) => {
      this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
      this.paginationTarget.innerHTML = data.pagination
    });

  }

  addFinishedLoadingNotice(){
    if(document.querySelector("#finished-loading-notice")){
      return
    }
    const newDiv = '<div class="text-center" id="finished-loading-notice">No more items to load</div>'
    this.element.insertAdjacentHTML('beforeend', newDiv)
  }

}