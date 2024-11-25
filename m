Return-Path: <linux-input+bounces-8225-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FD69D79BA
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 02:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0D8C282727
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 01:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61987184E;
	Mon, 25 Nov 2024 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEHTOYnp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65705748F;
	Mon, 25 Nov 2024 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732497501; cv=none; b=lrNMOX4y9da8im+lghQMPgxCXxU5UPQ3EdJxOwtzH7HYnIrMeA3btqFu0zPbQmZjWhPpBoBPJwGniA/A1z2RqkQhPTJB2uBm7Vd2yLURktAxOI+Faq6o9D0CrF904gLOzJ9uFxM1sbaF2Xw6PCrw5/BuDlw10RO4+UppQ9MLUtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732497501; c=relaxed/simple;
	bh=n/A4cGs0ht67MX+ggmE8gIVMiViPCemu2aMoihBsfQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugci3QskYMyOO5qF3gXADHviOX6w6x11bqNaA0l3JK519Ec41V0kFpO6gGYItlLxwnUqkl/6X6o8ce6bHFPyjj/cvjGnTbU18Z/gotCU073owtRJb7FhBsiYGHFC5eYs0ghSmr+CWJUDbeyChOg8TW4QM+QA9hYOnBJpNi906EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEHTOYnp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ea45dac86eso3321999a91.3;
        Sun, 24 Nov 2024 17:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732497498; x=1733102298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpsrLwi0x/86jBHhVpaJvVMarv4IwBuhNB/rslBX9hQ=;
        b=AEHTOYnpbxDU1XJbEvYillFuidhqBllP+HN67oFJQwm7+fm78zmgBQMd9iOxiwXcnI
         8DfZE/19zcvR8pgQEHrzAVJcE7Uk4kG9L/56AwUvletIWcPpwBjWQcMR5N0w7AS7FE8W
         EkB/GaAUkMZRJx+rpgHVKc0V1IFlILqo4YDrdMEkN6ssICRZeiiXtbC5XDcYM9NqWcIg
         Aoxppy4qWQVmU4tCs4GEqNnsbexsbGSJB/UtVsRW9Z6m8MI50u05ZXsVweh6OmDIG3Kd
         YFQ+Vr/BqayLI36MVFK8+3BsD/czzujQu4e6y+w9bR061ajlQYrVFYhP8Q4+7e7dIDOb
         kYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732497498; x=1733102298;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpsrLwi0x/86jBHhVpaJvVMarv4IwBuhNB/rslBX9hQ=;
        b=fsC7rVM4pso7/Rck8Q17JASz0XFGPP6Hlpl87DvUGU+55PWD291pxBKdlqcFJvQpmj
         94C3+ItzuVjAhebh+0q09t0DAe+/2LL+wJfv/+Ljus2VsftAxJ0CTy/SoDNcqdNSVrPx
         2/fl0zbnDiLxLUFWUZCnJGa37W702FNdr7aNhIrdVZgkK1LP6GcP0fnYq/9980Eb974S
         Kpy+6mZRvg2fwYvHDxREISYN7mXo6+EwvUBZ+kc1gNxXWzDqMpVf04iQdbpSWgOl8vNU
         Gp2PJLUfhKjP31zo7xQDJZTQ6ZY3IslFq2pqofZouzqD9BUjjRoPggOR9pp4fnFjnIVt
         NAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ex2zF5P/9SaNYoP1IO+lvcxOYGecUSeaMvzzzaqcUEu8FmZs5aGskR4DhRJnWs+GarRRpj7ONmofoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh10szT2/h+uuzTeQ/9Z6/dwpQ9p6pAo8w8oySffXpH57HLI88
	tZfjmTQqH+D2Cu84NjzqKWmR6YzDdTNACCsahTr0urgQOK9kMng4
X-Gm-Gg: ASbGnct8UEIRDIr2uVWQ5H1Rg5eiaoQXBjQz2RuoodYlk5Dz/5HB2OaiekqJ6NlyZ/9
	wDw6y0pNqZvaKRUnfhOZSk+Q1gdbVzlQJMnemuTK1YXWrsN0pwy5uANnbku7gUrvVqABBJXuXe/
	Ze0uVTdds6iLx+QFgiNQh1PgSw0phHdlTZWvgINmIbwLe0jsPh6/jSsaLvEdjzLR9TbEFG2Z9SB
	AL8X3ZcWHb02pRzVma58ogNPL64LmgMUwL1k0pORHdCKEoRjGw=
X-Google-Smtp-Source: AGHT+IF/DsuImC4rIDK+lQ5JUogWmqgHq1QtGdYuEfRbMk3Si164j5NafXDDV5ongl4eV4Tse0+0cQ==
X-Received: by 2002:a17:90b:4d01:b0:2ea:4578:46cf with SMTP id 98e67ed59e1d1-2eb0e8417edmr14158208a91.30.1732497498454;
        Sun, 24 Nov 2024 17:18:18 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e4f5:a3f2:59cb:65c6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead04f8ea7sm9005759a91.52.2024.11.24.17.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 17:18:17 -0800 (PST)
Date: Sun, 24 Nov 2024 17:18:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.13-rc0
Message-ID: <Z0PQVxK5T8AFnsJp@google.com>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.13-rc0

to receive updates for the input subsystem. You will get:

- support for NT36672A touchscreen added to novatek-nvt-ts driver

- a change to ads7846 driver to prevent XPT2046 from locking up

- a change switching platform input dirves back to using remove() method
  (from remove_new())

- updates to a number of input drivers to use the new cleanup facilities
  (__free(...), guard(), and scoped-guard()) which ensure that the
  resources and locks are released properly and automatically

- other assorted driver cleanups and fixes.

Changelog:
---------

AngeloGioacchino Del Regno (1):
      dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6359 keys

Christophe JAILLET (2):
      Input: synaptics - fix a typo
      Input: cypress-sf - constify struct i2c_device_id

David Lechner (1):
      Input: mpr121 - use devm_regulator_get_enable_read_voltage()

Dmitry Torokhov (75):
      Input: psmouse-smbus - use guard notation when acquiring mutex
      Input: elan_i2c - switch to using cleanup functions
      Input: adp5589-keys - use guard notation when acquiring mutex
      Input: applespi - use guard notation when acquiring spinlock
      Input: ep93xx_keypad - use guard notation when acquiring mutex
      Input: imx_keypad - use guard notation when acquiring mutex
      Input: ipaq-micro-keys - use guard notation when acquiring mutex and spinlock
      Input: lm8323 - use guard notation when acquiring mutexes
      Input: lpc32xx-keys - use guard notation when acquiring mutex
      Input: matrix_keypad - use guard notation when acquiring spinlock
      Input: omap4-keypad - use guard notation when acquiring mutex
      Input: pmic8xxx-keypad - use guard notation when acquiring mutex
      Input: pxa27x_keypad - use guard notation when acquiring mutex
      Input: spear-keyboard - use guard notation when acquiring mutex
      Input: st-keyscan - use guard notation when acquiring mutex
      Input: db9 - use guard notation when acquiring mutex
      Input: gamecon - use guard notation when acquiring mutex
      Input: iforce - use guard notation when acquiring mutex and spinlock
      Input: n64joy - use guard notation when acquiring mutex
      Input: turbografx - use guard notation when acquiring mutex
      Input: xpad - use guard notation when acquiring mutex and spinlock
      Input: ad714x - use guard notation when acquiring mutex
      Input: ati_remote2 - use guard notation when acquiring mutex
      Input: cm109 - use guard notation when acquiring mutex and spinlock
      Input: cma3000_d0x - use guard notation when acquiring mutex
      Input: da7280 - use guard notation when acquiring mutex and spinlock
      Input: kxtj9 - use guard notation when acquiring mutex/disabling irq
      Input: drv260x - use guard notation when acquiring mutex
      Input: drv2665 - use guard notation when acquiring mutex
      Input: drv2667 - use guard notation when acquiring mutex
      Input: ideapad_slidebar - use guard notation when acquiring spinlock
      Input: ibm-panel - use guard notation when acquiring spinlock
      Input: iqs269a - use guard notation when acquiring mutex
      Input: iqs269a - use cleanup facility for fwnodes
      Input: iqs626a - use cleanup facility for fwnodes
      Input: iqs7222 - use cleanup facility for fwnodes
      Input: max8997_haptic - use guard notation when acquiring mutex
      Input: pegasus_notetaker - use guard notation when acquiring mutex
      Input: powermate - use guard notation when acquiring spinlock
      Input: pwm-beeper - use guard notation when acquiring spinlock
      Input: regulator-haptic - use guard notation when acquiring mutex
      Input: rotary_encoder - use guard notation when acquiring mutex
      Input: sparcspkr - use guard notation when acquiring spinlock
      Input: serio - define serio_pause_rx guard to pause and resume serio ports
      Input: libps2 - use guard notation when temporarily pausing serio ports
      Input: alps - use guard notation when pausing serio port
      Input: byd - use guard notation when pausing serio port
      Input: synaptics - use guard notation when pausing serio port
      Input: atkbd - use guard notation when pausing serio port
      Input: sunkbd - use guard notation when pausing serio port
      Input: synaptics-rmi4 - use guard notation when pausing serio port in F03
      Input: elo - use guard notation when pausing serio port
      Input: gscps2 - use guard notation when acquiring spinlock
      Input: hyperv-keyboard - use guard notation when acquiring spinlock
      Input: i8042 - tease apart interrupt handler
      Input: i8042 - use guard notation when acquiring spinlock
      Input: ps2-gpio - use guard notation when acquiring mutex
      Input: ps2mult - use guard notation when acquiring spinlock
      Input: q40kbd - use guard notation when acquiring spinlock
      Input: sa1111ps2 - use guard notation when acquiring spinlock
      Input: serport - use guard notation when acquiring spinlock
      Input: serio - use guard notation when acquiring mutexes and spinlocks
      Input: serio_raw - use guard notation for locks and other resources
      Input: serio-raw - fix potential serio port name truncation
      Input: sun4i-ps2 - use guard notation when acquiring spinlock
      Input: userio - switch to using cleanup functions
      Input: xilinx_ps2 - use guard notation when acquiring spinlock
      Input: gscps2 - fix compilation error introduced with switch to guards
      Input: serio_raw - fix uninitialized variable bug
      Input: omap-keypad - use guard notation when acquiring mutex
      Input: synaptics-rmi4 - switch to using cleanup functions in F34
      Input: hilkbd - use guard notation when acquiring spinlock
      Input: locomokbd - use guard notation when acquiring spinlock
      Input: maple_keyb - use guard notation when acquiring mutex
      Input: introduce notion of passive observers for input handlers

Javier Carrasco (13):
      Input: hideep - add missing dependency on REGMAP_I2C
      Input: hycon-hy46xx - add missing dependency on REGMAP_I2C
      Input: cap11xx - switch to for_each_child_of_node_scoped
      Input: mtk-pmic-keys - switch to for_each_child_of_node_scoped
      Input: sun4i-lradc-keys - switch to for_each_child_of_node_scoped
      Input: twl6040-vibra - use cleanup facility for device_node
      Input: twl4030-vibra - use cleanup facility for device_node
      Input: 88pm860x - use cleanup facility for device_node
      Input: i8042 - use cleanup facility for device_node
      Input: raspberrypi-ts - use cleanup facility for device_node
      Input: ts4800-ts - use cleanup facility for device_node
      Input: sparcspkr - use device managed memory for 'state'
      Input: sparcspkr - use cleanup facility for device_node

Joel Selvaraj (3):
      Input: novatek-nvt-ts - replace generic i2c device id with specific IC variant
      dt-bindings: input: document Novatek NVT touchscreen controller
      Input: novatek-nvt-ts - add support for NT36672A touchscreen

Marek Vasut (1):
      Input: ads7846 - add dummy command register clearing cycle

Maud Spierings (1):
      Input: fix the input_event struct documentation

Nathan Chancellor (1):
      Input: ads7846 - increase xfer array size in 'struct ser_req'

Rob Herring (Arm) (1):
      dt-bindings: input: rotary-encoder: Fix "rotary-encoder,rollover" type

Shen Lichuan (1):
      Input: correct typos in multiple comments across misc drivers

Shivam Chaudhary (1):
      Input: i8042 - fix typo dublicate to duplicate

Uwe Kleine-König (1):
      Input: switch back to struct platform_driver::remove()

Wolfram Sang (2):
      Input: spear-keyboard - don't include 'pm_wakeup.h' directly
      Input: sun4i-lradc-keys - don't include 'pm_wakeup.h' directly

Yang Li (2):
      Input: matrix_keypad - remove duplicated include
      Input: userio - remove unneeded semicolon

Yu Jiaoliang (1):
      input: Fix typos in comments across various files

Yuan Can (1):
      Input: cs40l50 - fix wrong usage of INIT_WORK()

Zeng Heng (1):
      Input: imagis - fix warning regarding 'imagis_3038_data' being unused

Diffstat:
--------

 .../bindings/input/mediatek,pmic-keys.yaml         |   1 +
 .../devicetree/bindings/input/rotary-encoder.yaml  |   2 +-
 .../bindings/input/touchscreen/novatek,nvt-ts.yaml |  62 ++++
 Documentation/input/input.rst                      |   2 +-
 MAINTAINERS                                        |   1 +
 drivers/input/input.c                              |  15 +-
 drivers/input/joystick/db9.c                       |  30 +-
 drivers/input/joystick/gamecon.c                   |  22 +-
 drivers/input/joystick/iforce/iforce-ff.c          |  48 ++-
 drivers/input/joystick/iforce/iforce-packets.c     |  57 ++--
 drivers/input/joystick/iforce/iforce-serio.c       |  36 +--
 drivers/input/joystick/iforce/iforce-usb.c         |  13 +-
 drivers/input/joystick/n64joy.c                    |  35 +--
 drivers/input/joystick/turbografx.c                |  22 +-
 drivers/input/joystick/xpad.c                      |  99 +++----
 drivers/input/keyboard/adp5520-keys.c              |   2 +-
 drivers/input/keyboard/adp5589-keys.c              |  39 ++-
 drivers/input/keyboard/applespi.c                  |  72 ++---
 drivers/input/keyboard/atkbd.c                     |   8 +-
 drivers/input/keyboard/cap11xx.c                   |  12 +-
 drivers/input/keyboard/cros_ec_keyb.c              |   2 +-
 drivers/input/keyboard/cypress-sf.c                |   2 +-
 drivers/input/keyboard/ep93xx_keypad.c             |  10 +-
 drivers/input/keyboard/hilkbd.c                    |   4 +-
 drivers/input/keyboard/imx_keypad.c                |  27 +-
 drivers/input/keyboard/ipaq-micro-keys.c           |  12 +-
 drivers/input/keyboard/iqs62x-keys.c               |   2 +-
 drivers/input/keyboard/lm8323.c                    |  49 ++-
 drivers/input/keyboard/locomokbd.c                 |   5 +-
 drivers/input/keyboard/lpc32xx-keys.c              |  18 +-
 drivers/input/keyboard/maple_keyb.c                |   9 +-
 drivers/input/keyboard/matrix_keypad.c             |  19 +-
 drivers/input/keyboard/mpr121_touchkey.c           |  45 +--
 drivers/input/keyboard/mtk-pmic-keys.c             |  17 +-
 drivers/input/keyboard/omap-keypad.c               |  18 +-
 drivers/input/keyboard/omap4-keypad.c              |   6 +-
 drivers/input/keyboard/pmic8xxx-keypad.c           |   8 +-
 drivers/input/keyboard/pxa27x_keypad.c             |  16 +-
 drivers/input/keyboard/samsung-keypad.c            |   2 +-
 drivers/input/keyboard/sh_keysc.c                  |   2 +-
 drivers/input/keyboard/spear-keyboard.c            |   9 +-
 drivers/input/keyboard/st-keyscan.c                |  19 +-
 drivers/input/keyboard/stmpe-keypad.c              |   2 +-
 drivers/input/keyboard/sun4i-lradc-keys.c          |   8 +-
 drivers/input/keyboard/sunkbd.c                    |   5 +-
 drivers/input/misc/88pm80x_onkey.c                 |   2 +-
 drivers/input/misc/ad714x.c                        |  12 +-
 drivers/input/misc/ati_remote2.c                   |  57 ++--
 drivers/input/misc/cm109.c                         | 167 +++++------
 drivers/input/misc/cma3000_d0x.c                   |  16 +-
 drivers/input/misc/cs40l50-vibra.c                 |   6 +-
 drivers/input/misc/da7280.c                        |  26 +-
 drivers/input/misc/da9052_onkey.c                  |   4 +-
 drivers/input/misc/da9055_onkey.c                  |   4 +-
 drivers/input/misc/drv260x.c                       |  50 ++--
 drivers/input/misc/drv2665.c                       |  46 ++-
 drivers/input/misc/drv2667.c                       |  46 ++-
 drivers/input/misc/ibm-panel.c                     |   5 +-
 drivers/input/misc/ideapad_slidebar.c              |  26 +-
 drivers/input/misc/ims-pcu.c                       |   2 +-
 drivers/input/misc/iqs269a.c                       |  55 ++--
 drivers/input/misc/iqs626a.c                       |  22 +-
 drivers/input/misc/iqs7222.c                       |  30 +-
 drivers/input/misc/kxtj9.c                         |  16 +-
 drivers/input/misc/m68kspkr.c                      |   2 +-
 drivers/input/misc/max8997_haptic.c                |  17 +-
 drivers/input/misc/mc13783-pwrbutton.c             |   2 +-
 drivers/input/misc/palmas-pwrbutton.c              |   2 +-
 drivers/input/misc/pcap_keys.c                     |   2 +-
 drivers/input/misc/pcf50633-input.c                |   2 +-
 drivers/input/misc/pcspkr.c                        |   2 +-
 drivers/input/misc/pm8941-pwrkey.c                 |   2 +-
 drivers/input/misc/powermate.c                     |  11 +-
 drivers/input/misc/pwm-beeper.c                    |  12 +-
 drivers/input/misc/regulator-haptic.c              |  24 +-
 drivers/input/misc/rotary_encoder.c                |  23 +-
 drivers/input/misc/soc_button_array.c              |   4 +-
 drivers/input/misc/sparcspkr.c                     |  59 ++--
 drivers/input/misc/tps65219-pwrbutton.c            |   2 +-
 drivers/input/misc/twl4030-vibra.c                 |  11 +-
 drivers/input/misc/twl6040-vibra.c                 |   8 +-
 drivers/input/misc/wistron_btns.c                  |   4 +-
 drivers/input/misc/wm831x-on.c                     |   2 +-
 drivers/input/misc/yealink.c                       |   4 +-
 drivers/input/mouse/alps.c                         |   4 +-
 drivers/input/mouse/amimouse.c                     |   2 +-
 drivers/input/mouse/byd.c                          |   5 +-
 drivers/input/mouse/elan_i2c_core.c                | 228 +++++++-------
 drivers/input/mouse/elan_i2c_i2c.c                 |  14 +-
 drivers/input/mouse/psmouse-smbus.c                |  28 +-
 drivers/input/mouse/synaptics.c                    |   6 +-
 drivers/input/mouse/synaptics.h                    |   2 +-
 drivers/input/rmi4/rmi_f03.c                       |   4 +-
 drivers/input/rmi4/rmi_f34.c                       |  37 +--
 drivers/input/serio/altera_ps2.c                   |   2 +-
 drivers/input/serio/ams_delta_serio.c              |   2 +-
 drivers/input/serio/apbps2.c                       |   2 +-
 drivers/input/serio/arc_ps2.c                      |   2 +-
 drivers/input/serio/ct82c710.c                     |   2 +-
 drivers/input/serio/gscps2.c                       | 116 ++++----
 drivers/input/serio/hyperv-keyboard.c              |  38 ++-
 drivers/input/serio/i8042-acpipnpio.h              |   2 +-
 drivers/input/serio/i8042-sparcio.h                |  16 +-
 drivers/input/serio/i8042.c                        | 329 ++++++++++-----------
 drivers/input/serio/ioc3kbd.c                      |   2 +-
 drivers/input/serio/libps2.c                       |  28 +-
 drivers/input/serio/maceps2.c                      |   2 +-
 drivers/input/serio/olpc_apsp.c                    |   2 +-
 drivers/input/serio/ps2-gpio.c                     |   6 +-
 drivers/input/serio/ps2mult.c                      |  25 +-
 drivers/input/serio/q40kbd.c                       |  12 +-
 drivers/input/serio/rpckbd.c                       |   2 +-
 drivers/input/serio/sa1111ps2.c                    |   8 +-
 drivers/input/serio/serio.c                        | 165 +++++------
 drivers/input/serio/serio_raw.c                    | 125 ++++----
 drivers/input/serio/serport.c                      |  27 +-
 drivers/input/serio/sun4i-ps2.c                    |  10 +-
 drivers/input/serio/userio.c                       | 139 +++++----
 drivers/input/serio/xilinx_ps2.c                   |  17 +-
 drivers/input/tablet/pegasus_notetaker.c           |  86 +++---
 drivers/input/touchscreen/88pm860x-ts.c            |  20 +-
 drivers/input/touchscreen/Kconfig                  |   2 +
 drivers/input/touchscreen/ads7846.c                |  14 +-
 drivers/input/touchscreen/auo-pixcir-ts.c          |   2 +-
 drivers/input/touchscreen/bcm_iproc_tsc.c          |   2 +-
 drivers/input/touchscreen/da9052_tsi.c             |   2 +-
 drivers/input/touchscreen/edt-ft5x06.c             |   2 +-
 drivers/input/touchscreen/elo.c                    |   8 +-
 drivers/input/touchscreen/ili210x.c                |   2 +-
 drivers/input/touchscreen/imagis.c                 |   2 +-
 drivers/input/touchscreen/mainstone-wm97xx.c       |   2 +-
 drivers/input/touchscreen/mc13783_ts.c             |   2 +-
 drivers/input/touchscreen/novatek-nvt-ts.c         |  67 ++++-
 drivers/input/touchscreen/pcap_ts.c                |   2 +-
 drivers/input/touchscreen/pixcir_i2c_ts.c          |   2 +-
 drivers/input/touchscreen/raspberrypi-ts.c         |   4 +-
 drivers/input/touchscreen/rohm_bu21023.c           |   4 +-
 drivers/input/touchscreen/stmpe-ts.c               |   6 +-
 drivers/input/touchscreen/sun4i-ts.c               |   4 +-
 drivers/input/touchscreen/ti_am335x_tsc.c          |   4 +-
 drivers/input/touchscreen/ts4800-ts.c              |   5 +-
 drivers/input/touchscreen/wm831x-ts.c              |   2 +-
 drivers/input/touchscreen/wm97xx-core.c            |   6 +-
 drivers/platform/x86/x86-android-tablets/other.c   |   2 +-
 include/linux/input.h                              |   5 +
 include/linux/serio.h                              |   3 +
 146 files changed, 1511 insertions(+), 1843 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml

Thanks.


-- 
Dmitry

