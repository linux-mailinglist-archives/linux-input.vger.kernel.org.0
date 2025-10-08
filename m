Return-Path: <linux-input+bounces-15298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E1BC3601
	for <lists+linux-input@lfdr.de>; Wed, 08 Oct 2025 07:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 737BB34D33A
	for <lists+linux-input@lfdr.de>; Wed,  8 Oct 2025 05:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695282D7DD2;
	Wed,  8 Oct 2025 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxK+nVao"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3C2D7DC4
	for <linux-input@vger.kernel.org>; Wed,  8 Oct 2025 05:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759901020; cv=none; b=BKtRmQ4Efr+p7rqtlf2qiAj1lcQS8zp2o/H3sEa0h29GS41KyETi6msZdeDmDCkfZX27kTSaCvdn81pMdEPNx7ZZyncNnnk9Slo0Jn6ZmxPguxjI3F20uF5KTXkH24bxaXzYhRGG38MG/tTTWKa9vL6ih9qKV9PVsLr6C0/XR/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759901020; c=relaxed/simple;
	bh=P8qqEuK3PoEA5cllT3wlUBqTY/38xBUk1xlPNaGF0eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGpBXhLM4JfvXiJEHG33wQQBEL0xUwf7k4+GO4tpcHv1KPJjTuQbQBjREcWSfmXruHdab1xvnM5/gJZqVjSSuHqVuJot+hDqA6ZKXzLq5aFOnmQDDkglswQAoy5SkpygYcib62z1hd1C0ubhTQtlOxuL5asB/rjhkn5fTc4MJ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxK+nVao; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-791c287c10dso2444531b3a.1
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 22:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759901018; x=1760505818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXOa+U28y6xbw2LPH6fpfk/ty0XUAGQZN36l5ZO4W0M=;
        b=RxK+nVaoRHohJmveBMnd1fI/KiCfs9ZGNGn/hl8ooMjFSwhZdyOuvEbQGzcfqywLqX
         vHct2kfZlAOHNw+4SkCIUZW1d9xmAlAXY0E4VRr67aG56eKaHgdjM31Y7He3CYPO7cNm
         XLmQxIIISeLi5SQWlmJrqz6Ob3LC1+McBxr70/vLbl/4DLatHH3JnwKvjJjcWZlQ79a2
         /YGUNqlh93riNg+9CIwa09E1WueVk964bC9Ko0ya247JWU9ysP44ziwm8jtK0HIriowh
         Dt9ZSiSK6Cu8S8anH2laAVJlC8jJKl7OV2xfA8MlhOUcMrN4UfaX7YYRIX4ZhHSnRQVL
         Lw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759901018; x=1760505818;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXOa+U28y6xbw2LPH6fpfk/ty0XUAGQZN36l5ZO4W0M=;
        b=ARG35QNkfdvAQNAlknjVb1L9g0L/iYNB+3fhSMshuWB9dciuBqtJLwkPZtTW+IPWNl
         Lu8e9FxxpjnLYQHI/cCXW0lXHgMUc1R6xn9Q3KNq4KFvYIM9XLct7DxBU2ZueLTbT5iN
         +P6u4bU/dwvCv+arHgv/9IiwWUiFOL0JAFOWU91yifclqeO7PvWK+LSLJixi3K7Pd4Jc
         rLkyJBse5oQpMfy/QGgQw6OBkgOkgk5FMTJkPLnhm1NGZeSyNYeD9A36WhSzRDhj+nYZ
         DmEIuPzXGWCL2mz6Z/kzOXeXk/8JJ5pSUoDfqbTMzkoQeMYCpwlMPK9IU7asymdVYKr9
         s2kg==
X-Forwarded-Encrypted: i=1; AJvYcCUjqYD2PVfeG5PM+aqZQhIKqMB4DbsGkI7PRbaHImtAGDZXuXJpCo+1OmE5Zt+/f3IzrAaXDsj7ZZjNtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSiUdN5KbtCV1N+HuADeVSOmd0RvKiV0im9gR9wacsror0x3nH
	UBaz5Zied6I7Yi1Dmt31tisHn1g6JoqvHdbUD9V9nVcA29roVtk4eJEAc8nDIg==
X-Gm-Gg: ASbGncubvgKfrYfgdMcbpbCIKIduSTOQnCaagvKm3NmPBaXb20WJ75c5wZEzRPs3Tz3
	gx1pyjjNmzRIap59u+kzv5S0cm9IfSEMj9wT7ZAvb9VdwOfzaOKZCdNw2Zwf8xBqbrmDP9pPqYE
	Ur5JNVOHNCenrswwVIXiJXpjqwfqsNoErQE3mrgrtjztjvStjNULivqXORP/lK4ZKlLnOWnzwXC
	Gv6kNv8qu3fryMalQiewPj3gIYPFLcWCaSm/KMYaVfx5t4OD9ZVT3NKOCy53cvMsSMEUUUVNdTp
	7A0OHrq9SfEQVsBVE2CPJBHNIzqr+TBluz65U7oIAFeQhrTWkvwAmLXwgpAlZDf7Dyw0bG0GFBr
	KAk423Y72yA1+TR960cGDmLxK9g/sqCVlcVa/ZbxImk7XLbwx8zUAwbCOTS9ILjn4w3XccEWn9y
	PO6NQosCvgl8hV+HtotOD3AQ==
X-Google-Smtp-Source: AGHT+IH26oyBKYVovIOpfm01RMEX2KB31Pr4W/WwzI+6yHjxFfdmg0q4wKtgWT/J5cKLeK9ZXX+n0g==
X-Received: by 2002:a05:6a00:17a5:b0:78c:99a8:d294 with SMTP id d2e1a72fcca58-79382c6bb87mr2661587b3a.0.1759901017404;
        Tue, 07 Oct 2025 22:23:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:371b:ca9b:6e46:724a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e814sm17456730b3a.68.2025.10.07.22.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 22:23:36 -0700 (PDT)
Date: Tue, 7 Oct 2025 22:23:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.18-rc0
Message-ID: <es25pm67cujd4ufo3uqba5ca3do4mkcw4cdrcdzghrs3tc6azn@d6aejmsh4ywf>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.18-rc0

to receive updates for the input subsystem. You will get:

- a number of conversions to yaml/json schema and fixes for 
  input-related device tree bindings

- a new driver for Awinic AW86927 haptic chip

- a new driver for Hynitron CST816x series controller

- a new driver for add Himax HX852x(ES) touchscreen controller

- a fix to uinput to not leak kernel memory via a gap in
  uinput_ff_upload_compat structure

- a fix to prevent overflow in pressure calculation in tsc2007 driver
  causing phantom touches

- a change to Atmel maxTouch driver to support generic touchscreen
  configuration (flip, rotate, etc.)

- support for platform data was dropped in tca8418_keypad,
  pxa27x-keypad, spear-keyboard and twl4030_keypad drivers, they all
  now rely on generic device properties for configuration

- other assorted changes and fixes 

Changelog:
---------

Andreas Kemnade (1):
      dt-bindings: input: tsc2007: use comma in filename

Dan Carpenter (1):
      Input: aw86927 - fix error code in probe()

Dario Binacchi (9):
      Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
      dt-bindings: touchscreen: convert bu21013 bindings to json schema
      dt-bindings: touchscreen: convert zet6223 bindings to json schema
      dt-bindings: touchscreen: add debounce-delay-us property
      dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
      Input: imx6ul_tsc - set glitch threshold by DTS property
      dt-bindings: touchscreen: convert eeti bindings to json schema
      dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
      dt-bindings: touchscreen: remove touchscreen.txt

Dmitry Torokhov (10):
      Input: tca6416-keypad - remove the driver
      Input: tca8418_keypad - switch to using module_i2c_driver()
      Input: move input_bits_to_string() to input-compat.c
      Input: include export.h in modules using EXPORT_SYMBOL*()
      Input: pxa27x-keypad - replace uint32_t with u32
      Input: pxa27x-keypad - use BIT, GENMASK, FIELD_GET, etc
      Input: pxa27x-keypad - drop support for platform data
      Input: spear-keyboard - drop support for platform data
      Input: synaptics-rmi4 - add includes for types used in rmi_2d_sensor.h
      Input: twl4030_keypad - drop support for platform data

Duje Mihanović (1):
      dt-bindings: input: touchscreen: imagis: add missing minItems

Fabio Estevam (1):
      dt-bindings: input: touchscreen: tsc2007: Document 'wakeup-source'

Frank Li (6):
      dt-bindings: input: convert lpc32xx-key.txt to yaml format
      dt-bindings: input: exc3000: move eeti,egalax_ts from egalax-ts.txt to eeti,exc3000.yaml
      dt-bindings: input: convert semtech,sx8654 to yaml format
      dt-bindings: input: convert max11801-ts to yaml format
      dt-bindings: input: convert tca8418_keypad.txt to yaml format
      dt-bindings: touchscreen: resistive-adc-touch: change to unevaluatedProperties

Griffin Kroah-Hartman (2):
      dt-bindings: input: Add Awinic AW86927
      Input: aw86927 - add driver for Awinic AW86927

Haotian Zhang (1):
      Input: psxpad-spi - add a check for the return value of spi_setup()

J. Neuschäfer (1):
      Input: ps2-gpio - fix typo

Johannes Kirchmair (1):
      Input: tsc2007 - prevent overflow in pressure calculation

Krzysztof Kozlowski (1):
      dt-bindings: input: qcom,pm8941-pwrkey: Fix formatting of descriptions

Luca Weiss (2):
      dt-bindings: input: pm8941-pwrkey: Document wakeup-source property
      Input: pm8941-pwrkey - disable wakeup for resin by default

Marek Vasut (2):
      dt-bindings: input: touchscreen: goodix: Drop 'interrupts' requirement
      Input: atmel_mxt_ts - allow reset GPIO to sleep

Michael Trimarchi (1):
      Input: imx6ul_tsc - fix typo in register name

Oleh Kuzhylnyi (2):
      dt-bindings: input: touchscreen: add hynitron cst816x series
      Input: add driver for Hynitron CST816x series

Stephan Gerhold (2):
      dt-bindings: input: touchscreen: document Himax HX852x(ES)
      Input: add Himax HX852x(ES) touchscreen driver

Svyatoslav Ryhel (4):
      Input: tsc2007 - change warning to debug message if pen GPIO is not defined
      Input: tsc2007 - make interrupt optional
      dt-bindings: input: maxtouch: add common touchscreen properties
      Input: atmel_mxt_ts - add support for generic touchscreen configurations

Wolfram Sang (1):
      Input: remove unneeded 'fast_io' parameter in regmap_config

Zhen Ni (1):
      Input: uinput - zero-initialize uinput_ff_upload_compat to avoid info leak

Diffstat:
--------

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  28 +
 .../devicetree/bindings/input/atmel,maxtouch.yaml  |   3 +-
 .../devicetree/bindings/input/awinic,aw86927.yaml  |  48 ++
 .../devicetree/bindings/input/lpc32xx-key.txt      |  34 -
 .../devicetree/bindings/input/nxp,lpc3220-key.yaml |  61 ++
 .../bindings/input/qcom,pm8941-pwrkey.yaml         |  42 +-
 .../devicetree/bindings/input/tca8418_keypad.txt   |  10 -
 .../devicetree/bindings/input/ti,tca8418.yaml      |  61 ++
 .../bindings/input/touchscreen/bu21013.txt         |  43 --
 .../bindings/input/touchscreen/eeti,exc3000.yaml   |  42 +-
 .../devicetree/bindings/input/touchscreen/eeti.txt |  30 -
 .../bindings/input/touchscreen/egalax-ts.txt       |  18 -
 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml |  14 +
 .../bindings/input/touchscreen/goodix.yaml         |   1 -
 .../bindings/input/touchscreen/himax,hx852es.yaml  |  81 ++
 .../input/touchscreen/hynitron,cst816x.yaml        |  65 ++
 .../input/touchscreen/imagis,ist3038c.yaml         |  18 +
 .../bindings/input/touchscreen/max11801-ts.txt     |  17 -
 .../bindings/input/touchscreen/maxim,max11801.yaml |  46 ++
 .../input/touchscreen/raspberrypi,firmware-ts.txt  |  26 -
 .../input/touchscreen/resistive-adc-touch.yaml     |   2 +-
 .../bindings/input/touchscreen/rohm,bu21013.yaml   |  95 +++
 .../bindings/input/touchscreen/semtech,sx8654.yaml |  52 ++
 .../bindings/input/touchscreen/sx8654.txt          |  23 -
 .../{ti.tsc2007.yaml => ti,tsc2007.yaml}           |   4 +-
 .../bindings/input/touchscreen/touchscreen.txt     |   1 -
 .../bindings/input/touchscreen/touchscreen.yaml    |   4 +
 .../bindings/input/touchscreen/zeitec,zet6223.yaml |  62 ++
 .../bindings/input/touchscreen/zet6223.txt         |  30 -
 MAINTAINERS                                        |   7 +
 drivers/input/ff-core.c                            |   2 +-
 drivers/input/ff-memless.c                         |   1 +
 drivers/input/gameport/gameport.c                  |   1 +
 drivers/input/input-compat.c                       |  30 +
 drivers/input/input-compat.h                       |   3 +
 drivers/input/input-poller.c                       |   1 +
 drivers/input/input.c                              |  36 +-
 drivers/input/joystick/iforce/iforce-main.c        |   1 +
 drivers/input/joystick/iforce/iforce-packets.c     |   1 +
 drivers/input/joystick/psxpad-spi.c                |   6 +-
 drivers/input/keyboard/Kconfig                     |  18 -
 drivers/input/keyboard/Makefile                    |   1 -
 drivers/input/keyboard/pxa27x_keypad.c             | 530 +++++--------
 drivers/input/keyboard/spear-keyboard.c            |  71 +-
 drivers/input/keyboard/tca6416-keypad.c            | 305 --------
 drivers/input/keyboard/tca8418_keypad.c            |  13 +-
 drivers/input/keyboard/twl4030_keypad.c            |  35 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/ad714x.c                        |   1 +
 drivers/input/misc/adxl34x.c                       |   1 +
 drivers/input/misc/aw86927.c                       | 846 +++++++++++++++++++++
 drivers/input/misc/cma3000_d0x.c                   |   1 +
 drivers/input/misc/pm8941-pwrkey.c                 |  12 +-
 drivers/input/misc/uinput.c                        |   1 +
 drivers/input/rmi4/rmi_2d_sensor.c                 |   1 +
 drivers/input/rmi4/rmi_2d_sensor.h                 |   3 +
 drivers/input/rmi4/rmi_bus.c                       |   1 +
 drivers/input/rmi4/rmi_driver.c                    |   1 +
 drivers/input/serio/hil_mlc.c                      |   1 +
 drivers/input/serio/hp_sdc.c                       |   1 +
 drivers/input/serio/i8042.c                        |   1 +
 drivers/input/serio/libps2.c                       |   1 +
 drivers/input/serio/ps2-gpio.c                     |   2 +-
 drivers/input/serio/serio.c                        |   1 +
 drivers/input/sparse-keymap.c                      |   1 +
 drivers/input/touch-overlay.c                      |   1 +
 drivers/input/touchscreen.c                        |   1 +
 drivers/input/touchscreen/Kconfig                  |  22 +
 drivers/input/touchscreen/Makefile                 |   2 +
 drivers/input/touchscreen/ad7879.c                 |   1 +
 drivers/input/touchscreen/atmel_mxt_ts.c           |  13 +-
 drivers/input/touchscreen/cyttsp_core.c            |   1 +
 drivers/input/touchscreen/fsl-imx25-tcq.c          |   1 -
 drivers/input/touchscreen/goodix_berlin_core.c     |   1 +
 drivers/input/touchscreen/himax_hx852x.c           | 503 ++++++++++++
 drivers/input/touchscreen/hynitron-cst816x.c       | 253 ++++++
 drivers/input/touchscreen/imx6ul_tsc.c             | 121 +--
 drivers/input/touchscreen/tsc2007_core.c           |  39 +-
 drivers/input/touchscreen/tsc200x-core.c           |   1 +
 drivers/input/touchscreen/wm9705.c                 |   1 +
 drivers/input/touchscreen/wm9712.c                 |   1 +
 drivers/input/touchscreen/wm9713.c                 |   1 +
 drivers/input/touchscreen/wm97xx-core.c            |   1 +
 include/linux/platform_data/keyboard-spear.h       | 164 ----
 include/linux/platform_data/keypad-pxa27x.h        |  73 --
 include/linux/tca6416_keypad.h                     |  30 -
 87 files changed, 2764 insertions(+), 1378 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/awinic,aw86927.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
 create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/tca8418_keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,tca8418.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/rohm,bu21013.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/sx8654.txt
 rename Documentation/devicetree/bindings/input/touchscreen/{ti.tsc2007.yaml => ti,tsc2007.yaml} (95%)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zeitec,zet6223.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
 delete mode 100644 drivers/input/keyboard/tca6416-keypad.c
 create mode 100644 drivers/input/misc/aw86927.c
 create mode 100644 drivers/input/touchscreen/himax_hx852x.c
 create mode 100644 drivers/input/touchscreen/hynitron-cst816x.c
 delete mode 100644 include/linux/platform_data/keyboard-spear.h
 delete mode 100644 include/linux/platform_data/keypad-pxa27x.h
 delete mode 100644 include/linux/tca6416_keypad.h

Thanks.


-- 
Dmitry

