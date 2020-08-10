Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68DE240CC3
	for <lists+linux-input@lfdr.de>; Mon, 10 Aug 2020 20:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgHJSMj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Aug 2020 14:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgHJSMi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Aug 2020 14:12:38 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBD9C061756;
        Mon, 10 Aug 2020 11:12:38 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p37so1200851pgl.3;
        Mon, 10 Aug 2020 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=+1K7lPkl9sTdF9hLdLNfPdB56zzb78jCkAfPaMwndHs=;
        b=Sm/LzB8HAt3VwQj4DiJxBmeCCDGDcjV2aFcuWZ/kJJZ/IjgLGlOwBqOL5597ra7JCA
         +pE3qGvx0dx/9iWGM/KjucK1JRxc+D3Xf4RJGswAUcjsdDdG/dv+RCMUJIe762UZtXL2
         OTYnsY+pXnvNDN61dq1sIAt3iqB83oNBbpkF5C+bJj6a8U9CcawmQ6qzhKUso7lKZlBH
         lDDDqGL5tj1fE5I3y9o3xg0+TVe56WmAW2fIYx2bONbhyLxESh+IpjR7sYqXZbqCwMmo
         VUFQ4SNmaHtLwrYlPZlW2HPAdkRyri79Xpub5jsXU6t/7OMzYYzEaEfCZ++eYWGiSb6x
         5O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=+1K7lPkl9sTdF9hLdLNfPdB56zzb78jCkAfPaMwndHs=;
        b=HyauaqExlVcuVYginIkUHzuSEOic29NCp1nVmov9kRmd4Ir12Ue2IU9R07Iq1wkZnP
         yXb2D1y/GgzEljU9vFXzmmg1UR47b8jBBaOv6fWWUltB0QiCE1Qkiu0PIAn1LULks8EX
         vbklRXjKZWmrt1xKTGEch9h6nxW2ttqv/f1tt4vd2ft6d3Kz7HIPWKO7bTeWeJcwwpA5
         kZHDgEfDUxauFb8F5FvCo55heJUiRmGTd+jKyFkjGBvggF5VS1flhsVr/o8yBp+JNouG
         2JGm1H+Hn9gOqex/FEFZ4rfErqmtuSp0Mc64AGbgaQQoZzf2v/bSvHBRHv0i73OEAXUs
         vJfg==
X-Gm-Message-State: AOAM53015yELJWHx8GUHNwbkHRq+DBFO+MsY+2v/tX+ScriU8w3MxZKg
        YrBLwENYjz0lxaSOUaFknXQ=
X-Google-Smtp-Source: ABdhPJyi0A0Gf1gxQozPeG3qqp/rzzafdu85x+YeQyF+NtCy17IENlAAxUTtnnFpFBuGjTRNOxccLg==
X-Received: by 2002:a63:6c8:: with SMTP id 191mr21586967pgg.117.1597083158155;
        Mon, 10 Aug 2020 11:12:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 198sm22723988pfz.120.2020.08.10.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 11:12:37 -0700 (PDT)
Date:   Mon, 10 Aug 2020 11:12:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.9-rc0
Message-ID: <20200810181235.GA929203@dtor-ws>
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

- an update to Elan touchpad controller driver supporting newer ICs with
  enhanced precision reports and a new firmware update process
- an update to EXC3000 touch controller supporting additional parts
- assorted driver fixups.

Changelog:
---------

Colin Ian King (4):
      Input: elantech - remove redundant assignments to variable error
      Input: ims-pcu - return error code rather than -ENOMEM
      Input: alps - remove redundant assignment to variable ret
      Input: sentelic - fix error return when fsp_reg_write fails

Dmitry Torokhov (1):
      Input: elan_i2c - do not constantly re-query pattern ID

Gustavo A. R. Silva (1):
      Input: Use fallthrough pseudo-keyword

Jingle Wu (9):
      Input: elan_i2c - handle firmware not implementing "get pattern" command
      Input: elan_i2c - make fetching IC type of older controllers more robust
      Input: elan_i2c - handle devices with patterns above 1
      Input: elan_i2c - fix detecting IAP version on older controllers
      Input: elan_i2c - add support for different firmware page sizes
      Input: elan_i2c - handle firmware updated on newer ICs
      Input: elan_i2c - add firmware update info for ICs 0x11, 0x13, 0x14
      Input: elan_i2c - add support for high resolution reports
      Input: elan_i2c - add ic type 0x15

Michał Mirosław (1):
      Input: mt - cleanup open-coded __set_bit()

Nick Dyer (1):
      Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when necessary

Pavel Machek (1):
      Input: uinput - fix typo in function name documentation

Randy Dunlap (1):
      Input: synaptics-rmi4 - drop a duplicated word

Sebastian Reichel (5):
      Input: exc3000 - switch to i2c's probe_new API
      dt-bindings: touchscreen: Convert EETI EXC3000 touchscreen to json-schema
      Input: exc3000 - add EXC80H60 and EXC80H84 support
      Input: exc3000 - add reset gpio support
      Input: exc3000 - add support to query model and fw_version

Xiongfeng Wang (2):
      Input: psmouse - add a newline when printing 'proto' by sysfs
      Input: ati_remote2 - add missing newlines when printing module parameters

Xu Wang (1):
      Input: cm109 - remove needless check before usb_free_coherent()

Diffstat:
--------

 .../ABI/testing/sysfs-driver-input-exc3000         |  15 ++
 .../bindings/input/touchscreen/eeti,exc3000.yaml   |  58 +++++
 .../bindings/input/touchscreen/exc3000.txt         |  26 ---
 Documentation/input/uinput.rst                     |   6 +-
 drivers/input/input-mt.c                           |   2 +-
 drivers/input/joystick/db9.c                       |  10 +-
 drivers/input/joystick/gamecon.c                   |  10 +-
 drivers/input/joystick/sidewinder.c                |  15 +-
 drivers/input/joystick/spaceball.c                 |   8 +-
 drivers/input/keyboard/adp5589-keys.c              |   2 +-
 drivers/input/keyboard/atkbd.c                     |   2 +-
 drivers/input/keyboard/gpio_keys.c                 |   1 -
 drivers/input/misc/ati_remote2.c                   |   4 +-
 drivers/input/misc/cm109.c                         |   8 +-
 drivers/input/misc/ims-pcu.c                       |   2 +-
 drivers/input/misc/iqs269a.c                       |  21 +-
 drivers/input/misc/pwm-vibra.c                     |   2 +-
 drivers/input/misc/xen-kbdfront.c                  |   4 +-
 drivers/input/mouse/alps.c                         |   2 +-
 drivers/input/mouse/appletouch.c                   |   2 +-
 drivers/input/mouse/cyapa_gen3.c                   |   4 +-
 drivers/input/mouse/cyapa_gen5.c                   |   2 +-
 drivers/input/mouse/cyapa_gen6.c                   |   2 +-
 drivers/input/mouse/elan_i2c.h                     |  20 +-
 drivers/input/mouse/elan_i2c_core.c                | 195 ++++++++++------
 drivers/input/mouse/elan_i2c_i2c.c                 | 165 ++++++++++----
 drivers/input/mouse/elan_i2c_smbus.c               |  35 ++-
 drivers/input/mouse/elantech.c                     |  12 +-
 drivers/input/mouse/hgpk.c                         |   4 +-
 drivers/input/mouse/navpoint.c                     |   2 +-
 drivers/input/mouse/psmouse-base.c                 |   2 +-
 drivers/input/mouse/sentelic.c                     |   4 +-
 drivers/input/mouse/sermouse.c                     |   4 +-
 drivers/input/serio/i8042.c                        |   2 +-
 drivers/input/serio/libps2.c                       |   2 +-
 drivers/input/sparse-keymap.c                      |   2 +-
 drivers/input/tablet/gtco.c                        |   6 +-
 drivers/input/tablet/pegasus_notetaker.c           |   2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |  56 ++++-
 drivers/input/touchscreen/edt-ft5x06.c             |   3 +-
 drivers/input/touchscreen/elants_i2c.c             |   2 +-
 drivers/input/touchscreen/elo.c                    |   2 +-
 drivers/input/touchscreen/exc3000.c                | 248 +++++++++++++++++++--
 drivers/input/touchscreen/iqs5xx.c                 |   2 +-
 drivers/input/touchscreen/max11801_ts.c            |   1 -
 drivers/input/touchscreen/stmfts.c                 |   2 +-
 include/linux/rmi.h                                |   2 +-
 47 files changed, 718 insertions(+), 265 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-input-exc3000
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.txt

Thanks.


-- 
Dmitry
