Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE2F5136CB3
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 13:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgAJME1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 07:04:27 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:62295 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgAJME0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 07:04:26 -0500
IronPort-SDR: qIk/cjE2WgmyMkaspzJQ4sEJ/+brNoBrjUWFwlMxRQ+Jeqraah6h4/FrZa/YNiujfm6qhQEwiz
 I0f3IUpB/WaN5+mHCL462Du/AnPfEOodxlkowDZo360IF70AICzQ8S9SElDooBFTquuzxDqZIh
 q/yY5TeSicfHSFD+CIHLytLVwBga5NB9meZo+6Qk+chUg1tOymPgTTTlJae0+fsF4IgG7p8bf1
 ZaejQ7+FDlEtgiU0CkeaqnCG/saUyo5SYpbMloc38AUN7BNthwAtevSEY6dtpqQ/5UDRy/rcW3
 EG8=
X-IronPort-AV: E=Sophos;i="5.69,416,1571731200"; 
   d="scan'208";a="44750844"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 10 Jan 2020 04:04:25 -0800
IronPort-SDR: kqb6zirkvlhedIeHP4tzq5xFurIzAP11wA4EHtU4ITzoBrBc+zkWGGOb5UQAegYcgYeUablmQL
 g2TgM2ACSftgVoTakkTfDD2xIsdd0nCD4sl+mV4ib1ZmpfoSqF1qcV4C9nXWtIdGOp21+eKDKW
 +PJoIdX+b+Z12X+20uDn7Me0pawZ7cc2z2rKEGkFu++tZnIdX7MuokXOVrLnYQuwGyr+BPQ7uI
 449wwSCJUC43HhLmzJqkYLLkPAj5ZPeKdxYnarm++hiLvxlgJES/v0Z7BtRAdumJPNqx1ag/Us
 Rio=
Subject: Re: [PATCH v6 00/48] atmel_mxt_ts misc
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <ce60178b-475a-4234-5b36-b7a4daa6ad46@mentor.com>
Date:   Fri, 10 Jan 2020 21:04:16 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello dmitry and all

Kind reminder on this patch-set

Thanks,
Jiada

On 2019/11/22 17:23, Jiada Wang wrote:
> This patch-set forward ports Nick Dyer's work in ndyer/linux github repository
> as long as some other features and fixes
> 
> Balasubramani Vivekanandan (2):
>    Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c
>      transaction
>    Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin
> 
> Dean Jenkins (1):
>    Input: atmel_mxt_ts: return error from
>      mxt_process_messages_until_invalid()
> 
> Deepak Das (6):
>    Input: Atmel: improve error handling in mxt_start()
>    Input: Atmel: improve error handling in mxt_initialize()
>    Input: Atmel: improve error handling in mxt_update_cfg()
>    Input: Atmel: Improve error handling in mxt_initialize_input_device()
>    Input: Atmel: handle ReportID "0x00" while processing T5 messages
>    Input: Atmel: use T44 object to process T5 messages
> 
> George G. Davis (1):
>    input: atmel_mxt_ts: export GPIO reset line via sysfs
> 
> Jiada Wang (3):
>    Input: introduce input_mt_report_slot_inactive
>    Input: atmel_mxt_ts - eliminate data->raw_info_block
>    Input: atmel_mxt_ts - Fix compilation warning
> 
> Karl Tsou (1):
>    Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
> 
> Kautuk Consul (2):
>    Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
>    Input: atmel_mxt_ts - rely on calculated_crc rather than file
>      config_crc
> 
> Naveen Chakka (2):
>    input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen
>      status
>    input: atmel_mxt_ts: added sysfs interface to update atmel T38 data
> 
> Nick Dyer (26):
>    Input: atmel_mxt_ts - rework sysfs init/remove
>    Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when
>      necessary
>    Input: atmel_mxt_ts - split large i2c transfers into blocks
>    Input: atmel_mxt_ts - output status from T48 Noise Supression
>    Input: atmel_mxt_ts - output status from T42 Touch Suppression
>    Input: atmel_mxt_ts - implement T9 vector/orientation support
>    Input: atmel_mxt_ts - implement T15 Key Array support
>    Input: atmel_mxt_ts - handle reports from T47 Stylus object
>    Input: atmel_mxt_ts - implement support for T107 active stylus
>    Input: atmel_mxt_ts - release touch state during suspend
>    Input: atmel_mxt_ts - add regulator control support
>    Input: atmel_mxt_ts - report failures in suspend/resume
>    Input: atmel_mxt_ts - allow specification of firmware file name
>    Input: atmel_mxt_ts - handle cfg filename via pdata/sysfs
>    Input: atmel_mxt_ts - allow input name to be specified in platform
>      data
>    Input: atmel_mxt_ts - refactor firmware flash to extract context into
>      struct
>    Input: atmel_mxt_ts - refactor code to enter bootloader into separate
>      func
>    Input: atmel_mxt_ts - combine bootloader version query with probe
>    Input: atmel_mxt_ts - improve bootloader state machine handling
>    Input: atmel_mxt_ts - rename bl_completion to chg_completion
>    Input: atmel_mxt_ts - make bootloader interrupt driven
>    Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
>    Input: atmel_mxt_ts - implement I2C retries
>    Input: atmel_mxt_ts - orientation is not present in hover
>    Input: atmel_mxt_ts - implement debug output for messages
>    Input: atmel_mxt_ts - implement improved debug message interface
> 
> Nikhil Ravindran (1):
>    Input: atmel_mxt_ts: Add support for run self-test routine.
> 
> Sanjeev Chugh (1):
>    Input: atmel_mxt_ts: Implement synchronization during various
>      operation
> 
> karl tsou (1):
>    Input: atmel_mxt_ts - add config checksum attribute to sysfs
> 
> keerthikumarp (1):
>    input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel
>      touch panel controller in detachable displays.
> 
> ---
> v6:
> Fix issue in commit ("Input: introduce input_mt_report_slot_inactive")
> reported by kernel test robot
> 
> v5:
> Following commits have been updated to address warnings & errors
> reported by kbuild test robot
> Input: atmel_mxt_ts - make bootloader interrupt driven
> Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
> 
> Following commit has been updated
> Input: introduce input_mt_report_slot_inactive
> 
> v4:
> Following commit in v3 patch-set has been removed
> Input: switch to use return value of input_mt_report_slot_state
> 
> Following commit has been updated to address checkpatch warning
> Input: atmel_mxt_ts: Implement synchronization during various operation
> 
> v3:
> Following commits have been updated compared to v2 patchset
> Input: atmel_mxt_ts - implement debug output for messages
> - added inline comment
> Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msg
> - changed dev_info() to dev_dbg()
> 
> v2:
> Following commit in v1 patchset has been split into two commits
> Input: introduce input_mt_report_slot_inactive
> 
> Following commits have been updated compared to v1 patchset
> Input: atmel_mxt_ts - split large i2c transfers into blocks
> Input: atmel_mxt_ts - output status from T42 Touch Suppression
> 
> Following commits in v1 patchset have been squashed
> Input: touchscreen: Atmel: Add device tree support for T15 key array objects
> Input: atmel_mxt_ts - check data->input_dev is not null in mxt_input_sync()
> Input: atmel_mxt_ts - check firmware format before entering bootloader
> Input: atmel_mxt_ts: update stale use_retrigen_workaround flag
> input: atmel_mxt_ts: move bootloader probe from mxt_initialize()
> input: Atmel: limit the max bytes transferred while reading T5 messages
> Input: atmel_mxt_ts: Use msecs_to_jiffies() instead of HZ
> Input: atmel_mxt_ts: Use complete when in_bootloader true
> Input: atmel_mxt_ts: Prevent crash due to freeing of input device
> input: atmel_mxt_ts: Add NULL check for sysfs attribute debug_msg_attr
> 
> Following commits in v1 patchset have been dropped:
> Input: atmel_mxt_ts - configure and use gpios as real gpios
> Input: touchscreen: Atmel: Enable IRQ_DISABLE_UNLAZY flag for interrupt
> Input: atmel_mxt_ts - add memory access interface via sysfs
> Input: atmel_mxt_ts: Remove sysfs attributes during driver detach
> Input: atmel_mxt_ts: Avoid race condition in freeing of input device
> 
> 
> v1: initial version
> ---
>   .../bindings/input/atmel,maxtouch.txt         |   14 +
>   MAINTAINERS                                   |    1 +
>   drivers/hid/hid-alps.c                        |    3 +-
>   drivers/hid/hid-multitouch.c                  |    6 +-
>   drivers/input/input-mt.c                      |    2 +-
>   drivers/input/misc/xen-kbdfront.c             |    2 +-
>   drivers/input/mouse/elan_i2c_core.c           |    2 +-
>   drivers/input/touchscreen/atmel_mxt_ts.c      | 2266 ++++++++++++++---
>   drivers/input/touchscreen/cyttsp4_core.c      |    5 +-
>   drivers/input/touchscreen/cyttsp_core.c       |    2 +-
>   drivers/input/touchscreen/melfas_mip4.c       |    4 +-
>   drivers/input/touchscreen/mms114.c            |    2 +-
>   drivers/input/touchscreen/raspberrypi-ts.c    |    2 +-
>   drivers/input/touchscreen/stmfts.c            |    2 +-
>   include/dt-bindings/input/atmel_mxt_ts.h      |   22 +
>   include/linux/input/mt.h                      |    5 +
>   16 files changed, 1984 insertions(+), 356 deletions(-)
>   create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h
> 
