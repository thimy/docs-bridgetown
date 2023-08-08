import { LitElement, html, css } from "lit"

export class BumpNavbarElement extends LitElement {
  static styles = css`
    :host {
      header {
        height: 64px;
      }
    }
  `

  static properties = {
    logo: { type: String }
  }

  render() {
    return html`
      <header>
        <img src="${this.logo}" alt="Bump.sh" />
        <nav>
          <ul>
            <li><a href="<%= relative_url '/' %>">Home</a></li>
            <li><a href="<%= relative_url '/help' %>">Documentation</a></li>
            <li><a href="<%= relative_url '/updates' %>">Product Updates</a></li>
            <li><a href="<%= relative_url '/guides' %>">Guides</a></li>
          </ul>
        </nav>
      </header>
    `;
  }
}

// Try adding `<%= lit :happy_days, hello: "there" %>` somewhere in an ERB template
// on your site to see this example Lit component in action!
customElements.define("bump-navbar", BumpNavbarElement)
