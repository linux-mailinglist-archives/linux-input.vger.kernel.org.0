Return-Path: <linux-input+bounces-5099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C042937B77
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 19:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961151F2271B
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 17:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B1913AD22;
	Fri, 19 Jul 2024 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nctoQYRI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69DB250EC;
	Fri, 19 Jul 2024 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721409468; cv=none; b=gkftNJFCfOCAFAU7SI1uom0MNNxb36caEs0eT64UjqqGg07lPLTIpcUty+2dpW0dCD6hYLS8RABEekoo2RyYrYH5sXKdlFshYPq1y4oxtd/wp61n5WRvAXllUjnVvwpqzOtckhIf50aNFNT8YiGFA3c2v3KOrzVj6YZtk0vQTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721409468; c=relaxed/simple;
	bh=NjduyhuW31fSKfY4WCEANXEOSHKGhXJJB4YLOZwGlXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htYUvkRxi3FlDTcaXTA0FsLLeXJH4IK0eZw/+miKii6u1hvsQyk4iF2xSNR0Oznzs6pZv053UIAXR3JAthgV5nYRyh4AAWCScL+kbs7rTuRv9H+HREO05cyKehDiSEE0bLf4647wysK12VQoTLwKGAQnkgzNlJl2N9AT+vvZns0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nctoQYRI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb4c4de4cbso1192428a91.1;
        Fri, 19 Jul 2024 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721409465; x=1722014265; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lm89hzeWH2A+O41O9cEpxN95xEDBH4dUVAwTIF+qwHw=;
        b=nctoQYRIrb18gvFrkjMdJo+L0qFiE+Al5ZPh7QaTVofuFhrd4Pb5O755OKp+WsX/fy
         vjpxRga3ciYlSQAvaK6dtltg/kJUBDYJtnZ6+y8EYRunVFibzaqQwlJ7JXfpHjFG8YYu
         3lJQN4Vj17HYBBTMuCDNFHXgL9hkdRRZw3oTIWCDxQYFRtRo++PrLs1w+PcTZklZ6Sdc
         rUIObWoJYmWhXLwDHpWNZ3plvItLX9NvUY7yrG7+l4TsRVgzHkyzczRsnTTNOkyMVPYJ
         vfUUl/Vj9A8T6maUB9D0e7irQ1Fk2DKDfMlFG9oo1MywCnen/dPjbtUdfynhSCy3gWxQ
         06Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721409465; x=1722014265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lm89hzeWH2A+O41O9cEpxN95xEDBH4dUVAwTIF+qwHw=;
        b=rM4df4MtaxwQpqwdjv2noI+HLPzw8FlbsxHm/WZJtMsYwgJVIrlKkcWfnV5lldsL7z
         1EKn/xvgDwzhX9KpHzAhNVNpUIV81Q4SVm3vQu06zzVD2ZUxda2lVJ3IHUxzHBx3vy5a
         tE1xAgYyPOkvtxmH9dnylSGo95LmqpYTtjJm4zx6N0rhYygQKDRrUWZwPVI92Y2sPCSv
         /TAwoL9VcnxYWfePokfkRysgleuIKyT24jKdVh0GQ76qqlawNrO/lhTZJgXWIJSuZxb1
         jtDqtd3D+Wk0Pid+4kV0+jRHPHPX5SVr81B2uxTrmbO8DMk9lJsw2cjMHBKeYu2X/6dQ
         Xaog==
X-Forwarded-Encrypted: i=1; AJvYcCXLHUKbTeMiO7XXIJFVsiASZM7/qs3HSQIkhUK2AuyAz1oFiD6JU/y93fKBytBoG5rE3NzTe3akG/G5sZzMvHm2wm7JNIatpQn3qno=
X-Gm-Message-State: AOJu0YwfTv7MqG6tzz7ehgTdLtrSCc8RZ4CrzQ4mj6NpvDu6MGI44pUU
	qKi3SkCb/kuoeiuVDvpXbMX2zo9Nh2dfB7p83pMPzYZaPR0YjkWrwYfz/A==
X-Google-Smtp-Source: AGHT+IGGFSqKGldF08w1uidnrHl3iIK/c/3xLSONnJX8Dm3wQ1joqYuFCqGwO4lmr8N8S1rk/6e4Ng==
X-Received: by 2002:a17:90a:9af:b0:2c9:752d:c007 with SMTP id 98e67ed59e1d1-2cb527f584amr7078599a91.29.1721409464760;
        Fri, 19 Jul 2024 10:17:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a7c:a422:21c9:7dde])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb772c1ce1sm3155604a91.7.2024.07.19.10.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 10:17:44 -0700 (PDT)
Date: Fri, 19 Jul 2024 10:17:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.11-rc0
Message-ID: <ZpqftagN_230ClsS@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc0

to receive updates for the input subsystem. You will get:

- streamlined logic in input core for handling normal input handlers vs
  input filters

- updates to input drivers to allocate memory with sizeof(*pointer)
  instead of sizeof(type)

- change to ads7846 touchscreen driver to use hsync GPIO instead of
  requiring platform data with special method (which is not compatible
  with boards using device tree)

- update to adc-joystick driver to handle inverted axes

- cleanups in various drivers switching them to use the new "guard"
  and "__free()" facilities

- changes to several drivers (adxl34x, atmel_mxt_ts, ati-remote2,
  omap-keypad, yealink) to stop creating driver-specific device
  attributes manually and use driver core facilities for this

- update to Cypress PS/2 protocol driver to properly handle errors
  from the PS/2 transport as well as other cleanups

- update to edt-ft5x06 driver to support ft5426 variant 

- update to ektf2127 driver to support ektf2232 variant

- update to exc3000 driver to support EXC81W32 variant

- update to imagis driver to support IST3038 variant

- other assorted driver cleanups.  


Changelog:
---------

Andreas Kemnade (5):
      dt-bindings: touchscreen: convert elan,ektf2127 to json-schema
      dt-bindings: touchscreen: elan,ektf2127: Add EKTF2232
      Input: ektf2127 - add ektf2232 support
      dt-bindings: input: touchscreen: edt-ft5x06: Add ft5426
      Input: edt-ft5x06 - add ft5426

Andrei Lalaev (1):
      Input: qt1050 - handle CHIP_ID reading error

Andrew Davis (1):
      dt-bindings: input: ti,nspire-keypad: convert to YAML format

Chris Morgan (1):
      Input: adc-joystick - handle inverted axes

Dmitry Torokhov (36):
      linux/interrupt.h: allow "guard" notation to disable and reenable IRQ
      Input: cap11xx - stop using chip ID when configuring it
      Input: adxl34x - use device core to create driver-specific device attributes
      Input: adxl34x - use input_set_capability()
      Input: adxl34x - switch to using managed resources
      Input: adxl34x - switch to using "guard" notation
      Input: ims-pcu - use driver core to instantiate device attributes
      Input: ims-pcu - switch to using cleanup functions
      Input: adc-joystick - move axes data into the main structure
      Input: wacom_w8001 - use "guard" notation when acquiring mutex
      Input: goodix_berlin - use __free() cleanup in SPI transport
      Input: rohm_bu21023 - factor out settings update code
      Input: rohm_bu21023 - switch to using sysfs_emit()
      Input: rohm_bu21023 - switch to using cleanup functions
      Input: ili210x - use kvmalloc() to allocate buffer for firmware update
      Input: ili210x - switch to using cleanup functions in firmware code
      Input: ili210x - use guard notation when disabling and reenabling IRQ
      Input: elan_i2c - do not leave interrupt disabled on suspend failure
      Input: cypress_ps2 - clean up setting reporting rate
      Input: cypress_ps2 - fix error handling when sending command fails
      Input: cypress_ps2 - report timeouts when reading command status
      Input: cypress_ps2 - propagate errors from lower layers
      Input: cypress_ps2 - use u8 when dealing with byte data
      Input: evdev - remove ->event() method
      Input: make sure input handlers define only one processing method
      Input: make events() method return number of events processed
      Input: simplify event handling logic
      Input: rearrange input_alloc_device() to prepare for preallocating of vals
      Input: preallocate memory to hold event values
      Input: do not check number of events in input_pass_values()
      Input: twl4030-pwrbutton - fix kernel-doc warning
      Input: atmel_mxt_ts - use driver core to instantiate device attributes
      Input: omap-keypad - use driver core to instantiate device attributes
      Input: ati-remote2 - use driver core to instantiate device attributes
      Input: yealink - use driver core to instantiate device attributes
      Input: yealink - simplify locking in sysfs attribute handling

Erick Archer (8):
      Input: keyboard - use sizeof(*pointer) instead of sizeof(type)
      Input: misc - use sizeof(*pointer) instead of sizeof(type)
      Input: mouse - use sizeof(*pointer) instead of sizeof(type)
      Input: tablet - use sizeof(*pointer) instead of sizeof(type)
      Input: serio - use sizeof(*pointer) instead of sizeof(type)
      Input: gameport - use sizeof(*pointer) instead of sizeof(type)
      Input: touchscreen - use sizeof(*pointer) instead of sizeof(type)
      Input: joystick - use sizeof(*pointer) instead of sizeof(type)

Felix Kaechele (5):
      dt-bindings: input: touchscreen: himax,hx83112b: add HX83100A
      Input: himax_hx83112b - use more descriptive register defines
      Input: himax_hx83112b - implement MCU register reading
      Input: himax_hx83112b - add himax_chip struct for multi-chip support
      Input: himax_hx83112b - add support for HX83100A

Jason Gerecke (2):
      Input: wacom_w8001 - simplify device name generation
      Input: wacom_w8001 - correct device name generation

Javier Carrasco (4):
      Input: ims-pcu - annotate struct ims_pcu_flash_fmt with __counted_by
      Input: ims-pcu - drop repeated "input" in error message
      Input: qt1050 - constify struct regmap_config
      Input: fsl-imx25-tcq - constify struct regmap_config

Jeff Johnson (1):
      Input: add missing MODULE_DESCRIPTION() macros

Linus Walleij (2):
      dt-bindings: ads7846: Add hsync-gpios
      Input: ads7846 - handle HSYNC GPIO

Philipp Zabel (2):
      dt-bindings: input: touchscreen: exc3000: add EXC81W32
      Input: exc3000 - add EXC81W32 support

Raymond Hackley (3):
      Input: imagis - clarify the usage of protocol_b
      dt-bindings: input/touchscreen: imagis: Document ist3038
      Input: imagis - add supports for Imagis IST3038

Diffstat:
--------

 .../devicetree/bindings/input/ti,nspire-keypad.txt |  60 ------
 .../bindings/input/ti,nspire-keypad.yaml           |  74 +++++++
 .../bindings/input/touchscreen/ads7846.txt         |   1 +
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |   1 +
 .../bindings/input/touchscreen/eeti,exc3000.yaml   |  12 +-
 .../bindings/input/touchscreen/ektf2127.txt        |  25 ---
 .../bindings/input/touchscreen/elan,ektf2127.yaml  |  58 ++++++
 .../bindings/input/touchscreen/himax,hx83112b.yaml |   1 +
 .../input/touchscreen/imagis,ist3038c.yaml         |   1 +
 drivers/input/evdev.c                              |  16 +-
 drivers/input/gameport/emu10k1-gp.c                |   2 +-
 drivers/input/gameport/fm801-gp.c                  |   2 +-
 drivers/input/gameport/gameport.c                  |   2 +-
 drivers/input/gameport/ns558.c                     |   4 +-
 drivers/input/input.c                              | 230 ++++++++++++++-------
 drivers/input/joystick/a3d.c                       |   2 +-
 drivers/input/joystick/adc-joystick.c              | 130 +++++++-----
 drivers/input/joystick/adi.c                       |   2 +-
 drivers/input/joystick/analog.c                    |   3 +-
 drivers/input/joystick/as5011.c                    |   2 +-
 drivers/input/joystick/cobra.c                     |   2 +-
 drivers/input/joystick/db9.c                       |   2 +-
 drivers/input/joystick/gamecon.c                   |   2 +-
 drivers/input/joystick/gf2k.c                      |   2 +-
 drivers/input/joystick/grip.c                      |   3 +-
 drivers/input/joystick/grip_mp.c                   |   3 +-
 drivers/input/joystick/guillemot.c                 |   2 +-
 drivers/input/joystick/interact.c                  |   2 +-
 drivers/input/joystick/magellan.c                  |   2 +-
 drivers/input/joystick/maplecontrol.c              |   2 +-
 drivers/input/joystick/n64joy.c                    |   2 +-
 drivers/input/joystick/sidewinder.c                |   2 +-
 drivers/input/joystick/spaceball.c                 |   2 +-
 drivers/input/joystick/spaceorb.c                  |   2 +-
 drivers/input/joystick/stinger.c                   |   2 +-
 drivers/input/joystick/tmdc.c                      |   3 +-
 drivers/input/joystick/turbografx.c                |   2 +-
 drivers/input/joystick/twidjoy.c                   |   2 +-
 drivers/input/joystick/warrior.c                   |   2 +-
 drivers/input/joystick/xpad.c                      |   4 +-
 drivers/input/joystick/zhenhua.c                   |   2 +-
 drivers/input/keyboard/atkbd.c                     |   2 +-
 drivers/input/keyboard/cap11xx.c                   | 125 ++++++-----
 drivers/input/keyboard/lkkbd.c                     |   2 +-
 drivers/input/keyboard/locomokbd.c                 |   2 +-
 drivers/input/keyboard/maple_keyb.c                |   2 +-
 drivers/input/keyboard/newtonkbd.c                 |   2 +-
 drivers/input/keyboard/omap-keypad.c               |  21 +-
 drivers/input/keyboard/qt1050.c                    |   9 +-
 drivers/input/keyboard/stowaway.c                  |   2 +-
 drivers/input/keyboard/sunkbd.c                    |   2 +-
 drivers/input/keyboard/xtkbd.c                     |   2 +-
 drivers/input/matrix-keymap.c                      |   1 +
 drivers/input/misc/88pm80x_onkey.c                 |   2 +-
 drivers/input/misc/adxl34x-i2c.c                   |   9 +-
 drivers/input/misc/adxl34x-spi.c                   |   9 +-
 drivers/input/misc/adxl34x.c                       | 159 +++++---------
 drivers/input/misc/adxl34x.h                       |   2 +-
 drivers/input/misc/ati_remote2.c                   |  50 ++---
 drivers/input/misc/cma3000_d0x.c                   |   2 +-
 drivers/input/misc/ims-pcu.c                       | 197 +++++++++---------
 drivers/input/misc/max8997_haptic.c                |   2 +-
 drivers/input/misc/pcap_keys.c                     |   2 +-
 drivers/input/misc/powermate.c                     |   2 +-
 drivers/input/misc/sgi_btns.c                      |   1 +
 drivers/input/misc/soc_button_array.c              |   1 +
 drivers/input/misc/twl4030-pwrbutton.c             |   4 +-
 drivers/input/misc/uinput.c                        |   2 +-
 drivers/input/misc/yealink.c                       |  85 +++-----
 drivers/input/mouse/alps.c                         |   2 +-
 drivers/input/mouse/appletouch.c                   |   2 +-
 drivers/input/mouse/bcm5974.c                      |   2 +-
 drivers/input/mouse/cypress_ps2.c                  | 184 ++++++++---------
 drivers/input/mouse/cypress_ps2.h                  |   6 -
 drivers/input/mouse/elan_i2c_core.c                |   2 +
 drivers/input/mouse/focaltech.c                    |   3 +-
 drivers/input/mouse/hgpk.c                         |   2 +-
 drivers/input/mouse/lifebook.c                     |   2 +-
 drivers/input/mouse/maplemouse.c                   |   2 +-
 drivers/input/mouse/psmouse-base.c                 |   2 +-
 drivers/input/mouse/sentelic.c                     |   2 +-
 drivers/input/mouse/sermouse.c                     |   2 +-
 drivers/input/mouse/synaptics.c                    |   4 +-
 drivers/input/mouse/synaptics_i2c.c                |   2 +-
 drivers/input/mouse/vsxxxaa.c                      |   2 +-
 drivers/input/serio/altera_ps2.c                   |   2 +-
 drivers/input/serio/ambakmi.c                      |   4 +-
 drivers/input/serio/apbps2.c                       |   2 +-
 drivers/input/serio/arc_ps2.c                      |   2 +-
 drivers/input/serio/ct82c710.c                     |   2 +-
 drivers/input/serio/gscps2.c                       |   4 +-
 drivers/input/serio/hyperv-keyboard.c              |   4 +-
 drivers/input/serio/i8042.c                        |   4 +-
 drivers/input/serio/maceps2.c                      |   2 +-
 drivers/input/serio/olpc_apsp.c                    |   4 +-
 drivers/input/serio/parkbd.c                       |   2 +-
 drivers/input/serio/pcips2.c                       |   4 +-
 drivers/input/serio/ps2-gpio.c                     |   4 +-
 drivers/input/serio/ps2mult.c                      |   2 +-
 drivers/input/serio/q40kbd.c                       |   4 +-
 drivers/input/serio/rpckbd.c                       |   2 +-
 drivers/input/serio/sa1111ps2.c                    |   4 +-
 drivers/input/serio/serio.c                        |   2 +-
 drivers/input/serio/serio_raw.c                    |   4 +-
 drivers/input/serio/serport.c                      |   4 +-
 drivers/input/serio/sun4i-ps2.c                    |   4 +-
 drivers/input/serio/userio.c                       |   4 +-
 drivers/input/serio/xilinx_ps2.c                   |   4 +-
 drivers/input/tablet/acecad.c                      |   2 +-
 drivers/input/tablet/aiptek.c                      |   2 +-
 drivers/input/tablet/hanwang.c                     |   2 +-
 drivers/input/tablet/kbtab.c                       |   2 +-
 drivers/input/tablet/wacom_serial4.c               |   2 +-
 drivers/input/tests/input_test.c                   |   1 +
 drivers/input/touchscreen/ads7846.c                |  35 +++-
 drivers/input/touchscreen/atmel_mxt_ts.c           |  16 +-
 drivers/input/touchscreen/cyttsp_i2c_common.c      |   1 +
 drivers/input/touchscreen/da9052_tsi.c             |   2 +-
 drivers/input/touchscreen/dynapro.c                |   2 +-
 drivers/input/touchscreen/edt-ft5x06.c             |   1 +
 drivers/input/touchscreen/egalax_ts_serial.c       |   2 +-
 drivers/input/touchscreen/ektf2127.c               |  36 +++-
 drivers/input/touchscreen/elo.c                    |   2 +-
 drivers/input/touchscreen/exc3000.c                |   7 +
 drivers/input/touchscreen/fsl-imx25-tcq.c          |   2 +-
 drivers/input/touchscreen/fujitsu_ts.c             |   2 +-
 drivers/input/touchscreen/goodix_berlin_spi.c      |  24 ++-
 drivers/input/touchscreen/gunze.c                  |   2 +-
 drivers/input/touchscreen/hampshire.c              |   2 +-
 drivers/input/touchscreen/himax_hx83112b.c         | 135 +++++++++---
 drivers/input/touchscreen/ili210x.c                | 127 ++++++------
 drivers/input/touchscreen/imagis.c                 |  33 ++-
 drivers/input/touchscreen/inexio.c                 |   2 +-
 drivers/input/touchscreen/mtouch.c                 |   2 +-
 drivers/input/touchscreen/penmount.c               |   2 +-
 drivers/input/touchscreen/rohm_bu21023.c           |  95 ++++-----
 drivers/input/touchscreen/sur40.c                  |   2 +-
 drivers/input/touchscreen/touchit213.c             |   2 +-
 drivers/input/touchscreen/touchright.c             |   2 +-
 drivers/input/touchscreen/touchwin.c               |   2 +-
 drivers/input/touchscreen/tsc40.c                  |   2 +-
 drivers/input/touchscreen/usbtouchscreen.c         |  15 +-
 drivers/input/touchscreen/wacom_w8001.c            |  37 ++--
 drivers/input/vivaldi-fmap.c                       |   1 +
 include/linux/input.h                              |   7 +-
 include/linux/interrupt.h                          |   4 +
 146 files changed, 1236 insertions(+), 1052 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/ti,nspire-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,nspire-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml

Thanks.


-- 
Dmitry

