Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA92B0376
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgKLLCN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgKLLCJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:09 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C73C0613D4
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:09 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id h2so4912186wmm.0
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OuJR30k56OLhADyDOBOB3l1CAlx0B1isSCQez0QxynM=;
        b=refeYjsQ8ZuosNqopkP80ZZArkazUc+4Kz8uUZAjUHwJVBjVJCV3eTgeolltaBKcsO
         Yl3d1gDdi5uVy8NksPfsmlZd5p3GtHVxB0WlN+OENjZpNgbZpbguxJaEMhsJaowiI/mX
         XOYgOo5rH1X3Y9Y1gXag0RbIQF02lDdw6/wgncpHRhWiBh5jc5ZcJc5vZviSCzUaaXHn
         tHTBNNHc5jDW0oG/JiP7Ab8P5h1a35UZb4iIVNPqkSMRidq3HEzyK3CHq2lZ4V2Iy0Jt
         Ons9gPP1m/0k+rrNjPWWUIs9LTfexcm2mg+pZs05N71wNg/YtCiU3S4O3plGa9sFUj8o
         mgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OuJR30k56OLhADyDOBOB3l1CAlx0B1isSCQez0QxynM=;
        b=F5oiat+yC2TUhK/0H7OJioVKne3JetjvG5LqcVfW/4ikmro2dI/Igaw+ejlXxgXjgO
         Bu4YSpkf5Gk3YTQqKFNjflv2y2+V903b87k6jk1P3mQt37Ja0XH8syMmA+vDLuXygNfc
         XEgvQawiN9VIihVyhoko1hbCcrmibrtrERaZW5bsz3fd28l7fr2a7Mevruyt8cLVKh79
         5U+hNj9ofmX8h2nM6+alj+Vah3XvWp9iFCOkZH3FJO/RziVzsCbD3V2L8kA8NnXAjN7n
         xb8miRH5bXX253ViTxn+Ob8QickYrDvHWQfQNpNxbOasqoh7NZwkiy9N4bx3Ifm6dxC/
         PTJw==
X-Gm-Message-State: AOAM531MbRnkwbKAReVQ1czARxJF8ANZHDtFoO7pQZ05RwzA69pifR4m
        +lUu/eDmSh9xmMFLWIYo4AjYhA==
X-Google-Smtp-Source: ABdhPJw7vPdws+8ITixoz2jO4kTYAsz0L7gVEHoGmjIlxNshas87PJd9ayONM8BXIE5KWmGnh5lqfw==
X-Received: by 2002:a05:600c:2254:: with SMTP id a20mr9074869wmm.117.1605178927791;
        Thu, 12 Nov 2020 03:02:07 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:07 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Adam Buchbinder <adam.buchbinder@gmail.com>,
        Andrew Zabolotny <zap@homelink.ru>,
        authored by <andrew@goodix.com>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Bruce Kalk <kall@compass.com>,
        Cameron Gutman <aicommander@gmail.com>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Daniel Ritz <daniel.ritz@gmx.ch>,
        De Schrijver <peter.de-schrijver@nokia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dominic Cerquetti <binary1230@yahoo.com>,
        Donghwa Lee <dh09.lee@samsung.com>,
        Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <felipe.balbi@nokia.com>,
        Franz Lehner <franz@caos.at>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Haibo Chen <haibo.chen@freescale.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Ian Molton <spyro@f2s.com>,
        Ivan Hawkes <blackhawk@ivanhawkes.com>,
        James Hilliard <james.hilliard1@gmail.com>,
        Jan Kratochvil <honza@jikos.cz>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        "K. Merker" <merker@debian.org>,
        Liam Girdwood <lrg@slimlogic.co.uk>,
        linux-input@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Marko Friedemann <mfr@bmx-chemnitz.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        patches@opensource.cirrus.com,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter Osterlund <petero2@telia.com>,
        Russell King <rmk@arm.linux.org.uk>,
        Sangwon Jee <jeesw@melfas.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        Steven Toth <steve@toth.demon.co.uk>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        "VMware, Inc." <pv-drivers@vmware.com>
Subject: [PATCH 00/15] [Set 2/2] Rid W=1 issues from Input
Date:   Thu, 12 Nov 2020 11:01:49 +0000
Message-Id: <20201112110204.2083435-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This is the second (and last) of 2 sets.

Lee Jones (15):
  input: joystick: xpad: Demote non-conformant kernel-doc header
  input: keyboard: samsung-keypad: Remove set but unused variable 'var'
  input: misc: mc13783-pwrbutton: File headers are not good candidates
    for kernel-doc
  input: touchscreen: goodix: Provide some missing function parameter
    descriptions
  input: touchscreen: imx6ul_tsc: Remove set but unused variable 'value'
  input: touchscreen: melfas_mip4: Remove a bunch of unused variables
  input: touchscreen: usbtouchscreen: Remove unused variable 'ret'
  input: touchscreen: surface3_spi: Remove set but unused variable
    'timestamp'
  input: misc: wm831x-on: Source file headers are not good candidates
    for kernel-doc
  input: touchscreen: surface3_spi: Fix naming issue with
    'surface3_spi_get_gpio_config's header
  input: touchscreen: wm97xx-core: Provide missing description for
    'status'
  input: mouse: synaptics: Demote non-conformant kernel-doc header
  input: touchscreen: goodix: Fix misspelling of 'ctx'
  input: keyboard: applespi: Provide missing struct 'message'
    descriptions
  input: mouse: vmmouse: Demote obvious abuse of kernel-doc header

 drivers/input/joystick/xpad.c              |  2 +-
 drivers/input/keyboard/applespi.c          |  9 +++++++++
 drivers/input/keyboard/samsung-keypad.c    |  3 +--
 drivers/input/misc/mc13783-pwrbutton.c     |  2 +-
 drivers/input/misc/wm831x-on.c             |  2 +-
 drivers/input/mouse/synaptics.c            |  2 +-
 drivers/input/mouse/vmmouse.c              |  2 +-
 drivers/input/touchscreen/goodix.c         |  5 ++++-
 drivers/input/touchscreen/imx6ul_tsc.c     |  3 +--
 drivers/input/touchscreen/melfas_mip4.c    | 11 -----------
 drivers/input/touchscreen/surface3_spi.c   |  4 +---
 drivers/input/touchscreen/usbtouchscreen.c |  4 ++--
 drivers/input/touchscreen/wm97xx-core.c    |  2 +-
 13 files changed, 24 insertions(+), 27 deletions(-)

Cc: Adam Buchbinder <adam.buchbinder@gmail.com>
Cc: Andrew Zabolotny <zap@homelink.ru>
Cc: authored by <andrew@goodix.com>
Cc: Bastien Nocera <hadess@hadess.net>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: Bruce Kalk <kall@compass.com>
Cc: Cameron Gutman <aicommander@gmail.com>
Cc: Christoph Fritz <chf.fritz@googlemail.com>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Daniel Ritz <daniel.ritz@gmx.ch>
Cc: De Schrijver <peter.de-schrijver@nokia.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dominic Cerquetti <binary1230@yahoo.com>
Cc: Donghwa Lee <dh09.lee@samsung.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Felipe Balbi <felipe.balbi@nokia.com>
Cc: Franz Lehner <franz@caos.at>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Haibo Chen <haibo.chen@freescale.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Ian Molton <spyro@f2s.com>
Cc: Ivan Hawkes <blackhawk@ivanhawkes.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Jan Kratochvil <honza@jikos.cz>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: "K. Merker" <merker@debian.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-input@vger.kernel.org
Cc: "Łukasz Patron" <priv.luk@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Marko Friedemann <mfr@bmx-chemnitz.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: patches@opensource.cirrus.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Osterlund <petero2@telia.com>
Cc: Russell King <rmk@arm.linux.org.uk>
Cc: Sangwon Jee <jeesw@melfas.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: Steven Toth <steve@toth.demon.co.uk>
Cc: this to <linux-input@vger.kernel.org>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: "VMware, Inc." <pv-drivers@vmware.com>
-- 
2.25.1

