Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957DA67BF80
	for <lists+linux-input@lfdr.de>; Wed, 25 Jan 2023 23:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjAYWCJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 17:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjAYWCH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 17:02:07 -0500
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Jan 2023 14:02:06 PST
Received: from mail.schwarzvogel.de (unknown [IPv6:2a01:4f8:252:1806::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD09EC4C
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 14:02:06 -0800 (PST)
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.96)
        (envelope-from <klausman@schwarzvogel.de>)
        id 1pKnpE-000Xtw-1w
        for linux-input@vger.kernel.org;
        Wed, 25 Jan 2023 23:01:00 +0100
Date:   Wed, 25 Jan 2023 23:01:00 +0100
From:   Tobias Klausmann <klausman@schwarzvogel.de>
To:     linux-input@vger.kernel.org
Subject: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903 (046d:c091)
 report too many non-hires events
Message-ID: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_05,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

As it says in the subject.

At some point between 6.0 and 6.1, the kernel (if HID_LOGITECH_HIDPP was
m or y) started reporting a full event for every hires event on a
Logitech G903. 

In my quest of finding out what the root cause is, ive filed these bugs:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1029584
https://gitlab.freedesktop.org/libinput/libinput/-/issues/852

The libinput one has the most detail. The most relevant one is this log
from libinput record, showing what happens if I turn the mousewheel by
one notch:

    events:
    # Current time is 20:37:11
    - evdev:
      - [  3,  63476,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3,  63476,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3,  63476,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +3063ms
    - evdev:
      - [  3, 139476,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3, 139476,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3, 139476,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +76ms
    - evdev:
      - [  3, 197482,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3, 197482,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3, 197482,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +58ms
    - evdev:
      - [  3, 227485,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3, 227485,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3, 227485,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +30ms
    - evdev:
      - [  3, 240484,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3, 240484,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3, 240484,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +13ms
    - evdev:
      - [  3, 250470,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3, 250470,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3, 250470,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +10ms
    - evdev:
      - [  3, 256486,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3, 256486,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3, 256486,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +6ms
    - evdev:
      - [  3, 264472,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
      - [  3, 264472,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
      - [  3, 264472,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +8ms
    # Current time is 20:37:15

Note how it reports both REL_WHEEL and REL_WHEEL_HI_RES at every
instance.

I've tried assorted kernels, both Debian as well as hand-compiled
vanilla ones, and the problem only shows up if hid_logitech_hidpp.ko is
loaded, so I am blacklisting it for now. Also note that even unloading
the module didn't fix the behavior, though that may be because X11 was
still runing and so libinput's state ight have been still mangled.

The most recent kernels I have tested with are 6.1.4 and 6.2-rc5.

Best,
Tobias


-- 
printk(KERN_ERR "BIGMAC: Would you like that for here or to go?\n");
	linux-2.6.19/drivers/net/sunbmac.c
