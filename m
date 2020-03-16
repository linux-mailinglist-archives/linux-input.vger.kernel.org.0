Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F736186539
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 07:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbgCPGuq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 02:50:46 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:11317 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbgCPGup (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 02:50:45 -0400
IronPort-SDR: yopZ0fa95hozAXFaNnY16/eUJz2Fy2j84cWcqyqhZ9m8cCqMkbGmY+GLbsiLx+fRtgKmyzrQ3r
 tIVZBzuigdgPDOlc6DtXVqZwdjZ60y0hjG8K5ux3I4hSYOMzwSkWnH1TyeV/UW2GhYMf1gzsAK
 d1OgcN+tNfZyfz5X0ztuhrIGNcWe7slNCXo2czzvtpyrWXFN4IlGDjUMu3DSCULuR0J3BgJc1D
 kUI5rcS3i4Qi8fcWwy3WxQPk0tZKuoG+4L0QVLBhS4eYvt3QHL1u8OOx+FZA3zvlkds4TZP1e6
 /Ps=
X-IronPort-AV: E=Sophos;i="5.70,559,1574150400"; 
   d="scan'208";a="46679780"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 15 Mar 2020 22:50:44 -0800
IronPort-SDR: Ct0067OwoT8YCB+CAlNu2H4E9g8nveja56q8oPYtRr7Dc72Onpou7kab40qZ2kK1tjDuKrMPwl
 1jKH5Qtl0P4VJJkrmkHwnnBiXlEYvRS6kRlR9c0BErPrveGzBr6HXzL/nQu4ao99DX16I+LttD
 xfXtI0fZL+Kt17chSKLNleGLwAtsWwwHF1BMH2G8dGdXDWCQ/5wNb7/G4NOxXt99RWsP8knJGR
 U6cHqcflX7T3HVifMuRfqUnxhs3v4wmN6WwyfTCUAmAPQEM/OIYnYFiMMUKuomE6unwbNfAKiN
 1fU=
Subject: Re: [PATCH v7 00/48] atmel_mxt_ts misc
To:     Dmitry Osipenko <digetx@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <rydberg@bitmath.org>,
        <dmitry.torokhov@gmail.com>, <nick@shmanahar.org>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <c583d151-9243-cbde-a04b-bc0389d9be5a@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <caf51d41-07d0-37db-e19c-d8e2594349ae@mentor.com>
Date:   Mon, 16 Mar 2020 15:50:30 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c583d151-9243-cbde-a04b-bc0389d9be5a@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/03/13 0:21, Dmitry Osipenko wrote:
> 12.02.2020 11:41, Jiada Wang пишет:
>> This patch-set forward ports Nick Dyer's work in ndyer/linux github repository
>> as long as some other features and fixes
>>
>> Balasubramani Vivekanandan (2):
>>    Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c
>>      transaction
>>    Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin
>>
>> Dean Jenkins (1):
>>    Input: atmel_mxt_ts: return error from
>>      mxt_process_messages_until_invalid()
>>
>> Deepak Das (6):
>>    Input: Atmel: improve error handling in mxt_start()
>>    Input: Atmel: improve error handling in mxt_initialize()
>>    Input: Atmel: improve error handling in mxt_update_cfg()
>>    Input: Atmel: Improve error handling in mxt_initialize_input_device()
>>    Input: Atmel: handle ReportID "0x00" while processing T5 messages
>>    Input: Atmel: use T44 object to process T5 messages
>>
>> George G. Davis (1):
>>    input: atmel_mxt_ts: export GPIO reset line via sysfs
>>
>> Jiada Wang (3):
>>    Input: introduce input_mt_report_slot_inactive
>>    Input: atmel_mxt_ts - eliminate data->raw_info_block
>>    Input: atmel_mxt_ts - Fix compilation warning
>>
>> Karl Tsou (1):
>>    Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
>>
>> Kautuk Consul (2):
>>    Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
>>    Input: atmel_mxt_ts - rely on calculated_crc rather than file
>>      config_crc
>>
>> Naveen Chakka (2):
>>    input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen
>>      status
>>    input: atmel_mxt_ts: added sysfs interface to update atmel T38 data
>>
>> Nick Dyer (26):
>>    Input: atmel_mxt_ts - rework sysfs init/remove
>>    Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when
>>      necessary
>>    Input: atmel_mxt_ts - split large i2c transfers into blocks
>>    Input: atmel_mxt_ts - output status from T48 Noise Supression
>>    Input: atmel_mxt_ts - output status from T42 Touch Suppression
>>    Input: atmel_mxt_ts - implement T9 vector/orientation support
>>    Input: atmel_mxt_ts - implement T15 Key Array support
>>    Input: atmel_mxt_ts - handle reports from T47 Stylus object
>>    Input: atmel_mxt_ts - implement support for T107 active stylus
>>    Input: atmel_mxt_ts - release touch state during suspend
>>    Input: atmel_mxt_ts - add regulator control support
>>    Input: atmel_mxt_ts - report failures in suspend/resume
>>    Input: atmel_mxt_ts - allow specification of firmware file name
>>    Input: atmel_mxt_ts - handle cfg filename via pdata/sysfs
>>    Input: atmel_mxt_ts - allow input name to be specified in platform
>>      data
>>    Input: atmel_mxt_ts - refactor firmware flash to extract context into
>>      struct
>>    Input: atmel_mxt_ts - refactor code to enter bootloader into separate
>>      func
>>    Input: atmel_mxt_ts - combine bootloader version query with probe
>>    Input: atmel_mxt_ts - improve bootloader state machine handling
>>    Input: atmel_mxt_ts - rename bl_completion to chg_completion
>>    Input: atmel_mxt_ts - make bootloader interrupt driven
>>    Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
>>    Input: atmel_mxt_ts - implement I2C retries
>>    Input: atmel_mxt_ts - orientation is not present in hover
>>    Input: atmel_mxt_ts - implement debug output for messages
>>    Input: atmel_mxt_ts - implement improved debug message interface
>>
>> Nikhil Ravindran (1):
>>    Input: atmel_mxt_ts: Add support for run self-test routine.
>>
>> Sanjeev Chugh (1):
>>    Input: atmel_mxt_ts: Implement synchronization during various
>>      operation
>>
>> karl tsou (1):
>>    Input: atmel_mxt_ts - add config checksum attribute to sysfs
>>
>> keerthikumarp (1):
>>    input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel
>>      touch panel controller in detachable displays.
>>
>> ---
>> v7:
>> Fix regression found when updating firmware
>> Following commits have been updated to fix regression found when
>> updating firmware
>> Input: atmel_mxt_ts - improve bootloader state machine handling
>> Input: atmel_mxt_ts - make bootloader interrupt driven
>> input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen status
>> Input: atmel_mxt_ts: Implement synchronization during various operation
>>
>> v6:
>> Fix issue in commit ("Input: introduce input_mt_report_slot_inactive")
>> reported by kernel test robot
>>
>> v5:
>> Following commits have been updated to address warnings & errors
>> reported by kbuild test robot
>> Input: atmel_mxt_ts - make bootloader interrupt driven
>> Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
>>
>> Following commit has been updated
>> Input: introduce input_mt_report_slot_inactive
>>
>> v4:
>> Following commit in v3 patch-set has been removed
>> Input: switch to use return value of input_mt_report_slot_state
>>
>> Following commit has been updated to address checkpatch warning
>> Input: atmel_mxt_ts: Implement synchronization during various operation
>>
>> v3:
>> Following commits have been updated compared to v2 patchset
>> Input: atmel_mxt_ts - implement debug output for messages
>> - added inline comment
>> Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msg
>> - changed dev_info() to dev_dbg()
>>
>> v2:
>> Following commit in v1 patchset has been split into two commits
>> Input: introduce input_mt_report_slot_inactive
>>
>> Following commits have been updated compared to v1 patchset
>> Input: atmel_mxt_ts - split large i2c transfers into blocks
>> Input: atmel_mxt_ts - output status from T42 Touch Suppression
>>
>> Following commits in v1 patchset have been squashed
>> Input: touchscreen: Atmel: Add device tree support for T15 key array
>> objects
>> Input: atmel_mxt_ts - check data->input_dev is not null in
>> mxt_input_sync()
>> Input: atmel_mxt_ts - check firmware format before entering bootloader
>> Input: atmel_mxt_ts: update stale use_retrigen_workaround flag
>> input: atmel_mxt_ts: move bootloader probe from mxt_initialize()
>> input: Atmel: limit the max bytes transferred while reading T5 messages
>> Input: atmel_mxt_ts: Use msecs_to_jiffies() instead of HZ
>> Input: atmel_mxt_ts: Use complete when in_bootloader true
>> Input: atmel_mxt_ts: Prevent crash due to freeing of input device
>> input: atmel_mxt_ts: Add NULL check for sysfs attribute debug_msg_attr
>>
>> Following commits in v1 patchset have been dropped:
>> Input: atmel_mxt_ts - configure and use gpios as real gpios
>> Input: touchscreen: Atmel: Enable IRQ_DISABLE_UNLAZY flag for interrupt
>> Input: atmel_mxt_ts - add memory access interface via sysfs
>> Input: atmel_mxt_ts: Remove sysfs attributes during driver detach
>> Input: atmel_mxt_ts: Avoid race condition in freeing of input device
>>
>>
>> v1: initial version
>> ---
>>   .../bindings/input/atmel,maxtouch.txt         |   14 +
>>   MAINTAINERS                                   |    1 +
>>   drivers/hid/hid-alps.c                        |    3 +-
>>   drivers/hid/hid-multitouch.c                  |    6 +-
>>   drivers/input/misc/xen-kbdfront.c             |    2 +-
>>   drivers/input/mouse/elan_i2c_core.c           |    2 +-
>>   drivers/input/touchscreen/atmel_mxt_ts.c      | 2270 ++++++++++++++---
>>   drivers/input/touchscreen/cyttsp4_core.c      |    5 +-
>>   drivers/input/touchscreen/cyttsp_core.c       |    2 +-
>>   drivers/input/touchscreen/melfas_mip4.c       |    4 +-
>>   drivers/input/touchscreen/mms114.c            |    2 +-
>>   drivers/input/touchscreen/raspberrypi-ts.c    |    2 +-
>>   drivers/input/touchscreen/stmfts.c            |    2 +-
>>   include/dt-bindings/input/atmel_mxt_ts.h      |   22 +
>>   include/linux/input/mt.h                      |    5 +
>>   15 files changed, 1985 insertions(+), 357 deletions(-)
>>   create mode 100644 include/dt-bindings/input/atmel_mxt_ts.h
>>
> 
> Hello Jiada,
> 
> Please run all the patches through `scripts/checkpatch.pl --strict` and
> fix all the reported problems.
> 
Thanks, I will try to address checkpatch issues in v8 patch-set

Thanks,
Jiada
> Otherwise this is a very good series, it makes MXT1386 to work because
> I2C retying is indeed required for that controller.
> 
