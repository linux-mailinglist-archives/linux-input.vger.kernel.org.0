Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA081E552A
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 06:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgE1Enr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 00:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgE1Enq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 00:43:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3B9C05BD1E;
        Wed, 27 May 2020 21:43:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z64so8352562pfb.1;
        Wed, 27 May 2020 21:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=YkTz22E+TiGIERP3d3r6CMqsTVvO5LpEW2640eaokXU=;
        b=CAxY59Awj+NfuCIVnBZJiLCAjSFTgL0gqh7Bu6QBLXLtGCmE/b1v77f4pBi/mSWmWC
         tkmqAjeH+4nLhUfnVMSEZeYEFCpCIz7USlRmv9mQvznFD6HufOED7qynDLga52l2tsJR
         faMN2cW51iapImxRsYodnDkDGNckw5K2mUxiG5lGpyVCl7qaR0NTgr5d4YEiOINjLphy
         u7pnmr9VWgsWKh3cac6M7M9wkWCyq1YuT1u2Mghr4sNN+IzNd3I1MrISgrZqHxHYkbgj
         Eg6jJhRtAPNoYEqskmFlkLOkfOwF4oCzBrV9eDrcvkTIjgvIBPZXnQu+rv9CyYGVsIbA
         zOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=YkTz22E+TiGIERP3d3r6CMqsTVvO5LpEW2640eaokXU=;
        b=rLUsyztSdiii1ef05rfqn18+brZXBKiyRJB+QlLS4PNvucRlAAqAeeX2qBnBibVEWJ
         yJ18hL/6S4a3YU0IEZ4EoC56Syw4vcHrcoM7+6OaPgbFK/1hCBUkKUbYDtyJTl3+p+cR
         qNdylx8ReFqBdsIVEEl4KpnXvFzg32GMOZ+3gA647eiHb6OpbpKZNKWJtQ+aWyeYo/F1
         rHyCFKUbvAOykK9UKUFy1IHe4gA4WgT4zELgU9jLJSfoTFWre4Hkni2T6iBNvFIO4WVl
         3Qu/7/iXGptyimFZDbxvhDqWT1a8pP94aZRqgGwGZCrpk7cxgfqeOvE2ZCZEm6rW3pK+
         4EXw==
X-Gm-Message-State: AOAM531J8weHRNbk9fZc1IryBKAwol214SWvYQ+3HUkzsxvTY1JBfrZ2
        IVVEk8DJLDC7n4WbGkrz5ik=
X-Google-Smtp-Source: ABdhPJxAy+B1roZZH6w9NzGNPEl61+Lf7lB7dMxSBP8qd5CzvCo6ovz5CH+LoMOmT/NlwPwdLeruSQ==
X-Received: by 2002:a62:1d48:: with SMTP id d69mr1225660pfd.27.1590641026157;
        Wed, 27 May 2020 21:43:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id d8sm3322273pgb.42.2020.05.27.21.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 21:43:45 -0700 (PDT)
Date:   Wed, 27 May 2020 21:43:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.7-rc7
Message-ID: <20200528044343.GA109749@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Just a few random driver
fixups.

Changelog:
---------

Brendan Shanks (1):
      Input: evdev - call input_flush_device() on release(), not flush()

Christophe JAILLET (1):
      Input: dlink-dir685-touchkeys - fix a typo in driver name

Dennis Kadioglu (1):
      Input: synaptics - add a second working PNP_ID for Lenovo T470s

Dmitry Torokhov (1):
      Revert "Input: i8042 - add ThinkPad S230u to i8042 nomux list"

Enric Balletbo i Serra (1):
      Input: cros_ec_keyb - use cros_ec_cmd_xfer_status helper

Evan Green (1):
      Input: synaptics-rmi4 - really fix attn_data use-after-free

Gustavo A. R. Silva (1):
      Input: applespi - replace zero-length array with flexible-array

Hans de Goede (1):
      Input: axp20x-pek - always register interrupt handlers

James Hilliard (1):
      Input: usbtouchscreen - add support for BonXeon TP

Johnny Chuang (1):
      Input: elants_i2c - support palm detection

Kevin Locke (2):
      Input: i8042 - add ThinkPad S230u to i8042 nomux list
      Input: i8042 - add ThinkPad S230u to i8042 reset list

Stephan Gerhold (1):
      Input: mms114 - fix handling of mms345l

Wei Yongjun (1):
      Input: synaptics-rmi4 - fix error return code in rmi_driver_probe()

Wolfram Sang (1):
      Input: lm8333 - update contact email

Łukasz Patron (1):
      Input: xpad - add custom init packet for Xbox One S controllers

Diffstat:
--------

 drivers/input/evdev.c                           | 19 ++-----
 drivers/input/joystick/xpad.c                   | 12 +++++
 drivers/input/keyboard/applespi.c               |  2 +-
 drivers/input/keyboard/cros_ec_keyb.c           | 14 ++---
 drivers/input/keyboard/dlink-dir685-touchkeys.c |  2 +-
 drivers/input/misc/axp20x-pek.c                 | 72 +++++++++++++------------
 drivers/input/mouse/synaptics.c                 |  1 +
 drivers/input/rmi4/rmi_driver.c                 |  5 +-
 drivers/input/serio/i8042-x86ia64io.h           |  7 +++
 drivers/input/touchscreen/elants_i2c.c          | 11 +++-
 drivers/input/touchscreen/mms114.c              | 12 ++---
 drivers/input/touchscreen/usbtouchscreen.c      |  1 +
 include/linux/input/lm8333.h                    |  2 +-
 13 files changed, 88 insertions(+), 72 deletions(-)

Thanks.


-- 
Dmitry
