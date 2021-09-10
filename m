Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36885406689
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhIJEkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhIJEkF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:40:05 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D9DC061574;
        Thu,  9 Sep 2021 21:38:54 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id u18so759928pgf.0;
        Thu, 09 Sep 2021 21:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dLF2todN1aPrWmxZU8AtPPgKIlwOohGYoESKSQlQKM8=;
        b=QmoNX/FX5DXbc0LPHRXxpHvC+43FzjMRDDgaeLamMlJQMpKZTl9gBb27LfDghRIKo5
         URV59jBpMz6OkNWXSm2winyjnSfVP+thl58cB2tKu3JP9HFgGE83AHlYc53Z4LMIDFg7
         dPWi0OpUd9y23Z3ArqGDEsVJIMGPbiLs2BOeBGRJZIXMqIgxuH9VscdszhlttaGGSmbH
         2JXwDL7enCUNyP4RAyvtzn2C4TD9Vq5wwyS+Kgci7b4ULT8XDZqm2NaUyLch4nzMivJ1
         rIndXPFRup+/BOfN3Y03S+EP3Y9JRsmFWRiSix5cz1D9YsyfIdZPYrZHCUNPBT1bgDqy
         NzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dLF2todN1aPrWmxZU8AtPPgKIlwOohGYoESKSQlQKM8=;
        b=w5mnElIypFHetawFl/Ee60wNrdLGAOu0FRgTBf9bPZhFg2JulrJR3PyqbvZ6E2ULUB
         qmvAt7Lnklq1YRS9rCUBoxPzvbZVfS1PCG7GAA8p4KPSjWUAeiJjwFPILMzQcgWL22db
         yA1rd2AIfXlFUSbKbuMoyTw1lj2pelU4T8dQkzWUx/lN50qfZ642KEg+G7Nmuf9Hiq7S
         9a5A5EuDjGs35+YQeCHDuTpzRh9C2lzPEjl11kfijQHGhpeQia9du3fw9aSVH8xxgrsK
         7K7sEA+mZJgvgW1PxZsj7PZFeValA0vaQzhoz8d+KeytQsNAY0DMfgcTIGAQb/6ilCqd
         SMNg==
X-Gm-Message-State: AOAM530LVeaPHKkb0zVK3EK1bfoX7pcFqT+8rd7Cwosz2SYNftpxfJIK
        6BmFfxkLnSu55ELygKFYfi+G7Eg5X60=
X-Google-Smtp-Source: ABdhPJw6/hAo1hDi21qYVeEtsV+6CNh1IynMF0p471tx1xBmRTg027BpVejviYmFpfXdV8SYgDEctA==
X-Received: by 2002:a05:6a00:1823:b0:42a:ee71:d74a with SMTP id y35-20020a056a00182300b0042aee71d74amr4794189pfa.63.1631248734191;
        Thu, 09 Sep 2021 21:38:54 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id y22sm3293126pju.41.2021.09.09.21.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:38:53 -0700 (PDT)
Date:   Thu, 9 Sep 2021 21:38:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.15-rc0
Message-ID: <YTrhWrjCkK8ttRDt@google.com>
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

- several device tree bindings for input devices have been converted
  to yaml
- dropped no longer used ixp4xx-beeper and CSR Prima2 PWRC drivers
- analog joystick has been converted to use ktime API and no longer
  warn about low resolution timers
- a few driver fixes

Changelog:
---------

Alexander Sverdlin (1):
      Input: ep93xx_keypad - prepare clock before using it

Andy Shevchenko (1):
      Input: parkbd - switch to use module_parport_driver()

Colin Ian King (2):
      Input: Fix spelling mistake in Kconfig "Modul" -> "Module"
      Input: Fix spelling mistake in Kconfig "useable" -> "usable"

Dmitry Torokhov (3):
      Input: serio - make write method mandatory
      Revert "Input: serio - make write method mandatory"
      Input: pm8941-pwrkey - fix comma vs semicolon issue

Geert Uytterhoeven (1):
      Input: adc-keys - drop bogus __refdata annotation

Guenter Roeck (1):
      Input: analog - always use ktime functions

Linus Walleij (4):
      Input: ixp4xx-beeper - delete driver
      Input: adp5588-keys - use the right header
      Input: adp5589-keys - use the right header
      Input: mms114 - support MMS134S

Lukas Bulwahn (1):
      Input: remove dead CSR Prima2 PWRC driver

Marek Vasut (1):
      dt-bindings: input: tsc2005: Convert to YAML schema

Maxime Ripard (4):
      dt-bindings: input: Convert ChipOne ICN8318 binding to a schema
      dt-bindings: input: Convert Pixcir Touchscreen binding to a schema
      dt-bindings: input: Convert Regulator Haptic binding to a schema
      dt-bindings: input: sun4i-lradc: Add wakeup-source

Oliver Graute (1):
      Input: edt-ft5x06 - added case for EDT EP0110M09

jingle.wu (1):
      Input: elan_i2c - reduce the resume time for controller in Whitebox

satya priya (3):
      dt-bindings: power: reset: Change 'additionalProperties' to true
      dt-bindings: input: pm8941-pwrkey: Convert pm8941 power key binding to yaml
      dt-bindings: power: reset: qcom-pon: Convert qcom PON binding to yaml

Diffstat:
--------

 .../input/allwinner,sun4i-a10-lradc-keys.yaml      |   2 +
 .../bindings/input/qcom,pm8941-pwrkey.txt          |  55 ------
 .../bindings/input/qcom,pm8941-pwrkey.yaml         |  51 +++++
 .../devicetree/bindings/input/regulator-haptic.txt |  21 ---
 .../bindings/input/regulator-haptic.yaml           |  43 +++++
 .../input/touchscreen/chipone,icn8318.yaml         |  62 ++++++
 .../bindings/input/touchscreen/chipone_icn8318.txt |  44 -----
 .../input/touchscreen/pixcir,pixcir_ts.yaml        |  68 +++++++
 .../bindings/input/touchscreen/pixcir_i2c_ts.txt   |  31 ---
 .../bindings/input/touchscreen/ti,tsc2005.yaml     | 128 +++++++++++++
 .../bindings/input/touchscreen/tsc2005.txt         |  64 -------
 .../devicetree/bindings/power/reset/qcom,pon.txt   |  49 -----
 .../devicetree/bindings/power/reset/qcom,pon.yaml  |  80 ++++++++
 .../bindings/power/reset/reboot-mode.yaml          |   2 +-
 drivers/input/joystick/analog.c                    | 107 ++---------
 drivers/input/keyboard/Kconfig                     |   2 +-
 drivers/input/keyboard/adc-keys.c                  |   2 +-
 drivers/input/keyboard/adp5588-keys.c              |   2 +-
 drivers/input/keyboard/adp5589-keys.c              |   2 +-
 drivers/input/keyboard/ep93xx_keypad.c             |   4 +-
 drivers/input/misc/Kconfig                         |  22 ---
 drivers/input/misc/Makefile                        |   2 -
 drivers/input/misc/ixp4xx-beeper.c                 | 183 ------------------
 drivers/input/misc/pm8941-pwrkey.c                 |   2 +-
 drivers/input/misc/sirfsoc-onkey.c                 | 207 ---------------------
 drivers/input/mouse/elan_i2c.h                     |   3 +-
 drivers/input/mouse/elan_i2c_core.c                |   1 +
 drivers/input/serio/parkbd.c                       |  14 +-
 drivers/input/touchscreen/Kconfig                  |   2 +-
 drivers/input/touchscreen/edt-ft5x06.c             |   1 +
 drivers/input/touchscreen/mms114.c                 |  15 +-
 31 files changed, 472 insertions(+), 799 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/regulator-haptic.txt
 create mode 100644 Documentation/devicetree/bindings/input/regulator-haptic.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/chipone,icn8318.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/chipone_icn8318.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/pixcir_i2c_ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt
 delete mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
 delete mode 100644 drivers/input/misc/ixp4xx-beeper.c
 delete mode 100644 drivers/input/misc/sirfsoc-onkey.c

Thanks.


-- 
Dmitry
