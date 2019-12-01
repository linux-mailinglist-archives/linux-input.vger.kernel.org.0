Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09A910E020
	for <lists+linux-input@lfdr.de>; Sun,  1 Dec 2019 03:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfLACAY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Nov 2019 21:00:24 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:43279 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfLACAY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Nov 2019 21:00:24 -0500
Received: by mail-pj1-f67.google.com with SMTP id g4so2280185pjs.10;
        Sat, 30 Nov 2019 18:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=KglQNT0kqcwgu4BsPxajIRo4vPpce0iEWJXgDk9Q0IE=;
        b=QjLqyWBJzPtPmXDVFwBpCfn1iC1uSAM3K921+xDEYoCZtoyBUDp2iB0pT+sOknOu32
         Afd2wVVAb/fKVfQQ5jHOM3ey5CHMMUz10jixGGX2ZLwB5xUOQFvNv+d14CO714DShkUT
         kO/3WdL/7ud6aeL3oXoKM1FxaRCMuP2f7hk6g4L+EbwyA6/cVKSA4KwYOhQpaVc49N1O
         z0vK0KJFtTkpZjzDA95IorUDtNb6XyoTBd/ntyHyWs27JeOFxNeU8v63V1p/Z09ga3sk
         l69lJa1a4p6qYFSv3qG+h5EMWgX1n5Rw06WqZteo+XnPrXjuiWlgppXZ37yWqevMZUJp
         E8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=KglQNT0kqcwgu4BsPxajIRo4vPpce0iEWJXgDk9Q0IE=;
        b=BsnbGXbooaJ911/pfl08S88CuSpWvTgr5pIbufhKgFhnI2FCf/jZb0VWTDq8vZtQ5o
         +x++SK6Is8kRse9yQk7x/a7M75Z48G4x0bQ4c7hUuZ2VOam2jsHzjow/cqNXfIWgiYgv
         0sDTGpHoqaC9GUUcAh+UUiudWKKWbkVwCXjDS5hhNLwHdCeMUWLQJqMRgDH6I2QPGCCI
         xU/UV9TUAu9r9kreZTTM3xT5sN5z8VWKsNS528YZvCkeeZ3MOvERILnjcRblcKzv8tg+
         PQyKN5Bc+mGRGK5dnqvS7Ndz7jv+LSSXLxJYckZUj9sNcXWU5WAaLI3TlGR9tMjgmngs
         ygcw==
X-Gm-Message-State: APjAAAUue8Sca2dekZmi/9g1gR9WYz37D8N6CUWKVnyKdf+kiXXZnST0
        P/3zZVGLnZ5S0Sco5pWjapQXedGZ
X-Google-Smtp-Source: APXvYqxZXwZsfdCDeVmipiAWeheMNgwlwTfPDYSSG8Jsrpdhfujkkm3h5bKDgRLEaoTHOQV1da4/Rg==
X-Received: by 2002:a17:90b:3007:: with SMTP id hg7mr28331399pjb.73.1575165623103;
        Sat, 30 Nov 2019 18:00:23 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id l13sm18583325pjq.18.2019.11.30.18.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 18:00:22 -0800 (PST)
Date:   Sat, 30 Nov 2019 18:00:20 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.5-rc0
Message-ID: <20191201020020.GA225595@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- updates to Ilitech driver to support ILI2117
- face lift of st1232 driver to support MT-B protocol
- a new driver for i.MX system controller keys
- mpr121 driver now supports polling mode 
- various input drivers have been switched away from input_polled_dev to
  use polled mode of regular input devices
- other assorted cleanups and fixes.

Changelog:
---------

Anson Huang (2):
      Input: keyboard - imx_sc: Add i.MX system controller key support
      Input: imx_sc_key - correct SCU message structure to avoid stack corruption

Arnd Bergmann (1):
      Input: hp_sdc_rtc - remove dead chardev code

Dmitry Torokhov (41):
      Input: add input_get_poll_interval()
      Input: gpio_mouse - switch to using input device polling mode
      Input: pixcir_i2c_ts - remove platform data
      Input: gpio_keys - switch to using devm_fwnode_gpiod_get()
      Input: gpio_keys_polled - switch to using devm_fwnode_gpiod_get()
      Input: st1232 - simplify parsing of read buffer
      Input: st1232 - do not unconditionally configure as wakeup source
      Input: st1232 - rely on I2C core to configure wakeup interrupt
      Input: st1232 - do not reset the chip too early
      Input: st1232 - do not allocate fingers data separately
      Input: st1232 - do not set parent device explicitly
      Input: st1232 - note that the receive buffer is DMA-safe
      Input: st1232 - switch to using MT-B protocol
      Input: psxpad-spi - switch to using polled mode of input devices
      Input: raspberrypi-ts - switch to using polled mode of input devices
      Input: sur40 - switch to using polled mode of input devices
      Input: ts4800-ts - switch to using polled mode of input devices
      Input: tsc6507x-ts - switch to using polled mode of input devices
      Input: adc-keys - switch to using polled mode of input devices
      Input: clps711x-keypad - switch to using polled mode of input devices
      Input: jornada680_kbd - switch to using polled mode of input devices
      Input: gpio_keys_polled - switch to using polled mode of input devices
      Input: apanel - switch to using polled mode of input devices
      Input: wistron_btns - switch to using polled mode of input devices
      Input: cobalt_btns - convert to use managed resources
      Input: cobalt_btns - switch to using polled mode of input devices
      Input: sgi_btns - switch to using managed resources
      Input: sgi_btns - switch to using polled mode of input devices
      Input: rb532_button - switch to using managed resources
      Input: rb532_button - switch to using polled mode of input devices
      Input: gpio_decoder - switch to using polled mode of input devices
      Input: mma8450 - switch to using polled mode of input devices
      Input: bma150 - switch to using polled mode of input devices
      Input: kxtj9 - switch to using managed resources
      Input: kxtj9 - switch to using polled mode of input devices
      Input: ili210x - switch to using threaded IRQ
      Input: ili210x - handle errors from input_mt_init_slots()
      Input: ili210x - do not set parent device explicitly
      Input: ili210x - define and use chip operations structure
      Input: ili210x - do not unconditionally mark touchscreen as wakeup source
      Input: ili210x - remove unneeded suspend and resume handlers

Evan Green (1):
      Input: atmel_mxt_ts - disable IRQ across suspend

Fabio Estevam (8):
      Input: pixcir_i2c_ts - remove unneeded gpio.h header file
      Input: pixcir_i2c_ts - move definitions into a single file
      Input: pixcir_i2c_ts - keep header files sorted
      Input: pixcir_i2c_ts - print register address in decimal
      Input: pixcir_i2c_ts - do not print error on defer probe
      Input: colibri-vf50-ts - remove unneeded gpio.h header file
      Input: s3c2410_ts - remove unneeded gpio.h header file
      Input: wacom_i2c - remove unneeded gpio.h header file

Flavio Suligoi (1):
      Input: ar1021 - fix typo in preprocessor macro name

Hans Verkuil (2):
      Input: synaptics - switch another X1 Carbon 6 to RMI/SMbus
      Input: synaptics-rmi4 - fix various V4L2 compliance problems in F54

Jonathan Bakker (1):
      Input: bma150 - use managed resources helpers

Krzysztof Kozlowski (1):
      Input: fix Kconfig indentation

Lars-Peter Clausen (1):
      Input: adp5589 - make keypad support optional

Lucas Stach (1):
      Input: synaptics-rmi4 - simplify data read in rmi_f54_work

Marcel Ziswiler (1):
      dt-bindings: input: touchscreen: ad7879: generic node names in example

Marek Vasut (1):
      Input: ili210x - add ILI2117 support

Michal Vokáč (3):
      dt-bindings: input: Add common input binding in json-schema
      dt-bindings: input: Convert mpr121 binding to json-schema
      Input: mpr121 - add polling mode

Mylène Josserand (1):
      Input: edt-ft5x06 - add support for regulator

Stephan Gerhold (1):
      Input: mms114 - use device_get_match_data

Sven Van Asbroeck (3):
      Input: ili210x - do not retrieve/print chip firmware version
      Input: ili210x - add resolution to chip operations structure
      Input: ili210x - optionally show calibrate sysfs attribute

Diffstat:
--------

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  14 +
 .../bindings/input/fsl,mpr121-touchkey.yaml        |  89 +++++
 .../devicetree/bindings/input/ilitek,ili2xxx.txt   |   3 +-
 Documentation/devicetree/bindings/input/input.yaml |  36 ++
 Documentation/devicetree/bindings/input/keys.txt   |   8 -
 .../devicetree/bindings/input/mpr121-touchkey.txt  |  30 --
 .../devicetree/bindings/input/mtk-pmic-keys.txt    |   4 +-
 .../devicetree/bindings/input/st,stpmic1-onkey.txt |   2 +-
 .../bindings/input/touchscreen/ad7879.txt          |   4 +-
 .../bindings/input/touchscreen/edt-ft5x06.txt      |   1 +
 drivers/input/input-poller.c                       |   9 +
 drivers/input/joystick/Kconfig                     |   1 -
 drivers/input/joystick/psxpad-spi.c                |  64 ++--
 drivers/input/keyboard/Kconfig                     |  28 +-
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/adc-keys.c                  |  36 +-
 drivers/input/keyboard/adp5589-keys.c              | 171 +++++----
 drivers/input/keyboard/clps711x-keypad.c           |  70 ++--
 drivers/input/keyboard/gpio_keys.c                 |   6 +-
 drivers/input/keyboard/gpio_keys_polled.c          |  72 ++--
 drivers/input/keyboard/imx_sc_key.c                | 187 +++++++++
 drivers/input/keyboard/jornada680_kbd.c            |  37 +-
 drivers/input/keyboard/mpr121_touchkey.c           |  69 +++-
 drivers/input/misc/Kconfig                         |  15 -
 drivers/input/misc/apanel.c                        | 153 ++++----
 drivers/input/misc/bma150.c                        | 190 +++-------
 drivers/input/misc/cobalt_btns.c                   |  73 ++--
 drivers/input/misc/gpio_decoder.c                  |  42 ++-
 drivers/input/misc/hp_sdc_rtc.c                    | 342 -----------------
 drivers/input/misc/kxtj9.c                         | 224 +++--------
 drivers/input/misc/mma8450.c                       | 101 +++--
 drivers/input/misc/rb532_button.c                  |  48 +--
 drivers/input/misc/sgi_btns.c                      |  54 +--
 drivers/input/misc/wistron_btns.c                  |  51 +--
 drivers/input/mouse/Kconfig                        |  15 +-
 drivers/input/mouse/gpio_mouse.c                   |  45 +--
 drivers/input/mouse/synaptics.c                    |   1 +
 drivers/input/rmi4/rmi_f54.c                       |  63 ++--
 drivers/input/tablet/Kconfig                       |  20 +-
 drivers/input/touchscreen/Kconfig                  |   6 +-
 drivers/input/touchscreen/ar1021_i2c.c             |   4 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |   4 +
 drivers/input/touchscreen/colibri-vf50-ts.c        |   1 -
 drivers/input/touchscreen/edt-ft5x06.c             |  30 ++
 drivers/input/touchscreen/ili210x.c                | 418 ++++++++++++---------
 drivers/input/touchscreen/mms114.c                 |   3 +-
 drivers/input/touchscreen/pixcir_i2c_ts.c          | 177 +++++----
 drivers/input/touchscreen/raspberrypi-ts.c         |  38 +-
 drivers/input/touchscreen/s3c2410_ts.c             |   1 -
 drivers/input/touchscreen/st1232.c                 | 184 +++++----
 drivers/input/touchscreen/sur40.c                  |  92 +++--
 drivers/input/touchscreen/tps6507x-ts.c            |  36 +-
 drivers/input/touchscreen/ts4800-ts.c              |  68 ++--
 drivers/input/touchscreen/wacom_i2c.c              |   1 -
 include/linux/input.h                              |   1 +
 include/linux/platform_data/pixcir_i2c_ts.h        |  64 ----
 56 files changed, 1631 insertions(+), 1876 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
 create mode 100644 Documentation/devicetree/bindings/input/input.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/keys.txt
 delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt
 create mode 100644 drivers/input/keyboard/imx_sc_key.c
 delete mode 100644 include/linux/platform_data/pixcir_i2c_ts.h

Thanks.


-- 
Dmitry
