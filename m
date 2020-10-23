Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4815029693A
	for <lists+linux-input@lfdr.de>; Fri, 23 Oct 2020 06:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896667AbgJWEyZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 00:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896662AbgJWEyZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 00:54:25 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190A2C0613CE;
        Thu, 22 Oct 2020 21:54:25 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id n9so255709pgt.8;
        Thu, 22 Oct 2020 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=lsMim9fhx/TyK1uqD12rhdUeqHwdc89oDJ4SLQK8XTo=;
        b=ci+XUqtt7/D+3YehXSxHeS1FbEqQdnjNh5F0slCdBHwu3ARWVSDINiN6zv6yWrdjv9
         v9cPebqdONMGDANGucmxq+nUgYskiLgAg9HX+S4t2TkrrO1KtRA2vSSI+Ab21v3f4cv8
         LRezbCwQQUDJFvWjAxjXjUj52viYR7OTKVA85R2+B4pZCHZ+jG1hj+c8FDxbs7xit4mI
         QNzjREv8ejvCAOfrryIMNfpRdT1zZyFVY+mUjG15ilHynimMBUrOZOkgr0X/kTY8YXvq
         wjQU6DsJZSw4fymv5K3vj8QhgCCMke9OBzkoeTRwtjyLA4CSCAEtIQXEykhrJJ0Y6Muc
         DUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=lsMim9fhx/TyK1uqD12rhdUeqHwdc89oDJ4SLQK8XTo=;
        b=Luo097MXrfSlxl7rcnE0XdDfr6S7oFfE/adrMkzBeZoatLDDHRzaUtUPdJnq+MlrGM
         HsTXFZcv+sZbA5cRBppwSOuYgBmsaEaVxhG9mvEi9sMuKFMHnmTI8xl4UqdfvXEvLJ6T
         bGGBMxdsnD7qOrTdG2DoaEPDNdTdnUYy0b/szfP/I2e/pi5se3JJoCyYw7oJMpCd9UH8
         WvFPh9v68xcbt7nTXEqZ3p2N0k7XNAisy87aK+T1q2RyLtMreRZLlnC/w83eTKXEBhTb
         TF2bD/B4oMb3XhOXVcd4y+iOHa0Tx+tAOL+8GMwCIe1lE6ILDP3ia5xIvM9eCTA8IdbV
         tP+A==
X-Gm-Message-State: AOAM533uF6gXonkljTHx+w4WvMzvRIMBbSY0vpbjbBrCmvD4b06E0H6M
        u581YF2oV6JlMEXHOQfeYQk=
X-Google-Smtp-Source: ABdhPJyXgQS06ImeWOM4aCtlY+CgCGEAw1LdssRNzPw7wnD213f71eQqs4MrWFKcz0hqtDoESdp0Jg==
X-Received: by 2002:a17:90a:e50e:: with SMTP id t14mr495028pjy.118.1603428864397;
        Thu, 22 Oct 2020 21:54:24 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id kc21sm332267pjb.36.2020.10.22.21.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 21:54:23 -0700 (PDT)
Date:   Thu, 22 Oct 2020 21:54:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.10-rc0
Message-ID: <20201023045421.GA2205724@dtor-ws>
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

to receive updates for the input subsystem. You will get:

- a new driver for ADC driven joysticks
- a new Zintix touchscreen driver
- enhancements to Intel SoC button array driver
- support for F3A "function" in Synaptics RMI4 driver
- assorted driver fixups

Changelog:
---------

Artur Rojek (2):
      dt-bindings: input: Add docs for ADC driven joystick
      Input: joystick - add ADC attached joystick driver.

Dan Carpenter (1):
      Input: imx6ul_tsc - clean up some errors in imx6ul_tsc_resume()

Dmitry Torokhov (1):
      Input: imx6ul_tsc - unify open/close and PM paths

Furquan Shaikh (1):
      Input: raydium_i2c_ts - use single i2c_transfer transaction when using RM_CMD_BANK_SWITCH

Hans de Goede (8):
      Input: allocate keycodes for notification-center, pickup-phone and hangup-phone
      Input: allocate keycode for Fn + right shift
      platform/x86: thinkpad_acpi: Add support for new hotkeys found on X1C8 / T14
      platform/x86: thinkpad_acpi: Map Clipping tool hotkey to KEY_SELECTIVE_SCREENSHOT
      Input: soc_button_array - add active_low setting to soc_button_info
      Input: soc_button_array - add support for INT33D3 tablet-mode switch devices
      Input: soc_button_array - work around DSDTs which modify the irqflags
      Input: synaptics - enable InterTouch for ThinkPad T14 Gen 1

Jason A. Donenfeld (2):
      Input: synaptics-rmi4 - support bootloader v8 in f34v7
      Input: synaptics - enable InterTouch for ThinkPad P1/X1E gen 2

Joe Perches (1):
      Input: MT - avoid comma separated statements

Johnny Chuang (2):
      Input: elants_i2c - report resolution of ABS_MT_TOUCH_MAJOR by FW information.
      Input: elants_i2c - fix typo for an attribute to show calibration count

Kenny Levinsen (1):
      Input: evdev - per-client waitgroups

Krzysztof Kozlowski (4):
      Input: ep93xx_keypad - fix handling of platform_get_irq() error
      Input: omap4-keypad - fix handling of platform_get_irq() error
      Input: twl4030_keypad - fix handling of platform_get_irq() error
      Input: sun4i-ps2 - fix handling of platform_get_irq() error

Michael Srba (2):
      dt-bindings: input/touchscreen: add bindings for zinitix
      Input: add zinitix touchscreen driver

Mika Penttilä (1):
      Input: Add MAINTAINERS entry for SiS i2c touch input driver

Vincent Huang (2):
      Input: synaptics-rmi4 - rename f30_data to gpio_data
      Input: synaptics-rmi4 - add support for F3A

YueHaibing (1):
      Input: stmfts - fix a & vs && typo

Diffstat:
--------

 .../devicetree/bindings/input/adc-joystick.yaml    | 121 +++++
 .../bindings/input/touchscreen/zinitix.txt         |  40 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   7 +
 drivers/hid/hid-rmi.c                              |   2 +-
 drivers/input/evdev.c                              |  19 +-
 drivers/input/input-mt.c                           |  11 +-
 drivers/input/joystick/Kconfig                     |  10 +
 drivers/input/joystick/Makefile                    |   1 +
 drivers/input/joystick/adc-joystick.c              | 264 ++++++++++
 drivers/input/keyboard/ep93xx_keypad.c             |   4 +-
 drivers/input/keyboard/omap4-keypad.c              |   6 +-
 drivers/input/keyboard/twl4030_keypad.c            |   8 +-
 drivers/input/misc/soc_button_array.c              | 100 +++-
 drivers/input/mouse/synaptics.c                    |   6 +-
 drivers/input/rmi4/Kconfig                         |   8 +
 drivers/input/rmi4/Makefile                        |   1 +
 drivers/input/rmi4/rmi_bus.c                       |   3 +
 drivers/input/rmi4/rmi_driver.h                    |   1 +
 drivers/input/rmi4/rmi_f30.c                       |  14 +-
 drivers/input/rmi4/rmi_f34v7.c                     |   9 +-
 drivers/input/rmi4/rmi_f3a.c                       | 241 +++++++++
 drivers/input/serio/sun4i-ps2.c                    |   9 +-
 drivers/input/touchscreen/Kconfig                  |  12 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/elants_i2c.c             |   8 +-
 drivers/input/touchscreen/imx6ul_tsc.c             |  47 +-
 drivers/input/touchscreen/raydium_i2c_ts.c         | 131 ++---
 drivers/input/touchscreen/stmfts.c                 |   2 +-
 drivers/input/touchscreen/zinitix.c                | 581 +++++++++++++++++++++
 drivers/platform/x86/thinkpad_acpi.c               |  18 +-
 include/linux/rmi.h                                |  11 +-
 include/uapi/linux/input-event-codes.h             |   4 +
 33 files changed, 1531 insertions(+), 171 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/adc-joystick.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
 create mode 100644 drivers/input/joystick/adc-joystick.c
 create mode 100644 drivers/input/rmi4/rmi_f3a.c
 create mode 100644 drivers/input/touchscreen/zinitix.c

Thanks.


-- 
Dmitry
