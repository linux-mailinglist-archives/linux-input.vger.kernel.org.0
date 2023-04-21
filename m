Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5D26EAAFD
	for <lists+linux-input@lfdr.de>; Fri, 21 Apr 2023 14:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbjDUMyK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Apr 2023 08:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjDUMyI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Apr 2023 08:54:08 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A35E44A8
        for <linux-input@vger.kernel.org>; Fri, 21 Apr 2023 05:54:07 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-95678d891d6so217760466b.1
        for <linux-input@vger.kernel.org>; Fri, 21 Apr 2023 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682081645; x=1684673645;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tffwA8++0LsNwftCbiEQFGa9DgonCFTm4qBM4xY4JiU=;
        b=M9Z+o0HtdOl6XzeRkruMn2N07d1iGBTGPdyM8avbk+9ZExrAqBurI5x8btMXFDhdob
         7YdgMaVFqb2LwuhxSQ0UD9QgczzFHGYlvZ3dmGoPJ2g47S1izqDiuW4m/HhVrMujF7Ic
         q79HWC1gxo2YBO39t6mB1xPjWL/0zXqjQn8/7KrFgVBH8q/4m2vjVuRDArq76K8RI86H
         Xpf1zvC8sHa2fTJlcPLU+VXEl7SBVtu2pc8eK8lm2r66pEeqM8kX+Qiks+uOVNNodBSG
         q96bJ+nMOV1lv18AiQFcb6Fl0pwEAPs9NalHbs4+K1nV5Eyj6LLWoBXGA/YEyIWlgOq1
         VsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682081645; x=1684673645;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tffwA8++0LsNwftCbiEQFGa9DgonCFTm4qBM4xY4JiU=;
        b=UD3Um3qzWgc7ughDIe1CrO23Ind9of/0dj2eBXm/o3J1q7VbBNkFh6pY34tQxpHq6c
         x2iCSnwxUvfXCj9hayAkQ/1d5lsUPDGDfIgj1z04MIycUgAruIUaWPvzPAqqIO0fVE7Q
         DUN5f2t21flcJH7AZh60BiVcWP0/t0sgF8vxAnQJsa1eZOUwUMsh6zQrevqSUTRQoXSB
         hKmtNGak4f2K5x6ey3pJbF4MHg9EhITGXKwx6Or5vFj8Zp8GBegbfhfqMQAQ7kwut35V
         1xA9WHddQkAaezqpUHwHvYh9nkTZVpzanm5EH8PYvAZ3MlaHajqV1TKulpyAFhgIWYKE
         osLA==
X-Gm-Message-State: AAQBX9cOsUbOt03V+hof4ZYPWKgM4OtQkfd5lVm3GR/lZy8rzdvc2+Ix
        6F5kiWeBJdwjN3XEa5skZ7UuK2xhjqmji+H9cYjP71pZ
X-Google-Smtp-Source: AKy350YVN3XEReA/ISSMlvmq+sc5ZX4eguAkNfQz/GNXJZbWJLzMIfP74yRlwYW/OebenWsxG4Mf/9P9SutvHGwFWpU=
X-Received: by 2002:a17:907:1046:b0:94f:161d:e927 with SMTP id
 oy6-20020a170907104600b0094f161de927mr2385110ejb.41.1682081645503; Fri, 21
 Apr 2023 05:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAPNj2HJdA6uZ9xvvHsVNAFjS88-xALwOCXT1Hv4A5AG-HismAQ@mail.gmail.com>
In-Reply-To: <CAPNj2HJdA6uZ9xvvHsVNAFjS88-xALwOCXT1Hv4A5AG-HismAQ@mail.gmail.com>
From:   =?UTF-8?B?RnLDqWTDqXJpYyBMYW1vcmNl?= <frederic.lamorce@gmail.com>
Date:   Fri, 21 Apr 2023 08:53:39 -0400
Message-ID: <CAPNj2HJfbYXk1AOt-sX85sG_x90vG++=aLg8QN1kFL059srwnQ@mail.gmail.com>
Subject: [BUG] sysfs: cannot create duplicate filename, with Lenovo keyboard
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

kernel warning about a duplicate filename in sysfs after a resume.

CPU: AMD 5600H
distro : MX-21.3_ahs_x64 Wildflower September 18  2022 base: Debian
GNU/Linux 11 (bullseye)
kernel tested: 6.1.0-6mx-amd64 ; 6.1.0-7mx-amd64 ;
6.2.10-1-liquorix-amd64 ; 6.2.11-3-liquorix-amd64

I am using a Lenovo TrackPoint Keyboard II, it's a keyboard with an
integrated trackpad. It is paired in bluetooth mode. It is using the
hid-lenovo module.
Bluetooth is using mediatek mt7921e and btusb

After a suspend/resume, sometimes, there is a kernel warning in dmesg.
Maybe because the keyboard and mouse are using the same MAC address
and it tries to re-create the battery info?


[22706.169919] sysfs: cannot create duplicate filename
'/class/power_supply/hid-d8:ab:24:63:e7:77-battery'
[22706.169928] CPU: 2 PID: 41456 Comm: kworker/2:1 Tainted: P
 O       6.2.11-3-liquorix-amd64 #1  liquorix 6.2-16~mx21+1
[22706.169934] Hardware name: AZW SER/SER, BIOS V1.15_P4C7M43_Blink 09/17/2022
[22706.169937] Workqueue: events uhid_device_add_worker [uhid]
[22706.169955] Call Trace:
[22706.169960]  <TASK>
[22706.169962]  dump_stack_lvl+0x44/0x60
[22706.169973]  sysfs_warn_dup+0x57/0x70
[22706.169979]  sysfs_create_link+0xc2/0xd0
[22706.169983]  device_add+0x208/0xb70
[22706.169991]  __power_supply_register+0x27b/0x420
[22706.169999]  hidinput_setup_battery.isra.0+0x19e/0x240
[22706.170007]  hidinput_connect+0x1326/0x4e60
[22706.170016]  hid_connect+0x581/0x5d0
[22706.170021]  hid_hw_start+0x41/0x70
[22706.170025]  lenovo_probe+0x30/0x670 [hid_lenovo]
[22706.170038]  hid_device_probe+0xf4/0x190
[22706.170044]  really_probe+0x1d6/0x3c0
[22706.170050]  __driver_probe_device+0x72/0xe0
[22706.170054]  driver_probe_device+0x1e/0x170
[22706.170058]  __device_attach_driver+0xac/0x160
[22706.170063]  ? __pfx___device_attach_driver+0x10/0x10
[22706.170068]  bus_for_each_drv+0x7e/0xd0
[22706.170073]  device_initial_probe+0xfd/0x1e0
[22706.170079]  bus_probe_device+0xa8/0xc0
[22706.170083]  device_add+0x3ec/0xb70
[22706.170088]  hid_add_device+0xf8/0x3b0
[22706.170092]  ? od_dbs_update+0xb9/0x190
[22706.170099]  uhid_device_add_worker+0x15/0x60 [uhid]
[22706.170108]  process_one_work+0x1dc/0x3e0
[22706.170115]  worker_thread+0x4d/0x460
[22706.170121]  ? __pfx_worker_thread+0x10/0x10
[22706.170126]  kthread+0xd8/0x100
[22706.170131]  ? __pfx_kthread+0x10/0x10
[22706.170134]  ret_from_fork+0x2c/0x50
[22706.170142]  </TASK>
[22706.170168] lenovo 0005:17EF:60E1.001D: can't register power supply: -17
[22706.170305] input: TrackPoint Keyboard II as
/devices/virtual/misc/uhid/0005:17EF:60E1.001D/input/input42
[22706.171437] lenovo 0005:17EF:60E1.001D: input,hidraw4: BLUETOOTH
HID v0.47 Keyboard [TrackPoint Keyboard II] on 4c:d5:77:f0:c3:6c
[22734.816970] Bluetooth: hci0: ACL packet for unknown connection handle 512
[22735.849582] input: SANWA Gravi Mouse as
/devices/virtual/misc/uhid/0005:1915:0040.001E/input/input43
[22735.850012] input: SANWA Gravi Consumer Control as
/devices/virtual/misc/uhid/0005:1915:0040.001E/input/input44
[22735.851199] hid-generic 0005:1915:0040.001E: input,hidraw2:
BLUETOOTH HID v0.01 Mouse [SANWA Gravi] on 4c:d5:77:f0:c3:6c
[22760.786365] sysfs: cannot create duplicate filename
'/class/power_supply/hid-d8:ab:24:63:e7:77-battery'
[22760.786372] CPU: 6 PID: 37516 Comm: kworker/6:2 Tainted: P
 O       6.2.11-3-liquorix-amd64 #1  liquorix 6.2-16~mx21+1
[22760.786378] Hardware name: AZW SER/SER, BIOS V1.15_P4C7M43_Blink 09/17/2022
[22760.786380] Workqueue: events uhid_device_add_worker [uhid]
[22760.786396] Call Trace:
[22760.786400]  <TASK>
[22760.786402]  dump_stack_lvl+0x44/0x60
[22760.786411]  sysfs_warn_dup+0x57/0x70
[22760.786416]  sysfs_create_link+0xc2/0xd0
[22760.786419]  device_add+0x208/0xb70
[22760.786427]  __power_supply_register+0x27b/0x420
[22760.786434]  hidinput_setup_battery.isra.0+0x19e/0x240
[22760.786441]  hidinput_connect+0x1326/0x4e60
[22760.786449]  hid_connect+0x581/0x5d0
[22760.786454]  hid_hw_start+0x41/0x70
[22760.786459]  lenovo_probe+0x30/0x670 [hid_lenovo]
[22760.786469]  hid_device_probe+0xf4/0x190
[22760.786474]  really_probe+0x1d6/0x3c0
[22760.786478]  __driver_probe_device+0x72/0xe0
[22760.786483]  driver_probe_device+0x1e/0x170
[22760.786487]  __device_attach_driver+0xac/0x160
[22760.786491]  ? __pfx___device_attach_driver+0x10/0x10
[22760.786495]  bus_for_each_drv+0x7e/0xd0
[22760.786499]  device_initial_probe+0xfd/0x1e0
[22760.786504]  bus_probe_device+0xa8/0xc0
[22760.786507]  device_add+0x3ec/0xb70
[22760.786513]  hid_add_device+0xf8/0x3b0
[22760.786517]  uhid_device_add_worker+0x15/0x60 [uhid]
[22760.786526]  process_one_work+0x1dc/0x3e0
[22760.786534]  worker_thread+0x4d/0x460
[22760.786540]  ? __pfx_worker_thread+0x10/0x10
[22760.786545]  kthread+0xd8/0x100
[22760.786549]  ? __pfx_kthread+0x10/0x10
[22760.786553]  ret_from_fork+0x2c/0x50
[22760.786561]  </TASK>
[22760.786575] lenovo 0005:17EF:60E1.001F: can't register power supply: -17
[22760.786781] input: TrackPoint Keyboard II as
/devices/virtual/misc/uhid/0005:17EF:60E1.001F/input/input45
[22760.787191] lenovo 0005:17EF:60E1.001F: input,hidraw4: BLUETOOTH
HID v0.47 Keyboard [TrackPoint Keyboard II] on 4c:d5:77:f0:c3:6c
