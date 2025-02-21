---
title: "Matrix Setup"
type: docs
toc: true
aliases:
    - /matrix-setup
---

{{< callout type="info" >}}
For comprehensive insights check out the [join Matrix guide](https://joinmatrix.org/guide/)
{{< /callout >}}

#### Initial setup

1. Choose a Matrix client of your choice ([Element / X ](https://element.io/download), [SchildiChat](https://schildi.chat/) are recommended)
1. Create an account on a trusted homeserver of your choice: [here](https://matrix.org/ecosystem/hosting/) or [here](https://servers.joinmatrix.org/)
1. Setup your [Matrix client](/matrix-setup)
1. Join the AXP.OS support room: [#axp.os:binbash.rocks](https://matrix.to/#/#axp.os:binbash.rocks)

{{< callout type="warning" >}}
The configuration options might look different between the chosen Matrix client and can also be named differently or even missing.
{{< /callout >}}

When setting up an account the first time you will be asked to setup a Security key. This is a very important step and you should ensure not missing it.
If you skipped that step you can do it any time later via:
- `Security & Privacy -> Secure Backup -> Set-up -> choose: "Security Phrase"` ([guide](https://www.ubuntubuzz.com/2021/01/element-made-easy-setup-security-phrase-and-key.html))

Then configure the rest:
- `Security & Privacy -> Cross-signing -> must be: "Cross-signing is ready for use"` ([guide](https://ems-docs.element.io/books/element-cloud-documentation/page/check-status))
- `Security & Privacy -> Manage integrations (scalar.vector.im) -> disabled`
- `Preferences -> Prompt before sending invites to potentially invalid matrix IDs`

#### Recurring checks
- `Sessions`: Verify all sessions and remove unknown ones

#### Usage
- verify session(s): [guide](https://ems-docs.element.io/books/element-cloud-documentation/page/verify-new-login) or [guide](https://www.ubuntubuzz.com/2021/01/element-made-easy-setup-security-phrase-and-key.html)
