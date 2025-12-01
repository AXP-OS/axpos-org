## Overview

<table>
  <tr>
    <th></th>
    <td><img src="/img/devices/{{ .codename }}_icon.png" alt=""></td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>Codename:</strong></th>
    <td><i>{{ .codename }}</i></td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>Android:</strong></th>
    <td>{{ .android }}</td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>Flavors:</strong></th>
    <td>{{ .flavors }}</td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>First released:</strong></th>
    <td>{{ .firstrelease | markdownify }}</td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>Firmware:</strong></th>
    <td>{{ .firmware }}</td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>Encryption:</strong></th>
    <td style="background-color: {{ if eq .encryption "FBEv2" }}#33cc33{{ else if eq .encryption "FDE" }}#ff9933{{ else }}#66ffcc{{ end }}">{{ .encryption }}</td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>Relockable:</strong></th>
    <td style="background-color: {{ if hasPrefix .relock "yes" }}#33cc33{{ else }}#ff9933{{ end }}">{{ .relock }}</td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>VerifiedBoot (<a href="/AVB">AVB</a>):</strong></th>
    <td style="background-color: {{ if hasPrefix .verifiedboot "v2" }}#33cc33{{ else if hasPrefix .verifiedboot "v1" }}#66ffcc{{ else }}#ff9933{{ end }}">{{ .verifiedboot }}</td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>Verified & tested by:</strong></th>
    <td style="background-color: {{ if eq .supportlevel "team" }}#33cc33{{ end }}">The AXP.OS <a href="{{ printf "%s" .docbaseurl }}/support-levels#by-the-axp-{{ printf "%s" .supportlevel }}" target=_blank>{{ .supportlevel }}</a></td>
  </tr>
  <tr>
    <th style="text-align: left;"><strong>State:</strong></th>
    <td style="background-color: {{ if eq .state "stable" }}#33cc33{{ else if eq .state "!! ALPHA !!" }}#ff0000{{ else }}#ff9933{{ end }}">{{ .state }}</td>
  </tr>
</table>
