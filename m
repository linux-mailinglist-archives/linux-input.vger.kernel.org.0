Return-Path: <linux-input+bounces-6654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FB98440F
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 12:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 144A1281DAE
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 10:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C0318C93E;
	Tue, 24 Sep 2024 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPPnAmKP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FC1B85DD;
	Tue, 24 Sep 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727175558; cv=none; b=Y6QC0Ae+FUKVjS83cCEzmEmbeSflj5W2gX88D8pWO41i0NinOHgDjA0ysEvC8wQRcsc3PssK63PfRiOblgYy/+3l6kkLCAmCqyt28zInGSWxq8vmaglx7knuOpEL0PFqEuoGaQRjecCBC5vBPP64dur99F9cgpPnlEMPvJ16zVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727175558; c=relaxed/simple;
	bh=hzHojCeya+tURiQpzTpI5AD1Vo8zZzAWsYZs4q1g5SY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ca0FwWlu3vmRmENSthyu/JMCZH7L+0z/g1fyQrIb/CFUccTC+U9zsVDVXI2q4kObOpNAIhvT+emD+417eqHa/A57Tq/liLNwL6rhjSm4axwStkkfD5ddKUng6oAE0nhhpVmoulQixf6jsWKZgZLg0ztEgkJJfZPXbd27bBsYorY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPPnAmKP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-206aee40676so43169935ad.0;
        Tue, 24 Sep 2024 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727175556; x=1727780356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/ndECuOcrEK8nYgSjGTpYgH+EQGrTGWUD3VcIga9SY=;
        b=PPPnAmKP0fXilH54rMLClR6KBORfGpJr83WJ589jC7v5P8IZMxKP/GtdtnliHsr+F2
         Ls/QMgXLGa/n/FDDE7hnZx9WtUsOa9bXvXJeAESy0ca3k7ZwsSGFv1DG5UiLz7/8AD5T
         a9LnohxTe6JmolZOxkMOhtRH3NJlEgd2kv+HB7dVnGJVFMtx9GpxI6EYTp9Cx8CJjfFb
         8iU1ZzPobsHGfdApAL1l5I9jbsDAnWQrFQzydyHHVOdyKT8J7LXTlyWgpYl3whWDBs+A
         qfCphymxkjFxYSStygqAvc68RGc0YgIdQHH6YMUuuGzgcE1DMSwXEtAhs4fgoNXVflCm
         SyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727175556; x=1727780356;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/ndECuOcrEK8nYgSjGTpYgH+EQGrTGWUD3VcIga9SY=;
        b=ax4CFQh9yCScR/KAeCby+ezy559TPOAMEHCVsGPIwotQaFJ71+yT/BlHAmrDeShJ0J
         lsG6RvzeoXBtVrfcvKutVO6B3qt9gfn1uaCl9QhUhjR+xm6La3xErLJ+BH8NvTGB7ZM/
         eiuwJskfvz7lr/DiPT3x51ga/SfT6nzHwqiXMtobBgwV+JQdWGhpLkIIHbqhzpt4Pym5
         hcVnfixNp89DEC2lfTE6227cnvDtTIucyIg/8Zgtg56DauiMSOGnOL5W0HPXX9OIvLGj
         N+BhCS/gHs0OquwctC8X66EwrVxzHNjpQy02zSI9uB7aNOyrzvuDzXtCGl+P9sFDgvkf
         rUTg==
X-Forwarded-Encrypted: i=1; AJvYcCWVAisLCWZCpfiCVGcb6ODDmvFwKupgPb0rl9cB1NPJZS+/EtZF28mKx8iO7QcmswlV8l+bGTZLm1Bjaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxULqodIfCg2I41DU1I6QDiRHH1zcCoDb9P+sKghdiTKCWzlI4A
	L8+ljNQiLoyCYCL70b7AZSYqw3QgpbHN8IztnnFvLPnUOt330lGd
X-Google-Smtp-Source: AGHT+IHqUKJSj9oSfNaCqqbPuP18sx01+c/ZHEV8MYfSHPgWfe9m0vA9dq/wNM1bneViSLi43XL4dQ==
X-Received: by 2002:a17:902:fc84:b0:205:9112:efc7 with SMTP id d9443c01a7336-208d83ac37amr228650025ad.30.1727175555517;
        Tue, 24 Sep 2024 03:59:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb3f:d59:8f26:87ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1818a95sm8388965ad.204.2024.09.24.03.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:59:15 -0700 (PDT)
Date: Tue, 24 Sep 2024 03:59:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.12-rc0
Message-ID: <ZvKbeSkzyedREmXi@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc0

to receive updates for the input subsystem. You will get:

- support for PixArt PS/2 touchpad

- updates to tsc2004/5, usbtouchscreen, and zforce_ts drivers 

- support for GPIO-only mode for ADP55888 controller

- support for touch keys in Zinitix driver

- support for querying density of Synaptics sensors

- sysfs interface for Goodex "Berlin" devices to read and write touch IC
  registers

- more quirks to i8042 to handle various Tuxedo laptops

- a number of drivers have been converted to using "guard" notation
  when acquiring various locks, as well as using other cleanup functions
  to simplify releasing of resources (with more drivers to follow)

- evdev will limit amount of data that can be written into an evdev
  instance at a given time to 4096 bytes (170 input events) to avoid
  holding evdev->mutex for too long and starving other users

- Spitz has been converted to use software nodes/properties to describe
  its matrix keypad and GPIO-connected LEDs

- msc5000_ts, msc_touchkey and keypad-nomadik-ske drivers have been
  removed since noone in mainline have been using them

- other assorted cleanups and fixes.
  
Changelog:
---------

Binbin Zhou (1):
      Input: Add driver for PixArt PS/2 touchpad

Cai Huoqing (1):
      Input: colibri-vf50-ts - make use of the helper function dev_err_probe()

Charles Wang (1):
      Input: goodix-berlin - add sysfs interface for reading and writing touch IC registers

Christophe JAILLET (1):
      Input: spear-keyboard - switch to devm_clk_get_prepared()

David Lechner (1):
      Input: ims-pcu - fix calling interruptible mutex

Dmitry Torokhov (59):
      Input: usbtouchscreen - use driver core to instantiate device attributes
      Input: usbtouchscreen - remove custom USB_DEVICE_HID_CLASS macro
      Input: usbtouchscreen - move the driver ID table
      Input: usbtouchscreen - move process_pkt() into main device structure
      Input: usbtouchscreen - constify usbtouch_dev_info table
      Input: usbtouchscreen - split device info table into individual pieces
      Input: usbtouchscreen - use guard notation when acquiring mutexes
      Input: usbtouchscreen - switch to using __free() cleanup facility
      Input: msc5000_ts - remove the driver
      Input: msc_touchkey - remove the driver
      MAINTAINERS: update entry for Yealink driver
      Input: tsc2004/5 - fix handling of VIO power supply
      Input: tsc2004/5 - do not hard code interrupt trigger
      Input: tsc2004/5 - fix reset handling on probe
      Input: tsc2004/5 - do not use irq_set_irq_wake() directly
      Input: tsc2004/5 - respect "wakeup-source" property
      Input: tsc2004/5 - use guard notation when acquiring mutexes/locks
      Input: ilitek_ts_i2c - stop including gpio.h
      Input: cyttsp - stop including gpio.h
      Input: cyttsp - use devm_regulator_bulk_get_enable()
      Input: cyttsp4 - remove driver
      Input: keypad-nomadik-ske - remove the driver
      Input: evdev - limit amount of data for writes
      Input: mt6779-keypad - use devm_clk_get_enabled()
      Input: adp5588-keys - use guard notation when acquiring mutexes
      Input: matrix-keymap - switch to using __free() cleanup facility
      Input: bcm5974 - use guard notation when acquiring mutex
      MAINTAINERS: add gameport.h, serio.h and uinput.h to INPUT section
      MAINTAINERS: add i8042.h and libps2.h to INPUT section
      Input: snvs_pwrkey - use devm_clk_get_optional_enabled()
      Input: synaptics-rmi4 - fix crash when DPM query is not supported
      Input: matrix_keypad - remove support for clustered interrupt
      Input: matrix_keypad - switch to gpiod API and generic device properties
      ARM: spitz: Use software nodes/properties for the GPIO-driven buttons
      ARM: spitz: Use software nodes/properties for the matrix keypad
      Input: matrix_keypad - remove support for platform data
      Input: alps - use guard notation when acquiring mutex
      Input: atkbd - use guard notation when acquiring mutex
      Input: gpio-keys - switch to using cleanup functions
      Input: iqs62x-keys - use cleanup facility for fwnodes
      Input: tegra-kbc - use guard notation when acquiring mutex and spinlock
      Input: zforce_ts - simplify reporting of slot state
      Input: zforce_ts - remove support for platfrom data
      Input: zforce_ts - do not explicitly set EV_SYN, etc bits
      Input: zforce_ts - handle errors from input_mt_init_sots()
      Input: zforce_ts - remove unneeded locking
      Input: zforce_ts - ensure that pm_stay_awake() and pm_relax() are balanced
      Input: zforce_ts - use guard notation when acquiring mutexes
      Input: zforce_ts - switch to using get_unaligned_le16
      Input: zforce_ts - make parsing of contacts less confusing
      Input: zforce_ts - do not ignore errors when acquiring regulator
      Input: zforce_ts - use dev_err_probe() where appropriate
      Input: zforce_ts - make zforce_idtable constant
      Input: zforce_ts - stop treating VDD regulator as optional
      Input: zforce_ts - switch to using devm_regulator_get_enable()
      Input: zforce_ts - do not hardcode interrupt level
      Input: zforce_ts - remove assert/deassert wrappers
      Input: zforce_ts - switch to using asynchronous probing
      ARM: spitz: fix compile error when matrix keypad driver is enabled

Emanuele Ghidoli (2):
      Input: ilitek_ts_i2c - avoid wrong input subsystem sync
      Input: ilitek_ts_i2c - add report id message validation

Fabio Estevam (1):
      dt-bindings: input: touchscreen: Use generic node name

Frank Li (4):
      dt-bindings: input: touchscreen: convert ad7879 to yaml format
      dt-bindings: input: touchscreen: convert colibri-vf50-ts.txt to yaml
      dt-bindings: input: touchscreen: convert ads7846.txt to yaml
      dt-bindings: input: convert rotary-encoder to yaml

Jacky Bai (1):
      Input: bbnsm_pwrkey - fix missed key press after suspend

Javier Carrasco (6):
      Input: iqs269a - use device_for_each_child_node_scoped()
      Input: qt1050 - use device_for_each_child_node_scoped()
      Input: gpio_keys - use device_for_each_child_node_scoped()
      Input: gpio_keys_polled - use device_for_each_child_node_scoped()
      Input: adc-keys - use device_for_each_child_node_scoped()
      Input: adc-joystick - use device_for_each_child_node_scoped()

Jinjie Ruan (1):
      Input: ps2-gpio - use IRQF_NO_AUTOEN flag in request_irq()

Liao Chen (1):
      Input: mt6779-keypad - fix module autoloading

Linus Walleij (2):
      Input: zinitix - read and cache device version numbers
      Input: zinitix - varying icon status registers

Lukas Bulwahn (1):
      MAINTAINERS: remove unneeded file entry in INPUT section

Marge Yang (1):
      Input: synaptics-rmi4 - add support for querying DPM value (F12)

Nikita Travkin (2):
      dt-bindings: input: zinitix: Document touch-keys support
      Input: zinitix - add touchkey support

Nuno Sa (1):
      Input: adp5588-keys - fix check on return code

Rob Herring (Arm) (2):
      Input: tc3589x - use of_property_present()
      Input: tegra-kbc - use of_property_read_variable_u32_array() and of_property_present()

Shen Lichuan (2):
      Input: wistron_btns - use kmemdup_array instead of kmemdup for multiple allocation
      Input: Convert comma to semicolon

Sudip Mukherjee (1):
      Input: zforce_ts - use devm_add_action_or_reset()

Utsav Agarwal (2):
      Input: adp5588-keys - add support for pure gpio
      dt-bindings: input: pure gpio support for adp5588

Uwe Kleine-König (1):
      Input: hynitron_cstxxx - drop explicit initialization of struct i2c_device_id::driver_data to 0

Werner Sembach (3):
      Input: i8042 - add TUXEDO Stellaris 16 Gen5 AMD to i8042 quirk table
      Input: i8042 - add another board name for TUXEDO Stellaris Gen5 AMD line
      Input: i8042 - add TUXEDO Stellaris 15 Slim Gen6 AMD to i8042 quirk table

Diffstat:
--------

 .../devicetree/bindings/input/adi,adp5588.yaml     |   38 +-
 .../devicetree/bindings/input/rotary-encoder.txt   |   50 -
 .../devicetree/bindings/input/rotary-encoder.yaml  |   90 +
 .../bindings/input/touchscreen/ad7879.txt          |   71 -
 .../bindings/input/touchscreen/adi,ad7879.yaml     |  150 ++
 .../bindings/input/touchscreen/ads7846.txt         |  107 -
 .../bindings/input/touchscreen/azoteq,iqs7211.yaml |    4 +-
 .../bindings/input/touchscreen/colibri-vf50-ts.txt |   34 -
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |    2 +-
 .../bindings/input/touchscreen/goodix.yaml         |    2 +-
 .../bindings/input/touchscreen/ti,ads7843.yaml     |  183 ++
 .../touchscreen/toradex,vf50-touchscreen.yaml      |   77 +
 .../bindings/input/touchscreen/zinitix,bt400.yaml  |   10 +
 .../devicetree/bindings/power/wakeup-source.txt    |    2 +-
 MAINTAINERS                                        |    8 +-
 arch/arm/mach-pxa/spitz.c                          |  163 +-
 drivers/input/evdev.c                              |    7 +
 drivers/input/input.c                              |    2 +-
 drivers/input/joystick/adc-joystick.c              |   16 +-
 drivers/input/keyboard/Kconfig                     |   23 -
 drivers/input/keyboard/Makefile                    |    2 -
 drivers/input/keyboard/adc-keys.c                  |    5 +-
 drivers/input/keyboard/adp5588-keys.c              |   99 +-
 drivers/input/keyboard/atkbd.c                     |   37 +-
 drivers/input/keyboard/gpio_keys.c                 |   48 +-
 drivers/input/keyboard/gpio_keys_polled.c          |    4 +-
 drivers/input/keyboard/iqs62x-keys.c               |    7 +-
 drivers/input/keyboard/matrix_keypad.c             |  334 ++-
 drivers/input/keyboard/mcs_touchkey.c              |  268 ---
 drivers/input/keyboard/mt6779-keypad.c             |   19 +-
 drivers/input/keyboard/nomadik-ske-keypad.c        |  378 ----
 drivers/input/keyboard/qt1050.c                    |   15 +-
 drivers/input/keyboard/snvs_pwrkey.c               |   24 +-
 drivers/input/keyboard/spear-keyboard.c            |   16 +-
 drivers/input/keyboard/tc3589x-keypad.c            |    3 +-
 drivers/input/keyboard/tegra-kbc.c                 |  117 +-
 drivers/input/matrix-keymap.c                      |   25 +-
 drivers/input/misc/ims-pcu.c                       |    2 +-
 drivers/input/misc/iqs269a.c                       |    7 +-
 drivers/input/misc/nxp-bbnsm-pwrkey.c              |   38 +
 drivers/input/misc/wistron_btns.c                  |    4 +-
 drivers/input/mouse/Kconfig                        |   12 +
 drivers/input/mouse/Makefile                       |    1 +
 drivers/input/mouse/alps.c                         |   48 +-
 drivers/input/mouse/bcm5974.c                      |   35 +-
 drivers/input/mouse/pixart_ps2.c                   |  300 +++
 drivers/input/mouse/pixart_ps2.h                   |   36 +
 drivers/input/mouse/psmouse-base.c                 |   17 +
 drivers/input/mouse/psmouse.h                      |    3 +-
 drivers/input/rmi4/rmi_f12.c                       |   43 +-
 drivers/input/serio/i8042-acpipnpio.h              |   37 +
 drivers/input/serio/ps2-gpio.c                     |    6 +-
 drivers/input/touchscreen/Kconfig                  |   42 -
 drivers/input/touchscreen/Makefile                 |    6 +-
 drivers/input/touchscreen/colibri-vf50-ts.c        |   10 +-
 drivers/input/touchscreen/cyttsp4_core.c           | 2174 --------------------
 drivers/input/touchscreen/cyttsp4_core.h           |  448 ----
 drivers/input/touchscreen/cyttsp4_i2c.c            |   72 -
 drivers/input/touchscreen/cyttsp4_spi.c            |  187 --
 drivers/input/touchscreen/cyttsp_core.c            |   39 +-
 drivers/input/touchscreen/cyttsp_core.h            |    5 -
 drivers/input/touchscreen/cyttsp_i2c.c             |   55 +
 drivers/input/touchscreen/cyttsp_i2c_common.c      |   86 -
 drivers/input/touchscreen/goodix_berlin.h          |    1 +
 drivers/input/touchscreen/goodix_berlin_core.c     |   43 +
 drivers/input/touchscreen/goodix_berlin_i2c.c      |    1 +
 drivers/input/touchscreen/goodix_berlin_spi.c      |    1 +
 drivers/input/touchscreen/hynitron_cstxxx.c        |    2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c          |   19 +-
 drivers/input/touchscreen/mcs5000_ts.c             |  288 ---
 drivers/input/touchscreen/tsc2004.c                |    6 -
 drivers/input/touchscreen/tsc2005.c                |    6 -
 drivers/input/touchscreen/tsc200x-core.c           |  249 +--
 drivers/input/touchscreen/tsc200x-core.h           |    1 -
 drivers/input/touchscreen/usbtouchscreen.c         |  956 ++++-----
 drivers/input/touchscreen/zforce_ts.c              |  474 ++---
 drivers/input/touchscreen/zinitix.c                |  134 +-
 include/linux/input/matrix_keypad.h                |   48 -
 include/linux/platform_data/cyttsp4.h              |   62 -
 include/linux/platform_data/keypad-nomadik-ske.h   |   50 -
 include/linux/platform_data/mcs.h                  |   30 -
 include/linux/platform_data/zforce_ts.h            |   15 -
 82 files changed, 2501 insertions(+), 6038 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.txt
 create mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ad7879.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/toradex,vf50-touchscreen.yaml
 delete mode 100644 drivers/input/keyboard/mcs_touchkey.c
 delete mode 100644 drivers/input/keyboard/nomadik-ske-keypad.c
 create mode 100644 drivers/input/mouse/pixart_ps2.c
 create mode 100644 drivers/input/mouse/pixart_ps2.h
 delete mode 100644 drivers/input/touchscreen/cyttsp4_core.c
 delete mode 100644 drivers/input/touchscreen/cyttsp4_core.h
 delete mode 100644 drivers/input/touchscreen/cyttsp4_i2c.c
 delete mode 100644 drivers/input/touchscreen/cyttsp4_spi.c
 delete mode 100644 drivers/input/touchscreen/cyttsp_i2c_common.c
 delete mode 100644 drivers/input/touchscreen/mcs5000_ts.c
 delete mode 100644 include/linux/platform_data/cyttsp4.h
 delete mode 100644 include/linux/platform_data/keypad-nomadik-ske.h
 delete mode 100644 include/linux/platform_data/mcs.h
 delete mode 100644 include/linux/platform_data/zforce_ts.h

Thanks.


-- 
Dmitry

