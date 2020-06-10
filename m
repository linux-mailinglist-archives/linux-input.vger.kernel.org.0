Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3148C1F4C8F
	for <lists+linux-input@lfdr.de>; Wed, 10 Jun 2020 06:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgFJErx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jun 2020 00:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgFJErw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jun 2020 00:47:52 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9215C05BD1E;
        Tue,  9 Jun 2020 21:47:51 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id m2so372791pjv.2;
        Tue, 09 Jun 2020 21:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=/JAifpepDhNAiKsoWdRvH31Vci7YRnUEvReq7INmRO0=;
        b=ArFSspGFQWIRGVh967ln3jXomaONiojy+mPGT/8T421pjHnpcTq24JuQVydpW9WmsI
         gi2CDUYfteWoU/8YAF7qJlcUtPx+Su5MEku4vPEfXOBqVPe5lesNdC59ZhLgSevTz8rl
         CYRGI4ZTN+tLinWwK5jtkcJsYZ1wnYw5KgaZEhuwQZjN028HdVGSVH2x3fdTsMeEM1xd
         YH6iGVAsEKsH/g6A44Wa774JJ32i4YxogUnfugZBtYCttUGI9+sy6CoDIX0ngrpyuvSn
         eOL+kJ/gp/W29U2HK7zbbcphp5xm9HxiET3139ZXpv64EBMqNEtJYFBNUIvrtmIs/iGV
         nuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=/JAifpepDhNAiKsoWdRvH31Vci7YRnUEvReq7INmRO0=;
        b=tPoSuSG92kaI+DmbJz8NpT08YV7j5OWy9EF6oJhN6NgZFvaZMvl1muPEIfcnGMy2pB
         AKmQSkH2ZBsRT2XBxbrZoRupRGcLOrEMy0uaKq7+ZV8aZi3zDw82cholQEwZKKcR42ko
         QkFiaGgLeqaWj1o2vvLie3Z1rymw7KoK1yavEjdCxKHAJW5G3vHlutPae08//5vg+wjr
         Xqx0oSCzJbJQk8R1TVTd4DMynOjU4w2rtfA3iaRNeuc434QWrU+IPDMsxD13FPgjpTSw
         ybSGNL7AQ4ShViX/ipeLkecbVfiHvZpY9gXjrfRvwkHExvEkvE5TNwaDnqJsXT6xmHzr
         WdIw==
X-Gm-Message-State: AOAM531chBjpVIZqmyNe7JpjwdupmCGI6hOSNueOx+tdVAycMadTsl6B
        uPXcQmXdsWiin4hf8zzQsq4=
X-Google-Smtp-Source: ABdhPJwGVssFnEMv/8WKxfQ94gr9d9y3zI1Mr0gGe4gnCmT1iisM/oWuZwjqgPLes+n3Tme+5FxJZw==
X-Received: by 2002:a17:90a:c250:: with SMTP id d16mr1253982pjx.60.1591764470709;
        Tue, 09 Jun 2020 21:47:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id nl11sm4462074pjb.0.2020.06.09.21.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 21:47:50 -0700 (PDT)
Date:   Tue, 9 Jun 2020 21:47:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.8-rc0
Message-ID: <20200610044748.GA177775@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- a new driver for Azoteq IQS269A capacitive touch controller
- a new driver for Cypress CY8CTMA140 touchscreen
- updates to Elan and ft5x06 touchscreen drivers
- assorted driver fixes
- msm-vibrator has been removed as we have more generic solution. 

Thanks!

Changelog:
---------

Ahmad Fatoum (1):
      Input: edt-ft5x06 - prefer asynchronous probe

Anson Huang (1):
      Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups

Arnd Bergmann (1):
      Input: adi - work around module name confict

Brian Masney (2):
      dt-bindings: Input: remove msm-vibrator
      Input: remove msm-vibrator driver

Christophe JAILLET (2):
      Input: tca6416-keypad - fix a typo in MODULE_DESCRIPTION
      Input: spear-keyboard - fix a typo in a module name in Kconfig

David Heidelberg (1):
      dt-bindings: input: touchscreen: elants_i2c: convert to YAML

Jeff LaBundy (3):
      dt-bindings: input: Add bindings for Azoteq IQS269A
      Input: add support for Azoteq IQS269A
      Input: iqs269a - add missing I2C dependency

Jiada Wang (1):
      Input: introduce input_mt_report_slot_inactive()

Johnny Chuang (1):
      Input: elants_i2c - provide an attribute to show calibration count

Kenny Levinsen (1):
      Input: evdev - use keyed wakeups

Linus Walleij (3):
      Input: delete unused GP2AP002A00F driver
      dt-bindings: touchscreen: Add CY8CTMA140 bindings
      Input: add driver for the Cypress CY8CTMA140 touchscreen

Marco Felsch (3):
      Input: edt-ft5x06 - fix get_default register write access
      Input: edt-ft5x06 - move parameter restore into helper
      Input: edt-ft5x06 - improve power management operations

Michał Mirosław (3):
      Input: elants - remove unused axes
      Input: elants - override touchscreen info with DT properties
      Input: elants - refactor elants_i2c_execute_command()

Rajat Jain (3):
      Input: i8042 - attach fwnode to serio i8042 kbd device
      Input: atkbd - expose function row physical map to userspace
      Input: atkbd - receive and use physcode->keycode mapping from FW

Stephan Gerhold (2):
      dt-bindings: mms114: document melfas,mms345l binding
      Input: mms114 - add extra compatible for mms345l

Diffstat:
--------

 .../devicetree/bindings/input/elants_i2c.txt       |   34 -
 .../devicetree/bindings/input/iqs269a.yaml         |  581 +++++++
 .../devicetree/bindings/input/msm-vibrator.txt     |   36 -
 .../input/touchscreen/cypress,cy8ctma140.yaml      |   72 +
 .../input/touchscreen/elan,elants_i2c.yaml         |   69 +
 .../bindings/input/touchscreen/mms114.txt          |    3 +-
 MAINTAINERS                                        |    6 +
 drivers/hid/hid-alps.c                             |    3 +-
 drivers/hid/hid-multitouch.c                       |    6 +-
 drivers/input/evdev.c                              |    7 +-
 drivers/input/joystick/Kconfig                     |    1 +
 drivers/input/keyboard/Kconfig                     |    2 +-
 drivers/input/keyboard/atkbd.c                     |   97 +-
 drivers/input/keyboard/imx_sc_key.c                |   33 +-
 drivers/input/keyboard/tca6416-keypad.c            |    2 +-
 drivers/input/misc/Kconfig                         |   32 +-
 drivers/input/misc/Makefile                        |    3 +-
 drivers/input/misc/gp2ap002a00f.c                  |  281 ---
 drivers/input/misc/iqs269a.c                       | 1833 ++++++++++++++++++++
 drivers/input/misc/msm-vibrator.c                  |  281 ---
 drivers/input/misc/xen-kbdfront.c                  |    2 +-
 drivers/input/mouse/elan_i2c_core.c                |    2 +-
 drivers/input/serio/i8042-x86ia64io.h              |    1 +
 drivers/input/serio/i8042.c                        |    3 +
 drivers/input/touchscreen/Kconfig                  |   12 +
 drivers/input/touchscreen/Makefile                 |    1 +
 drivers/input/touchscreen/atmel_mxt_ts.c           |    7 +-
 drivers/input/touchscreen/cy8ctma140.c             |  353 ++++
 drivers/input/touchscreen/cyttsp4_core.c           |    5 +-
 drivers/input/touchscreen/cyttsp_core.c            |    2 +-
 drivers/input/touchscreen/edt-ft5x06.c             |  198 ++-
 drivers/input/touchscreen/elants_i2c.c             |  247 +--
 drivers/input/touchscreen/melfas_mip4.c            |    4 +-
 drivers/input/touchscreen/mms114.c                 |   19 +-
 drivers/input/touchscreen/raspberrypi-ts.c         |    2 +-
 drivers/input/touchscreen/stmfts.c                 |    2 +-
 include/linux/input/gp2ap002a00f.h                 |   23 -
 include/linux/input/mt.h                           |    5 +
 38 files changed, 3397 insertions(+), 873 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/elants_i2c.txt
 create mode 100644 Documentation/devicetree/bindings/input/iqs269a.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/msm-vibrator.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
 delete mode 100644 drivers/input/misc/gp2ap002a00f.c
 create mode 100644 drivers/input/misc/iqs269a.c
 delete mode 100644 drivers/input/misc/msm-vibrator.c
 create mode 100644 drivers/input/touchscreen/cy8ctma140.c
 delete mode 100644 include/linux/input/gp2ap002a00f.h

Thanks.


-- 
Dmitry
