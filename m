Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB5BB58A2
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2019 01:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfIQXkK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 19:40:10 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41597 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfIQXkK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 19:40:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id q7so3089692pfh.8;
        Tue, 17 Sep 2019 16:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=iTGIlWbjjxmOw7QeJDkVvzAELPMVeeIMI6z8knILVhU=;
        b=WBIssmhxqYEmUk3BYdfG+awy7Ef5S88OVlV2evAPSx+tkGBIPO5WWvAkmXKuIaTvFr
         hBp7Vmc3btwtQitJeW0wlSI8cydQLe/DUAliaNcuq2i4B85iqAibFdPkB4e8j0+9RC7m
         wTwvU77jHJaXrbyp+miYZWQojvTdvEJf1Xlg2R/X3XJ1hLC7B6r3CWdH1qFstp9eWbvx
         ya/uPmHJ9v8Y/xyRHOZ+8jgZIZYfqfbjIYgZVbFHp4GzrDQOoOCwPyRqIXKvz9+qaPSM
         i/E+hhVeBK7qn6glPaVo6Rsfhnj91SNyG50IPjxLo2c1Vnrr5SCPLhq60WrWl2sZ3r2c
         JNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=iTGIlWbjjxmOw7QeJDkVvzAELPMVeeIMI6z8knILVhU=;
        b=W4LL/rxVcVNVxC19q0q0qUImjwc/CTQEqPQ3saH7Ogl99kfI425B7kUn9WwKSfM35x
         +9UX+EfVdoXpFM0NJx5fG5OAaKbe+118RMQONSCEc4pC5i0Kenz26UlZqi6XLsLVeykT
         SVIVMUbQkKBC5qcKh3Rj+85kp4hzJ5w2hUTXYlLbKYbnRDu2K5dsoO/BRPLMlel3FwIG
         SYLFDLWUvpbvkiT1H4jQT50FTsbyPks3R3ZMsCcBt+CPSaFhvqNVD0vOXafOGbeSlz1G
         pfAezfIZWI8kJRzf7zjgDDA5YXcducvwP7tPPUJdnGXfN+v2TRZVNPsF3CT5wuXqW7OC
         0hUg==
X-Gm-Message-State: APjAAAV2eOzhNEIwWmsDWDO1Qcwfg7c2Uq91wVYz1+dh9VGzp/HGigmO
        QFqm14dQZNNFgQMv1Sl8Jqg=
X-Google-Smtp-Source: APXvYqw7NDLuTSfK4w+jQSAqvN8EEadyDmBV1gCyzyDKZll7TbphibPq6vKLGDps2vKUN5TmAY1Puw==
X-Received: by 2002:a62:1d82:: with SMTP id d124mr1004996pfd.135.1568763607475;
        Tue, 17 Sep 2019 16:40:07 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h18sm3903322pfn.53.2019.09.17.16.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 16:40:06 -0700 (PDT)
Date:   Tue, 17 Sep 2019 16:40:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.4-rc0
Message-ID: <20190917234004.GA145240@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- input core allows hardware drivers to specify a [more precise]
  timestamp (normally taken in top half) to better track velocity of
  contacts
- input_dev instances now support "polling" mode so that drivers could
  use the same object for polled and interrupt-driven operation. The
  plan is to convert existing drivers and retire input_polled_dev API
- a new driver for the FlySky FS-iA6B RC receiver
- a refresh of BU21013 touchpad driver
- w90x900 keyboard and touchpad drivers are removed as the platform is
  gone
- assorted fixes

Note that driver core change is from immutable branch created by Greg
that I pulled into my tree.  I guess you have not merged his pull yet,
that is why it shows up in my list of changes.

Thanks.

Changelog:
---------

Andy Shevchenko (4):
      Input: mpr121 - switch to use device_property_count_u32()
      Input: hideep - switch to use device_property_count_u32()
      Input: atmel_mxt_ts - switch to use device_property_count_u32()
      Input: matrix-keymap - switch to use device_property_count_u32()

Arnd Bergmann (2):
      Input: remove w90x900 keyboard driver
      Input: remove w90x900 touchscreen driver

Atif Niyaz (1):
      Input: allow drivers specify timestamp for input events

Christophe JAILLET (1):
      Input: synaptics - fix a typo

Colin Ian King (1):
      Input: sidewinder - make array seq static const, makes object smaller

Denis Efremov (1):
      Input: synaptics-rmi4 - remove the exporting of rmi_2d_sensor_set_input_params

Dmitry Torokhov (16):
      Input: elan_i2c - switch to using devm_device_add_groups()
      Input: elan_i2c - switch to using devm_add_action_or_reset()
      Input: cyapa - switch to using devm_device_add_group()
      driver core: add dev_groups to all drivers
      Input: add support for polling to input devices
      ARM: ux500: improve BU21013 touchpad bindings
      Input: bu21013_ts - rename some variables
      Input: bu21013_ts - annotate supend/resume methods as __maybe_unused
      Input: bu21013_ts - remove useless comments
      Input: bu21013_ts - convert to using managed resources
      Input: bu21013_ts - remove support for platform data
      Input: bu21013_ts - use interrupt from I2C client
      Input: bu21013_ts - fix suspend when wake source
      Input: bu21013_ts - switch to using MT-B (slotted) protocol
      Input: bu21013_ts - switch to using standard touchscreen properties
      Input: reset device timestamp on sync

Enrico Weigelt (1):
      Input: soc_button_array - use platform_device_register_resndata()

Fei Shao (1):
      Input: cros_ec_keyb - add back missing mask for event_type

Greg Kroah-Hartman (4):
      Input: gpio_keys - convert driver to use dev_groups
      Input: axp20x-pek - convert driver to use dev_groups
      Input: edt-ft5x06 - no need to check return value of debugfs_create functions
      Input: applespi - no need to check return value of debugfs_create functions

Hui Wang (1):
      Input: psmouse - drop all unneeded functions from mouse headers

Jason Gerecke (1):
      Input: wacom_w8001 - allocate additional space for 'phys'

Linus Walleij (1):
      Input: bu21013_ts - convert to use GPIO descriptors

Marco Felsch (2):
      dt-bindings: input: ads7846: fix property description
      Input: ads7846 - add support for general touchscreen bindings

Markus Koch (1):
      Input: add support for the FlySky FS-iA6B RC receiver

Maximilian Luz (2):
      platform/x86: surfacepro3_button: Fix device check
      Input: soc_button_array - add support for newer surface devices

Mukesh Ojha (4):
      Input: fsl-imx25-tcq - use devm_platform_ioremap_resource()
      Input: mxs-lradc-ts - use devm_platform_ioremap_resource()
      Input: sun4i-ts - use devm_platform_ioremap_resource()
      Input: ts4800-ts - use devm_platform_ioremap_resource()

Stephen Boyd (2):
      Input: remove dev_err() usage after platform_get_irq()
      Input: i8042 - enable wakeup on a stable struct device

Diffstat:
--------

 .../bindings/input/touchscreen/ads7846.txt         |  29 +-
 .../bindings/input/touchscreen/bu21013.txt         |  27 +-
 MAINTAINERS                                        |   6 +
 drivers/base/dd.c                                  |  14 +
 drivers/input/Makefile                             |   2 +-
 drivers/input/evdev.c                              |  35 +-
 drivers/input/input-poller.c                       | 213 ++++++
 drivers/input/input-poller.h                       |  18 +
 drivers/input/input.c                              |  83 ++-
 drivers/input/joystick/Kconfig                     |  10 +
 drivers/input/joystick/Makefile                    |   5 +-
 drivers/input/joystick/fsia6b.c                    | 231 +++++++
 drivers/input/joystick/sidewinder.c                |   2 +-
 drivers/input/keyboard/Kconfig                     |  11 -
 drivers/input/keyboard/Makefile                    |   1 -
 drivers/input/keyboard/applespi.c                  |  30 +-
 drivers/input/keyboard/bcm-keypad.c                |   4 +-
 drivers/input/keyboard/cros_ec_keyb.c              |   6 +-
 drivers/input/keyboard/davinci_keyscan.c           |   1 -
 drivers/input/keyboard/gpio_keys.c                 |  13 +-
 drivers/input/keyboard/imx_keypad.c                |   4 +-
 drivers/input/keyboard/lpc32xx-keys.c              |   4 +-
 drivers/input/keyboard/mpr121_touchkey.c           |   3 +-
 drivers/input/keyboard/nomadik-ske-keypad.c        |   4 +-
 drivers/input/keyboard/nspire-keypad.c             |   4 +-
 drivers/input/keyboard/opencores-kbd.c             |   4 +-
 drivers/input/keyboard/pmic8xxx-keypad.c           |   8 +-
 drivers/input/keyboard/pxa27x_keypad.c             |   4 +-
 drivers/input/keyboard/pxa930_rotary.c             |   4 +-
 drivers/input/keyboard/sh_keysc.c                  |   4 +-
 drivers/input/keyboard/snvs_pwrkey.c               |   4 +-
 drivers/input/keyboard/spear-keyboard.c            |   4 +-
 drivers/input/keyboard/st-keyscan.c                |   4 +-
 drivers/input/keyboard/tegra-kbc.c                 |   4 +-
 drivers/input/keyboard/w90p910_keypad.c            | 264 --------
 drivers/input/matrix-keymap.c                      |   2 +-
 drivers/input/misc/88pm80x_onkey.c                 |   1 -
 drivers/input/misc/88pm860x_onkey.c                |   4 +-
 drivers/input/misc/Kconfig                         |   6 +-
 drivers/input/misc/ab8500-ponkey.c                 |   8 +-
 drivers/input/misc/axp20x-pek.c                    |  25 +-
 drivers/input/misc/da9055_onkey.c                  |   5 +-
 drivers/input/misc/da9063_onkey.c                  |   7 +-
 drivers/input/misc/e3x0-button.c                   |  10 +-
 drivers/input/misc/hisi_powerkey.c                 |   8 +-
 drivers/input/misc/max8925_onkey.c                 |   8 +-
 drivers/input/misc/pm8941-pwrkey.c                 |   4 +-
 drivers/input/misc/rk805-pwrkey.c                  |   8 +-
 drivers/input/misc/soc_button_array.c              | 127 +++-
 drivers/input/misc/stpmic1_onkey.c                 |  10 +-
 drivers/input/misc/tps65218-pwrbutton.c            |   4 +-
 drivers/input/misc/twl6040-vibra.c                 |   4 +-
 drivers/input/mouse/alps.h                         |  11 -
 drivers/input/mouse/byd.h                          |  11 -
 drivers/input/mouse/cyapa.c                        |  16 +-
 drivers/input/mouse/cypress_ps2.h                  |  11 -
 drivers/input/mouse/elan_i2c_core.c                |  20 +-
 drivers/input/mouse/elantech.h                     |  18 +-
 drivers/input/mouse/hgpk.h                         |  13 +-
 drivers/input/mouse/lifebook.h                     |  13 +-
 drivers/input/mouse/logips2pp.h                    |   7 -
 drivers/input/mouse/pxa930_trkball.c               |   4 +-
 drivers/input/mouse/sentelic.h                     |  11 -
 drivers/input/mouse/synaptics.c                    |   2 +-
 drivers/input/mouse/touchkit_ps2.h                 |   8 -
 drivers/input/mouse/trackpoint.h                   |   8 -
 drivers/input/mouse/vmmouse.h                      |  11 -
 drivers/input/rmi4/rmi_2d_sensor.c                 |   1 -
 drivers/input/serio/arc_ps2.c                      |   4 +-
 drivers/input/serio/i8042.c                        |  25 +-
 drivers/input/serio/ps2-gpio.c                     |   2 -
 drivers/input/touchscreen/88pm860x-ts.c            |   4 +-
 drivers/input/touchscreen/Kconfig                  |   9 -
 drivers/input/touchscreen/Makefile                 |   1 -
 drivers/input/touchscreen/ads7846.c                |  38 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |   3 +-
 drivers/input/touchscreen/bcm_iproc_tsc.c          |   4 +-
 drivers/input/touchscreen/bu21013_ts.c             | 740 +++++++++------------
 drivers/input/touchscreen/edt-ft5x06.c             |   2 -
 drivers/input/touchscreen/fsl-imx25-tcq.c          |   8 +-
 drivers/input/touchscreen/hideep.c                 |   3 +-
 drivers/input/touchscreen/imx6ul_tsc.c             |   8 +-
 drivers/input/touchscreen/lpc32xx_ts.c             |   4 +-
 drivers/input/touchscreen/mxs-lradc-ts.c           |  10 +-
 drivers/input/touchscreen/sun4i-ts.c               |   3 +-
 drivers/input/touchscreen/ts4800-ts.c              |   4 +-
 drivers/input/touchscreen/w90p910_ts.c             | 331 ---------
 drivers/input/touchscreen/wacom_w8001.c            |   4 +-
 drivers/platform/x86/surfacepro3_button.c          |  47 ++
 include/linux/device.h                             |   3 +
 include/linux/input.h                              |  26 +
 include/linux/input/bu21013.h                      |  34 -
 include/linux/platform_data/keypad-w90p910.h       |  16 -
 include/uapi/linux/serio.h                         |   1 +
 94 files changed, 1253 insertions(+), 1551 deletions(-)
 create mode 100644 drivers/input/input-poller.c
 create mode 100644 drivers/input/input-poller.h
 create mode 100644 drivers/input/joystick/fsia6b.c
 delete mode 100644 drivers/input/keyboard/w90p910_keypad.c
 delete mode 100644 drivers/input/touchscreen/w90p910_ts.c
 delete mode 100644 include/linux/input/bu21013.h
 delete mode 100644 include/linux/platform_data/keypad-w90p910.h

Thanks.


-- 
Dmitry
