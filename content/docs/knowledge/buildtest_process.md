---
title: "Build & testing process"
type: docs
toc: true
aliases:
    - /tests
    - /Tests
    - /Testing
    - /testing
    - /Buildtest
    - /Buildtests
    - /buildtest
    - /buildtests
---

## The process

The following describes roughly the build & test process of AXP.OS updates:

1. a build id will be defined in the format: `YYYY.<id/round>` (e.g. `2026.001`, see [meaning, history & examples](/docs/knowledge/faq/#meaning-of-the-axpos-build-id))
2. one (1) dedicated [AXP.OS Team](/docs/knowledge/supportlevels/#by-the-axp-team) supported device will be used to test a new update
3. if there are any build or other issues they will be solved for that single device
4. once this device is working, ALL other [AXP.OS Team](/docs/knowledge/supportlevels/#by-the-axp-team) supported devices will be build and build issues solved
5. all devices run through the testing [checklist](/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist), if there are any issues they will be solved
6. depending on 1-4 _one_ or _all_ devices get re-build and steps repeat from 2(!) again until 5 is without issues. the build id does not change.
7. once this is done all [AXP.OS Community](/docs/knowledge/supportlevels/#by-the-axp-community) supported devices will be build and build issues solved
8. the community goes through the testing [checklist](/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist), reported issues will be either tracked, solved or documented

That way all devices have the same build id instead of each having unique ones. A build id includes the same set of features regardless how many build runs of a specific device were required to resolve issues.

> [!TIP]
> _Read more about the meaning of the build id and its history [here](/docs/knowledge/faq/#meaning-of-the-axpos-build-id)._

