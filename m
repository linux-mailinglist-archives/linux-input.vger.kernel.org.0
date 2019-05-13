Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F431BE62
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2019 22:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfEMUMk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 16:12:40 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33070 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfEMUMj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 16:12:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id z28so7800969pfk.0;
        Mon, 13 May 2019 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=f0OLh/RrP6a7zNlExIIeXXVPr8btdj53wDym/U3VQuM=;
        b=FBREkDOpTRj+5leh3qC1tZItJLT4F+R+B+F0EETTiXczu4K3z943bBVR+bFdHwgkMo
         o5SGCNR0Hd9Ys6IbfxOR31j3B7SDm6/ETdzYYX/DUFPps4v6NhIH/Gnh+RRpH7Eza5Gk
         aZiDDGkNfBzNqgxlPBjOR1iJhZjQPqTud2UxXxmsrSu3/N/R41tVPzhTMqfqfPRqhtMR
         vF/VF1ZubcBEUU38FXfd11exydpDEwCo6DDUIy/y8hV4kI6lK1WsLLUUa/rBc3DtOJWx
         Xn5wiHfE49eXzfirUejf6GVNd83B/82b4T0dbNDrQKkIdKjtsSi7q3UUGYkLXnX0i8rE
         W2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=f0OLh/RrP6a7zNlExIIeXXVPr8btdj53wDym/U3VQuM=;
        b=gFXtvBgbS1fm2Fs2GsrjdrMUfzii/3LZtSjgZWkUyq7JVqbqJ2pOVfzw4CxUfX41Ko
         mF7Z66k0qrUC85Oz8mn7YkdWxOCmJgEl1Zv5eHhVXiCLEVic6hzS0fIo8cXzApQrBfEA
         fFn24oNCRvix+sAEtyjt5ZTC6GXcLdSSP9PAmCRcQu2lQpt2TO/jBBehTIrQdkMYwtqY
         HxgeFhE0gGUE8R/8ENsbvevxGbeiHc/qZL2H602e3uxJpcXsG+kaInckD1xCVlc6ez6s
         xJJD04SQR7JULgDisC5NHBmNGuA/ckwrr2h1zconr9cnRu542piBPU4WdbivdeA7T77Q
         86MA==
X-Gm-Message-State: APjAAAV/k3SnRPvr1FsYSogkjxqTGxrKOHEt6rVqtf9nzunQ1kTYLG3u
        H3/XLUbAneUJ35Fj1ehkfv8=
X-Google-Smtp-Source: APXvYqwTok3C98yvPhmU1IYHB6s5BsqbJp7oMKdIW3rhfZYZMM2isF4ciT+XTg8516SvLfZ/lB6jFA==
X-Received: by 2002:a63:5c25:: with SMTP id q37mr34590080pgb.263.1557778358251;
        Mon, 13 May 2019 13:12:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e12sm16302619pfl.122.2019.05.13.13.12.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 13:12:37 -0700 (PDT)
Date:   Mon, 13 May 2019 13:12:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.2-rc0
Message-ID: <20190513201235.GA87488@dtor-ws>
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

to receive updates for the input subsystem. You will get a few new
drivers:

- driver for Azoteq IQS550/572/525 touch controllers
- driver for Microchip AT42QT1050 keys
- driver for GPIO controllable vibrators
- support for GT5663 in Goodix driver

along with miscellaneous driver fixes.


Changelog:
---------

Andy Shevchenko (2):
      Input: edt-ft5x06 - enable ACPI enumeration
      Input: edt-ft5x06 - convert to use SPDX identifier

Anson Huang (1):
      Input: snvs_pwrkey - use dev_pm_set_wake_irq() to simplify code

Dmitry Torokhov (3):
      Input: i8042 - signal wakeup from atkbd/psmouse
      Input: add KEY_KBD_LAYOUT_NEXT
      HID: input: add mapping for KEY_KBD_LAYOUT_NEXT

Gustavo A. R. Silva (2):
      Input: evdev - use struct_size() in kzalloc() and vzalloc()
      Input: libps2 - mark expected switch fall-through

Jagan Teki (2):
      Input: goodix - add regulators suppot
      Input: goodix - add GT5663 CTP support

Jean Delvare (1):
      Input: olpc_apsp - depend on ARCH_MMP

Jeff LaBundy (1):
      Input: add support for Azoteq IQS550/572/525

Joseph Salisbury (1):
      Input: hyperv-keyboard - add module description

Luca Weiss (1):
      Input: add a driver for GPIO controllable vibrators

Marco Felsch (1):
      Input: qt1050 - add Microchip AT42QT1050 support

Philipp Zabel (2):
      Input: synaptics-rmi4 - fill initial format
      Input: synaptics-rmi4 - fix enum_fmt

Vladimir Zapolskiy (1):
      Input: lpc32xx-key - add clocks property and fix DT binding example

Ziping Chen (1):
      Input: sun4i-a10-lradc-keys - add support for A83T

Diffstat:
--------

 .../devicetree/bindings/input/gpio-vibrator.yaml   |   37 +
 .../devicetree/bindings/input/lpc32xx-key.txt      |    5 +-
 .../devicetree/bindings/input/microchip,qt1050.txt |   78 ++
 .../devicetree/bindings/input/sun4i-lradc-keys.txt |    6 +-
 .../bindings/input/touchscreen/goodix.txt          |    3 +
 .../bindings/input/touchscreen/iqs5xx.txt          |   80 ++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/hid/hid-input.c                            |    2 +
 drivers/input/evdev.c                              |    7 +-
 drivers/input/keyboard/Kconfig                     |   11 +
 drivers/input/keyboard/Makefile                    |    1 +
 drivers/input/keyboard/atkbd.c                     |    2 +
 drivers/input/keyboard/qt1050.c                    |  598 +++++++++++
 drivers/input/keyboard/snvs_pwrkey.c               |   30 +-
 drivers/input/keyboard/sun4i-lradc-keys.c          |   38 +-
 drivers/input/misc/Kconfig                         |   12 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/gpio-vibra.c                    |  207 ++++
 drivers/input/mouse/psmouse-base.c                 |    2 +
 drivers/input/rmi4/rmi_f54.c                       |   21 +-
 drivers/input/serio/Kconfig                        |    1 +
 drivers/input/serio/hyperv-keyboard.c              |    2 +
 drivers/input/serio/i8042.c                        |    3 -
 drivers/input/serio/libps2.c                       |    1 +
 drivers/input/touchscreen/Kconfig                  |   10 +
 drivers/input/touchscreen/Makefile                 |    1 +
 drivers/input/touchscreen/edt-ft5x06.c             |   23 +-
 drivers/input/touchscreen/goodix.c                 |   54 +
 drivers/input/touchscreen/iqs5xx.c                 | 1133 ++++++++++++++++++++
 include/uapi/linux/input-event-codes.h             |    1 +
 30 files changed, 2297 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/gpio-vibrator.yaml
 create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
 create mode 100644 drivers/input/keyboard/qt1050.c
 create mode 100644 drivers/input/misc/gpio-vibra.c
 create mode 100644 drivers/input/touchscreen/iqs5xx.c

Thanks.


-- 
Dmitry
