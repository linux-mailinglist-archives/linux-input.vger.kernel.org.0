Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7943466ACCA
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjANRCw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjANRCv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:02:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A260AA5F6
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:02:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E3FD60BC1
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A991C433D2;
        Sat, 14 Jan 2023 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715768;
        bh=tRQXDArWf8Unud5toS4LvkdCgfKWkAxY0EJ+ydnKOGU=;
        h=From:To:Cc:Subject:Date:From;
        b=jWpDpIWQ0zj16sMm/V8fRfiVvFVNnzZ71zDWDfIYPG5Fjyp+QKvp7tkGl00SeVdXB
         u3cjYLpog3l+cW32L5XCLBbKXwnJA91lNjTxKv6RqnrsiwvBlh6S2UxaBsdxKjkk9C
         T9yqoHkI+mEh0P3Fza9n8Jg0GJnB0012e53PS/xHNq132lJOmemkgkKdvMELzBmE8s
         OTmmRbYUX96W8HH2ZraJD7r7T0BG0rnh//B4ybldA+mnPfbePNdeIRdxUdPUdQjof+
         8tly5ldhWGkqyPArLgJkK72XvYXhMQupVigmTMvtXooQQveXennMCKYlguuf3paJTd
         tMjIfuJ/E4WAQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Andi Shyti <andi@etezian.org>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Lyude Paul <lyude@redhat.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/16] Input: Switch to new PM macros set 3
Date:   Sat, 14 Jan 2023 17:16:04 +0000
Message-Id: <20230114171620.42891-1-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Continuation of
https://lore.kernel.org/all/20230102181842.718010-1-jic23@kernel.org/

This time we have most of the remaining drivers where the changes needed
are more complex than the earlier straight conversions.

A separate series will deal with pm80x as the cleanup for that will
extend to MFD and RTC trees and cannot easily be broken up due to
some changes in exports.

There is a general mixture of cases in here:
1) More complex direct conversions - typically drivers with separate
   sleep and runtime pm ops.
2) Cases where the callbacks or struct dev_pm_ops is exported to
   multiple modules.
3) Refactors that avoid duplication of callbacks or exports.
4) A tweak to the core input handling to use the new macros - this
   is different from the driver changes, but seemed sensible.

Note there are a few cases in here where I a much more minimal
set of callbacks is provided than DEFINE_SIMPLE_DEV_PM_OPS() and
friends would set. I don't know the history behind those so whilst
they might well be fine converted to the generic macros, I've
left them alone.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Caleb Connolly <caleb@connolly.tech>
Cc: Andi Shyti <andi@etezian.org>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Andrew Duggan <aduggan@synaptics.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

Jonathan Cameron (16):
  Input: cyapa - switch to SYSTEM_SLEEP/RUNTIME_PM_OPS() and pm_ptr()
  Input: axp20x-pek - switch to SYSTEM_SLEEP_PM_OPS() and pm_sleep_ptr()
  Input: samsung-keypad - switch to pm_ptr() and
    SYSTEM_SLEEP/RUNTIME_PM_OPS()
  Input: s6sy761 - switch to SYSTEM_SLEEP_/RUNTIME_PM_OPS() and pm_ptr()
  Input: rmi4 - switch to SYSTEM_SLEEP/RUNTIME_PM_OPS() and pm_ptr()
  Input: stmfts - switch to SYSTEM_SLEEP_/RUNTIME_PM_OPS() and pm_ptr()
  Input: ad714x - unify dev_pm_ops using EXPORT_SIMPLE_DEV_PM_OPS()
  Input: adxl34x - unify dev_pm_ops using EXPORT_SIMPLE_DEV_PM_OPS()
  Input: tsc200x - use EXPORT_GPL_SIMPLE_DEV_PM_OPS()
  Input: cyttsp4 - use EXPORT_GPL_RUNTIME_DEV_PM_OPS()
  Input: cyttsp - use EXPORT_GPL_SIMPLE_DEV_PM_OPS()
  Input: applespi - use pm_sleep_ptr() and SYSTEM_SLEEP_PM_OPS()
  Input: omap4-keyad - use pm_ptr() and RUNTIME_DEV_PM_OPS()
  Input: Use pm_sleep_ptr() to avoid need for ifdef CONFIG_PM_SLEEP
  Input: cma3000 - use pm_sleep_ptr() to allow removal of ifdef
    CONFIG_PM guards
  Input: wistron_btns -  use pm_sleep_ptr() to allow removal of ifdef
    CONFIG_PM guards

 drivers/input/input.c                    |  7 ++-----
 drivers/input/keyboard/applespi.c        | 10 +++++-----
 drivers/input/keyboard/omap4-keypad.c    |  6 +++---
 drivers/input/keyboard/samsung-keypad.c  | 12 ++++--------
 drivers/input/misc/ad714x-i2c.c          | 14 +------------
 drivers/input/misc/ad714x-spi.c          | 14 +------------
 drivers/input/misc/ad714x.c              | 12 ++++++------
 drivers/input/misc/ad714x.h              |  4 ++--
 drivers/input/misc/adxl34x-i2c.c         | 25 +-----------------------
 drivers/input/misc/adxl34x-spi.c         | 25 +-----------------------
 drivers/input/misc/adxl34x.c             | 16 +++++++++++----
 drivers/input/misc/adxl34x.h             |  4 ++--
 drivers/input/misc/axp20x-pek.c          | 12 +++++-------
 drivers/input/misc/cma3000_d0x_i2c.c     |  6 +-----
 drivers/input/misc/wistron_btns.c        |  6 +-----
 drivers/input/mouse/cyapa.c              | 14 ++++++-------
 drivers/input/rmi4/rmi_i2c.c             | 11 +++--------
 drivers/input/rmi4/rmi_smbus.c           | 15 +++++++-------
 drivers/input/rmi4/rmi_spi.c             | 11 +++--------
 drivers/input/touchscreen/cyttsp4_core.c |  9 ++-------
 drivers/input/touchscreen/cyttsp4_i2c.c  |  2 +-
 drivers/input/touchscreen/cyttsp4_spi.c  |  2 +-
 drivers/input/touchscreen/cyttsp_core.c  |  7 +++----
 drivers/input/touchscreen/cyttsp_i2c.c   |  2 +-
 drivers/input/touchscreen/cyttsp_spi.c   |  2 +-
 drivers/input/touchscreen/s6sy761.c      | 15 +++++++-------
 drivers/input/touchscreen/stmfts.c       | 14 ++++++-------
 drivers/input/touchscreen/tsc2004.c      |  2 +-
 drivers/input/touchscreen/tsc2005.c      |  2 +-
 drivers/input/touchscreen/tsc200x-core.c |  7 +++----
 30 files changed, 95 insertions(+), 193 deletions(-)

-- 
2.39.0

