---
title: "Build & testing process"
type: docs
toc: true
aliases:
    - /tests
    - /Tests
    - /Testing
    - /testing
---

## The process

The following describes roughly the build & test process of monthly updates:

1. a Build ID* will be created: `YYYY-MM-05.<build round>` (e.g. `2025-07-05.1`, see next topic)
2. one dedicated [AXP.OS Team](https://axpos.org/docs/knowledge/supportlevels/#by-the-axp-team) supported device will be used to test a new monthly update
3. if there are any build or other issues they will be solved for that single device
4. once this device is working, ALL other [AXP.OS Team](https://axpos.org/docs/knowledge/supportlevels/#by-the-axp-team) supported devices will be build and build issues solved
5. all devices run through the testing [checklist](/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist), if there are any issues they will be solved
6. depending on 1-4 one or all devices get re-build and steps repeat from 2(!) again until 5 is without issues. the build id does not change.
7. once this is done all [AXP.OS Community](https://axpos.org/docs/knowledge/supportlevels/#by-the-axp-community) supported devices will be build and build issues solved
8. the community goes through the testing [checklist](/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist), reported issues will be either tracked, solved or documented

That way all devices have the same build id instead of unique ones. A build id so includes the same set of features regardless when or how many single build runs of a specific device were required to solve issues.

In other words the build id does not reflect taken build tries of a specific device (anymore), i.e. it could have taken 100 build tries but the id will still show `.1` at the end.

> [!IMPORTANT]
> At the moment this build id will be shown only in the official [automation channel - sfX Automation](https://axpos.org/docs/overview/#support) as it is more for information purpose and e.g. to handle internals like the testing checklists of the community. It is planned to integrate it for [reproducible builds](/Reproducible-builds) git tagging though.

## The "Build ID"

`YYYY-MM-05.<build round>` explained:

_(ASB: Android Security Bulletin, see [here](https://source.android.com/docs/security/bulletin/2025-01-01?hl=en#Common-questions-and-answers))_

- `YYYY` = 4 digit ASB year
- `MM` = 2 digit ASB month
- `05` = 2 digit ASB level, always `05` for AXP.OS as described [here](/docs/knowledge/patchlevels/#the-axpos-patch-level)
- `<build round>` = all steps from "The process" 1-8 (see above) are handled by a single id  named `<build round>`. basically it is just a counter which increases only when **step 7** passed and AFTER that issues were found affecting one or more devices.

