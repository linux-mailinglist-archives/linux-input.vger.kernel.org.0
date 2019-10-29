Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F2EE81F5
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfJ2HUP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:20:15 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41229 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfJ2HUP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:20:15 -0400
IronPort-SDR: rmmPZZUR4/bMutBwjnDSpllGlXVBqZNCNb7JW3ET2xJlVXybRuCZZ+DOa96B/ed2l7eVAdsctt
 GgWAG2lXv1R/hGgdep+VfcK1+4ThxxXEi7HrcDJYTtbavNImVUZdSSh9fyftGSjpvhCs6aoP6A
 oZKZQm6Xjvj/MLzmzCNjYBMHZ2nfwpWtXR9lE5eAm4Re7nTN4BArWaU6Fgg4rLAQ0u/jrR0f/g
 9NLZeb1cR3JG/SJBbyq2c9cAlBRnT/7i5RzX+W8sWKV5WAlEZiNskm6aGlxgnyqH5IIBTc73g1
 XiY=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663201"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:20:14 -0800
IronPort-SDR: 0Uk6qzNHDuYRq1avq7mzO8bWrW7aM9mcBoY2csbYd8sDJljhrTyF3FA+JmxV7RRvqTIc5qdu8Q
 1oyiX98Ypmq9vwyzuVofPp3+J+4Cn52lMnY6jLf/aHZN2wy7A+6bg6DhlF4KWtK0I4AXL2qoV4
 DOxK44fTj8/inyJknoWVXsidTSlNxRWMspN4yAtVf5yR9ZkCA5kBiaG2sSjPyd4iMD8W3YeNJJ
 zHMh1ll2jy7SCRMYyaoQSPxQxjBl5YNgQJLGcreNA/DHrXI/XrzxkbRlwrOR71V2y6/DAqF30z
 c3Y=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 00/48] atmel_mxt_ts misc
Date:   Tue, 29 Oct 2019 16:19:22 +0900
Message-ID: <20191029072010.8492-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch-set forward ports Nick Dyer's work in ndyer/linux github repository
as long as some other features and fixes

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

Jiada Wang (3):
  Input: introduce input_mt_report_slot_inactive
  Input: atmel_mxt_ts - eliminate data->raw_info_block
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

Nick Dyer (26):
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
  Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
  Input: atmel_mxt_ts - implement I2C retries
  Input: atmel_mxt_ts - orientation is not present in hover
  Input: atmel_mxt_ts - implement debug output for messages
  Input: atmel_mxt_ts - implement improved debug message interface

Nikhil Ravindran (1):
  Input: atmel_mxt_ts: Add support for run self-test routine.

Sanjeev Chugh (1):
  Input: atmel_mxt_ts: Implement synchronization during various
    operation

karl tsou (1):
  Input: atmel_mxt_ts - add config checksum attribute to sysfs

keerthikumarp (1):
  input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel
    touch panel controller in detachable displays.

---
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
Input: touchscreen: Atmel: Add device tree support for T15 key array objects
Input: atmel_mxt_ts - check data->input_dev is not null in mxt_input_sync()
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
 drivers/input/input-mt.c                      |    2 +-
 drivers/input/misc/xen-kbdfront.c             |    2 +-
 drivers/input/mouse/elan_i2c_core.c           |    2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c      | 2266 ++++++++++++++---
 drivers/input/touchscreen/cyttsp4_core.c      |    5 +-
 drivers/input/touchscreen/cyttsp_core.c       |    2 +-
 drivers/input/touchscreen/melfas_mip4.c       |    4 +-
 drivers/input/touchscreen/mms114.c            |    2 +-
 drivers/input/touchscreen/raspberrypi-ts.c    |    2 +-
 drivers/input/touchscreen/stmfts.c            |    2 +-
 include/dt-bindings/input/atmel_mxt_ts.h      |   22 +
 include/linux/input/mt.h                      |    5 +
 16 files changed, 1984 insertions(+), 356 deletions(-)
 create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h

-- 
2.17.1

