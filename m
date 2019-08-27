Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E1D9DDAD
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfH0GZ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:25:58 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:14029 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfH0GZ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:25:58 -0400
IronPort-SDR: CVK48l8xpAkVELVlq3FPE88gzYulH40s7xifvsn4UwMpQDn4FM3vKWW43ASVR4KB1Fv5wIwJvT
 j6DI+zBHM2TlqIe0OD1jPCFY0QwOAmWG/cZO2SlZR2293AGIhU9es8osKPprWs2Nfy/ooY6swL
 SVZTAyPL4BcWf+uSPR6/eQazEn9/HHy0A4SLIEa7uvNvR7wXrOMBVytbs0mbfg2MdU7P3x7C77
 mC7lypk7nWs2Q9bKtksEfxsNxFmHXR5iDS5MUSNFukdb9gniXCrLB/yD+kjTrmjimSPEked9T7
 uxA=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40792611"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:25:57 -0800
IronPort-SDR: KBlj47vXkzsrO/7JHD5XiHEh9/GW95CBlj2/pt/cqMNxQ1IXAObKdGSTBK1fo1mOTSPOF4bAUn
 QKb40SfNDLU5TSzyFegYgI+Vwhs7ttmxPckzwJ4iKBxiIDvZH3jh8hNxwMN9T9Nv0yoGQFwK/L
 Os48gwiPiJED4VGyXrFBIzAmPJWnH8pZfwuCQJYxko2SaXgUF1mUpvRli9gct1jsWE3iRa7qxw
 JY9VqbVm2+vCQVwcpreRT8pq2u64G+xj1F/z/O3wlnvuyyvV8R2usyFZs0Gz5ohLIR5VfCt+CH
 9bU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 00/49] atmel_mxt_ts misc
Date:   Tue, 27 Aug 2019 15:25:18 +0900
Message-ID: <20190827062607.19839-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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

Jiada Wang (4):
  Input: switch to use return value of input_mt_report_slot_state
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
 drivers/hid/hid-asus.c                        |    3 +-
 drivers/hid/hid-elan.c                        |    3 +-
 drivers/hid/hid-logitech-hidpp.c              |    5 +-
 drivers/hid/hid-magicmouse.c                  |    3 +-
 drivers/hid/hid-multitouch.c                  |    9 +-
 drivers/hid/hid-sony.c                        |    8 +-
 drivers/hid/wacom_wac.c                       |   15 +-
 drivers/input/input-mt.c                      |    2 +-
 drivers/input/misc/xen-kbdfront.c             |    2 +-
 drivers/input/mouse/elan_i2c_core.c           |    2 +-
 drivers/input/mouse/elantech.c                |    5 +-
 drivers/input/mouse/focaltech.c               |    3 +-
 drivers/input/mouse/sentelic.c                |    3 +-
 drivers/input/mouse/synaptics.c               |    3 +-
 drivers/input/rmi4/rmi_2d_sensor.c            |    6 +-
 drivers/input/touchscreen/atmel_mxt_ts.c      | 2269 ++++++++++++++---
 drivers/input/touchscreen/chipone_icn8505.c   |    4 +-
 drivers/input/touchscreen/cyttsp4_core.c      |    5 +-
 drivers/input/touchscreen/cyttsp_core.c       |    2 +-
 drivers/input/touchscreen/egalax_ts.c         |    3 +-
 drivers/input/touchscreen/hideep.c            |    7 +-
 drivers/input/touchscreen/ili210x.c           |    3 +-
 drivers/input/touchscreen/melfas_mip4.c       |    4 +-
 drivers/input/touchscreen/mms114.c            |    6 +-
 drivers/input/touchscreen/penmount.c          |    5 +-
 drivers/input/touchscreen/raspberrypi-ts.c    |    2 +-
 drivers/input/touchscreen/raydium_i2c_ts.c    |    4 +-
 drivers/input/touchscreen/sis_i2c.c           |    5 +-
 drivers/input/touchscreen/stmfts.c            |    2 +-
 drivers/input/touchscreen/surface3_spi.c      |    4 +-
 drivers/input/touchscreen/wacom_w8001.c       |    3 +-
 drivers/input/touchscreen/zforce_ts.c         |    6 +-
 include/dt-bindings/input/atmel_mxt_ts.h      |   22 +
 include/linux/input/mt.h                      |    5 +
 37 files changed, 2026 insertions(+), 425 deletions(-)
 create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h

-- 
2.19.2

