Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFFF1F7FDC
	for <lists+linux-input@lfdr.de>; Sat, 13 Jun 2020 02:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgFMAIO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jun 2020 20:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbgFMAIO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jun 2020 20:08:14 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B2BC03E96F
        for <linux-input@vger.kernel.org>; Fri, 12 Jun 2020 17:08:13 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id q19so11742322eja.7
        for <linux-input@vger.kernel.org>; Fri, 12 Jun 2020 17:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mU9mfrVcF29Cpn62z/lheljRf8PhJJk0QKY3zr5pd20=;
        b=SXRactYhIUSH6rFauWn+o+GOAXzf1YNKbThd5HModIJ6rzDmdeWmw092+uLebTqT/v
         evIc8HfzLl1nncmZZlqMvfZQ2vk1jlEh2O6LAAkATBKVkdhsIKJ+lEIKmNqO5wI41NMk
         AbIqiTw2PNQPhF75rd/26F03HdDgc7UnJ2f847rXim6AilrXxvrh0dkNESu/kRzjANch
         0RmteZQlhwHNN5jRKSDRlmpM8HMw4ScrR1mhhdZyuLbD3B+vT2q+3Hba1LMm4lkD4vz+
         m+hpQA0taJnJXB1DFD6YWEKxomEy9E+aoV2bEm024BZpS5Ic4GAJzFqpAVwHNXeBgt4r
         /p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mU9mfrVcF29Cpn62z/lheljRf8PhJJk0QKY3zr5pd20=;
        b=Eb8h9LzA7B5hTZhu+aCaAMVaWw7WTuw3GOLwwj45PFKsnUtWozhuitsy9XEnTg8RID
         PevcCbE4GtZgFY7AS5AL4x5vfBxMmqac+RLceNrMbLlVe2uG6MJxs5jg+M22jNv5dmfs
         N9yYlGPSKcqSgtoMv6qvJjEu77b5dcFp/w9LPK6CRSXsZKY/X1jkH6y02gOpZWN97A1g
         sTxKLgoa/D2THv55HJoDznmQxdxbtJN3IUgDBn+B/cfi0nVb6I67y3AUzWM7tnh1tuqM
         e8zouh1Tc2CYtvpDg24ZP/b3XUZ8Bp93y5kGHxA7ywVPCzW0UAvV7AopPa6S0jpanNsu
         adjg==
X-Gm-Message-State: AOAM531qfJQ8JEXn3DBZa7/89YGUCGMfyTf4RwkcQJutOqsew1BY8B9S
        mdw9gxya3+T8o8RTYfYENbQebop/MSENf9q7WvsMZizav8s=
X-Google-Smtp-Source: ABdhPJxviJmiszsWFeGyQLzScBkq52H5RvBcp5+pml5MScOcHlc22J19qVeuNO0KKGbnFl4IHFXRTk4pwLgzd+JXHoI=
X-Received: by 2002:a17:906:a458:: with SMTP id cb24mr15279804ejb.5.1592006891398;
 Fri, 12 Jun 2020 17:08:11 -0700 (PDT)
MIME-Version: 1.0
From:   Siarhei Vishniakou <svv@google.com>
Date:   Fri, 12 Jun 2020 19:07:59 -0500
Message-ID: <CAKF84v0xsK2d+XEEnNC+SnE987fDaD=RyvZzZW3ew8L4K0JHzg@mail.gmail.com>
Subject: Kasan crash in hid-steam
To:     linux-input <linux-input@vger.kernel.org>,
        rodrigorivascosta@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I'm doing testing of hid-steam using uhid, and found the following crash:

[30248.140908] c4   3226 hid-steam 0003:28DE:1102.0009: : USB HID
v0.00 Device [Steam Controller - USB (Test)] on
[30248.141833] c4   3226 hid-steam 0003:28DE:1102.000A: : USB HID
v0.00 Device [Steam Controller - USB (Test)] on
[30248.142922] c4   3226 hid-steam 0003:28DE:1102.0009: Steam
Controller 'XXXXXXXXXX' connected
[30248.142939] c4   3226
==================================================================
[30248.142962] c4   3226 BUG: KASAN: invalid-access in
__list_add_valid+0x24/0xc0
[30248.142977] c4   3226 Read of size 8 at addr 51ffffc04c383a08 by
task kworker/4:1/3226
[30248.142989] c4   3226 Pointer tag: [51], memory tag: [e7]
[30248.142998] c4   3226
[30248.143015] c4   3226 CPU: 4 PID: 3226 Comm: kworker/4:1 Tainted: G
S         O    4.14.180-g271a34011b63-ab6580010 #1
[30248.143026] c4   3226 Hardware name: Qualcomm Technologies, Inc.
SM8150 V2 PM8150 Google Inc. MSM sm8150 Coral DVT (DT)
[30248.143045] c4   3226 Workqueue: events uhid_device_add_worker
[30248.143057] c4   3226 Call trace:
[30248.143073] c4   3226  dump_backtrace+0x0/0x314
[30248.143087] c4   3226  show_stack+0x20/0x2c
[30248.143102] c4   3226  dump_stack+0x84/0x13c
[30248.143116] c4   3226  print_address_description+0x80/0x30c
[30248.143129] c4   3226  __kasan_report+0x180/0x1b0
[30248.143142] c4   3226  kasan_report+0x10/0x18
[30248.143155] c4   3226  __hwasan_load8_noabort+0x74/0x7c
[30248.143168] c4   3226  __list_add_valid+0x24/0xc0
[30248.143181] c4   3226  steam_register+0x51c/0x5fc
[30248.143194] c4   3226  steam_probe+0x3d8/0x450
[30248.143208] c4   3226  hid_device_probe+0xd0/0x1b8
[30248.143222] c4   3226  really_probe+0x85c/0x960
[30248.143236] c4   3226  driver_probe_device+0x17c/0x1c8
[30248.143250] c4   3226  __device_attach_driver+0x290/0x2e0
[30248.143263] c4   3226  bus_for_each_drv+0xd4/0x13c
[30248.143276] c4   3226  __device_attach+0x108/0x214
[30248.143290] c4   3226  device_initial_probe+0x20/0x2c
[30248.143344] c4   3226  bus_probe_device+0x58/0x104
[30248.143393] c4   3226  device_add+0xbb0/0xee8
[30248.143441] c4   3226  hid_add_device+0x6b0/0x704
[30248.143492] c4   3226  uhid_device_add_worker+0x30/0xa0
[30248.143542] c4   3226  process_one_work+0x524/0x904
[30248.143591] c4   3226  worker_thread+0x53c/0x93c
[30248.143639] c4   3226  kthread+0x1b0/0x1c0
[30248.143706] c4   3226  ret_from_fork+0x10/0x18
[30248.143769] c4   3226
[30248.143833] c4   3226 The buggy address belongs to the page:
[30248.143901] c4   3226 page:ffffffbf0130e0c0 count:1 mapcount:0
mapping:          (null) index:0x0
[30248.143968] c4   3226 flags: 0x39c0000000000000()
[30248.144034] c4   3226 raw: 39c0000000000000 0000000000000000
0000000000000000 00000001ffffffff
[30248.144098] c4   3226 raw: dead000000000100 dead000000000200
0000000000000000 0000000000000000
[30248.144145] c4   3226 page dumped because: kasan: bad access detected
[30248.144190] c4   3226
[30248.144236] c4   3226 Memory state around the buggy address:
[30248.144268] c4   3226  ffffffc04c383800: e7 e7 e7 e7 e7 e7 e7 e7 e7
e7 e7 e7 e7 e7 e7 e7
[30248.144281] c4   3226  ffffffc04c383900: e7 e7 e7 e7 e7 e7 e7 e7 e7
e7 e7 e7 e7 e7 e7 e7
[30248.144294] c4   3226 >ffffffc04c383a00: e7 e7 e7 e7 e7 e7 e7 e7 e7
e7 e7 e7 e7 e7 e7 e7
[30248.144306] c4   3226                    ^
[30248.144319] c4   3226  ffffffc04c383b00: e7 e7 e7 e7 e7 e7 e7 e7 e7
e7 e7 e7 e7 e7 e7 e7
[30248.144367] c4   3226  ffffffc04c383c00: e7 e7 e7 e7 e7 e7 e7 e7 e7
e7 e7 e7 e7 e7 e7 e7
[30248.144414] c4   3226
==================================================================
[30248.144460] c4   3226 Disabling lock debugging due to kernel taint
[30248.144548] c4   3226 Kernel panic - not syncing: panic_on_warn set ...
[30248.144548] c4   3226
[30248.144571] c4   3226 CPU: 4 PID: 3226 Comm: kworker/4:1 Tainted: G
S  B      O    4.14.180-g271a34011b63-ab6580010 #1
[30248.144583] c4   3226 Hardware name: Qualcomm Technologies, Inc.
SM8150 V2 PM8150 Google Inc. MSM sm8150 Coral DVT (DT)
[30248.144598] c4   3226 Workqueue: events uhid_device_add_worker
[30248.144610] c4   3226 Call trace:
[30248.144624] c4   3226  dump_backtrace+0x0/0x314
[30248.144638] c4   3226  show_stack+0x20/0x2c
[30248.144651] c4   3226  dump_stack+0x84/0x13c
[30248.144665] c4   3226  panic+0x1f0/0x3cc
[30248.144679] c4   3226  __kasan_report+0x0/0x1b0
[30248.144692] c4   3226  __kasan_report+0x198/0x1b0
[30248.144705] c4   3226  kasan_report+0x10/0x18
[30248.144718] c4   3226  __hwasan_load8_noabort+0x74/0x7c
[30248.144732] c4   3226  __list_add_valid+0x24/0xc0
[30248.144745] c4   3226  steam_register+0x51c/0x5fc
[30248.144757] c4   3226  steam_probe+0x3d8/0x450
[30248.144771] c4   3226  hid_device_probe+0xd0/0x1b8
[30248.144784] c4   3226  really_probe+0x85c/0x960
[30248.144797] c4   3226  driver_probe_device+0x17c/0x1c8
[30248.144811] c4   3226  __device_attach_driver+0x290/0x2e0
[30248.144824] c4   3226  bus_for_each_drv+0xd4/0x13c
[30248.144837] c4   3226  __device_attach+0x108/0x214
[30248.144850] c4   3226  device_initial_probe+0x20/0x2c
[30248.144863] c4   3226  bus_probe_device+0x58/0x104
[30248.144876] c4   3226  device_add+0xbb0/0xee8
[30248.144889] c4   3226  hid_add_device+0x6b0/0x704
[30248.144903] c4   3226  uhid_device_add_worker+0x30/0xa0
[30248.144917] c4   3226  process_one_work+0x524/0x904
[30248.144930] c4   3226  worker_thread+0x53c/0x93c
[30248.144943] c4   3226  kthread+0x1b0/0x1c0
[30248.144956] c4   3226  ret_from_fork+0x10/0x18
[30248.144969] c4   3226 SMP: stopping secondary CPUs
[30248.144989] c1   1156 CPU1: stopping

It doesn't always reproduce, the rate is about 20%. It looks like some
kind of race having to do with multiple devices being
registered/unregistered.

I don't have good repro steps, since I don't fully understand the
communication expectation between the controller and the host.

Our rough setup is this:
1. SET_REPORT_REPLY is sent whenever SET_REPORT is received by the device.
2. We send GET_REPORT_REPLY with the following data: [0xae, 0x15,
0x01, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09], but
adjusting the data didn't seem to change much.

Here are some user space logs from a good run (no crash):

06-12 18:27:13.851125  1662  1727 I HidCommandDevice: Received
SET_REPORT: id=1 rnum=0 data=0 ae 15 1
--------- switch to kernel
06-12 18:27:13.798089   784   784 I hid-steam 0003: 28DE:1102.0007: :
USB HID v0.00 Device [Steam Controller - USB (Test)] on
06-12 18:27:13.798988   784   784 I hid-steam 0003: 28DE:1102.0008: :
USB HID v0.00 Device [Steam Controller - USB (Test)] on
06-12 18:27:13.800317   784   784 I hid-steam 0003: 28DE:1102.0007:
Steam Controller '' connected
06-12 18:27:13.801880   784   784 I input   : Steam Controller as
/devices/virtual/misc/uhid/0003:28DE:1102.0007/input/input6
--------- switch to main
06-12 18:27:13.851212  1662  1727 I HidCommandDevice: Replying to this report
06-12 18:27:13.851322  1662  1727 I HidCommandDevice: Received
GET_REPORT: id=2 rnum=0
06-12 18:27:13.851886  1662  1727 I HidCommandDevice: Received
SET_REPORT: id=3 rnum=0 data=0 85
06-12 18:27:13.851920  1662  1727 I HidCommandDevice: Replying to this report
06-12 18:27:13.852028  1662  1727 I HidCommandDevice: Received
SET_REPORT: id=4 rnum=0 data=0 8e
06-12 18:27:13.852060  1662  1727 I HidCommandDevice: Replying to this report
06-12 18:27:13.852190  1662  1727 I HidCommandDevice: Received
SET_REPORT: id=5 rnum=0 data=0 87 3 18 1 0
06-12 18:27:13.852226  1662  1727 I HidCommandDevice: Replying to this report
06-12 18:27:13.870766  1662  1727 I HidCommandDevice: Received
SET_REPORT: id=6 rnum=0 data=0 81
06-12 18:27:13.870834  1662  1727 I HidCommandDevice: Replying to this report
06-12 18:27:13.871031  1662  1727 I HidCommandDevice: Received
SET_REPORT: id=7 rnum=0 data=0 87 6 8 7 0 18 0 0
06-12 18:27:13.871066  1662  1727 I HidCommandDevice: Replying to this report
06-12 18:27:13.872465 23575 23652 D EventHub: No input device
configuration file found for device 'Steam Controller'.
06-12 18:27:13.883785 23575 23652 W EventHub: Unable to disable kernel
key repeat for /dev/input/event3: Function not implemented
06-12 18:27:13.883898 23575 23652 I EventHub: usingClockIoctl=true
06-12 18:27:13.883977 23575 23652 I EventHub: New device: id=5,
fd=231, path='/dev/input/event3', name='Steam Controller',
classes=0x80000141, configuration='',
keyLayout='/system/usr/keylayout/Vendor_28de_Product_1102.kl',
keyCharacterMap='/system/usr/keychars/Generic.kcm',
builtinKeyboard=false,
06-12 18:27:13.885210 23575 23652 I InputReader: Device added: id=6,
eventHubId=5, name='Steam Controller',
descriptor='80c9cfd6d89d1a65e47ed44fef534e1fc9bf162c',sources=0x01000511

--------- switch to main
06-12 18:27:14.638762 23575 23652 I EventHub: Removing device
'/dev/input/event3' due to inotify event
06-12 18:27:14.638983 23575 23652 I EventHub: Removed device:
path=/dev/input/event3 name=Steam Controller id=5 fd=231
classes=0x80000141
--------- switch to kernel
06-12 18:27:14.587671  1727  1727 E hid-steam 0003: 28DE:1102.0007:
steam_send_report: error -5 (85)
06-12 18:27:14.587812  1727  1727 E hid-steam 0003: 28DE:1102.0007:
steam_send_report: error -5 (8e)
06-12 18:27:14.587929  1727  1727 E hid-steam 0003: 28DE:1102.0007:
steam_send_report: error -5 (87 03 18 01 00)

We don't have any immediate plans to look into this failure, but we
will happily take a patch if anyone else is willing to debug this.
