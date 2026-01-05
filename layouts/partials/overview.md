## Overview

<table>
  <tr>
    <td style="text-align:center;">codename<br/><i><b>{{ .codename }}</b></i></td>
{{ if .flavor_pro }}
  <td style="text-align: center;">
    <div style="position: relative; display: inline-block;">
      <img src="/img/devices/{{ .codename }}_icon.png" alt="">
      <span style="
        position: absolute;
        bottom: 0;
        right: 0;
        font-size: 2em;
        transform: translate(50%, 20%); /* horizontal %, vertical % */
        pointer-events: none;
      ">⚙️</span>
    </div>
  </td>
{{ end }}
{{ if .flavor_slim }}
  <td style="text-align: center;">
    <div style="position: relative; display: inline-block;">
      <img src="/img/devices/{{ .codename }}_icon.png" alt="">
      <span style="
        position: absolute;
        bottom: 0;
        right: 0;
        font-size: 2em;
        transform: translate(60%, 20%); /* horizontal %, vertical % */
        pointer-events: none;
      ">🛡️</span>
    </div>
  </td>
{{ end }}
  </tr>
<tr>
  <td style="text-align:left;"><strong>Flavor (<a href="/Flavors">?</a>):</strong></td>
  {{ if .flavor_pro }}<th style="text-align:center;"><strong>Pro</strong></th>{{ end }}
  {{ if .flavor_slim }}<th style="text-align:center;"><strong>Slim</strong></th>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>Android:</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;">{{ .android_pro }}</td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;">{{ .android_slim }}</td>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>First released:</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;">{{ .firstrelease_pro | markdownify }}</td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;">{{ .firstrelease_slim | markdownify }}</td>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>Firmware:</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;">{{ .firmware }}</td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;">{{ .firmware }}</td>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>Encryption (<a href="https://source.android.com/docs/security/features/encryption">?</a>):</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;background-color: {{ if eq .encryption_pro "FBEv2" }}#33cc33{{ else if eq .encryption_pro "FDE" }}#ff9933{{ else }}#66ffcc{{ end }}">{{ .encryption_pro }}</td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;background-color: {{ if eq .encryption_slim "FBEv2" }}#33cc33{{ else if eq .encryption_slim "FDE" }}#ff9933{{ else }}#66ffcc{{ end }}">{{ .encryption_slim }}</td>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>Relockable:</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;background-color: {{ if hasPrefix .relock_pro "yes" }}#33cc33{{ else }}#ff9933{{ end }}">{{ .relock_pro }}</td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;background-color: {{ if hasPrefix .relock_slim "yes" }}#33cc33{{ else }}#ff9933{{ end }}">{{ .relock_slim }}</td>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>VerifiedBoot/AVB (<a href="/AVB">?</a>):</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;background-color: {{ if hasPrefix .verifiedboot_pro "v2" }}#33cc33{{ else if hasPrefix .verifiedboot_pro "v1" }}#ebf500{{ else }}#f23000{{ end }}">{{ .verifiedboot_pro }}</td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;background-color: {{ if hasPrefix .verifiedboot_slim "v2" }}#33cc33{{ else if hasPrefix .verifiedboot_slim "v1" }}#ebf500{{ else }}#f23000{{ end }}">{{ .verifiedboot_slim }}</td>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>Verified & tested by:</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;background-color: {{ if eq .supportlevel_pro "team" }}#33cc33{{ end }}">The AXP.OS <a href="{{ printf "%s" .docbaseurl }}/support-levels#by-the-axp-{{ .supportlevel_pro }}" target="_blank">{{ .supportlevel_pro }}</a></td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;background-color: {{ if eq .supportlevel_slim "team" }}#33cc33{{ end }}">The AXP.OS <a href="{{ printf "%s" .docbaseurl }}/support-levels#by-the-axp-{{ .supportlevel_slim }}" target="_blank">{{ .supportlevel_slim }}</a></td>{{ end }}
</tr>
<tr>
  <th style="text-align:left;"><strong>State:</strong></th>
  {{ if .flavor_pro }}<td style="text-align:center;background-color: {{ if eq .state_pro "stable" }}#33cc33{{ else if eq .state_pro "!! ALPHA !!" }}#ff0000{{ else }}#ff9933{{ end }}">{{ .state_pro }}</td>{{ end }}
  {{ if .flavor_slim }}<td style="text-align:center;background-color: {{ if eq .state_slim "stable" }}#33cc33{{ else if eq .state_slim "!! ALPHA !!" }}#ff0000{{ else }}#ff9933{{ end }}">{{ .state_slim }}</td>{{ end }}
</tr>
</table>