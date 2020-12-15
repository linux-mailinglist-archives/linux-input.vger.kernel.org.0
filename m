Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD822DA5DA
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 02:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbgLOByf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Dec 2020 20:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgLOByT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Dec 2020 20:54:19 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F34DC061793;
        Mon, 14 Dec 2020 17:53:39 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id b5so6494015pjk.2;
        Mon, 14 Dec 2020 17:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=LrHYAS/TOn/LRA++BG/ZvZYNPgudoRQGGB4W8D7Y3vc=;
        b=UrztiCx0GxnDAnV8gKzhJ2pDoXPSdn0rP0ITypOg8sO2/aQhubbMgEsmnVGESPz7Mc
         tLuDMRvvJELJ17sKBSG20qvY1hOpxDBMtoxs5KLokUJ5JOsfNC4G3m9eGtpXb5spD6ik
         A28XvIOohPgE8ZZ/XjXNLFez4oePuA9c8h+57pgCajGvMEQr1fsU6qO0TAkJkeMv4Fc2
         PpG7lB7mJaYphbcsjIWEjwWZECxL6nL1tOAOy4IGXplzhSevcKZSBY9r7vn1yFyU6Iam
         nuPj0ULnf7Ot8nGYd0pF3RFYPMhd2meWJ90Y17sBR8FqUCE3efBorxfagQmdbdyyGWsb
         oyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=LrHYAS/TOn/LRA++BG/ZvZYNPgudoRQGGB4W8D7Y3vc=;
        b=LjHk8yHXW7ah5JxPEV6U+Y7US6WZzsATBgcq/DNq7McJ2qZ5ToIrLr49wKU6lD8MZJ
         dPjGg/X96ynolAfPmrHXz62GkJ3FGwzfNc9TAHitu9HSBUzCiCf/XNj8BwwDl68trszN
         SqFDhHrGzo15ONZUQFyoGfEJD+qdxOpZEebGY3Eu9BMvl6RLVnVOvObg4C3iuTJGy5Mg
         f/y5T3mWNiqO8N/zbyKvjqA4MiUVxr5Polp6WxqKLtStfyQUImSpvwcpG2sdUCsE/Bud
         62Y3epTa/WlxQNzPf30QIXFYwv8nSQxOJ7Er94Dfg6siUYZGtUsSuhbQVgRdwQhw/TnP
         aZzA==
X-Gm-Message-State: AOAM533spGPplc0ddb1QxXBerF9+H2naSm+gtQpFwuYrKnbw3zCaI0Sq
        ezojV3e72VmRukI6laQTbhs=
X-Google-Smtp-Source: ABdhPJwz6tBNkokVFOsbgIGeDrhoQEtEo9MViN3LBCWd3HiTUYtziI+DgsibJyFA5LLlUbJJMQMFcA==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id lx10mr27750767pjb.205.1607997218607;
        Mon, 14 Dec 2020 17:53:38 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v3sm20674130pjn.7.2020.12.14.17.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 17:53:37 -0800 (PST)
Date:   Mon, 14 Dec 2020 17:53:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.11-rc0
Message-ID: <X9gXHwIQvxomBHFt@google.com>
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

to receive updates for the input subsystem. You will get:

- support for inhibiting input devices at request from userspace. If a
  device implements open/close methods, it can also put device into low
  power state. This is needed, for example, to disable keyboard and
  touchpad on convertibles when they are transitioned into tablet mode

- now that ordinary input devices can be configured for polling mode,
  dedicated input polling device implementation has been removed

- GTCO tablet driver has been removed, as it used problematic custom HID
  parser, devices are EOL, and there is no interest from the
  manufacturer

- a new driver for Dialog DA7280 haptic chips has been introduced

- a new driver for power button on Dell Wyse 3020

- support for eKTF2132 in ektf2127 driver

- support for SC2721 and SC2730 in sc27xx-vibra driver

- enhancements for Atmel touchscreens, AD7846 touchscreens, Elan
  touchpads, ADP5589, ST1232 touchscreen, TM2 touchkey drivers

- fixes and cleanups to allow clean builds with W=1


Changelog:
---------

Alexandru Ardelean (5):
      Input: adp5589-keys - use devm_kzalloc() to allocate the kpad object
      Input: adp5589-keys - use device-managed function in adp5589_keypad_add()
      Input: adp5589-keys - remove setup/teardown hooks for gpios
      Input: adp5589-keys - use devm_gpiochip_add_data() for gpios
      Input: adp5589-keys - use devm_add_action_or_reset() for register clear

Andrej Valek (1):
      Input: st1232 - add support resolution reading

Andrzej Pietrasiewicz (3):
      Input: add input_device_enabled()
      Input: use input_device_enabled()
      Input: document inhibiting

Anson Huang (1):
      Input: imx_keypad - add COMPILE_TEST support

Arnd Bergmann (1):
      Input: cyapa_gen6 - fix out-of-bounds stack access

Chunyan Zhang (2):
      dt-bindings: input: Convert sc27xx-vibra.txt to json-schema
      dt-bindings: input: Add compatible string for SC2721 and SC2730

Colin Ian King (2):
      Input: vsxxxaa - fix Kconfig spelling mistake
      Input: da7280 - fix spelling mistake "sequemce" -> "sequence"

David Jander (1):
      Input: ads7846 - fix race that causes missing releases

Dmitry Torokhov (10):
      Input: ads7846 - fix unaligned access on 7845
      Input: ads7846 - drop unneeded asm/irq.h include
      Input: adp5589-keys - mark suspend and resume methods as __maybe_unused
      Input: adp5589-keys - use BIT()
      Input: remove input_polled_dev implementation
      Input: omap4-keypad - set up interrupt as wakeup source
      Input: gtco - remove driver
      Input: edt-ft5x06 - consolidate handling of number of electrodes
      Input: adp5589-keys - do not unconditionally configure as wakeup source
      Input: adp5589-keys - do not explicitly control IRQ for wakeup

Fuqian Huang (1):
      Input: cyapa - switch to using devm_add_action_or_reset()

Gustavo A. R. Silva (2):
      Input: pcspkr - fix fall-through warnings for Clang
      Input: libps2 - fix fall-through warnings for Clang

Jingle Wu (1):
      Input: elan_i2c - add new trackpoint report type 0x5F

Jonathan Neuschäfer (2):
      dt-bindings: input: ektf2127: Add elan,ektf2132 compatible string
      Input: ektf2127 - add support for eKTF2132 touchscreen

Lee Jones (27):
      Input: drv260x - fix kernel-doc formatting and remove one abuse
      Input: drv2665 - fix formatting expected by kernel-doc
      Input: drv2667 - fix formatting and add missing member docs
      Input: nomadik-ske-keypad - provide some missing struct member docs
      Input: pmic8xxx-keypad - fix kernel-doc formatting
      Input: elantech - demote obvious abuse of kernel-doc header
      Input: gpio_keys - fix misnamed function parameter 'dev'
      Input: cros_ec_keyb - struct headers should start with 'struct <name>'
      Input: ab8500-ponkey - fix incorrect name in 'ab8500_ponkey' doc header
      Input: cyapa - fix misnaming of 'cyapa_i2c_write's 'reg' param
      Input: cyapa_gen5 - fix obvious abuse of kernel-doc format
      Input: resistive-adc-touch - struct headers should start with 'struct <name>'
      Input: cyttsp4 - move 'cyttsp4_tch_abs_string' to the only file that references it
      Input: synaptics-rmi4 - fix kerneldoc warnings
      Input: samsung-keypad - remove set but unused variable 'var'
      Input: imx6ul_tsc - remove set but unused variable 'value'
      Input: elan_i2c_core - move header inclusion inside
      Input: xpad - demote non-conformant kernel-doc header
      Input: mc13783-pwrbutton - file headers are not good candidates for kernel-doc
      Input: goodix - provide some missing function parameter descriptions
      Input: wm831x-on - source file headers are not good candidates for kernel-doc
      Input: surface3_spi - fix naming issue with 'surface3_spi_get_gpio_config's header
      Input: wm97xx-ts - provide missing description for 'status'
      Input: synaptics - demote non-conformant kernel-doc header
      Input: goodix - fix misspelling of 'ctx'
      Input: applespi - provide missing struct 'message' descriptions
      Input: vmmouse - demote obvious abuse of kernel-doc header

Linus Walleij (3):
      Input: atmel_mxt_ts - fix up inverted RESET handler
      Input: atmel_mxt_ts - convert bindings to YAML and extend
      Input: atmel_mxt_ts - support regulator supplies

Lubomir Rintel (2):
      dt-bindings: input: Add Dell Wyse 3020 Power Button binding
      Input: add driver for power button on Dell Wyse 3020

Michał Mirosław (1):
      Input: elants - document some registers and values

Nemo Han (1):
      Input: sc27xx - add support for sc2730 and sc2721

Oleksij Rempel (2):
      Input: ads7846 - convert to full duplex
      Input: ads7846 - fix integer overflow on Rt calculation

Patrik Fimml (1):
      Input: Add "inhibited" property

Roy Im (3):
      MAINTAINERS: da7280 updates to the Dialog Semiconductor search terms
      dt-bindings: input: Add document bindings for DA7280
      Input: new da7280 haptic driver

Sergiu Cuciurean (3):
      Input: ad7877 - use new structure for SPI transfer delays
      Input: synaptics-rmi4 - use new structure for SPI transfer delays
      Input: applespi - use new structure for SPI transfer delays

Stefan Riedmueller (1):
      Input: stmpe - add axis inversion and swapping capability

Stephan Gerhold (3):
      dt-bindings: input: tm2-touchkey: convert to yaml
      dt-bindings: input: tm2-touchkey: document vddio-supply
      Input: tm2-touchkey - add vddio regulator

Wang Qing (1):
      Input: ads7846 - use kobj_to_dev() API

Zhang Qilong (2):
      Input: analog - fix formatting of error code
      Input: omap4-keypad - fix runtime PM error handling

Zheng Yongjun (3):
      Input: atmel_mxt_ts - simplify the return expression of mxt_send_bootloader_cmd()
      Input: parkbd - convert comma to semicolon
      Input: ipx4xx-beeper - convert comma to semicolon

jingle.wu (1):
      Input: elantech - fix protocol errors for some trackpoints in SMBus mode

Diffstat:
--------

 .../devicetree/bindings/input/ariel-pwrbutton.yaml |   57 +
 .../devicetree/bindings/input/atmel,maxtouch.txt   |   41 -
 .../devicetree/bindings/input/atmel,maxtouch.yaml  |   81 ++
 .../bindings/input/cypress,tm2-touchkey.txt        |   33 -
 .../bindings/input/cypress,tm2-touchkey.yaml       |   73 ++
 .../devicetree/bindings/input/dlg,da7280.txt       |  108 ++
 .../bindings/input/sprd,sc27xx-vibra.txt           |   23 -
 .../bindings/input/sprd,sc27xx-vibrator.yaml       |   48 +
 .../bindings/input/touchscreen/ektf2127.txt        |    2 +-
 Documentation/driver-api/input.rst                 |    9 -
 Documentation/input/input-programming.rst          |   46 +
 MAINTAINERS                                        |    4 +-
 arch/arm/boot/dts/imx53-ppd.dts                    |    2 +-
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts       |    2 +-
 arch/arm/boot/dts/imx6q-apalis-eval.dts            |    2 +-
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts      |    2 +-
 arch/arm/boot/dts/imx6q-apalis-ixora.dts           |    2 +-
 arch/arm/boot/dts/imx7-colibri-aster.dtsi          |    2 +-
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi        |    2 +-
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    |    2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi               |    2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |    2 +-
 arch/powerpc/configs/ppc6xx_defconfig              |    1 -
 drivers/input/Kconfig                              |   13 -
 drivers/input/Makefile                             |    1 -
 drivers/input/input-polldev.c                      |  362 ------
 drivers/input/input-poller.c                       |    2 +-
 drivers/input/input.c                              |  118 +-
 drivers/input/joystick/analog.c                    |    2 +-
 drivers/input/joystick/xpad.c                      |    6 +-
 drivers/input/keyboard/Kconfig                     |    2 +-
 drivers/input/keyboard/adp5589-keys.c              |  216 ++--
 drivers/input/keyboard/applespi.c                  |   21 +-
 drivers/input/keyboard/cros_ec_keyb.c              |    9 +-
 drivers/input/keyboard/ep93xx_keypad.c             |    2 +-
 drivers/input/keyboard/gpio_keys.c                 |    6 +-
 drivers/input/keyboard/imx_keypad.c                |    4 +-
 drivers/input/keyboard/ipaq-micro-keys.c           |    2 +-
 drivers/input/keyboard/lpc32xx-keys.c              |    4 +-
 drivers/input/keyboard/nomadik-ske-keypad.c        |    2 +
 drivers/input/keyboard/omap4-keypad.c              |  132 +-
 drivers/input/keyboard/pmic8xxx-keypad.c           |   26 +-
 drivers/input/keyboard/pxa27x_keypad.c             |    2 +-
 drivers/input/keyboard/samsung-keypad.c            |    7 +-
 drivers/input/keyboard/spear-keyboard.c            |    8 +-
 drivers/input/keyboard/st-keyscan.c                |    4 +-
 drivers/input/keyboard/tegra-kbc.c                 |    4 +-
 drivers/input/keyboard/tm2-touchkey.c              |    3 +-
 drivers/input/misc/Kconfig                         |   23 +
 drivers/input/misc/Makefile                        |    2 +
 drivers/input/misc/ab8500-ponkey.c                 |    2 +-
 drivers/input/misc/ariel-pwrbutton.c               |  169 +++
 drivers/input/misc/da7280.c                        | 1329 ++++++++++++++++++++
 drivers/input/misc/drv260x.c                       |   30 +-
 drivers/input/misc/drv2665.c                       |   14 +-
 drivers/input/misc/drv2667.c                       |   18 +-
 drivers/input/misc/ixp4xx-beeper.c                 |    2 +-
 drivers/input/misc/kxtj9.c                         |    4 +-
 drivers/input/misc/mc13783-pwrbutton.c             |    2 +-
 drivers/input/misc/pcspkr.c                        |    1 +
 drivers/input/misc/sc27xx-vibra.c                  |   71 +-
 drivers/input/misc/sirfsoc-onkey.c                 |    2 +-
 drivers/input/misc/wm831x-on.c                     |    2 +-
 drivers/input/mouse/Kconfig                        |    2 +-
 drivers/input/mouse/cyapa.c                        |   18 +-
 drivers/input/mouse/cyapa_gen3.c                   |    3 +-
 drivers/input/mouse/cyapa_gen5.c                   |    7 +-
 drivers/input/mouse/cyapa_gen6.c                   |    2 +-
 drivers/input/mouse/elan_i2c.h                     |   16 +
 drivers/input/mouse/elan_i2c_core.c                |   15 +-
 drivers/input/mouse/elan_i2c_smbus.c               |    8 +-
 drivers/input/mouse/elantech.c                     |  101 +-
 drivers/input/mouse/elantech.h                     |    4 +
 drivers/input/mouse/navpoint.c                     |    4 +-
 drivers/input/mouse/synaptics.c                    |    2 +-
 drivers/input/mouse/vmmouse.c                      |    2 +-
 drivers/input/rmi4/rmi_bus.c                       |    2 +-
 drivers/input/rmi4/rmi_f01.c                       |   16 +-
 drivers/input/rmi4/rmi_f11.c                       |  236 ++--
 drivers/input/rmi4/rmi_f54.c                       |    6 +
 drivers/input/rmi4/rmi_i2c.c                       |    4 +
 drivers/input/rmi4/rmi_spi.c                       |    6 +-
 drivers/input/serio/libps2.c                       |    2 +-
 drivers/input/serio/parkbd.c                       |    2 +-
 drivers/input/tablet/Kconfig                       |   12 -
 drivers/input/tablet/Makefile                      |    1 -
 drivers/input/tablet/gtco.c                        | 1043 ---------------
 drivers/input/touchscreen/ad7877.c                 |    6 +-
 drivers/input/touchscreen/ad7879.c                 |    6 +-
 drivers/input/touchscreen/ads7846.c                |  247 ++--
 drivers/input/touchscreen/atmel_mxt_ts.c           |   54 +-
 drivers/input/touchscreen/auo-pixcir-ts.c          |    8 +-
 drivers/input/touchscreen/bu21029_ts.c             |    4 +-
 drivers/input/touchscreen/chipone_icn8318.c        |    4 +-
 drivers/input/touchscreen/cyttsp4_core.c           |   14 +
 drivers/input/touchscreen/cyttsp4_core.h           |   14 -
 drivers/input/touchscreen/cyttsp_core.c            |    4 +-
 drivers/input/touchscreen/edt-ft5x06.c             |   43 +-
 drivers/input/touchscreen/eeti_ts.c                |    4 +-
 drivers/input/touchscreen/ektf2127.c               |   36 +-
 drivers/input/touchscreen/elants_i2c.c             |   18 +-
 drivers/input/touchscreen/goodix.c                 |    5 +-
 drivers/input/touchscreen/imx6ul_tsc.c             |    7 +-
 drivers/input/touchscreen/ipaq-micro-ts.c          |    2 +-
 drivers/input/touchscreen/iqs5xx.c                 |    4 +-
 drivers/input/touchscreen/lpc32xx_ts.c             |    4 +-
 drivers/input/touchscreen/melfas_mip4.c            |    8 +-
 drivers/input/touchscreen/mms114.c                 |    6 +-
 drivers/input/touchscreen/pixcir_i2c_ts.c          |    8 +-
 drivers/input/touchscreen/resistive-adc-touch.c    |    2 +-
 drivers/input/touchscreen/st1232.c                 |   52 +-
 drivers/input/touchscreen/stmpe-ts.c               |    7 +-
 drivers/input/touchscreen/surface3_spi.c           |    2 +-
 drivers/input/touchscreen/ucb1400_ts.c             |    4 +-
 drivers/input/touchscreen/wm97xx-core.c            |   16 +-
 drivers/input/touchscreen/zforce_ts.c              |    8 +-
 drivers/input/touchscreen/zinitix.c                |    4 +-
 include/linux/input-polldev.h                      |   58 -
 include/linux/input.h                              |   14 +-
 include/linux/input/adp5589.h                      |    7 -
 kernel/configs/android-recommended.config          |    1 -
 121 files changed, 2989 insertions(+), 2381 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.txt
 create mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 delete mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
 create mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
 delete mode 100644 drivers/input/input-polldev.c
 create mode 100644 drivers/input/misc/ariel-pwrbutton.c
 create mode 100644 drivers/input/misc/da7280.c
 delete mode 100644 drivers/input/tablet/gtco.c
 delete mode 100644 include/linux/input-polldev.h

Thanks.


-- 
Dmitry
