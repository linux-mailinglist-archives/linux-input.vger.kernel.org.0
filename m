Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A1665B633
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 19:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjABSGJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 13:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbjABSF6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 13:05:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33405F96
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 10:05:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82828B80D0B
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 18:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F64C433EF;
        Mon,  2 Jan 2023 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672682754;
        bh=X42khAIWdNfwMKY5uZ8Efbdx5P67cjzE6GOBogUNDQE=;
        h=From:To:Cc:Subject:Date:From;
        b=nNfBbxXpYvJO0YTvgM735ZPjjOyhsq4u4vEr7mVsmCSOcu1rA6DYHUoWHwmU3+YDH
         hpSvSMiDbhaq8aIKlzVngTtWNNzKNlkP2BAXp4HFmZgyQ7IcRBeS1f4asIoEwK1aEk
         pL1U9L7yYc/fEZx2ALoUE02t6qucyIuJnQNsNVjLJMF3kFvvzgReINjiAFUvFcBvvX
         YHmECqVffMouqQ7eFb1xeGpV7t9Z829uT70IdUV19keCAjJIpJa+ltRgNQDsU0RUwk
         KxihK1OhlcTLoOvynCO/56yKKz2SsRZNuq0zrn+4HzpXjP2vmIdBdKYZGQ6x8JZHBe
         Zf5lztOfpwhiQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Roy Im <roy.im.opensource@diasemi.com>,
        Moritz Fischer <mdf@kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
        Jeff LaBundy <jeff@labundy.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Stephen Boyd <swboyd@chromium.org>,
        Damien Riegel <damien.riegel@savoirfairelinux.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pascal Paillet <p.paillet@st.com>,
        Tony Lindgren <tony@atomide.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhu Yi <yi.zhu5@cn.bosch.com>,
        Mark Jonas <mark.jonas@de.bosch.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Daniel Mack <daniel@zonque.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Douglas Anderson <dianders@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Anthony Kim <anthony.kim@hideep.com>,
        Joe Hung <joe_hung@ilitek.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Fabio Estevam <festevam@gmail.com>,
        John Keeping <john@metanate.com>,
        Stephen Just <stephenjust@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dario Binacchi <dariobin@libero.it>,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 00/69] Input: Switch to DEFINE_SIMPLE_DEV_PM_OP() set 2
Date:   Mon,  2 Jan 2023 18:17:33 +0000
Message-Id: <20230102181842.718010-1-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This 2nd set is a continuation from:
https://lore.kernel.org/all/20221204180841.2211588-1-jic23@kernel.org/

A 3rd set (maybe more than one) will cover the remaining more
complex cases in Input that go beyond a straight forward switch.
Those will need more careful review than this (hopefully) simple
set.

As part of recent changes to the macros in linux/pm.h, the
SIMPLE_DEV_PM_OPS() macro is deprecated in favor of the combination
of DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
More details in the relevant commit message.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1a3c7bb088266fa2db017be299f91f1c1894c857

The main advantage of the new versions is that they allow the compiler
to 'see' the callbacks registered, thus avoiding the need to either
protect them with ifdef guards or to mark them __maybe_unused.
The compiler then removes the structure and the callbacks as dead code
in event of !CONFIG_PM_SLEEP.

Ultimately to clean up the old macros the change needs to be done to
all instances of the SIMPLE_DEV_PM_OPS() in the kernel. There are similar
changes to be done for runtime PM macros and more complex PM handling.
This set is just meant to switch over some of the low hanging fruit in
a bite sized chunk.

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Roy Im <roy.im.opensource@diasemi.com>
Cc: Moritz Fischer <mdf@kernel.org>
Cc: Luca Weiss <luca@z3ntu.xyz>
Cc: Jeff LaBundy <jeff@labundy.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Pascal Paillet <p.paillet@st.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Raul E Rangel <rrangel@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Zhu Yi <yi.zhu5@cn.bosch.com>
Cc: Mark Jonas <mark.jonas@de.bosch.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Bastien Nocera <hadess@hadess.net>
Cc: Anthony Kim <anthony.kim@hideep.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Markuss Broks <markuss.broks@gmail.com>
Cc: Haibo Chen <haibo.chen@nxp.com>
Cc: Sangwon Jee <jeesw@melfas.com>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: John Keeping <john@metanate.com>
Cc: Stephen Just <stephenjust@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Dario Binacchi <dariobin@libero.it>
Cc: Alistair Francis <alistair@alistair23.me>

Jonathan Cameron (69):
  Input: 88pm860x - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: da7280 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: drv260x - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: drv2665 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: drv2667 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: e3x0-button - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: gpio-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: iqs269a - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: iqs626a - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: kxtj9 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
  Input: max77693-haptic - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: max8925_onkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: max8997_haptic - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: palmas-pwrbutton - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pcfg8574_keypad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pm8941-pwrkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pm8xxx-vibrator - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pmic8xxx-pwrkey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pwm-beeper - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pwm-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: regulator-haptic - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: rotary-encoder - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: stpmic1_onekey - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: twl4030-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: twl6030-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: elan_i2c_core - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: navpoint - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: synaptics_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ambakmi - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ad7877 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ads7846 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ar1021 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: atmel_mxt_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: auo-pixcir-ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: bu21013_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: bu21029 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: chipone_in8318 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: chipone_icn8505 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: cy8ctma140 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: cy8ctmg110_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: edt-ft5x06 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: eeti_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: egalax_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  input: ektf2127 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: elants_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: goodix - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: hideep - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ilitek_ts_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: imagis - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: imx6ul_tsc - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: iqs5xx - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: mcs5000_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: melfas_mip4 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  input: migor_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: mms114 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: msg2638 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: pixcir_i2c_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: raydium_i2c_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: silead - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: st1232 - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: surface3_spi - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ti_am335x_tsc - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ucb1400_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: wacom_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: wdt87xx_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: wm97xx - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: zforce_ts - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: zinitix - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  Input: ipaq-micro-ts - use DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()

 drivers/input/misc/88pm860x_onkey.c         |  9 +++++----
 drivers/input/misc/da7280.c                 |  8 ++++----
 drivers/input/misc/drv260x.c                |  8 ++++----
 drivers/input/misc/drv2665.c                |  8 ++++----
 drivers/input/misc/drv2667.c                |  8 ++++----
 drivers/input/misc/e3x0-button.c            | 10 +++++-----
 drivers/input/misc/gpio-vibra.c             | 10 +++++-----
 drivers/input/misc/iqs269a.c                |  8 ++++----
 drivers/input/misc/iqs626a.c                |  8 ++++----
 drivers/input/misc/kxtj9.c                  |  8 ++++----
 drivers/input/misc/max77693-haptic.c        | 11 ++++++-----
 drivers/input/misc/max8925_onkey.c          |  9 +++++----
 drivers/input/misc/max8997_haptic.c         |  7 ++++---
 drivers/input/misc/palmas-pwrbutton.c       | 10 +++++-----
 drivers/input/misc/pcf8574_keypad.c         | 16 +++-------------
 drivers/input/misc/pm8941-pwrkey.c          | 10 +++++-----
 drivers/input/misc/pm8xxx-vibrator.c        |  6 +++---
 drivers/input/misc/pmic8xxx-pwrkey.c        |  8 ++++----
 drivers/input/misc/pwm-beeper.c             | 10 +++++-----
 drivers/input/misc/pwm-vibra.c              | 10 +++++-----
 drivers/input/misc/regulator-haptic.c       |  8 ++++----
 drivers/input/misc/rotary_encoder.c         | 10 +++++-----
 drivers/input/misc/stpmic1_onkey.c          | 12 ++++++------
 drivers/input/misc/twl4030-vibra.c          | 10 +++++-----
 drivers/input/misc/twl6040-vibra.c          |  7 ++++---
 drivers/input/mouse/elan_i2c_core.c         |  8 ++++----
 drivers/input/mouse/navpoint.c              |  9 +++++----
 drivers/input/mouse/synaptics_i2c.c         | 10 +++++-----
 drivers/input/serio/ambakmi.c               |  6 +++---
 drivers/input/touchscreen/ad7877.c          |  8 ++++----
 drivers/input/touchscreen/ads7846.c         |  8 ++++----
 drivers/input/touchscreen/ar1021_i2c.c      |  9 +++++----
 drivers/input/touchscreen/atmel_mxt_ts.c    |  8 ++++----
 drivers/input/touchscreen/auo-pixcir-ts.c   | 10 +++++-----
 drivers/input/touchscreen/bu21013_ts.c      |  8 ++++----
 drivers/input/touchscreen/bu21029_ts.c      |  8 ++++----
 drivers/input/touchscreen/chipone_icn8318.c |  6 ++----
 drivers/input/touchscreen/chipone_icn8505.c |  8 ++++----
 drivers/input/touchscreen/cy8ctma140.c      |  9 +++++----
 drivers/input/touchscreen/cy8ctmg110_ts.c   |  9 +++++----
 drivers/input/touchscreen/edt-ft5x06.c      | 10 +++++-----
 drivers/input/touchscreen/eeti_ts.c         |  8 ++++----
 drivers/input/touchscreen/egalax_ts.c       |  9 +++++----
 drivers/input/touchscreen/ektf2127.c        | 10 +++++-----
 drivers/input/touchscreen/elants_i2c.c      | 10 +++++-----
 drivers/input/touchscreen/goodix.c          |  8 ++++----
 drivers/input/touchscreen/hideep.c          |  8 ++++----
 drivers/input/touchscreen/ilitek_ts_i2c.c   |  8 ++++----
 drivers/input/touchscreen/imagis.c          |  8 ++++----
 drivers/input/touchscreen/imx6ul_tsc.c      | 10 +++++-----
 drivers/input/touchscreen/ipaq-micro-ts.c   | 11 +++++------
 drivers/input/touchscreen/iqs5xx.c          |  8 ++++----
 drivers/input/touchscreen/mcs5000_ts.c      |  9 +++++----
 drivers/input/touchscreen/melfas_mip4.c     |  8 ++++----
 drivers/input/touchscreen/migor_ts.c        |  8 ++++----
 drivers/input/touchscreen/mms114.c          |  8 ++++----
 drivers/input/touchscreen/msg2638.c         |  8 ++++----
 drivers/input/touchscreen/pixcir_i2c_ts.c   | 10 +++++-----
 drivers/input/touchscreen/raydium_i2c_ts.c  | 12 ++++++------
 drivers/input/touchscreen/silead.c          |  8 ++++----
 drivers/input/touchscreen/st1232.c          | 10 +++++-----
 drivers/input/touchscreen/surface3_spi.c    | 12 ++++++------
 drivers/input/touchscreen/ti_am335x_tsc.c   |  8 ++++----
 drivers/input/touchscreen/ucb1400_ts.c      | 10 +++++-----
 drivers/input/touchscreen/wacom_i2c.c       |  8 ++++----
 drivers/input/touchscreen/wdt87xx_i2c.c     |  8 ++++----
 drivers/input/touchscreen/wm97xx-core.c     | 10 +++++-----
 drivers/input/touchscreen/zforce_ts.c       |  8 ++++----
 drivers/input/touchscreen/zinitix.c         |  8 ++++----
 69 files changed, 306 insertions(+), 308 deletions(-)

-- 
2.39.0

