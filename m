Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395B83233A9
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 23:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhBWWUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 17:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhBWWT5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 17:19:57 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334DFC061574;
        Tue, 23 Feb 2021 14:19:16 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id o63so103607pgo.6;
        Tue, 23 Feb 2021 14:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=zARPbeUvEAJIucN7FNQvAHsEwq4sjuhnV4NwcS05nFw=;
        b=DlZYoZtuvjHmyfRHf4vrpd+dKmRxsjk7+CRYhgMN+lM62pi3iTg9+m5XHCJwTuo0j2
         RKsb1y4fkI5j6GIXJgOU9TEODaugJfvMMUdoXuxIFQz6OKFM27egkSC9oayyY8lzID11
         H0lU/glPqQgn6f11YZQWRPOJj5uHdlPOMLmdRryPCxQzh2iuRwDWpTkm6+OfFfAOE79R
         K0FNa98JD14Fo3zMuRc3rhxm/7+/TnpvT6aFe8q/ChUFIeOKC2UAfHn2+urpqeduHbP3
         9S2NIEMM/6eDZHkAKsks4KdVNm6sv9WJY4D7N+VTsdn22PNGeaEBNYewWXlD+B3bAhQc
         9+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=zARPbeUvEAJIucN7FNQvAHsEwq4sjuhnV4NwcS05nFw=;
        b=ljj9wQfuJ9BiaxiE5sYeSXvbcrVgWlwwpMRuleHMCAh1x950P5SdaR0WS2gH5ledUD
         85YWchFJWxWJd2vNEekj2vV2tYmI804qq7jDxw+eWSRELa3hMOiyhsl5I3iPgbUIC9pp
         WZBKNFqH9oz4M0Ia3huascWixZhOUEw4+fjlBXcAxfOzWd25GOzWZGCfo92153lDQ47H
         4+6zLjx8afS3Xg7k6Z5BnuA3vUCucA+1zYY95TY0p8Oqz7jEdFScZDe54eYYnXcwbXNv
         vTpVaUqvJrtpMc9gok6nGMGV+phryHTyHif/eR3K/xm+9ci9lfF2Bo2qnjCTXPjvbRs3
         P/zw==
X-Gm-Message-State: AOAM5303IL6M4OXw9rb/obrx5Pq6BStoLFFCZ4RMIcr25ov9akwKmEVW
        eOTzqMFwiIz14cXQCxN4Z58=
X-Google-Smtp-Source: ABdhPJzcWZLjhzlQTZtoQxkwn7tHNXlH20s+vShF1/MS/fjqa7Xfxhitj0hgg/wTvZeegT1NyrR4vg==
X-Received: by 2002:aa7:8d04:0:b029:1ed:2328:f677 with SMTP id j4-20020aa78d040000b02901ed2328f677mr4129843pfe.26.1614118755555;
        Tue, 23 Feb 2021 14:19:15 -0800 (PST)
Received: from google.com ([2620:15c:202:201:703e:f61b:7159:b96b])
        by smtp.gmail.com with ESMTPSA id v1sm124683pjh.29.2021.02.23.14.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 14:19:14 -0800 (PST)
Date:   Tue, 23 Feb 2021 14:19:12 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.12-rc0
Message-ID: <YDV/YAJ/eNezR3jR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Mostly existing driver fixes
plus a new driver for game controllers directly connected to Nintendo
64, and an enhancement for keyboards driven by Chrome OS EC to
communicate layout of the top row to userspace.

Changelog:
---------

Bhaskar Chowdhury (1):
      Input: alps - fix spelling of "positive"

Dan Carpenter (3):
      Input: sur40 - fix an error code in sur40_probe()
      Input: elo - fix an error code in elo_connect()
      Input: joydev - prevent potential read overflow in ioctl

Dmitry Torokhov (6):
      Input: da7280 - fix missing error test
      Input: da7280 - protect OF match table with CONFIG_OF
      Input: imx_keypad - add dependency on HAS_IOMEM
      Input: omap4-keypad - switch to use managed resources
      Input: add missing dependencies on CONFIG_HAS_IOMEM
      Input: zinitix - fix return type of zinitix_init_touch()

Geert Uytterhoeven (1):
      Input: st1232 - fix NORMAL vs. IDLE state handling

Jeff LaBundy (9):
      Input: iqs5xx - minor cosmetic improvements
      Input: iqs5xx - preserve bootloader errors
      Input: iqs5xx - accommodate bootloader latency
      Input: iqs5xx - re-initialize device upon warm reset
      Input: iqs5xx - simplify axis setup logic
      Input: iqs5xx - eliminate unnecessary register read
      Input: iqs5xx - allow more time for ATI to complete
      Input: iqs5xx - allow device to be a wake-up source
      Input: iqs5xx - initialize an uninitialized variable

Jiapeng Chong (1):
      Input: aiptek - convert sysfs sprintf/snprintf family to sysfs_emit

Josh Poimboeuf (1):
      Input: elants_i2c - detect enum overflow

Lauri Kasanen (1):
      Input: Add N64 controller driver

Lee Jones (5):
      Input: synaptics - replace NOOP with suitable commentary
      Input: melfas_mip4 - mark a bunch of variables as __always_unused
      Input: usbtouchscreen - actually check return value of usb_submit_urb()
      Input: surface3_spi - remove set but unused variable 'timestamp'
      Input: stmpe-ts - add description for 'prop' struct member

Marcos Paulo de Souza (1):
      Input: i8042 - add ASUS Zenbook Flip to noselftest list

Michael Tretter (1):
      Input: st1232 - add IDLE state as ready condition

Michał Mirosław (1):
      Input: elants_i2c - add support for eKTF3624

Oleksij Rempel (1):
      Input: ads7846 - convert to one message

Olivier Crête (1):
      Input: xpad - add support for PowerA Enhanced Wired Controller for Xbox Series X|S

Philip Chen (5):
      dt-bindings: input: cros-ec-keyb: Add a new property describing top row
      Input: cros-ec-keyb - expose function row physical map to userspace
      dt-bindings: input: Create macros for cros-ec keymap
      dt-bindings: input: Fix the keymap for LOCK key
      ARM: dts: cros-ec-keyboard: Use keymap macros

Ronald Tschalär (2):
      Input: applespi - don't wait for responses to commands indefinitely.
      Input: applespi - fix occasional crc errors under load.

Tony Lindgren (5):
      Input: omap4-keypad - disable unused long interrupts
      Input: omap4-keypad - scan keys in two phases and simplify with bitmask
      Input: omap4-keypad - move rest of key scanning to a separate function
      Input: omap4-keypad - use PM runtime autosuspend
      Input: omap4-keypad - implement errata check for lost key-up events

Yang Li (1):
      Input: zinitix - remove unneeded semicolon

jeffrey.lin (1):
      Input: raydium_ts_i2c - do not send zero length

Diffstat:
--------

 .../ABI/testing/sysfs-driver-input-cros-ec-keyb    |   6 +
 .../bindings/input/google,cros-ec-keyb.yaml        |  24 ++
 arch/arm/boot/dts/cros-ec-keyboard.dtsi            |  93 +----
 drivers/input/joydev.c                             |   7 +-
 drivers/input/joystick/Kconfig                     |   7 +
 drivers/input/joystick/Makefile                    |   2 +-
 drivers/input/joystick/n64joy.c                    | 345 +++++++++++++++++++
 drivers/input/joystick/xpad.c                      |   1 +
 drivers/input/keyboard/Kconfig                     |   6 +-
 drivers/input/keyboard/applespi.c                  |  23 +-
 drivers/input/keyboard/cros_ec_keyb.c              |  79 +++++
 drivers/input/keyboard/omap4-keypad.c              | 302 ++++++++++-------
 drivers/input/misc/da7280.c                        |   3 +
 drivers/input/mouse/alps.c                         |   2 +-
 drivers/input/mouse/synaptics.c                    |   7 +-
 drivers/input/serio/Kconfig                        |   2 +-
 drivers/input/serio/i8042-x86ia64io.h              |   4 +
 drivers/input/tablet/aiptek.c                      |  80 ++---
 drivers/input/touchscreen/Kconfig                  |   2 +-
 drivers/input/touchscreen/ads7846.c                | 376 +++++++++++----------
 drivers/input/touchscreen/elants_i2c.c             | 151 ++++++++-
 drivers/input/touchscreen/elo.c                    |   4 +-
 drivers/input/touchscreen/iqs5xx.c                 | 209 +++++-------
 drivers/input/touchscreen/melfas_mip4.c            |   8 +-
 drivers/input/touchscreen/raydium_i2c_ts.c         |   3 +-
 drivers/input/touchscreen/st1232.c                 |   9 +-
 drivers/input/touchscreen/stmpe-ts.c               |   1 +
 drivers/input/touchscreen/sur40.c                  |   1 +
 drivers/input/touchscreen/surface3_spi.c           |   2 -
 drivers/input/touchscreen/usbtouchscreen.c         |   3 +
 drivers/input/touchscreen/zinitix.c                |   4 +-
 include/dt-bindings/input/cros-ec-keyboard.h       | 103 ++++++
 32 files changed, 1263 insertions(+), 606 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-input-cros-ec-keyb
 create mode 100644 drivers/input/joystick/n64joy.c
 create mode 100644 include/dt-bindings/input/cros-ec-keyboard.h

Thanks.


-- 
Dmitry
