Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233981993E7
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730409AbgCaKu6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:50:58 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730334AbgCaKu6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:50:58 -0400
IronPort-SDR: g95KUfPpRhJBZqEL7Xg8HhPMBBA70G7eibD50fcNAb+rGLSupzX23HDAOQUVYbX1HAgvJ3FQqM
 vt32HGloySCXlyGm2cH0167Fnr3S4EYeDS2cqVV4UachPJU1ID4C9sFSBC28ErO2pJyEZ0xqR5
 AXEJchJpEMMywgXS+I+L0NRIs047AA1LrI1YbM/dkPQm2BnsW3vFp3GSdF0xNLFpE+qcfhYemy
 UefdUk4U82Or2BZq3Bwxwi4JPfxCaWb+aopfj3HNzI1DRvieh0VqZgqH8hgUEKo34zWJyo7TcJ
 yIQ=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330704"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:50:57 -0800
IronPort-SDR: 5HXooqdw3lLy4SLctRDC9U2D7KiS8bMpHv3In5VOzrqSupRMCaOiju9hGg8AEChr78sEE5gTtD
 xBCs3Dsj5luVoLMpZ6e0isKW29U0kxuda+f1wzfJICJpinCND9TtzlpWT2otOtjQKKw1kHgKxq
 cir/SJp5IbSZYRSA8+1owuB4jlo8qGoq0F/MNNeQ3Gc02Bxu7hvIDRyb9TDg3+EaTK9kTiH/Kr
 ZyRrG+lgIxR6ErWvZpypxyBKCueCYGneCa8pGQtmMCSxhWf6w3lB2QfsdWPbYzo65fl30Fird3
 WnI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 00/55] atmel_mxt_ts misc
Date:   Tue, 31 Mar 2020 03:49:56 -0700
Message-ID: <20200331105051.58896-1-jiada_wang@mentor.com>
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

Jiada Wang (10):
  Input: introduce input_mt_report_slot_inactive
  dt-bindings: input: atmel: add suspend mode support
  Input: atmel_mxt_ts: Rename mxt_fw_version_show to fw_version_show
  Input: atmel_mxt_ts: Rename mxt_hw_version_show to hw_version_show
  Input: atmel_mxt_ts: rename mxt_update_fw_store to update_fw_store
  dt-bindings: input: atmel: provide name of configuration file
  dt-bindings: input: atmel: support to specify input name
  Input: atmel_mxt_ts - eliminate data->raw_info_block
  dt-bindings: input: atmel: support to set max bytes transferred
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
 .../bindings/input/atmel,maxtouch.txt         |   17 +
 MAINTAINERS                                   |    1 +
 drivers/hid/hid-alps.c                        |    3 +-
 drivers/hid/hid-multitouch.c                  |    6 +-
 drivers/input/misc/xen-kbdfront.c             |    2 +-
 drivers/input/mouse/elan_i2c_core.c           |    2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c      | 2270 ++++++++++++++---
 drivers/input/touchscreen/cyttsp4_core.c      |    5 +-
 drivers/input/touchscreen/cyttsp_core.c       |    2 +-
 drivers/input/touchscreen/melfas_mip4.c       |    4 +-
 drivers/input/touchscreen/mms114.c            |    2 +-
 drivers/input/touchscreen/raspberrypi-ts.c    |    2 +-
 drivers/input/touchscreen/stmfts.c            |    2 +-
 include/dt-bindings/input/atmel_mxt_ts.h      |   23 +
 include/linux/input/mt.h                      |    5 +
 15 files changed, 1985 insertions(+), 361 deletions(-)
 create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h

-- 
2.17.1

