Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB71A1CA307
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgEHF5T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:57:19 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:21951 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgEHF5T (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:57:19 -0400
IronPort-SDR: iWsuOs1L0Ixuth+rzMhXVhYhS6Hc4qRBR9B3vOj/CXD02wp394wBSu+IP3JjsXq1+5aNEZMRoP
 Hf6G0SveAH+A1BQoBk5mBvcoskHHox2lekp5Qtut/rB1a890yIs56gUqvxezN/FI/qzriszw34
 w7cpTnH5wTxiHey+LzX6XtSbws4BRpRSMvG6JgWKAoHATdd02wSccwPW/JSgs5YgpdHMld1Uce
 FPULzqflqHN1NZO/lOoK/AziV5Skh7rS+4GSRy9VeP+3WsgN2Lu9IuI5CSCDIJ2YfQ+4volaGP
 wdg=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48651885"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 07 May 2020 21:57:02 -0800
IronPort-SDR: cCqpoRZXbZtSD7FLMLVxVrSX3EezEf9xBwqN5C3iuiOjwg+B31vIUaKVoxeZG+YquhnamQ24wb
 atXQen75W/kh+JauGmI/mjEmdDm993G5i67d1HilfTtgynCxQVe//FoVGvLjRVIRNlA1pjD5Ud
 APajCw5l8GDhMiCobjkMmVxgd3XRnbELl84T8qBgUYCk8IMbyJajIU/NVe/0hoF47alhTD41WD
 dodF2H2Bih6lDYHM7nt5gU6uHL9U8f4gJnG2LmjE8Etqqr493/uIZsqJVaAvyR3w1YH+cLlg8y
 W+Q=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 00/56] atmel_mxt_ts misc
Date:   Thu, 7 May 2020 22:56:00 -0700
Message-ID: <20200508055656.96389-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch-set forward ports Nick Dyer's work in ndyer/linux github
repository as long as some other features and fixes

Balasubramani Vivekanandan (2):
  Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c
    transaction
  Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin

Dean Jenkins (1):
  Input: atmel_mxt_ts: return error from
    mxt_process_messages_until_invalid()

Deepak Das (6):
  Input: Atmel: improve error handling in mxt_start()
  Input: Atmel: improve error handling in mxt_initialize()
  Input: Atmel: improve error handling in mxt_update_cfg()
  Input: Atmel: Improve error handling in mxt_initialize_input_device()
  Input: Atmel: handle ReportID "0x00" while processing T5 messages
  Input: Atmel: use T44 object to process T5 messages

George G. Davis (1):
  input: atmel_mxt_ts: export GPIO reset line via sysfs

Janus Cheng (1):
  Input: atmel_mxt_ts - check data->input_dev is not null in
    mxt_input_sync()

Jiada Wang (12):
  Input: introduce input_mt_report_slot_inactive
  dt-bindings: input: atmel: add suspend mode support
  Input: atmel_mxt_ts: Rename mxt_fw_version_show to fw_version_show
  Input: atmel_mxt_ts: Rename mxt_hw_version_show to hw_version_show
  Input: atmel_mxt_ts: rename mxt_update_fw_store to update_fw_store
  dt-bindings: input: atmel: provide name of configuration file
  dt-bindings: input: atmel: support to specify input name
  Input: atmel_mxt_ts - rename mxt_object_show to object_show
  Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
  Input: atmel_mxt_ts - eliminate data->raw_info_block
  input: atmel_mxt_ts: don't disable IRQ before remove of
    mxt_fw_attr_group
  Input: atmel_mxt_ts - Fix compilation warning

Karl Tsou (1):
  Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs

Kautuk Consul (2):
  Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
  Input: atmel_mxt_ts - rely on calculated_crc rather than file
    config_crc

Naveen Chakka (2):
  input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen
    status
  input: atmel_mxt_ts: added sysfs interface to update atmel T38 data

Nick Dyer (25):
  Input: atmel_mxt_ts - rework sysfs init/remove
  Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when
    necessary
  Input: atmel_mxt_ts - split large i2c transfers into blocks
  Input: atmel_mxt_ts - output status from T48 Noise Supression
  Input: atmel_mxt_ts - output status from T42 Touch Suppression
  Input: atmel_mxt_ts - implement T9 vector/orientation support
  Input: atmel_mxt_ts - implement T15 Key Array support
  Input: atmel_mxt_ts - handle reports from T47 Stylus object
  Input: atmel_mxt_ts - implement support for T107 active stylus
  Input: atmel_mxt_ts - release touch state during suspend
  Input: atmel_mxt_ts - add regulator control support
  Input: atmel_mxt_ts - report failures in suspend/resume
  Input: atmel_mxt_ts - allow specification of firmware file name
  Input: atmel_mxt_ts - handle cfg filename via pdata/sysfs
  Input: atmel_mxt_ts - allow input name to be specified in platform
    data
  Input: atmel_mxt_ts - refactor firmware flash to extract context into
    struct
  Input: atmel_mxt_ts - refactor code to enter bootloader into separate
    func
  Input: atmel_mxt_ts - combine bootloader version query with probe
  Input: atmel_mxt_ts - improve bootloader state machine handling
  Input: atmel_mxt_ts - rename bl_completion to chg_completion
  Input: atmel_mxt_ts - make bootloader interrupt driven
  Input: atmel_mxt_ts - implement I2C retries
  Input: atmel_mxt_ts - orientation is not present in hover
  Input: atmel_mxt_ts - implement debug output for messages
  Input: atmel_mxt_ts - implement improved debug message interface

Nikhil Ravindran (1):
  Input: atmel_mxt_ts: Add support for run self-test routine.

karl tsou (1):
  Input: atmel_mxt_ts - add config checksum attribute to sysfs

keerthikumarp (1):
  input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel
    touch panel controller in detachable displays.
---
v11:
Following commits in v10 have been dropped
dt-bindings: input: atmel: support to set max bytes transferred
Input: atmel_mxt_ts: Implement synchronization during various operation

Following commits have been added
Input: atmel_mxt_ts - check data->input_dev is not null in
mxt_input_sync()
Input: atmel_mxt_ts - rename mxt_object_show to object_show
input: atmel_mxt_ts: don't disable IRQ before remove of
mxt_fw_attr_group

Following commits have been updated to address review findings
dt-bindings: input: atmel: add suspend mode support
input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen
status
Input: atmel_mxt_ts - handle cfg filename via pdata/sysfs
Input: atmel_mxt_ts - delay enabling IRQ when not using regulators

v10:
Following commits have been updated
input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen
status
dt-bindings: input: atmel: add suspend mode support
Input: atmel_mxt_ts: Implement synchronization during various operation

Re-order commits to avoid compilation error

v9:
Following commits have been added
Input: atmel_mxt_ts: rename mxt_update_fw_store to update_fw_store
Input: atmel_mxt_ts: Rename mxt_hw_version_show to hw_version_show
Input: atmel_mxt_ts: Rename mxt_fw_version_show to fw_version_show

Addressed dev_attrs related checkpatch warnings

v8:
Fix checkpatch errors and warnings

Fix issue in commit (" Input: atmel_mxt_ts - only read messages in
mxt_acquire_irq() when necessary")
reported by Dmitry Osipenko

Cleanup coding style for commits
Input: atmel_mxt_ts - add regulator control support
Input: atmel_mxt_ts - improve bootloader state machine handling

v7:
Fix regression found when updating firmware
Following commits have been updated to fix regression found when
updating firmware
Input: atmel_mxt_ts - improve bootloader state machine handling
Input: atmel_mxt_ts - make bootloader interrupt driven
input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen
status
Input: atmel_mxt_ts: Implement synchronization during various operation

v6:
Fix issue in commit ("Input: introduce input_mt_report_slot_inactive")
reported by kernel test robot

v5:
Following commits have been updated to address warnings & errors
reported by kbuild test robot
Input: atmel_mxt_ts - make bootloader interrupt driven
Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs

Following commit has been updated
Input: introduce input_mt_report_slot_inactive

v4:
Following commit in v3 patch-set has been removed
Input: switch to use return value of input_mt_report_slot_state

Following commit has been updated to address checkpatch warning
Input: atmel_mxt_ts: Implement synchronization during various operation

v3:
Following commits have been updated compared to v2 patchset
Input: atmel_mxt_ts - implement debug output for messages
- added inline comment
Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msg
- changed dev_info() to dev_dbg()

v2:
Following commit in v1 patchset has been split into two commits
Input: introduce input_mt_report_slot_inactive

Following commits have been updated compared to v1 patchset
Input: atmel_mxt_ts - split large i2c transfers into blocks
Input: atmel_mxt_ts - output status from T42 Touch Suppression

Following commits in v1 patchset have been squashed
Input: touchscreen: Atmel: Add device tree support for T15 key array
objects
Input: atmel_mxt_ts - check data->input_dev is not null in
mxt_input_sync()
Input: atmel_mxt_ts - check firmware format before entering bootloader
Input: atmel_mxt_ts: update stale use_retrigen_workaround flag
input: atmel_mxt_ts: move bootloader probe from mxt_initialize()
input: Atmel: limit the max bytes transferred while reading T5 messages
Input: atmel_mxt_ts: Use msecs_to_jiffies() instead of HZ
Input: atmel_mxt_ts: Use complete when in_bootloader true
Input: atmel_mxt_ts: Prevent crash due to freeing of input device
input: atmel_mxt_ts: Add NULL check for sysfs attribute debug_msg_attr

Following commits in v1 patchset have been dropped:
Input: atmel_mxt_ts - configure and use gpios as real gpios
Input: touchscreen: Atmel: Enable IRQ_DISABLE_UNLAZY flag for interrupt
Input: atmel_mxt_ts - add memory access interface via sysfs
Input: atmel_mxt_ts: Remove sysfs attributes during driver detach
Input: atmel_mxt_ts: Avoid race condition in freeing of input device

v1: initial version
---

 .../bindings/input/atmel,maxtouch.txt         |   14 +
 MAINTAINERS                                   |    1 +
 drivers/hid/hid-alps.c                        |    3 +-
 drivers/hid/hid-multitouch.c                  |    6 +-
 drivers/input/misc/xen-kbdfront.c             |    2 +-
 drivers/input/mouse/elan_i2c_core.c           |    2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c      | 2072 ++++++++++++++---
 drivers/input/touchscreen/cyttsp4_core.c      |    5 +-
 drivers/input/touchscreen/cyttsp_core.c       |    2 +-
 drivers/input/touchscreen/melfas_mip4.c       |    4 +-
 drivers/input/touchscreen/mms114.c            |    2 +-
 drivers/input/touchscreen/raspberrypi-ts.c    |    2 +-
 drivers/input/touchscreen/stmfts.c            |    2 +-
 include/dt-bindings/input/atmel_mxt_ts.h      |   23 +
 include/linux/input/mt.h                      |    5 +
 15 files changed, 1790 insertions(+), 355 deletions(-)
 create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h

-- 
2.17.1

