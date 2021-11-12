Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DDD44E1D3
	for <lists+linux-input@lfdr.de>; Fri, 12 Nov 2021 07:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbhKLGVF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Nov 2021 01:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhKLGVE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Nov 2021 01:21:04 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9B5C061766;
        Thu, 11 Nov 2021 22:18:14 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id p18so7560612plf.13;
        Thu, 11 Nov 2021 22:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=5SRlNkFjRfdiBfDr1obYB0KVyKvJJMA4RHVo1FAKarg=;
        b=f1JxmNExUk58tSjMFkXcnWoXMj5XglyEMWLskgFhuoT7g1016gMLMqRvvXobyNVVMy
         3kt64BQ7vvuw81H2WCK1t4TFX71W+k9KuqC5vldjeB5cnihazDweHFm6URtUUJB8wIRk
         BsqD8uc7PCETaKxBQdS9rXMm1Dnb7E2uZB/PUPUHflqt+cwNMiL05h8SynUgE4Qm/Jx4
         Qs7g+6FKFxxKpxSPOi0rIGC08mZFfb8GhCN2b7PQC53DzfX2BUmx0RAHTSlGzkEAcJgA
         eK23GB1t9Z3iAoiroF+9MvihOdawt7HwrR7jpeMsDhFey/bTHZ1oIQdvovBorzObA5ND
         Pfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=5SRlNkFjRfdiBfDr1obYB0KVyKvJJMA4RHVo1FAKarg=;
        b=TxXuPRfj1IFDR1Ycjv2pH+d4GDBpmlfDGivICSk0GBvlAjCRT2kordY3BwjqKAYsf3
         FPWwGwS/UI63pGT2PqAPZO/DEttOxJ6VID7PtGrbsi0ArD+dfoG9f5c5ksuhFp/+zhgV
         qtenBKCUEoMrNTNv1VtvpIGsLMj18RVdShsgfYejH6CYpTrZV5Gd5Ie7ZUgqgS0NLN4x
         +vyVXb0Mf1JxL3xa5EUbV/bxwp85xFDQgMy+d78gNGT5yX2nUMb3hFHRBaOTz5HhOveY
         fiFBnbknPvFAICSo80m+uSbmUXqZNHxjsPbwg+M7aLG7DEPuNdXv5o6qqBycj51UiT5/
         ZXuQ==
X-Gm-Message-State: AOAM530DAddGglWDGPHFMsqSzzBpdOi1JSjb3w8SHZb6boCMhhRy0RJE
        vJnzMTkbFN9kw7MiFvR59Uk=
X-Google-Smtp-Source: ABdhPJzw7Rvpd9rFOVTL++YGVvNXz1dBmh7NekLABh5x3g1KRz5I8t0R86Sqk8VSg7KSoBkGshChiw==
X-Received: by 2002:a17:902:758b:b0:13e:8b1:e49f with SMTP id j11-20020a170902758b00b0013e08b1e49fmr5748125pll.6.1636697894143;
        Thu, 11 Nov 2021 22:18:14 -0800 (PST)
Received: from google.com ([2620:15c:202:201:db13:f4cc:63e8:d83c])
        by smtp.gmail.com with ESMTPSA id h12sm5286822pfv.117.2021.11.11.22.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 22:18:13 -0800 (PST)
Date:   Thu, 11 Nov 2021 22:18:10 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.16-rc0
Message-ID: <YY4HIiDhEjGHXyGm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Just one new driver (Cypress
StreetFighter touchkey), and no input core changes this time, plus fixes
and enhancements to existing drivers.

You will get a merge conflict, please remove
Documentation/devicetree/bindings/input/cap11xx.txt
and edit Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
as follows:

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index fa0f37a90ac9..d5d6bced3148 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -19,6 +19,7 @@ properties:
       - microchip,cap1106
       - microchip,cap1126
       - microchip,cap1188
+      - microchip,cap1206

   reg:
     maxItems: 1


Changelog:
---------

Alistair Francis (1):
      Input: wacom_i2c - use macros for the bit masks

Arnd Bergmann (1):
      Input: analog - fix invalid snprintf() call

Arvind Yadav (1):
      Input: palmas-pwrbutton - handle return value of platform_get_irq()

Cai Huoqing (3):
      Input: elants_i2c - make use of devm_add_action_or_reset()
      Input: raydium_i2c_ts - make use of the helper function devm_add_action_or_reset()
      Input: mpr121 - make use of the helper function devm_add_action_or_reset()

Colin Ian King (1):
      Input: tmdc - fix spelling mistake "Millenium" -> "Millennium"

Daniel Mack (3):
      Input: ads7846 - add short-hand for spi->dev in probe() function
      Input: ads7846 - remove custom filter handling functions from pdata
      Input: ads7846 - switch to devm initialization

Dmitry Torokhov (9):
      Input: ep93xx_keypad - annotate suspend/resume as __maybe_unused
      Input: ep93xx_keypad - use BIT() and GENMASK() macros
      Input: ep93xx_keypad - use dev_pm_set_wake_irq()
      Input: ep93xx_keypad - switch to using managed resources
      Input: adxl34x - fix sparse warning
      Input: ads7846 - set input device bus type and product ID
      Input: ads7846 - use input_set_capability()
      Input: ads7846 - do not attempt IRQ workaround when deferring probe
      Input: cpcap-pwrbutton - do not set input parent explicitly

Hans de Goede (6):
      Input: goodix - change goodix_i2c_write() len parameter type to int
      Input: goodix - add a goodix.h header file
      Input: goodix - refactor reset handling
      Input: goodix - push error logging up into i2c_read and i2c_write helpers
      Input: goodix - allow specifying the config filename
      Input: goodix - add support for controllers without flash

Jesse Taube (1):
      Input: cap11xx - add support for cap1206

Johan Hovold (1):
      Input: iforce - fix control-message timeout

John Keeping (2):
      Input: st1232 - increase "wait ready" timeout
      Input: st1232 - prefer asynchronous probing

Jonathan Corbet (1):
      Input: remove unused header <linux/input/cy8ctmg110_pdata.h>

Krzysztof Kozlowski (1):
      Input: max77693-haptic - drop unneeded MODULE_ALIAS

Len Baker (1):
      Input: omap-keypad - prefer struct_size over open coded arithmetic

Loic Poulain (1):
      Input: synaptics-rmi4 - Fix device hierarchy

Lukas Bulwahn (1):
      MAINTAINERS: rectify entry for CHIPONE ICN8318 I2C TOUCHSCREEN DRIVER

Marek Vasut (6):
      Input: ili210x - use resolution from ili251x firmware
      Input: ili210x - export ili251x version details via sysfs
      Input: ili210x - add ili251x firmware update support
      Input: ili210x - special case ili251x sample read out
      Input: ili210x - improve polled sample spacing
      Input: ili210x - reduce sample period to 15ms

Mark Brown (1):
      Input: ariel-pwrbutton - add SPI device ID table

Phoenix Huang (1):
      Input: elantench - fix misreporting trackpoint coordinates

Randy Dunlap (1):
      Input: max8925_onkey - don't mark comment as kernel-doc

Shawn Guo (2):
      reboot: export symbol 'reboot_mode'
      Input: pm8941-pwrkey - respect reboot_mode for warm reset

Stephan Gerhold (2):
      Input: tm2-touchkey - report scan codes
      Input: tm2-touchkey - allow changing keycodes from userspace

Takashi Iwai (1):
      Input: i8042 - Add quirk for Fujitsu Lifebook T725

Tang Bin (1):
      Input: cpcap-pwrbutton - handle errors from platform_get_irq()

Uwe Kleine-König (2):
      Input: adxl34x - make adxl34x_remove() return void
      Input: tsc200x - make tsc200x_remove() return void

Yassine Oudjana (2):
      Input: cypress-sf - add Cypress StreetFighter touchkey driver
      dt-bindings: input: Add binding for cypress-sf

simba.hsu (1):
      Input: raydium_i2c_ts - read device version in bootloader mode

Diffstat:
--------

 .../devicetree/bindings/input/cypress-sf.yaml      |  61 +++
 .../bindings/input/microchip,cap11xx.yaml          |   1 +
 MAINTAINERS                                        |  12 +-
 drivers/input/joystick/analog.c                    |  18 +-
 drivers/input/joystick/iforce/iforce-usb.c         |   2 +-
 drivers/input/joystick/tmdc.c                      |   2 +-
 drivers/input/keyboard/Kconfig                     |  10 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/cap11xx.c                   |  43 +-
 drivers/input/keyboard/cypress-sf.c                | 224 +++++++++
 drivers/input/keyboard/ep93xx_keypad.c             | 172 +++----
 drivers/input/keyboard/mpr121_touchkey.c           |   4 +-
 drivers/input/keyboard/omap-keypad.c               |   3 +-
 drivers/input/keyboard/tm2-touchkey.c              |   7 +
 drivers/input/misc/adxl34x-i2c.c                   |   4 +-
 drivers/input/misc/adxl34x-spi.c                   |   4 +-
 drivers/input/misc/adxl34x.c                       |   6 +-
 drivers/input/misc/adxl34x.h                       |   2 +-
 drivers/input/misc/ariel-pwrbutton.c               |   7 +
 drivers/input/misc/cpcap-pwrbutton.c               |   7 +-
 drivers/input/misc/max77693-haptic.c               |   1 -
 drivers/input/misc/max8925_onkey.c                 |   2 +-
 drivers/input/misc/palmas-pwrbutton.c              |   5 +
 drivers/input/misc/pm8941-pwrkey.c                 |   6 +-
 drivers/input/mouse/elantech.c                     |  13 +
 drivers/input/rmi4/rmi_bus.c                       |   1 +
 drivers/input/serio/i8042-x86ia64io.h              |  14 +
 drivers/input/touchscreen/Kconfig                  |   1 +
 drivers/input/touchscreen/Makefile                 |   3 +-
 drivers/input/touchscreen/ads7846.c                | 200 +++-----
 drivers/input/touchscreen/elants_i2c.c             |   4 +-
 drivers/input/touchscreen/goodix.c                 | 231 ++++-----
 drivers/input/touchscreen/goodix.h                 | 117 +++++
 drivers/input/touchscreen/goodix_fwupload.c        | 427 ++++++++++++++++
 drivers/input/touchscreen/ili210x.c                | 559 ++++++++++++++++++++-
 drivers/input/touchscreen/raydium_i2c_ts.c         |  54 +-
 drivers/input/touchscreen/st1232.c                 |   3 +-
 drivers/input/touchscreen/tsc2004.c                |   4 +-
 drivers/input/touchscreen/tsc2005.c                |   4 +-
 drivers/input/touchscreen/tsc200x-core.c           |   4 +-
 drivers/input/touchscreen/tsc200x-core.h           |   2 +-
 drivers/input/touchscreen/wacom_i2c.c              |  22 +-
 include/linux/input/cy8ctmg110_pdata.h             |  10 -
 include/linux/spi/ads7846.h                        |  15 -
 kernel/reboot.c                                    |   1 +
 45 files changed, 1833 insertions(+), 460 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml
 create mode 100644 drivers/input/keyboard/cypress-sf.c
 create mode 100644 drivers/input/touchscreen/goodix.h
 create mode 100644 drivers/input/touchscreen/goodix_fwupload.c
 delete mode 100644 include/linux/input/cy8ctmg110_pdata.h

Thanks.


-- 
Dmitry
