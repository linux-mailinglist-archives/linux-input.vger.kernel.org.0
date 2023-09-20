Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044E77A827C
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236357AbjITM7c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236278AbjITM72 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:28 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202C992
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:59:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmz-000587-4p; Wed, 20 Sep 2023 14:58:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmq-007gyN-0B; Wed, 20 Sep 2023 14:58:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmp-003ICS-Ks; Wed, 20 Sep 2023 14:58:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        =?utf-8?b?am9ld3UgKOWQs+S7suaMryk=?= <joewu@msi.com>,
        chrome-platform@lists.linux.dev,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Jeff LaBundy <jeff@labundy.com>, Rob Herring <robh@kernel.org>,
        Siarhei Volkau <lis8215@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        Yangtao Li <frank.li@vivo.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Support Opensource <support.opensource@diasemi.com>,
        Andrey Moiseev <o2g.org.ru@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Miloslav Trmac <mitr@volny.cz>, patches@opensource.cirrus.com,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Liang He <windhl@126.com>, Chen Jun <chenjun102@huawei.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-sunxi@lists.linux.dev, Michal Simek <michal.simek@amd.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 00/52] input: Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:37 +0200
Message-Id: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7964; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rWdlzhLIsHdM03iIkzA+11kS9bDXeLiLuCT43NqOQEY=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSuN8ZmSTKloh8yuFfy5MV5+uWsEeuNnvFmY9DEnP0nc mxS2Ys6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZhI9l32f+prjjenxj/xNLI/ fCZcNn9G469/HMsa190y6F523t9fXWCd7K3veRHzPn4uUmXpVu7IVMq7Z1gYIv12T02du9Hygtm x111E7772uLAgK2i+p4KXma7iPda+l2/SmvTeLQ06vuyleBS3hmnPkp/vlyf81g8qWyQ2Jf3I2a tuP0tlnjwV4ddmDFzW6MtRLFlc9HDu4oR5aYHXukvPsnU3rX50flr8LMH41Xl9VQezPB4c46xVl WzNb+/ZvIBjXZ9844U1y7xbuhZtMo0v51cqmqJ6XK0yULdrwd+NO6X7gp6cnWE2z+zOtizOedHn 6mvWfReo3inFY8jS1lP4KX9rgZ98eVBpuZ6M54SIWxsB
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

this series converts all platform drivers below drivers/input to use
remove_new. The motivation is to get rid of an integer return code
that is (mostly) ignored by the platform driver core and error prone on
the driver side.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are no interdependencies between the patches. As there are still
quite a few drivers to convert, I'm happy about every patch that makes
it in. So even if there is a merge conflict with one patch until you
apply or a subject prefix is suboptimal, please apply the remainder of
this series anyhow.

Best regards
Uwe

Uwe Kleine-König (52):
  input: adp5520-keys - Convert to platform remove callback returning
    void
  input: cros_ec_keyb - Convert to platform remove callback returning
    void
  input: ep93xx_keypad - Convert to platform remove callback returning
    void
  input: iqs62x-keys - Convert to platform remove callback returning
    void
  input: matrix_keypad - Convert to platform remove callback returning
    void
  input: omap-keypad - Convert to platform remove callback returning
    void
  input: omap4-keypad - Convert to platform remove callback returning
    void
  input: samsung-keypad - Convert to platform remove callback returning
    void
  input: sh_keysc - Convert to platform remove callback returning void
  input: spear-keyboard - Convert to platform remove callback returning
    void
  input: stmpe-keypad - Convert to platform remove callback returning
    void
  input: 88pm80x_onkey - Convert to platform remove callback returning
    void
  input: da9052_onkey - Convert to platform remove callback returning
    void
  input: da9055_onkey - Convert to platform remove callback returning
    void
  input: ideapad_slidebar - Convert to platform remove callback
    returning void
  input: m68kspkr - Convert to platform remove callback returning void
  input: max8997_haptic - Convert to platform remove callback returning
    void
  input: mc13783-pwrbutton - Convert to platform remove callback
    returning void
  input: palmas-pwrbutton - Convert to platform remove callback
    returning void
  input: pcap_keys - Convert to platform remove callback returning void
  input: pcf50633-input - Convert to platform remove callback returning
    void
  input: pcspkr - Convert to platform remove callback returning void
  input: pm8941-pwrkey - Convert to platform remove callback returning
    void
  input: soc_button_array - Convert to platform remove callback
    returning void
  input: sparcspkr - Convert to platform remove callback returning void
  input: wistron_btns - Convert to platform remove callback returning
    void
  input: wm831x-on - Convert to platform remove callback returning void
  input: navpoint - Convert to platform remove callback returning void
  input: altera_ps2 - Convert to platform remove callback returning void
  input: ams_delta_serio - Convert to platform remove callback returning
    void
  input: apbps2 - Convert to platform remove callback returning void
  input: arc_ps2 - Convert to platform remove callback returning void
  input: ct82c710 - Convert to platform remove callback returning void
  drivers/input/serio/i8042-sparcio.h :: Convert to platform remove
    callback returning void
  input: i8042 - Convert to platform remove callback returning void
  input: ioc3kbd - Convert to platform remove callback returning void
  input: maceps2 - Convert to platform remove callback returning void
  input: olpc_apsp - Convert to platform remove callback returning void
  input: ps2-gpio - Convert to platform remove callback returning void
  input: q40kbd - Convert to platform remove callback returning void
  input: rpckbd - Convert to platform remove callback returning void
  input: sun4i-ps2 - Convert to platform remove callback returning void
  input: xilinx_ps2 - Convert to platform remove callback returning void
  input: da9052_tsi - Convert to platform remove callback returning void
  input: mainstone-wm97xx - Convert to platform remove callback
    returning void
  input: mc13783_ts - Convert to platform remove callback returning void
  input: pcap_ts - Convert to platform remove callback returning void
  input: stmpe-ts - Convert to platform remove callback returning void
  input: sun4i-ts - Convert to platform remove callback returning void
  input: ti_am335x_tsc - Convert to platform remove callback returning
    void
  input: wm831x-ts - Convert to platform remove callback returning void
  input: wm97xx-core - Convert to platform remove callback returning
    void

 drivers/input/keyboard/adp5520-keys.c        |  6 ++----
 drivers/input/keyboard/cros_ec_keyb.c        |  6 ++----
 drivers/input/keyboard/ep93xx_keypad.c       |  6 ++----
 drivers/input/keyboard/iqs62x-keys.c         |  6 ++----
 drivers/input/keyboard/matrix_keypad.c       |  6 ++----
 drivers/input/keyboard/omap-keypad.c         |  6 ++----
 drivers/input/keyboard/omap4-keypad.c        |  6 ++----
 drivers/input/keyboard/samsung-keypad.c      |  6 ++----
 drivers/input/keyboard/sh_keysc.c            |  6 ++----
 drivers/input/keyboard/spear-keyboard.c      |  6 ++----
 drivers/input/keyboard/stmpe-keypad.c        |  6 ++----
 drivers/input/misc/88pm80x_onkey.c           |  5 ++---
 drivers/input/misc/da9052_onkey.c            |  6 ++----
 drivers/input/misc/da9055_onkey.c            |  6 ++----
 drivers/input/misc/ideapad_slidebar.c        |  6 ++----
 drivers/input/misc/m68kspkr.c                |  6 ++----
 drivers/input/misc/max8997_haptic.c          |  6 ++----
 drivers/input/misc/mc13783-pwrbutton.c       |  6 ++----
 drivers/input/misc/palmas-pwrbutton.c        |  6 ++----
 drivers/input/misc/pcap_keys.c               |  6 ++----
 drivers/input/misc/pcf50633-input.c          |  6 ++----
 drivers/input/misc/pcspkr.c                  |  6 ++----
 drivers/input/misc/pm8941-pwrkey.c           |  6 ++----
 drivers/input/misc/soc_button_array.c        |  6 ++----
 drivers/input/misc/sparcspkr.c               | 12 ++++--------
 drivers/input/misc/wistron_btns.c            |  6 ++----
 drivers/input/misc/wm831x-on.c               |  6 ++----
 drivers/input/mouse/navpoint.c               |  6 ++----
 drivers/input/serio/altera_ps2.c             |  6 ++----
 drivers/input/serio/ams_delta_serio.c        |  6 ++----
 drivers/input/serio/apbps2.c                 |  6 ++----
 drivers/input/serio/arc_ps2.c                |  6 ++----
 drivers/input/serio/ct82c710.c               |  6 ++----
 drivers/input/serio/i8042-sparcio.h          |  6 ++----
 drivers/input/serio/i8042.c                  |  6 ++----
 drivers/input/serio/ioc3kbd.c                |  6 ++----
 drivers/input/serio/maceps2.c                |  6 ++----
 drivers/input/serio/olpc_apsp.c              |  6 ++----
 drivers/input/serio/ps2-gpio.c               |  5 ++---
 drivers/input/serio/q40kbd.c                 |  6 ++----
 drivers/input/serio/rpckbd.c                 |  6 ++----
 drivers/input/serio/sun4i-ps2.c              |  6 ++----
 drivers/input/serio/xilinx_ps2.c             |  6 ++----
 drivers/input/touchscreen/da9052_tsi.c       |  6 ++----
 drivers/input/touchscreen/mainstone-wm97xx.c |  6 ++----
 drivers/input/touchscreen/mc13783_ts.c       |  6 ++----
 drivers/input/touchscreen/pcap_ts.c          |  6 ++----
 drivers/input/touchscreen/stmpe-ts.c         |  6 ++----
 drivers/input/touchscreen/sun4i-ts.c         |  6 ++----
 drivers/input/touchscreen/ti_am335x_tsc.c    |  5 ++---
 drivers/input/touchscreen/wm831x-ts.c        |  6 ++----
 drivers/input/touchscreen/wm97xx-core.c      |  6 ++----
 52 files changed, 106 insertions(+), 209 deletions(-)

base-commit: 926f75c8a5ab70567eb4c2d82fbc96963313e564
-- 
2.40.1

