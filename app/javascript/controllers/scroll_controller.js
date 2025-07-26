import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.scrollToBottom()

    // Turbo Streamで再描画されるたびにスクロールを実行
    document.addEventListener("turbo:before-stream-render", this.scrollToBottom)
  }

  disconnect() {
    document.removeEventListener("turbo:before-stream-render", this.scrollToBottom)
  }

  scrollToBottom = () => {
    // チャットボックス内を一番下までスクロール
    this.element.scrollTop = this.element.scrollHeight

    // 画面全体も一番下までスクロール
    // window.scrollTo({
    // top: document.body.scrollHeight,
    //  behavior: "smooth"
    // })
  }
}
