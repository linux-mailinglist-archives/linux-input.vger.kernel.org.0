Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108433BB712
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 08:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhGEGMs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jul 2021 02:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhGEGMr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jul 2021 02:12:47 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28692C061574;
        Sun,  4 Jul 2021 23:10:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id x3so1193821pll.5;
        Sun, 04 Jul 2021 23:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=JEhINzht+z/BFpCV+B98U2IUTccYiWXANCuuqJv185U=;
        b=lh3WqIQtfm/H3F7rt3qXA/ORAkJsCi5YQOKkHXAka0LDmEAd8CKVTuT8J653hwGV3X
         G9Qux3/IDHpJ8VputqRIOewJk1njRCe033odbCTXTM4gvbg3LwAJUmq2nS5E5VmhcOJB
         n/FtQWLY54oUgg6omedYzesAVQsjeMFjQkDJpdYLKvkKKa8wthC6/xGE3hT0kEUjEEH8
         MZNABNW05CacynL/U0pJ7IAY2EJkk6/Znz9lhLgoeySWX3UiwsOtaBp9Lpc8SedhL6lj
         2J8EhjHmI5tgsVuuAoO7YgwrdHC8cwD2iWkhArXL77eBrIPQ+SgKL7ZxcWJeEVHjKR8H
         a6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=JEhINzht+z/BFpCV+B98U2IUTccYiWXANCuuqJv185U=;
        b=l0qH4Qi4H0iG+n8vby9duIN+p9r+C4dFV9bTIDB4beMLY3lmtrMSTiuZejIETX8b2Y
         g2kyZZQUCQQZAfCNJswWujKa07xFSdm8wRcDYodkkvhpz857dSrpfUKdm9iL0xYwtq9n
         LJt7AWMSeOAR4U+kAv+GEEs+MIRYbzXAbQa/AO4Vf59ukBXa15mxT1a40lNrfabQIzme
         0AK/MpAnuxoZHG7BUeFEAkCpQprYmObRWVMCZ1SejrJNL6FZD/2sB3A2Nsljqo2uwO44
         Jesnd90jS9YZ+hgxx2NYHCxXtl7XKS75X05H4b1jJhq5WAc+EmSBMpCWuTf3VB+z/mLq
         7BhQ==
X-Gm-Message-State: AOAM532J/Lbj2FvPY6TXwYARNNPxl2IqGJ5X+64WV5pO6wsOTbXvSRte
        6OtRXmfu0a4IhyTNNhvGKpY=
X-Google-Smtp-Source: ABdhPJzEvMZuYSW7/06b7+cens/0AjHweBa48H4w9H8E68eJIjHC0+5g/A+6koIS07Zo9xdZZi0Htg==
X-Received: by 2002:a17:90a:f68f:: with SMTP id cl15mr13260999pjb.219.1625465410504;
        Sun, 04 Jul 2021 23:10:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7310:c0e:56b3:ae76])
        by smtp.gmail.com with ESMTPSA id z20sm13229027pgk.36.2021.07.04.23.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 23:10:09 -0700 (PDT)
Date:   Sun, 4 Jul 2021 23:10:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.14-rc0
Message-ID: <YOKiP9QsgXyK8zQK@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- a new driver for SparkFun Qwiic Joystick
- pm8941-pwrkey driver now supports PMK8350
- a bunch of assorted driver fixes


Changelog:
---------

Alexander Larkin (1):
      Input: joydev - prevent use of not validated data in JSIOCSBTNMAP ioctl

Andy Shevchenko (2):
      Input: resistive-adc-touch - describe parameters in kernel doc
      Input: resistive-adc-touch - replace OF headers with proper ones

Chris Ye (1):
      Input: xpad - map "Select" button on Microsoft Xbox One controller

Christophe JAILLET (1):
      Input: evbug - remove an empty comment block

Colin Ian King (1):
      Input: resistive-adc-touch - fix uninitialized variable 'press'

Corentin Labbe (1):
      dt-bindings: input: remove fsl-mma8450 which is handled by trivial-devices

David Collins (2):
      dt-bindings: input: pm8941-pwrkey: add pmk8350 compatible strings
      Input: pm8941-pwrkey - add support for PMK8350 PON_HLOS PMIC peripheral

Dmitry Torokhov (11):
      Input: cyttsp - do not force interrupt trigger
      Input: resistive-adc-touch - rework mapping of channels
      Input: cyttsp - change maintainer
      Input: cyttsp - remove public header
      Input: cy8ctmg110_ts - rely on platform code to supply interrupt
      Input: cy8ctmg110_ts - do not hard code interrupt trigger
      Input: cy8ctmg110_ts - do not hardcode as wakeup source
      Input: cy8ctmg110_ts - let I2C core configure wake interrupt
      Input: cy8ctmg110_ts - use endian helpers when converting data on wire
      Input: cy8ctmg110_ts - switch to using managed resources
      Input: cy8ctmg110_ts - switch to using gpiod API

Geert Uytterhoeven (1):
      dt-bindings: input: touchscreen: st1232: Convert to json-schema

Johan Hovold (1):
      Input: usbtouchscreen - fix control-request directions

Linus Walleij (3):
      Input: cyttsp - convert bindings to YAML and extend
      Input: cyttsp - probe from compatibles
      Input: cyttsp - obtain regulators

Oleh Kravchenko (2):
      dt-bindings: Add vendor prefix and bindings for Qwiic Joystick
      Input: add SparkFun Qwiic Joystick driver

Oleksij Rempel (4):
      dt-bindings: touchscreen: Convert resistive-adc-touch binding to json schema
      dt-bindings: touchscreen: add touchscreen-x/y-plate-ohms property
      dt-bindings: touchscreen: resistive-adc-touch: add support for z1 and z2 channels
      Input: resistive-adc-touch - add support for z1 and z2 channels

Shubhankar Kuranagatti (1):
      Input: ims-pcu - replace some spaces with tabs

Stephan Gerhold (2):
      dt-bindings: input: touchscreen: edt-ft5x06: add iovcc-supply
      Input: edt-ft5x06 - add support for iovcc-supply

Takashi Iwai (2):
      Input: elants_i2c - fix NULL dereference at probing
      Input: elants_i2c - switch to probe_new

Tyson Moore (1):
      Input: i8042 - fix typos in comments

Yizhuo Zhai (1):
      Input: hideep - fix the uninitialized use in hideep_nvm_unlock()

YueHaibing (4):
      Input: ims-pcu - use kobj_to_dev()
      Input: tsc200x-core - use kobj_to_dev()
      Input: atkbd - use kobj_to_dev()
      Input: trackpoint - use kobj_to_dev()

Zhen Lei (1):
      Input: hil_kbd - fix error return code in hil_dev_connect()

zhouchuangao (1):
      Input: cros_ec_keyb - use kobj_to_dev() API

Diffstat:
--------

 .../devicetree/bindings/input/fsl-mma8450.txt      |  12 --
 .../bindings/input/qcom,pm8941-pwrkey.txt          |   2 +
 .../input/touchscreen/cypress,cy8ctma340.yaml      | 148 ++++++++++++++++++
 .../bindings/input/touchscreen/cyttsp.txt          |  93 ------------
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |   1 +
 .../input/touchscreen/resistive-adc-touch.txt      |  33 ----
 .../input/touchscreen/resistive-adc-touch.yaml     |  86 +++++++++++
 .../input/touchscreen/sitronix,st1232.yaml         |  50 ++++++
 .../bindings/input/touchscreen/sitronix-st1232.txt |  28 ----
 .../bindings/input/touchscreen/touchscreen.yaml    |   6 +
 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   5 +-
 drivers/input/evbug.c                              |   3 -
 drivers/input/joydev.c                             |   2 +-
 drivers/input/joystick/Kconfig                     |   9 ++
 drivers/input/joystick/Makefile                    |   1 +
 drivers/input/joystick/qwiic-joystick.c            | 146 ++++++++++++++++++
 drivers/input/joystick/xpad.c                      |   6 +
 drivers/input/keyboard/atkbd.c                     |   2 +-
 drivers/input/keyboard/cros_ec_keyb.c              |   2 +-
 drivers/input/keyboard/hil_kbd.c                   |   1 +
 drivers/input/misc/ims-pcu.c                       |   6 +-
 drivers/input/misc/pm8941-pwrkey.c                 | 103 +++++++++----
 drivers/input/mouse/trackpoint.c                   |   2 +-
 drivers/input/serio/i8042.c                        |   4 +-
 drivers/input/touchscreen/cy8ctmg110_ts.c          | 167 +++++++--------------
 drivers/input/touchscreen/cyttsp_core.c            |  47 +++++-
 drivers/input/touchscreen/cyttsp_core.h            |   3 +-
 drivers/input/touchscreen/cyttsp_i2c.c             |  10 ++
 drivers/input/touchscreen/cyttsp_spi.c             |  10 ++
 drivers/input/touchscreen/edt-ft5x06.c             |  38 ++++-
 drivers/input/touchscreen/elants_i2c.c             |  11 +-
 drivers/input/touchscreen/hideep.c                 |  13 +-
 drivers/input/touchscreen/resistive-adc-touch.c    | 136 ++++++++++++++---
 drivers/input/touchscreen/tsc200x-core.c           |   2 +-
 drivers/input/touchscreen/usbtouchscreen.c         |   8 +-
 include/linux/input/cy8ctmg110_pdata.h             |   1 -
 include/linux/input/cyttsp.h                       |  29 ----
 39 files changed, 836 insertions(+), 394 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/fsl-mma8450.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/sitronix-st1232.txt
 create mode 100644 drivers/input/joystick/qwiic-joystick.c
 delete mode 100644 include/linux/input/cyttsp.h

Thanks.


-- 
Dmitry
