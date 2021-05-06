Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC59375D27
	for <lists+linux-input@lfdr.de>; Fri,  7 May 2021 00:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhEFWYu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 18:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhEFWYt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 18:24:49 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530ACC061574;
        Thu,  6 May 2021 15:23:51 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id i13so6328742pfu.2;
        Thu, 06 May 2021 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=3UQY3IaQICwwk6HbxIX3pUDsru+1PJgdeqcE0XjsYls=;
        b=ruhSDf56/+eG6E19cF20Wg2y46MRQYFkzGXA8x6sGX/ZK+Gc8y1Yhu1sy08JxPcHeT
         JP72ueO2j+6j9z419b2cLnfdiOWjn64l/dPNS/pLBnO3txGlVJWEjQ12S3YT8ayaJjwf
         j8PXK3WEv9IG5D2k99ukpO/wR8KnkCpL2JKnCrcXKpk67YDHmZZR04+cvi385JwgnqAg
         +grD7j7QA5cSS1FCh71+d72aZ+nGv6aJkNDtPavpZ7L/uWj4NR1oe9aH6bAQarl2xlhL
         W+otHSnjHHOMopKsP1OJlkETdyev+hNxEyKwoAmDhpPbuZJY+LWx2MUh3f2OmcTlhw87
         dEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=3UQY3IaQICwwk6HbxIX3pUDsru+1PJgdeqcE0XjsYls=;
        b=omoczzkUm6IeAHUowAE04dKaowUqO1Zlo3mAJo3CwyQgjq1hrAZxJ9CICKOzhxwafw
         U8K/G9yjvuCbTuHJWTByxMC55PEz9vE4yGhdGRAs99Cn3R+rqwMsqrQMVm6Y8roehjBV
         bxXioDRjWfW+6OMHjKiTVhI8+nHfFBPAiEX2uYiujaqpePquZBpTihHSaXzHwYduVQHB
         BX2EX4se/4OxMrYk6xwlZqOfY314OtfY5PLbBL8G0goeROqkCsMcuPcBgEIypugIChOO
         CWPOZmMrOZaHwOf2uKDMujhzxDsh5AMWNNFPLQlfcPQbp92zqX0eVoVZCepm8m8cA2Q7
         3PtQ==
X-Gm-Message-State: AOAM533GKN8G5xCvBCADRfMsTpBtnNDuaPZTP5VPlA++uEdBySQEPkSl
        SaExB5y94KtE8UrbxsG0pcU=
X-Google-Smtp-Source: ABdhPJxuSshNtiWlkAgD3FAX4hBaPAa9EAUkxSTVaVVuvGORTOI5mwz4Vzra5SD3t5u0NJPASayufw==
X-Received: by 2002:a65:68d7:: with SMTP id k23mr6713922pgt.410.1620339830832;
        Thu, 06 May 2021 15:23:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5228:3770:a497:742])
        by smtp.gmail.com with ESMTPSA id j7sm10966877pjw.4.2021.05.06.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 15:23:49 -0700 (PDT)
Date:   Thu, 6 May 2021 15:23:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.13-rc0
Message-ID: <YJRsc3LxpkFNTknm@google.com>
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

- 3 new touchscreen drivers: Hycon HY46XX, ILITEK Lego Series, and
   MStar MSG2638
- a new driver for Azoteq IQS626A proximity and touch controller
- addition of Amazon Game Controller to the list of devices handled by
  xpad driver
- Elan touchscreen driver will avoid binding to devices described as
  I2CHID compatible in ACPI tables
- various driver fixes.


Changelog:
---------

Andy Shevchenko (2):
      Input: tsc2007 - convert to GPIO descriptors
      Input: tsc2007 - make use of device properties

Barry Song (1):
      Input: move to use request_irq by IRQF_NO_AUTOEN flag

Bhaskar Chowdhury (1):
      Input: silead - fix a typo

Dmitry Osipenko (2):
      dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and WAKE line GPIO
      Input: atmel_mxt_ts - support wakeup methods

Dmitry Torokhov (3):
      Input: wacom_i2c - do not force interrupt trigger
      Input: wacom_i2c - switch to using managed resources
      Input: gpio-keys - fix crash when disabliing GPIO-less buttons

Fabio Estevam (1):
      Input: imx_keypad - convert to a DT-only driver

Giulio Benetti (3):
      dt-bindings: Add Hycon Technology vendor prefix
      dt-bindings: touchscreen: Add HY46XX bindings
      Input: add driver for the Hycon HY46XX touchpanel series

Hans de Goede (2):
      Input: elants_i2c - do not bind to i2c-hid compatible ACPI instantiated devices
      Input: silead - add workaround for x86 BIOS-es which bring the chip up in a stuck state

Hansem Ro (1):
      Input: ili210x - add missing negation for touch indication on ili210x

Heikki Krogerus (1):
      Input: rotary-encoder - update docs according to the latest API changes

Jeff LaBundy (11):
      Input: iqs5xx - update vendor's URL
      Input: iqs5xx - optimize axis definition and validation
      Input: iqs5xx - expose firmware revision to user space
      Input: iqs5xx - remove superfluous revision validation
      Input: iqs5xx - close bootloader using hardware reset
      Input: touchscreen - move helper functions to core
      Input: touchscreen - broaden use-cases described in comments
      dt-bindings: input: Add bindings for Azoteq IQS626A
      Input: Add support for Azoteq IQS626A
      Input: iqs5xx - make reset GPIO optional
      dt-bindings: input: iqs5xx: Convert to YAML

Jiapeng Chong (1):
      Input: apbps2 - remove useless variable

Jingle Wu (1):
      Input: elan_i2c - reduce the resume time for new devices

Joe Hung (2):
      dt-bindings: input: touchscreen: ilitek_ts_i2c: Add bindings
      Input: Add support for ILITEK Lego Series

Johan Hovold (1):
      Input: ims-pcu - drop redundant driver-data assignment

Krzysztof Kozlowski (1):
      dt-bindings: input: atmel,maxtouch: add wakeup-source

Linus Walleij (8):
      Input: cyttsp - verbose error on soft reset
      Input: mms114 - convert bindings to YAML and extend
      Input: mms114 - support MMS136
      Input: cyttsp - error message on boot mode exit error
      Input: cyttsp - reduce reset pulse timings
      Input: cyttsp - drop the phys path
      Input: cyttsp - set abs params for ABS_MT_TOUCH_MAJOR
      Input: cyttsp - flag the device properly

Lucas Stach (4):
      Input: exc3000 - split MT event handling from IRQ handler
      Input: exc3000 - factor out vendor data request
      Input: exc3000 - fix firmware version query for device in bootloader
      Input: exc3000 - add type sysfs attribute

Lukas Bulwahn (1):
      MAINTAINERS: repair reference in HYCON HY46XX TOUCHSCREEN SUPPORT

Matt Reynolds (1):
      Input: xpad - add support for Amazon Game Controller

Nikolai Kostrigin (1):
      Input: elan_i2c - fix a typo in parameter name

Paul Cercueil (3):
      Input: gpio-keys - remove extra call to input_sync
      Input: gpio-keys - use hrtimer for release timer
      Input: gpio-keys - use hrtimer for software debounce, if possible

Uwe Kleine-König (1):
      Input: max8997 - simplify open coding of a division using up to 64 divisions

Vincent Knecht (2):
      dt-bindings: input/touchscreen: add bindings for msg2638
      Input: add MStar MSG2638 touchscreen driver

edison.jiang (1):
      Input: lpc32xx_ts - convert to use BIT()

Diffstat:
--------

 .../ABI/testing/sysfs-driver-input-exc3000         |    9 +
 .../devicetree/bindings/input/atmel,maxtouch.yaml  |   32 +
 .../devicetree/bindings/input/iqs626a.yaml         |  843 +++++++++
 .../bindings/input/touchscreen/azoteq,iqs5xx.yaml  |   75 +
 .../bindings/input/touchscreen/hycon,hy46xx.yaml   |  119 ++
 .../bindings/input/touchscreen/ilitek_ts_i2c.yaml  |   73 +
 .../bindings/input/touchscreen/iqs5xx.txt          |   80 -
 .../bindings/input/touchscreen/melfas,mms114.yaml  |   87 +
 .../bindings/input/touchscreen/mms114.txt          |   42 -
 .../bindings/input/touchscreen/mstar,msg2638.yaml  |   69 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/input/devices/rotary-encoder.rst     |    8 +-
 MAINTAINERS                                        |    7 +
 drivers/input/Makefile                             |    1 +
 drivers/input/joystick/xpad.c                      |    2 +
 drivers/input/keyboard/gpio_keys.c                 |  105 +-
 drivers/input/keyboard/imx_keypad.c                |   13 +-
 drivers/input/keyboard/tca6416-keypad.c            |    3 +-
 drivers/input/keyboard/tegra-kbc.c                 |    5 +-
 drivers/input/misc/Kconfig                         |   11 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/ims-pcu.c                       |    1 -
 drivers/input/misc/iqs626a.c                       | 1838 ++++++++++++++++++++
 drivers/input/misc/max8997_haptic.c                |    9 +-
 drivers/input/mouse/elan_i2c.h                     |    7 +-
 drivers/input/mouse/elan_i2c_core.c                |   58 +-
 drivers/input/serio/apbps2.c                       |    3 +-
 .../of_touchscreen.c => touchscreen.c}             |   13 +-
 drivers/input/touchscreen/Kconfig                  |   39 +-
 drivers/input/touchscreen/Makefile                 |    4 +-
 drivers/input/touchscreen/ar1021_i2c.c             |    5 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |   83 +-
 drivers/input/touchscreen/bu21029_ts.c             |    4 +-
 drivers/input/touchscreen/cyttsp_core.c            |   39 +-
 drivers/input/touchscreen/cyttsp_core.h            |    1 -
 drivers/input/touchscreen/elants_i2c.c             |   44 +-
 drivers/input/touchscreen/exc3000.c                |  253 +--
 drivers/input/touchscreen/hycon-hy46xx.c           |  591 +++++++
 drivers/input/touchscreen/ili210x.c                |    2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c          |  690 ++++++++
 drivers/input/touchscreen/iqs5xx.c                 |  171 +-
 drivers/input/touchscreen/lpc32xx_ts.c             |   10 +-
 drivers/input/touchscreen/melfas_mip4.c            |    5 +-
 drivers/input/touchscreen/mms114.c                 |   26 +-
 drivers/input/touchscreen/msg2638.c                |  337 ++++
 drivers/input/touchscreen/silead.c                 |   46 +-
 drivers/input/touchscreen/stmfts.c                 |    3 +-
 drivers/input/touchscreen/tsc2007.h                |    4 +-
 drivers/input/touchscreen/tsc2007_core.c           |   60 +-
 drivers/input/touchscreen/wacom_i2c.c              |   56 +-
 drivers/input/touchscreen/wm831x-ts.c              |    3 +-
 drivers/input/touchscreen/zinitix.c                |    4 +-
 include/dt-bindings/input/atmel-maxtouch.h         |   10 +
 53 files changed, 5469 insertions(+), 537 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/mms114.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
 create mode 100644 drivers/input/misc/iqs626a.c
 rename drivers/input/{touchscreen/of_touchscreen.c => touchscreen.c} (93%)
 create mode 100644 drivers/input/touchscreen/hycon-hy46xx.c
 create mode 100644 drivers/input/touchscreen/ilitek_ts_i2c.c
 create mode 100644 drivers/input/touchscreen/msg2638.c
 create mode 100644 include/dt-bindings/input/atmel-maxtouch.h

Thanks.


-- 
Dmitry
