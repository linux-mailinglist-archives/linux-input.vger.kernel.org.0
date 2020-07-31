Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03CCD234692
	for <lists+linux-input@lfdr.de>; Fri, 31 Jul 2020 15:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgGaNHc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 09:07:32 -0400
Received: from mail.astralinux.ru ([217.74.38.120]:52526 "EHLO astralinux.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726306AbgGaNHc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 09:07:32 -0400
Received: from [46.148.196.138] (account dmastykin@astralinux.ru HELO [192.168.32.67])
  by astralinux.ru (CommuniGate Pro SMTP 6.2.7)
  with ESMTPSA id 2157173; Fri, 31 Jul 2020 16:04:39 +0300
Subject: UPD: hid-multitouch: goodix: hovering works as touch
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
To:     linux-input@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, benjamin.tissoires@redhat.com
References: <8a538cad-c3f2-6172-1d6e-a18c89b51337@astralinux.ru>
Message-ID: <a2d4bd70-04e7-032d-9e93-b05bb5e9bf2e@astralinux.ru>
Date:   Fri, 31 Jul 2020 16:07:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8a538cad-c3f2-6172-1d6e-a18c89b51337@astralinux.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,
I tried touchscreen with kernel 4.15 (ubuntu) and hid-multitouch gives 
me BTN_TOOL_PEN and BTN_TOUCH events, so both hovering and touching work.
Back to kernel 5.4 I noticed that I don't see BTN_TOUCH among supported 
events, despite of this (hid-multitouch/mt_touch_input_mapping):

case HID_DG_TIPSWITCH:
	if (field->application != HID_GD_SYSTEM_MULTIAXIS) {
		input_set_capability(hi->input, EV_KEY, BTN_TOUCH);
	}
	MT_STORE_FIELD(tip_state);
	return 1;

But after I added:
case HID_DG_ERASER: // comes from my device
	return -1;

BTN_TOUCH appeared again in supported events, and I see it appearing in 
evtest output in the moments of start/stop hovering. I would like to see 
BTN_TOOL_PEN instead...

Please, could you suggest, where could be a problem?
Thank you very much!
Dmitry Mastykin


On 7/30/20 7:23 PM, Dmitry Mastykin wrote:
> Hello all,
> 
> I'm using a notebook with Goodix gt7385p touchscreen controller in HID 
> Protocol Device (I2C bus) mode.
> 
> hid-multitouch driver is servicing this device. I added this to be sure 
> the quirks set:
>      { .driver_data = MT_CLS_WIN_8_DUAL,
>          HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>              I2C_VENDOR_ID_GOODIX,
>              I2C_DEVICE_ID_GOODIX_0113) },
> 
> The problem is that hovering works as touch, and UI menus and buttons 
> are activated before I touch the panel with stylus. I attach evtest 
> output of touching panel be stylus and removing stylus away.
> 
> Trying a wacom pen tablet, borrowed from my daughter, I see that they 
> use such a sequence:
> EV_KEY BTN_TOOL_PEN 1 - start hovering here
> EV_KEY BTN_TOUCH 1 - start touching
> EV_KEY BTN_TOUCH 0 - stop touching
> EV_KEY BTN_TOOL_PEN 0 - stop hovering
> 
> Just to make the touchscreen working I tried to add BTN_TOUCH reports to 
> hid-multitouch for my device. But as soon as I add 
> input_set_capability(hi->input, EV_KEY, BTN_TOUCH), I see BTN_TOUCH 0 / 
> BTN_TOUCH 1 pair in every report.
> 
> So 2 questions that I have:
> 1) is the sequence in evtest.txt correct?
> 2) who may report BTN_TOUCH 0/1 pairs when BTN_TOUCH capability is 
> added? I tried to search with debug messages in hid-input.c and 
> hid-multitouch.c but without success.
> 
> Thank you in advance!
> Dmitry Mastykin
> 
> Here is the citation from dmesg:
> ----------------------------------------------------------------------
> [    5.032956] i2c_hid i2c-GXTP7380:00: i2c-GXTP7380:00 supply vdd not 
> found, using dummy regulator
> [    5.032979] i2c_hid i2c-GXTP7380:00: i2c-GXTP7380:00 supply vddl not 
> found, using dummy regulator                [    5.088245] input: 
> GXTP7380:00 27C6:0113 Touchscreen as 
> /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-9/i
> 2c-GXTP7380:00/0018:27C6:0113.0001/input/input14 
>                                             [    5.109607] input: 
> GXTP7380:00 27C6:0113 as 
> /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-9/i2c-GXTP7380:
> 00/0018:27C6:0113.0001/input/input15 
>                                             [    5.112486] input: 
> GXTP7380:00 27C6:0113 as 
> /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-9/i2c-GXTP7380:
> 00/0018:27C6:0113.0001/input/input16 
>                                             [    5.112561] hid-generic 
> 0018:27C6:0113.0001: input,hidraw0: I2C HID v1.00 Device [GXTP7380:00 
> 27C6:0113] on i2c-G
> XTP7380:00                                            [    6.417241] 
> input: GXTP7380:00 27C6:0113 as 
> /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-9/i2c-GXTP7380:
> 00/0018:27C6:0113.0001/input/input20 
>                                             [    6.417833] input: 
> GXTP7380:00 27C6:0113 Stylus as 
> /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-9/i2c-GX
> TP7380:00/0018:27C6:0113.0001/input/input21 
>                                             [    6.417902] input: 
> GXTP7380:00 27C6:0113 UNKNOWN as 
> /devices/pci0000:00/0000:00:17.0/i2c_designware.4/i2c-9/i2c-G
> XTP7380:00/0018:27C6:0113.0001/input/input22 
>                                             [    6.417973] 
> hid-multitouch 0018:27C6:0113.0001: input,hidraw0: I2C HID v1.00 Device 
> [GXTP7380:00 27C6:0113] on i2
> c-GXTP7380:00


evtest.txt
Input driver version is 1.0.1
Input device ID: bus 0x18 vendor 0x27c6 product 0x113 version 0x100
Input device name: "GXTP7380:00 27C6:0113 Stylus"
Supported events:
   Event type 0 (EV_SYN)
   Event type 1 (EV_KEY)
   Event type 3 (EV_ABS)
     Event code 47 (ABS_MT_SLOT)
       Value      0
       Min        0
       Max        9
     Event code 53 (ABS_MT_POSITION_X)
       Value      0
       Min        0
       Max      960
       Resolution       4
     Event code 54 (ABS_MT_POSITION_Y)
       Value      0
       Min        0
       Max      540
       Resolution       3
     Event code 57 (ABS_MT_TRACKING_ID)
       Value      0
       Min        0
       Max    65535
     Event code 58 (ABS_MT_PRESSURE)
       Value      0
       Min        0
       Max     1023
     Event code 59 (ABS_MT_DISTANCE)
       Value      0
       Min        0
       Max        1
Properties:
   Property type 1 (INPUT_PROP_DIRECT)
Testing ... (interrupt to exit)
Event: time 1596124249.087943, type 3 (EV_ABS), code 57 
(ABS_MT_TRACKING_ID), value 0
Event: time 1596124249.087943, type 3 (EV_ABS), code 53 
(ABS_MT_POSITION_X), value 599
Event: time 1596124249.087943, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 340
Event: time 1596124249.087943, type 3 (EV_ABS), code 59 
(ABS_MT_DISTANCE), value 1
Event: time 1596124249.087943, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 139
Event: time 1596124249.087943, -------------- SYN_REPORT ------------
Event: time 1596124249.097234, type 3 (EV_ABS), code 59 
(ABS_MT_DISTANCE), value 0
Event: time 1596124249.097234, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 201
Event: time 1596124249.097234, -------------- SYN_REPORT ------------
Event: time 1596124249.101803, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 260
Event: time 1596124249.101803, -------------- SYN_REPORT ------------
Event: time 1596124249.112267, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 289
Event: time 1596124249.112267, -------------- SYN_REPORT ------------
Event: time 1596124249.116674, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 266
Event: time 1596124249.116674, -------------- SYN_REPORT ------------
Event: time 1596124249.127249, type 3 (EV_ABS), code 53 
(ABS_MT_POSITION_X), value 598
Event: time 1596124249.127249, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 223
Event: time 1596124249.127249, -------------- SYN_REPORT ------------
Event: time 1596124249.131745, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 339
Event: time 1596124249.131745, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 181
Event: time 1596124249.131745, -------------- SYN_REPORT ------------
Event: time 1596124249.142256, type 3 (EV_ABS), code 53 
(ABS_MT_POSITION_X), value 597
Event: time 1596124249.142256, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 338
Event: time 1596124249.142256, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 161
Event: time 1596124249.142256, -------------- SYN_REPORT ------------
Event: time 1596124249.146603, type 3 (EV_ABS), code 53 
(ABS_MT_POSITION_X), value 596
Event: time 1596124249.146603, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 337
Event: time 1596124249.146603, type 3 (EV_ABS), code 59 
(ABS_MT_DISTANCE), value 1
Event: time 1596124249.146603, type 3 (EV_ABS), code 58 
(ABS_MT_PRESSURE), value 0
Event: time 1596124249.146603, -------------- SYN_REPORT ------------
Event: time 1596124249.172060, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 336
Event: time 1596124249.172060, -------------- SYN_REPORT ------------
Event: time 1596124249.202273, type 3 (EV_ABS), code 53 
(ABS_MT_POSITION_X), value 595
Event: time 1596124249.202273, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 335
Event: time 1596124249.202273, -------------- SYN_REPORT ------------
Event: time 1596124249.206695, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 334
Event: time 1596124249.206695, -------------- SYN_REPORT ------------
Event: time 1596124249.217088, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 333
Event: time 1596124249.217088, -------------- SYN_REPORT ------------
Event: time 1596124249.232096, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 331
Event: time 1596124249.232096, -------------- SYN_REPORT ------------
Event: time 1596124249.236768, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 330
Event: time 1596124249.236768, -------------- SYN_REPORT ------------
Event: time 1596124249.247150, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 329
Event: time 1596124249.247150, -------------- SYN_REPORT ------------
Event: time 1596124249.251871, type 3 (EV_ABS), code 54 
(ABS_MT_POSITION_Y), value 328
Event: time 1596124249.251871, -------------- SYN_REPORT ------------
Event: time 1596124249.262288, type 3 (EV_ABS), code 57 
(ABS_MT_TRACKING_ID), value -1
Event: time 1596124249.262288, -------------- SYN_REPORT ------------

