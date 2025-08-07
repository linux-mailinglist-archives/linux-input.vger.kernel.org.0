Return-Path: <linux-input+bounces-13849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C982B1D173
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 06:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB095814EC
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 04:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7131DF970;
	Thu,  7 Aug 2025 04:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMRYw72W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012251A254E;
	Thu,  7 Aug 2025 04:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754540726; cv=none; b=mzQ5yJEoltJqptZsLiitzTCBdVGNCEySJiEfnj1VFWLGBUL+22aXBTXBAzy5PcCbJ4DDON6UFy0XIKhfHkdvC4uPZEhUTPenwOwDZbRC91xUWzO+KHOciYS2NvdbDxj9aU/6JCRGbs2u9DRoNIYO4A90eXO64MFnkkaArWToLgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754540726; c=relaxed/simple;
	bh=8XRCuOIc6PLtYGqbd26NP4TxOLXD+4AJO12adN+QlTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6gJuKXHPzhBAWGvJTNWSY0fKY14f+3kLrMWLOsrJtvK4J0M6HkaLJsfe8jhmWO+F+QAf4wqTAKnCTYLHl3hgtgeLIe9GU1DzLQ1uKeXKIGePvSDqP0HAIaJulVCbgwE7OCl80hrLOXABVG8XT95vEvUFHr4yGpnH+OnfYAL4Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMRYw72W; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24009eeb2a7so5379525ad.0;
        Wed, 06 Aug 2025 21:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754540724; x=1755145524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNIasyvnaSlF4bLeADM4Vjl9btrk/TFgj1EXASCTo4c=;
        b=dMRYw72WnkqW19yITuzFPJQ1S0O+9RAADIxxF4xbFz0/yxYgmB+sX1WDrIkHjz9WDp
         GN4xkKdOpdiX9RcmARX+jnqvIcUeKERS9v6etvOio3MfYUiT/evyL36CXe4hoxZ27EcE
         2ieWfIP4i8bgefabsf4s1iIOm6NweH5GrXcaaFCt2axeW7xOQ9cAPLNbDNNv0lVFza4t
         cZMPOTjo1HzfP+wMVGVqp3Xgj0V98hu+h7vr1vfT+RsgLdEB0Y6/jOvLt2v+OZ4ALZ9e
         0BKD4UuwCw4Fz6pwOzjualaJXX6egtv3bw20vwV1E76vnN0ILOcugU1IPwifBFzldjgy
         fmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754540724; x=1755145524;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNIasyvnaSlF4bLeADM4Vjl9btrk/TFgj1EXASCTo4c=;
        b=AoOauHNwJt4h5oeun4zqh6MuPcyrJAhSifBNHdBDNrz5HyVBx8GjPqekmzo+sga+Ts
         lNOf8l8T5woRGP3pHfLxA+V/o5TC9m5/I3gcsAfBFKLsWAwB2ebcIrFfVnb/JOgF7fbx
         vL2AGvCO99Eef8ya5wMCmwQIQ3KxNsHJKNPMNOuzhr3yCZVus92X4XdXdd7edec6ZJiA
         /P8AQfGEnvWSuWrxdNKMxr8qjlpTgog4Zz39+IdMhz+stBTqbGdxjThcdAAh9ZreFfNs
         ycXzwZLc3OcdthA/5Y914y9In4E0KTlKcTKkRglXzG5p7ZuGTd/4Hdko7CRQwLOF8Ccs
         hWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqruGZzQ4GeODH3nYz8jP2hIHI5EYojRdSRWN0Pg8ztq/DBdaLQXHLiTZ1gZ+NuicDPdw/mRNVCNaZQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi8X0tyW2Fqf4UGwmVsxmfi2ixC7cc4FkC7ktYAEvt0H5fGVJl
	WaQ4aEPQWR+xZy0J1y7GSMx6+0xVsdtvzXFBYjiR2Qzsp1VsnbmY075/5JNJEw==
X-Gm-Gg: ASbGncuQLvdltG4ITzAhut3OUDrIVODUxEHKmylJkPNCI1cORPxpFiEf4gqpoqVBU6S
	z8toAY7j3iSuC6gw133YD0m9or5LVtkqvHx8PTeVHETQfT43QzD4WcucdQlNx2N+f+m9Z4yhVCv
	8nnDDPm7pFx4C7+T3mchCc6eZxOm6rAUzJjoMxifH+6lD1hcqn5zKlytVcYh5DniodTzTI6ZQj5
	M/8tdDZ7Vxz8e/dcl89uaFvSvwZoaLCiZi0VSKld7IIxB2y+eiJn9IlevQ9E3ATPIvUwyZq9hrz
	zjxjMYV5l8wziO/zHySleEGlbBcoiqCAwjdioaGTVyPQiB1/+ROcqDH5j7/Ofv71aXrRfgXorK4
	D4iUgNhN5+OKyOW6skr8jAUs=
X-Google-Smtp-Source: AGHT+IEuoRJw58edWM7oxKdY/eob/ARquut0aTNb53EPvbZr4xqVL5zq9gtZIBWBDqJBNXMKautlMg==
X-Received: by 2002:a17:902:eccb:b0:242:9bcb:7b92 with SMTP id d9443c01a7336-2429f4600edmr73955355ad.54.1754540724071;
        Wed, 06 Aug 2025 21:25:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1dc7:76a8:a227:b1c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a8cdsm172174375ad.121.2025.08.06.21.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 21:25:23 -0700 (PDT)
Date: Wed, 6 Aug 2025 21:25:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [git pull] Input updates for v6.17-rc0
Message-ID: <7ool7vscmhygq3jtks25bxhxbm2aijk6wp3cpy6njoifw6b5ri@2le5vfs3ztzo>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.17-rc0

to receive updates for the input subsystem. You will get:

- updates to several drivers consuming GPIO APIs to use setters
  returning error codes

- an infrastructure allowing to define "overlays" for touchscreens
  carving out regions implementing buttons and other elements from a
  bigger sensors and a corresponding update to st1232 driver

- an update to AT/PS2 keyboard driver to map F13-F24 by default

- Samsung keypad driver got a facelift

- evdev input handler will now bind to all devices using EV_SYN event
  instead of abusing id->driver_info

- 2 new sub-drivers implementing 1A (capacitive buttons) and 21
  (forcepad button) functions in Synaptics RMI driver

- support for polling mode in Goodix touchscreen driver 

- support for support for FocalTech FT8716 in edt-ft5x06 driver

- support for MT6359 in mtk-pmic-keys driver  

- removal of pcf50633-input driver since platform it was used on is gone

- new definitions for game controller "grip" buttons (BTN_GRIP*) and
  corresponding changes to xpad and hid-steam controller drivers

- a new definition for "performance" key (Turbo button is back!)


Changelog:
---------

André Apitzsch (2):
      dt-bindings: input: syna,rmi4: Document F1A function
      Input: synaptics-rmi4 - add support for F1A

Bartosz Golaszewski (3):
      Input: ad7879 - use new GPIO line value setter callbacks
      Input: adp5588 - use new GPIO line value setter callbacks
      Input: adp5589 - use new GPIO line value setter callbacks

Chen Ni (1):
      Input: cs40l50 - remove redundant flush_workqueue() calls

Dmitry Torokhov (10):
      Input: samsung-keypad - switch to using devm_clk_get_prepared()
      Input: samsung-keypad - do not set input device's parent explicitly
      Input: samsung-keypad - do not combine memory allocation checks
      Input: samsung-keypad - use struct_size() helper
      Input: samsung-keypad - use devm to disable runtime PM
      Input: samsung-keypad - use guard notation to acquire mutex
      Input: samsung-keypad - use per-chip parameters
      Input: samsung-keypad - use BIT() and GENMASK() where appropriate
      Input: evdev - switch matching to EV_SYN
      Input: remove special handling of id->driver_info when matching

Dr. David Alan Gilbert (1):
      Input: pcf50633-input - remove the driver

Frank Li (2):
      dt-bindings: input: touchscreen: convert lpc32xx-tsc.txt to yaml format
      dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format

Javier Carrasco (4):
      dt-bindings: touchscreen: add touch-overlay property
      Input: touch-overlay - add touchscreen overlay handling
      dt-bindings: input: touchscreen: st1232: add touch-overlay example
      Input: st1232 - add touch-overlay handling

Jens Reidel (2):
      dt-bindings: input: touchscreen: edt-ft5x06: Document FT8716 support
      Input: edt-ft5x06 - add support for FocalTech FT8716

Joseph Guo (1):
      Input: goodix - add support for polling mode

Louis-Alexis Eyraud (1):
      Input: mtk-pmic-keys - add support for MT6359 PMIC keys

Marcos Alano (1):
      Input: add keycode for performance mode key

Marge Yang (1):
      Input: synaptics-rmi4 - add support for Forcepads (F21)

Uwe Kleine-König (2):
      Input: max8997_haptic - optimize PWM configuration
      Input: max77693 - convert to atomic pwm operation

Vicki Pfau (5):
      Documentation: Fix capitalization of XBox -> Xbox
      Input: xpad - change buttons the D-Pad gets mapped as to BTN_DPAD_*
      Input: Add and document BTN_GRIP*
      Input: xpad - use new BTN_GRIP* buttons
      HID: hid-steam: Use new BTN_GRIP* buttons

Werner Sembach (1):
      Input: atkbd - correctly map F13 - F24

Wolfram Sang (1):
      Input: edt-ft5x06 - use per-client debugfs directory

Diffstat:
--------

 .../devicetree/bindings/input/syna,rmi4.yaml       |  20 ++
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |   1 +
 .../bindings/input/touchscreen/lpc32xx-tsc.txt     |  16 --
 .../input/touchscreen/nxp,lpc3220-tsc.yaml         |  43 ++++
 .../input/touchscreen/sitronix,st1232.yaml         |  29 +++
 .../bindings/input/touchscreen/ti.tsc2007.yaml     |  75 ++++++
 .../bindings/input/touchscreen/touchscreen.yaml    | 119 +++++++++
 .../bindings/input/touchscreen/tsc2007.txt         |  39 ---
 Documentation/input/devices/edt-ft5x06.rst         |  21 +-
 Documentation/input/gamepad.rst                    |  19 +-
 Documentation/userspace-api/media/rc/rc-protos.rst |   4 +-
 MAINTAINERS                                        |   7 +
 drivers/hid/hid-debug.c                            |   2 +
 drivers/hid/hid-steam.c                            |  35 ++-
 drivers/input/Makefile                             |   2 +-
 drivers/input/evdev.c                              |   8 +-
 drivers/input/input.c                              |   2 +-
 drivers/input/joystick/xpad.c                      |  64 ++---
 drivers/input/keyboard/adp5588-keys.c              |   9 +-
 drivers/input/keyboard/atkbd.c                     |  12 +-
 drivers/input/keyboard/mtk-pmic-keys.c             |  17 ++
 drivers/input/keyboard/samsung-keypad.c            | 137 +++++-----
 drivers/input/misc/Kconfig                         |   7 -
 drivers/input/misc/Makefile                        |   1 -
 drivers/input/misc/cs40l50-vibra.c                 |   1 -
 drivers/input/misc/max77693-haptic.c               |  41 ++-
 drivers/input/misc/max8997_haptic.c                |  96 ++++---
 drivers/input/misc/pcf50633-input.c                | 113 ---------
 drivers/input/rmi4/Kconfig                         |  15 ++
 drivers/input/rmi4/Makefile                        |   2 +
 drivers/input/rmi4/rmi_bus.c                       |   6 +
 drivers/input/rmi4/rmi_driver.h                    |   2 +
 drivers/input/rmi4/rmi_f1a.c                       | 143 +++++++++++
 drivers/input/rmi4/rmi_f21.c                       | 179 +++++++++++++
 drivers/input/touch-overlay.c                      | 277 +++++++++++++++++++++
 drivers/input/touchscreen/ad7879.c                 |  11 +-
 drivers/input/touchscreen/edt-ft5x06.c             |  26 +-
 drivers/input/touchscreen/goodix.c                 |  50 +++-
 drivers/input/touchscreen/st1232.c                 |  35 ++-
 include/linux/input/touch-overlay.h                |  25 ++
 include/uapi/linux/input-event-codes.h             |   8 +
 41 files changed, 1295 insertions(+), 424 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
 delete mode 100644 drivers/input/misc/pcf50633-input.c
 create mode 100644 drivers/input/rmi4/rmi_f1a.c
 create mode 100644 drivers/input/rmi4/rmi_f21.c
 create mode 100644 drivers/input/touch-overlay.c
 create mode 100644 include/linux/input/touch-overlay.h

Thanks.


-- 
Dmitry

