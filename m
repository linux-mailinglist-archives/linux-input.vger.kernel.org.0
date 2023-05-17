Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4722706E79
	for <lists+linux-input@lfdr.de>; Wed, 17 May 2023 18:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjEQQrC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 May 2023 12:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjEQQrB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 May 2023 12:47:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2D310E0
        for <linux-input@vger.kernel.org>; Wed, 17 May 2023 09:46:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzKIg-00040h-6i; Wed, 17 May 2023 18:46:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzKIf-000tJM-2u; Wed, 17 May 2023 18:46:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzKIe-005PnY-Bn; Wed, 17 May 2023 18:46:52 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] Input: Switch i2c drivers back to use .probe()
Date:   Wed, 17 May 2023 18:46:45 +0200
Message-Id: <20230517164645.162294-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=50943; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LVBtVnQUWfTq8I/Y0SAVZ9hbZ4+L0Pt+ITWFmkjei9M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZQT0gPN2PrIrDGLrSBi1qQ0xcRdZeZAX70/F7 O8k/Dm45gyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGUE9AAKCRCPgPtYfRL+ TidMB/9iXPfE/j713Q9MrYjh+kTs4phx22Q87xHL9RSr3vgtu/X4KNk4ss2OngneVmBDbnwJOZs kicRbpFVCbmIdrCbBKcQik0vO5MvFkC8lLNCHNhv0lA6EoPI7mSShCYVOBbwlBtpYkF0GDJoerp 8IQVrM65WipcryqQvbC9i581ECKfZxZeBZD61I3p2UHeQRIwCCi1gvMhhoFSaBNWVUh3PpCgNzn MhfpJfcvgJ4bw0mwlV+THxbo3nfjxIOgj1veDhcouGAPQcuNiY6DXkCgH7VisHCLUeWCNe5LmtH 7Z6DHZkk0Bnu/zdpYGU4m++YfnTgmR1zd6cGj9s02mURqaId
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was generated using coccinelle, but I aligned the result to
the per-file indention. Other than that it's just s/probe_new/probe/.

I used v6.4-rc1 as base for it, there are a few patches in next that
conflict slightly with it, but for me git can sort it all out.
Feel free to just drop all conflicting hunks if it doesn't go so smooth
for you, I'll care about the fallout later.

I chose to do this in a single patch for all drivers below
drivers/input. If you want me to split it (per driver? per directory?)
just tell me.

Also note I didn't Cc: all the individual maintainers to not exceed the
allowed length of To: and Cc:. If this patch will be split I can extend
the audience accordingly.

Best regards
Uwe

 drivers/input/joystick/as5011.c                 | 2 +-
 drivers/input/joystick/qwiic-joystick.c         | 2 +-
 drivers/input/keyboard/adp5588-keys.c           | 2 +-
 drivers/input/keyboard/adp5589-keys.c           | 2 +-
 drivers/input/keyboard/cap11xx.c                | 2 +-
 drivers/input/keyboard/cypress-sf.c             | 2 +-
 drivers/input/keyboard/dlink-dir685-touchkeys.c | 2 +-
 drivers/input/keyboard/lm8323.c                 | 2 +-
 drivers/input/keyboard/lm8333.c                 | 2 +-
 drivers/input/keyboard/max7359_keypad.c         | 2 +-
 drivers/input/keyboard/mcs_touchkey.c           | 2 +-
 drivers/input/keyboard/mpr121_touchkey.c        | 2 +-
 drivers/input/keyboard/pinephone-keyboard.c     | 2 +-
 drivers/input/keyboard/qt1050.c                 | 2 +-
 drivers/input/keyboard/qt1070.c                 | 2 +-
 drivers/input/keyboard/qt2160.c                 | 2 +-
 drivers/input/keyboard/tca6416-keypad.c         | 2 +-
 drivers/input/keyboard/tca8418_keypad.c         | 2 +-
 drivers/input/keyboard/tm2-touchkey.c           | 2 +-
 drivers/input/misc/ad714x-i2c.c                 | 2 +-
 drivers/input/misc/adxl34x-i2c.c                | 2 +-
 drivers/input/misc/apanel.c                     | 2 +-
 drivers/input/misc/atmel_captouch.c             | 2 +-
 drivers/input/misc/bma150.c                     | 2 +-
 drivers/input/misc/cma3000_d0x_i2c.c            | 2 +-
 drivers/input/misc/da7280.c                     | 2 +-
 drivers/input/misc/drv260x.c                    | 2 +-
 drivers/input/misc/drv2665.c                    | 2 +-
 drivers/input/misc/drv2667.c                    | 2 +-
 drivers/input/misc/ibm-panel.c                  | 2 +-
 drivers/input/misc/iqs269a.c                    | 2 +-
 drivers/input/misc/iqs626a.c                    | 2 +-
 drivers/input/misc/iqs7222.c                    | 2 +-
 drivers/input/misc/kxtj9.c                      | 2 +-
 drivers/input/misc/mma8450.c                    | 2 +-
 drivers/input/misc/pcf8574_keypad.c             | 2 +-
 drivers/input/mouse/cyapa.c                     | 2 +-
 drivers/input/mouse/elan_i2c_core.c             | 2 +-
 drivers/input/mouse/synaptics_i2c.c             | 2 +-
 drivers/input/rmi4/rmi_i2c.c                    | 2 +-
 drivers/input/rmi4/rmi_smbus.c                  | 2 +-
 drivers/input/touchscreen/ad7879-i2c.c          | 2 +-
 drivers/input/touchscreen/ar1021_i2c.c          | 2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c        | 2 +-
 drivers/input/touchscreen/auo-pixcir-ts.c       | 2 +-
 drivers/input/touchscreen/bu21013_ts.c          | 2 +-
 drivers/input/touchscreen/bu21029_ts.c          | 2 +-
 drivers/input/touchscreen/chipone_icn8318.c     | 2 +-
 drivers/input/touchscreen/chipone_icn8505.c     | 2 +-
 drivers/input/touchscreen/cy8ctma140.c          | 2 +-
 drivers/input/touchscreen/cy8ctmg110_ts.c       | 2 +-
 drivers/input/touchscreen/cyttsp4_i2c.c         | 2 +-
 drivers/input/touchscreen/cyttsp5.c             | 2 +-
 drivers/input/touchscreen/cyttsp_i2c.c          | 2 +-
 drivers/input/touchscreen/edt-ft5x06.c          | 2 +-
 drivers/input/touchscreen/eeti_ts.c             | 2 +-
 drivers/input/touchscreen/egalax_ts.c           | 2 +-
 drivers/input/touchscreen/ektf2127.c            | 2 +-
 drivers/input/touchscreen/elants_i2c.c          | 2 +-
 drivers/input/touchscreen/exc3000.c             | 2 +-
 drivers/input/touchscreen/goodix.c              | 2 +-
 drivers/input/touchscreen/hideep.c              | 2 +-
 drivers/input/touchscreen/himax_hx83112b.c      | 2 +-
 drivers/input/touchscreen/hycon-hy46xx.c        | 2 +-
 drivers/input/touchscreen/hynitron_cstxxx.c     | 2 +-
 drivers/input/touchscreen/ili210x.c             | 2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c       | 2 +-
 drivers/input/touchscreen/imagis.c              | 2 +-
 drivers/input/touchscreen/iqs5xx.c              | 2 +-
 drivers/input/touchscreen/max11801_ts.c         | 2 +-
 drivers/input/touchscreen/mcs5000_ts.c          | 2 +-
 drivers/input/touchscreen/melfas_mip4.c         | 2 +-
 drivers/input/touchscreen/migor_ts.c            | 2 +-
 drivers/input/touchscreen/mms114.c              | 2 +-
 drivers/input/touchscreen/msg2638.c             | 2 +-
 drivers/input/touchscreen/novatek-nvt-ts.c      | 2 +-
 drivers/input/touchscreen/pixcir_i2c_ts.c       | 2 +-
 drivers/input/touchscreen/raydium_i2c_ts.c      | 2 +-
 drivers/input/touchscreen/rohm_bu21023.c        | 2 +-
 drivers/input/touchscreen/s6sy761.c             | 2 +-
 drivers/input/touchscreen/silead.c              | 2 +-
 drivers/input/touchscreen/sis_i2c.c             | 2 +-
 drivers/input/touchscreen/st1232.c              | 2 +-
 drivers/input/touchscreen/stmfts.c              | 2 +-
 drivers/input/touchscreen/sx8654.c              | 2 +-
 drivers/input/touchscreen/tsc2004.c             | 2 +-
 drivers/input/touchscreen/tsc2007_core.c        | 2 +-
 drivers/input/touchscreen/wacom_i2c.c           | 2 +-
 drivers/input/touchscreen/wdt87xx_i2c.c         | 2 +-
 drivers/input/touchscreen/zet6223.c             | 2 +-
 drivers/input/touchscreen/zforce_ts.c           | 2 +-
 drivers/input/touchscreen/zinitix.c             | 2 +-
 92 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/input/joystick/as5011.c b/drivers/input/joystick/as5011.c
index 3b88f0b49e01..bf8b1cc0ea9c 100644
--- a/drivers/input/joystick/as5011.c
+++ b/drivers/input/joystick/as5011.c
@@ -348,7 +348,7 @@ static struct i2c_driver as5011_driver = {
 	.driver = {
 		.name = "as5011",
 	},
-	.probe_new	= as5011_probe,
+	.probe		= as5011_probe,
 	.remove		= as5011_remove,
 	.id_table	= as5011_id,
 };
diff --git a/drivers/input/joystick/qwiic-joystick.c b/drivers/input/joystick/qwiic-joystick.c
index d4da31c0616c..7d88d76b14d6 100644
--- a/drivers/input/joystick/qwiic-joystick.c
+++ b/drivers/input/joystick/qwiic-joystick.c
@@ -137,7 +137,7 @@ static struct i2c_driver qwiic_driver = {
 		.of_match_table	= of_match_ptr(of_qwiic_match),
 	},
 	.id_table	= qwiic_id_table,
-	.probe_new	= qwiic_probe,
+	.probe		= qwiic_probe,
 };
 module_i2c_driver(qwiic_driver);
 
diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 72ae5ce72956..896a5a989ddc 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -866,7 +866,7 @@ static struct i2c_driver adp5588_driver = {
 		.of_match_table = adp5588_of_match,
 		.pm   = pm_sleep_ptr(&adp5588_dev_pm_ops),
 	},
-	.probe_new = adp5588_probe,
+	.probe    = adp5588_probe,
 	.remove   = adp5588_remove,
 	.id_table = adp5588_id,
 };
diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 38d7073863a8..8996e00cd63a 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1054,7 +1054,7 @@ static struct i2c_driver adp5589_driver = {
 		.name = KBUILD_MODNAME,
 		.pm = pm_sleep_ptr(&adp5589_dev_pm_ops),
 	},
-	.probe_new = adp5589_probe,
+	.probe = adp5589_probe,
 	.id_table = adp5589_id,
 };
 
diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index 040696d0e49c..1b4937dce672 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -518,7 +518,7 @@ static struct i2c_driver cap11xx_i2c_driver = {
 		.of_match_table = cap11xx_dt_ids,
 	},
 	.id_table	= cap11xx_i2c_ids,
-	.probe_new	= cap11xx_i2c_probe,
+	.probe		= cap11xx_i2c_probe,
 };
 
 module_i2c_driver(cap11xx_i2c_driver);
diff --git a/drivers/input/keyboard/cypress-sf.c b/drivers/input/keyboard/cypress-sf.c
index 686388f40317..2bacd9d80ecf 100644
--- a/drivers/input/keyboard/cypress-sf.c
+++ b/drivers/input/keyboard/cypress-sf.c
@@ -229,7 +229,7 @@ static struct i2c_driver cypress_sf_driver = {
 		.of_match_table = of_match_ptr(cypress_sf_of_match),
 	},
 	.id_table = cypress_sf_id_table,
-	.probe_new = cypress_sf_probe,
+	.probe = cypress_sf_probe,
 };
 module_i2c_driver(cypress_sf_driver);
 
diff --git a/drivers/input/keyboard/dlink-dir685-touchkeys.c b/drivers/input/keyboard/dlink-dir685-touchkeys.c
index ddba2bc861da..6c065eff5a5a 100644
--- a/drivers/input/keyboard/dlink-dir685-touchkeys.c
+++ b/drivers/input/keyboard/dlink-dir685-touchkeys.c
@@ -145,7 +145,7 @@ static struct i2c_driver dir685_tk_i2c_driver = {
 		.name	= "dlink-dir685-touchkeys",
 		.of_match_table = of_match_ptr(dir685_tk_of_match),
 	},
-	.probe_new	= dir685_tk_probe,
+	.probe		= dir685_tk_probe,
 	.id_table	= dir685_tk_id,
 };
 module_i2c_driver(dir685_tk_i2c_driver);
diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index 5df4d5a7ed9e..3964f6e0f6af 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -826,7 +826,7 @@ static struct i2c_driver lm8323_i2c_driver = {
 		.name	= "lm8323",
 		.pm	= pm_sleep_ptr(&lm8323_pm_ops),
 	},
-	.probe_new	= lm8323_probe,
+	.probe		= lm8323_probe,
 	.remove		= lm8323_remove,
 	.id_table	= lm8323_id,
 };
diff --git a/drivers/input/keyboard/lm8333.c b/drivers/input/keyboard/lm8333.c
index 7457c3220f90..c9f05764e36d 100644
--- a/drivers/input/keyboard/lm8333.c
+++ b/drivers/input/keyboard/lm8333.c
@@ -218,7 +218,7 @@ static struct i2c_driver lm8333_driver = {
 	.driver = {
 		.name		= "lm8333",
 	},
-	.probe_new	= lm8333_probe,
+	.probe		= lm8333_probe,
 	.remove		= lm8333_remove,
 	.id_table	= lm8333_id,
 };
diff --git a/drivers/input/keyboard/max7359_keypad.c b/drivers/input/keyboard/max7359_keypad.c
index b363749d02e2..faab7691c219 100644
--- a/drivers/input/keyboard/max7359_keypad.c
+++ b/drivers/input/keyboard/max7359_keypad.c
@@ -280,7 +280,7 @@ static struct i2c_driver max7359_i2c_driver = {
 		.name = "max7359",
 		.pm   = pm_sleep_ptr(&max7359_pm),
 	},
-	.probe_new	= max7359_probe,
+	.probe		= max7359_probe,
 	.id_table	= max7359_ids,
 };
 
diff --git a/drivers/input/keyboard/mcs_touchkey.c b/drivers/input/keyboard/mcs_touchkey.c
index d414e19e4559..de312d8eb974 100644
--- a/drivers/input/keyboard/mcs_touchkey.c
+++ b/drivers/input/keyboard/mcs_touchkey.c
@@ -258,7 +258,7 @@ static struct i2c_driver mcs_touchkey_driver = {
 		.name	= "mcs_touchkey",
 		.pm	= pm_sleep_ptr(&mcs_touchkey_pm_ops),
 	},
-	.probe_new	= mcs_touchkey_probe,
+	.probe		= mcs_touchkey_probe,
 	.remove		= mcs_touchkey_remove,
 	.shutdown       = mcs_touchkey_shutdown,
 	.id_table	= mcs_touchkey_id,
diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index 74ad353462a3..d434753afab1 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -389,7 +389,7 @@ static struct i2c_driver mpr_touchkey_driver = {
 		.of_match_table = of_match_ptr(mpr121_touchkey_dt_match_table),
 	},
 	.id_table	= mpr121_id,
-	.probe_new	= mpr_touchkey_probe,
+	.probe		= mpr_touchkey_probe,
 };
 
 module_i2c_driver(mpr_touchkey_driver);
diff --git a/drivers/input/keyboard/pinephone-keyboard.c b/drivers/input/keyboard/pinephone-keyboard.c
index 5548699b8b38..038ff3549a7a 100644
--- a/drivers/input/keyboard/pinephone-keyboard.c
+++ b/drivers/input/keyboard/pinephone-keyboard.c
@@ -455,7 +455,7 @@ static const struct of_device_id ppkb_of_match[] = {
 MODULE_DEVICE_TABLE(of, ppkb_of_match);
 
 static struct i2c_driver ppkb_driver = {
-	.probe_new	= ppkb_probe,
+	.probe		= ppkb_probe,
 	.driver		= {
 		.name		= DRV_NAME,
 		.of_match_table = ppkb_of_match,
diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index 317fe2b1f827..6953097db445 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -588,7 +588,7 @@ static struct i2c_driver qt1050_driver = {
 		.of_match_table = of_match_ptr(qt1050_of_match),
 		.pm = pm_sleep_ptr(&qt1050_pm_ops),
 	},
-	.probe_new = qt1050_probe,
+	.probe = qt1050_probe,
 };
 
 module_i2c_driver(qt1050_driver);
diff --git a/drivers/input/keyboard/qt1070.c b/drivers/input/keyboard/qt1070.c
index fabb50bde844..91aaa9fc43a4 100644
--- a/drivers/input/keyboard/qt1070.c
+++ b/drivers/input/keyboard/qt1070.c
@@ -271,7 +271,7 @@ static struct i2c_driver qt1070_driver = {
 		.pm	= pm_sleep_ptr(&qt1070_pm_ops),
 	},
 	.id_table	= qt1070_id,
-	.probe_new	= qt1070_probe,
+	.probe		= qt1070_probe,
 	.remove		= qt1070_remove,
 };
 
diff --git a/drivers/input/keyboard/qt2160.c b/drivers/input/keyboard/qt2160.c
index 04d2ee6ff577..599ea85cfd30 100644
--- a/drivers/input/keyboard/qt2160.c
+++ b/drivers/input/keyboard/qt2160.c
@@ -460,7 +460,7 @@ static struct i2c_driver qt2160_driver = {
 	},
 
 	.id_table	= qt2160_idtable,
-	.probe_new	= qt2160_probe,
+	.probe		= qt2160_probe,
 	.remove		= qt2160_remove,
 };
 
diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index 673b905af6fe..2f745cabf4f2 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -350,7 +350,7 @@ static struct i2c_driver tca6416_keypad_driver = {
 		.name	= "tca6416-keypad",
 		.pm	= pm_sleep_ptr(&tca6416_keypad_dev_pm_ops),
 	},
-	.probe_new	= tca6416_keypad_probe,
+	.probe		= tca6416_keypad_probe,
 	.remove		= tca6416_keypad_remove,
 	.id_table	= tca6416_id,
 };
diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 3d7492f38337..76fc19ffe21d 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -370,7 +370,7 @@ static struct i2c_driver tca8418_keypad_driver = {
 		.name	= "tca8418_keypad",
 		.of_match_table = tca8418_dt_ids,
 	},
-	.probe_new	= tca8418_keypad_probe,
+	.probe		= tca8418_keypad_probe,
 	.id_table	= tca8418_id,
 };
 
diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
index 4e20571cb4c3..75bd3ea51194 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -356,7 +356,7 @@ static struct i2c_driver tm2_touchkey_driver = {
 		.pm = pm_sleep_ptr(&tm2_touchkey_pm_ops),
 		.of_match_table = tm2_touchkey_of_match,
 	},
-	.probe_new = tm2_touchkey_probe,
+	.probe = tm2_touchkey_probe,
 	.id_table = tm2_touchkey_id_table,
 };
 module_i2c_driver(tm2_touchkey_driver);
diff --git a/drivers/input/misc/ad714x-i2c.c b/drivers/input/misc/ad714x-i2c.c
index d8e39f4a57ac..679fcfea942c 100644
--- a/drivers/input/misc/ad714x-i2c.c
+++ b/drivers/input/misc/ad714x-i2c.c
@@ -86,7 +86,7 @@ static struct i2c_driver ad714x_i2c_driver = {
 		.name = "ad714x_captouch",
 		.pm   = pm_sleep_ptr(&ad714x_pm),
 	},
-	.probe_new = ad714x_i2c_probe,
+	.probe = ad714x_i2c_probe,
 	.id_table = ad714x_id,
 };
 
diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34x-i2c.c
index 1c75d98c85a7..6b880e282d99 100644
--- a/drivers/input/misc/adxl34x-i2c.c
+++ b/drivers/input/misc/adxl34x-i2c.c
@@ -135,7 +135,7 @@ static struct i2c_driver adxl34x_driver = {
 		.pm = pm_sleep_ptr(&adxl34x_pm),
 		.of_match_table = adxl34x_of_id,
 	},
-	.probe_new = adxl34x_i2c_probe,
+	.probe    = adxl34x_i2c_probe,
 	.remove   = adxl34x_i2c_remove,
 	.id_table = adxl34x_id,
 };
diff --git a/drivers/input/misc/apanel.c b/drivers/input/misc/apanel.c
index f42d3219cdcc..b5219bbe856d 100644
--- a/drivers/input/misc/apanel.c
+++ b/drivers/input/misc/apanel.c
@@ -201,7 +201,7 @@ static struct i2c_driver apanel_driver = {
 	.driver = {
 		.name = APANEL,
 	},
-	.probe_new	= apanel_probe,
+	.probe		= apanel_probe,
 	.shutdown	= apanel_shutdown,
 	.id_table	= apanel_id,
 };
diff --git a/drivers/input/misc/atmel_captouch.c b/drivers/input/misc/atmel_captouch.c
index d9704b174d3a..b6a30044e814 100644
--- a/drivers/input/misc/atmel_captouch.c
+++ b/drivers/input/misc/atmel_captouch.c
@@ -263,7 +263,7 @@ static const struct i2c_device_id atmel_captouch_id[] = {
 MODULE_DEVICE_TABLE(i2c, atmel_captouch_id);
 
 static struct i2c_driver atmel_captouch_driver = {
-	.probe_new	= atmel_captouch_probe,
+	.probe		= atmel_captouch_probe,
 	.id_table	= atmel_captouch_id,
 	.driver		= {
 		.name	= "atmel_captouch",
diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index 3f9da5c3cb53..0fb4cc628f29 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -551,7 +551,7 @@ static struct i2c_driver bma150_driver = {
 	},
 	.class		= I2C_CLASS_HWMON,
 	.id_table	= bma150_id,
-	.probe_new	= bma150_probe,
+	.probe		= bma150_probe,
 	.remove		= bma150_remove,
 };
 
diff --git a/drivers/input/misc/cma3000_d0x_i2c.c b/drivers/input/misc/cma3000_d0x_i2c.c
index 136eb3715870..a4dfb3052dc0 100644
--- a/drivers/input/misc/cma3000_d0x_i2c.c
+++ b/drivers/input/misc/cma3000_d0x_i2c.c
@@ -97,7 +97,7 @@ static const struct i2c_device_id cma3000_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, cma3000_i2c_id);
 
 static struct i2c_driver cma3000_i2c_driver = {
-	.probe_new	= cma3000_i2c_probe,
+	.probe		= cma3000_i2c_probe,
 	.remove		= cma3000_i2c_remove,
 	.id_table	= cma3000_i2c_id,
 	.driver = {
diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index b85a19e3554f..ce82548916bb 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -1321,7 +1321,7 @@ static struct i2c_driver da7280_driver = {
 		.of_match_table = of_match_ptr(da7280_of_match),
 		.pm = pm_sleep_ptr(&da7280_pm_ops),
 	},
-	.probe_new = da7280_probe,
+	.probe = da7280_probe,
 	.id_table = da7280_i2c_id,
 };
 module_i2c_driver(da7280_driver);
diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 8a9ebfc04a2d..59acf8d7e259 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -653,7 +653,7 @@ static const struct of_device_id drv260x_of_match[] = {
 MODULE_DEVICE_TABLE(of, drv260x_of_match);
 
 static struct i2c_driver drv260x_driver = {
-	.probe_new	= drv260x_probe,
+	.probe		= drv260x_probe,
 	.driver		= {
 		.name	= "drv260x-haptics",
 		.of_match_table = drv260x_of_match,
diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index 9145096f80ea..de27e6079d84 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -297,7 +297,7 @@ MODULE_DEVICE_TABLE(of, drv2665_of_match);
 #endif
 
 static struct i2c_driver drv2665_driver = {
-	.probe_new	= drv2665_probe,
+	.probe		= drv2665_probe,
 	.driver		= {
 		.name	= "drv2665-haptics",
 		.of_match_table = of_match_ptr(drv2665_of_match),
diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index 88b4dbe3e5b5..11c5855256e8 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -474,7 +474,7 @@ MODULE_DEVICE_TABLE(of, drv2667_of_match);
 #endif
 
 static struct i2c_driver drv2667_driver = {
-	.probe_new	= drv2667_probe,
+	.probe		= drv2667_probe,
 	.driver		= {
 		.name	= "drv2667-haptics",
 		.of_match_table = of_match_ptr(drv2667_of_match),
diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
index 3969ffc1bc8d..867ac7aa10d2 100644
--- a/drivers/input/misc/ibm-panel.c
+++ b/drivers/input/misc/ibm-panel.c
@@ -189,7 +189,7 @@ static struct i2c_driver ibm_panel_driver = {
 		.name = DEVICE_NAME,
 		.of_match_table = ibm_panel_match,
 	},
-	.probe_new = ibm_panel_probe,
+	.probe = ibm_panel_probe,
 	.remove = ibm_panel_remove,
 };
 module_i2c_driver(ibm_panel_driver);
diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index f4c3aff3895b..1272ef7b5794 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -1746,7 +1746,7 @@ static struct i2c_driver iqs269_i2c_driver = {
 		.of_match_table = iqs269_of_match,
 		.pm = pm_sleep_ptr(&iqs269_pm),
 	},
-	.probe_new = iqs269_probe,
+	.probe = iqs269_probe,
 };
 module_i2c_driver(iqs269_i2c_driver);
 
diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index 90f997a905b5..50035c25c3f7 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -1822,7 +1822,7 @@ static struct i2c_driver iqs626_i2c_driver = {
 		.of_match_table = iqs626_of_match,
 		.pm = pm_sleep_ptr(&iqs626_pm),
 	},
-	.probe_new = iqs626_probe,
+	.probe = iqs626_probe,
 };
 module_i2c_driver(iqs626_i2c_driver);
 
diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index e47ab6c1177f..096b0925f41b 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2593,7 +2593,7 @@ static struct i2c_driver iqs7222_i2c_driver = {
 		.name = "iqs7222",
 		.of_match_table = iqs7222_of_match,
 	},
-	.probe_new = iqs7222_probe,
+	.probe = iqs7222_probe,
 };
 module_i2c_driver(iqs7222_i2c_driver);
 
diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
index 4e806d56c55d..912e614d039d 100644
--- a/drivers/input/misc/kxtj9.c
+++ b/drivers/input/misc/kxtj9.c
@@ -538,7 +538,7 @@ static struct i2c_driver kxtj9_driver = {
 		.name	= NAME,
 		.pm	= pm_sleep_ptr(&kxtj9_pm_ops),
 	},
-	.probe_new	= kxtj9_probe,
+	.probe		= kxtj9_probe,
 	.id_table	= kxtj9_id,
 };
 
diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
index b12152536976..76a190b2220b 100644
--- a/drivers/input/misc/mma8450.c
+++ b/drivers/input/misc/mma8450.c
@@ -202,7 +202,7 @@ static struct i2c_driver mma8450_driver = {
 		.name	= MMA8450_DRV_NAME,
 		.of_match_table = mma8450_dt_ids,
 	},
-	.probe_new	= mma8450_probe,
+	.probe		= mma8450_probe,
 	.id_table	= mma8450_id,
 };
 
diff --git a/drivers/input/misc/pcf8574_keypad.c b/drivers/input/misc/pcf8574_keypad.c
index 6323c3d37ef7..536cedeb38e6 100644
--- a/drivers/input/misc/pcf8574_keypad.c
+++ b/drivers/input/misc/pcf8574_keypad.c
@@ -199,7 +199,7 @@ static struct i2c_driver pcf8574_kp_driver = {
 		.name  = DRV_NAME,
 		.pm = pm_sleep_ptr(&pcf8574_kp_pm_ops),
 	},
-	.probe_new = pcf8574_kp_probe,
+	.probe    = pcf8574_kp_probe,
 	.remove   = pcf8574_kp_remove,
 	.id_table = pcf8574_kp_id,
 };
diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index dd7b0d70d791..05851bc32541 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -1489,7 +1489,7 @@ static struct i2c_driver cyapa_driver = {
 		.of_match_table = of_match_ptr(cyapa_of_match),
 	},
 
-	.probe_new = cyapa_probe,
+	.probe = cyapa_probe,
 	.id_table = cyapa_id_table,
 };
 
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 5f0d75a45c80..0cff742302a9 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1424,7 +1424,7 @@ static struct i2c_driver elan_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.dev_groups = elan_sysfs_groups,
 	},
-	.probe_new	= elan_probe,
+	.probe		= elan_probe,
 	.id_table	= elan_id,
 };
 
diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
index 068692a8aba5..af5cc64c622d 100644
--- a/drivers/input/mouse/synaptics_i2c.c
+++ b/drivers/input/mouse/synaptics_i2c.c
@@ -650,7 +650,7 @@ static struct i2c_driver synaptics_i2c_driver = {
 		.pm	= pm_sleep_ptr(&synaptics_i2c_pm),
 	},
 
-	.probe_new	= synaptics_i2c_probe,
+	.probe		= synaptics_i2c_probe,
 	.remove		= synaptics_i2c_remove,
 
 	.id_table	= synaptics_i2c_id_table,
diff --git a/drivers/input/rmi4/rmi_i2c.c b/drivers/input/rmi4/rmi_i2c.c
index d69569ce8d8d..091d4e23b629 100644
--- a/drivers/input/rmi4/rmi_i2c.c
+++ b/drivers/input/rmi4/rmi_i2c.c
@@ -377,7 +377,7 @@ static struct i2c_driver rmi_i2c_driver = {
 		.of_match_table = of_match_ptr(rmi_i2c_of_match),
 	},
 	.id_table	= rmi_id,
-	.probe_new	= rmi_i2c_probe,
+	.probe		= rmi_i2c_probe,
 };
 
 module_i2c_driver(rmi_i2c_driver);
diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 4bf0e1df6a4a..7059a2762aeb 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -418,7 +418,7 @@ static struct i2c_driver rmi_smb_driver = {
 		.pm	= pm_ptr(&rmi_smb_pm),
 	},
 	.id_table	= rmi_id,
-	.probe_new	= rmi_smb_probe,
+	.probe		= rmi_smb_probe,
 	.remove		= rmi_smb_remove,
 };
 
diff --git a/drivers/input/touchscreen/ad7879-i2c.c b/drivers/input/touchscreen/ad7879-i2c.c
index dd8f31737bb8..feaa6f8b01ed 100644
--- a/drivers/input/touchscreen/ad7879-i2c.c
+++ b/drivers/input/touchscreen/ad7879-i2c.c
@@ -62,7 +62,7 @@ static struct i2c_driver ad7879_i2c_driver = {
 		.pm	= &ad7879_pm_ops,
 		.of_match_table = of_match_ptr(ad7879_i2c_dt_ids),
 	},
-	.probe_new	= ad7879_i2c_probe,
+	.probe		= ad7879_i2c_probe,
 	.id_table	= ad7879_id,
 };
 
diff --git a/drivers/input/touchscreen/ar1021_i2c.c b/drivers/input/touchscreen/ar1021_i2c.c
index 3a5b65cae360..64dfb749386f 100644
--- a/drivers/input/touchscreen/ar1021_i2c.c
+++ b/drivers/input/touchscreen/ar1021_i2c.c
@@ -182,7 +182,7 @@ static struct i2c_driver ar1021_i2c_driver = {
 		.of_match_table = ar1021_i2c_of_match,
 	},
 
-	.probe_new	= ar1021_i2c_probe,
+	.probe		= ar1021_i2c_probe,
 	.id_table	= ar1021_i2c_id,
 };
 module_i2c_driver(ar1021_i2c_driver);
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 996bf434e1cb..ea45ebad7745 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3377,7 +3377,7 @@ static struct i2c_driver mxt_driver = {
 		.acpi_match_table = ACPI_PTR(mxt_acpi_id),
 		.pm	= pm_sleep_ptr(&mxt_pm_ops),
 	},
-	.probe_new	= mxt_probe,
+	.probe		= mxt_probe,
 	.remove		= mxt_remove,
 	.id_table	= mxt_id,
 };
diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index 5359efc80b2b..90c682e7407f 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -636,7 +636,7 @@ static struct i2c_driver auo_pixcir_driver = {
 		.pm	= pm_sleep_ptr(&auo_pixcir_pm_ops),
 		.of_match_table	= of_match_ptr(auo_pixcir_ts_dt_idtable),
 	},
-	.probe_new	= auo_pixcir_probe,
+	.probe		= auo_pixcir_probe,
 	.id_table	= auo_pixcir_idtable,
 };
 
diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index c994ab6f4e58..85332cfaa29d 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -617,7 +617,7 @@ static struct i2c_driver bu21013_driver = {
 		.name	=	DRIVER_TP,
 		.pm	=	pm_sleep_ptr(&bu21013_dev_pm_ops),
 	},
-	.probe_new	=	bu21013_probe,
+	.probe		=	bu21013_probe,
 	.remove		=	bu21013_remove,
 	.id_table	=	bu21013_id,
 };
diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 8f1442894ff9..c8126d2efe95 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -474,7 +474,7 @@ static struct i2c_driver bu21029_driver = {
 		.pm		= pm_sleep_ptr(&bu21029_pm_ops),
 	},
 	.id_table	= bu21029_ids,
-	.probe_new	= bu21029_probe,
+	.probe		= bu21029_probe,
 };
 module_i2c_driver(bu21029_driver);
 
diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
index 32b714a6ed2d..9fbeaf17f00b 100644
--- a/drivers/input/touchscreen/chipone_icn8318.c
+++ b/drivers/input/touchscreen/chipone_icn8318.c
@@ -264,7 +264,7 @@ static struct i2c_driver icn8318_driver = {
 		.pm	= pm_sleep_ptr(&icn8318_pm_ops),
 		.of_match_table = icn8318_of_match,
 	},
-	.probe_new = icn8318_probe,
+	.probe = icn8318_probe,
 	.id_table = icn8318_i2c_id,
 };
 
diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
index 246bee0bee53..b56954830b33 100644
--- a/drivers/input/touchscreen/chipone_icn8505.c
+++ b/drivers/input/touchscreen/chipone_icn8505.c
@@ -498,7 +498,7 @@ static struct i2c_driver icn8505_driver = {
 		.pm	= pm_sleep_ptr(&icn8505_pm_ops),
 		.acpi_match_table = icn8505_acpi_match,
 	},
-	.probe_new = icn8505_probe,
+	.probe = icn8505_probe,
 };
 
 module_i2c_driver(icn8505_driver);
diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
index cd86477d971a..967ecde23e83 100644
--- a/drivers/input/touchscreen/cy8ctma140.c
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -344,7 +344,7 @@ static struct i2c_driver cy8ctma140_driver = {
 		.of_match_table = cy8ctma140_of_match,
 	},
 	.id_table	= cy8ctma140_idtable,
-	.probe_new	= cy8ctma140_probe,
+	.probe		= cy8ctma140_probe,
 };
 module_i2c_driver(cy8ctma140_driver);
 
diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index dcf50fbf6dc7..54d6c4869eb0 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -279,7 +279,7 @@ static struct i2c_driver cy8ctmg110_driver = {
 		.pm	= pm_sleep_ptr(&cy8ctmg110_pm),
 	},
 	.id_table	= cy8ctmg110_idtable,
-	.probe_new	= cy8ctmg110_probe,
+	.probe		= cy8ctmg110_probe,
 };
 
 module_i2c_driver(cy8ctmg110_driver);
diff --git a/drivers/input/touchscreen/cyttsp4_i2c.c b/drivers/input/touchscreen/cyttsp4_i2c.c
index ec7a4779f3fb..80a6890cd45a 100644
--- a/drivers/input/touchscreen/cyttsp4_i2c.c
+++ b/drivers/input/touchscreen/cyttsp4_i2c.c
@@ -60,7 +60,7 @@ static struct i2c_driver cyttsp4_i2c_driver = {
 		.name	= CYTTSP4_I2C_NAME,
 		.pm	= pm_ptr(&cyttsp4_pm_ops),
 	},
-	.probe_new	= cyttsp4_i2c_probe,
+	.probe		= cyttsp4_i2c_probe,
 	.remove		= cyttsp4_i2c_remove,
 	.id_table	= cyttsp4_i2c_id,
 };
diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 30102cb80fac..03470321eb91 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -891,7 +891,7 @@ static struct i2c_driver cyttsp5_i2c_driver = {
 		.name = CYTTSP5_NAME,
 		.of_match_table = cyttsp5_of_match,
 	},
-	.probe_new = cyttsp5_i2c_probe,
+	.probe = cyttsp5_i2c_probe,
 	.id_table = cyttsp5_i2c_id,
 };
 module_i2c_driver(cyttsp5_i2c_driver);
diff --git a/drivers/input/touchscreen/cyttsp_i2c.c b/drivers/input/touchscreen/cyttsp_i2c.c
index 3f91cb43ec82..127a8fda1da4 100644
--- a/drivers/input/touchscreen/cyttsp_i2c.c
+++ b/drivers/input/touchscreen/cyttsp_i2c.c
@@ -66,7 +66,7 @@ static struct i2c_driver cyttsp_i2c_driver = {
 		.pm	= pm_sleep_ptr(&cyttsp_pm_ops),
 		.of_match_table = cyttsp_of_i2c_match,
 	},
-	.probe_new	= cyttsp_i2c_probe,
+	.probe		= cyttsp_i2c_probe,
 	.id_table	= cyttsp_i2c_id,
 };
 
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 24ab9e9f5b21..7da749c36a89 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1510,7 +1510,7 @@ static struct i2c_driver edt_ft5x06_ts_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table = edt_ft5x06_ts_id,
-	.probe_new = edt_ft5x06_ts_probe,
+	.probe    = edt_ft5x06_ts_probe,
 	.remove   = edt_ft5x06_ts_remove,
 };
 
diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 56fa21688bdb..5e4167f6c63e 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -291,7 +291,7 @@ static struct i2c_driver eeti_ts_driver = {
 		.pm = pm_sleep_ptr(&eeti_ts_pm),
 		.of_match_table = of_match_ptr(of_eeti_ts_match),
 	},
-	.probe_new = eeti_ts_probe,
+	.probe = eeti_ts_probe,
 	.id_table = eeti_ts_id,
 };
 
diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 1a9805938e6d..a7f7e7308267 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -264,7 +264,7 @@ static struct i2c_driver egalax_ts_driver = {
 		.of_match_table	= egalax_ts_dt_ids,
 	},
 	.id_table	= egalax_ts_id,
-	.probe_new	= egalax_ts_probe,
+	.probe		= egalax_ts_probe,
 };
 
 module_i2c_driver(egalax_ts_driver);
diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
index e6f1e46d003d..fd8724a3c19f 100644
--- a/drivers/input/touchscreen/ektf2127.c
+++ b/drivers/input/touchscreen/ektf2127.c
@@ -351,7 +351,7 @@ static struct i2c_driver ektf2127_driver = {
 		.pm	= pm_sleep_ptr(&ektf2127_pm_ops),
 		.of_match_table = of_match_ptr(ektf2127_of_match),
 	},
-	.probe_new = ektf2127_probe,
+	.probe = ektf2127_probe,
 	.id_table = ektf2127_i2c_id,
 };
 module_i2c_driver(ektf2127_driver);
diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 8a16eb51481f..2da1db64126d 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1673,7 +1673,7 @@ MODULE_DEVICE_TABLE(of, elants_of_match);
 #endif
 
 static struct i2c_driver elants_i2c_driver = {
-	.probe_new = elants_i2c_probe,
+	.probe = elants_i2c_probe,
 	.id_table = elants_i2c_id,
 	.driver = {
 		.name = DEVICE_NAME,
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 69eae79e2087..4af4c1e5d0da 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -460,7 +460,7 @@ static struct i2c_driver exc3000_driver = {
 		.of_match_table = of_match_ptr(exc3000_of_match),
 	},
 	.id_table	= exc3000_id,
-	.probe_new	= exc3000_probe,
+	.probe		= exc3000_probe,
 };
 
 module_i2c_driver(exc3000_driver);
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index d77f116680a0..f5aa240739f9 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1544,7 +1544,7 @@ MODULE_DEVICE_TABLE(of, goodix_of_match);
 #endif
 
 static struct i2c_driver goodix_ts_driver = {
-	.probe_new = goodix_ts_probe,
+	.probe = goodix_ts_probe,
 	.remove = goodix_ts_remove,
 	.id_table = goodix_ts_id,
 	.driver = {
diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index 7c7020099b0f..404153338df7 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -1136,7 +1136,7 @@ static struct i2c_driver hideep_driver = {
 		.pm			= pm_sleep_ptr(&hideep_pm_ops),
 	},
 	.id_table	= hideep_i2c_id,
-	.probe_new	= hideep_probe,
+	.probe		= hideep_probe,
 };
 
 module_i2c_driver(hideep_driver);
diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index e96150d80a48..4f6609dcdef3 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -349,7 +349,7 @@ MODULE_DEVICE_TABLE(of, himax_of_match);
 #endif
 
 static struct i2c_driver himax_ts_driver = {
-	.probe_new = himax_probe,
+	.probe = himax_probe,
 	.id_table = himax_ts_id,
 	.driver = {
 		.name = "Himax-hx83112b-TS",
diff --git a/drivers/input/touchscreen/hycon-hy46xx.c b/drivers/input/touchscreen/hycon-hy46xx.c
index 8f4989aba9a4..2450cfa14de9 100644
--- a/drivers/input/touchscreen/hycon-hy46xx.c
+++ b/drivers/input/touchscreen/hycon-hy46xx.c
@@ -580,7 +580,7 @@ static struct i2c_driver hycon_hy46xx_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table = hycon_hy46xx_id,
-	.probe_new = hycon_hy46xx_probe,
+	.probe = hycon_hy46xx_probe,
 };
 
 module_i2c_driver(hycon_hy46xx_driver);
diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
index e86c85addb38..05946fee4fd4 100644
--- a/drivers/input/touchscreen/hynitron_cstxxx.c
+++ b/drivers/input/touchscreen/hynitron_cstxxx.c
@@ -488,7 +488,7 @@ static struct i2c_driver hynitron_i2c_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table = hyn_tpd_id,
-	.probe_new = hyn_probe,
+	.probe = hyn_probe,
 };
 
 module_i2c_driver(hynitron_i2c_driver);
diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 4897fafa4204..cf0d14062d70 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -1043,7 +1043,7 @@ static struct i2c_driver ili210x_ts_driver = {
 		.of_match_table = ili210x_dt_ids,
 	},
 	.id_table = ili210x_i2c_id,
-	.probe_new = ili210x_i2c_probe,
+	.probe = ili210x_i2c_probe,
 };
 
 module_i2c_driver(ili210x_ts_driver);
diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index d69809338498..2f872e95fbba 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -679,7 +679,7 @@ static struct i2c_driver ilitek_ts_i2c_driver = {
 		.of_match_table = of_match_ptr(ilitek_ts_i2c_match),
 		.acpi_match_table = ACPI_PTR(ilitekts_acpi_id),
 	},
-	.probe_new = ilitek_ts_i2c_probe,
+	.probe = ilitek_ts_i2c_probe,
 	.id_table = ilitek_ts_i2c_id,
 };
 module_i2c_driver(ilitek_ts_i2c_driver);
diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen/imagis.c
index de1b16e94bb8..07111ca24455 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -357,7 +357,7 @@ static struct i2c_driver imagis_ts_driver = {
 		.pm = pm_sleep_ptr(&imagis_pm_ops),
 		.of_match_table = of_match_ptr(imagis_of_match),
 	},
-	.probe_new = imagis_probe,
+	.probe = imagis_probe,
 };
 
 module_i2c_driver(imagis_ts_driver);
diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index c73e9c5c0077..0aa9d6492df8 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -1093,7 +1093,7 @@ static struct i2c_driver iqs5xx_i2c_driver = {
 		.pm		= pm_sleep_ptr(&iqs5xx_pm),
 	},
 	.id_table	= iqs5xx_id,
-	.probe_new	= iqs5xx_probe,
+	.probe		= iqs5xx_probe,
 };
 module_i2c_driver(iqs5xx_i2c_driver);
 
diff --git a/drivers/input/touchscreen/max11801_ts.c b/drivers/input/touchscreen/max11801_ts.c
index 461023fd6a09..8be6dade118c 100644
--- a/drivers/input/touchscreen/max11801_ts.c
+++ b/drivers/input/touchscreen/max11801_ts.c
@@ -230,7 +230,7 @@ static struct i2c_driver max11801_ts_driver = {
 		.of_match_table = max11801_ts_dt_ids,
 	},
 	.id_table	= max11801_ts_id,
-	.probe_new	= max11801_ts_probe,
+	.probe		= max11801_ts_probe,
 };
 
 module_i2c_driver(max11801_ts_driver);
diff --git a/drivers/input/touchscreen/mcs5000_ts.c b/drivers/input/touchscreen/mcs5000_ts.c
index 704e36087ca2..ac28019ba4c3 100644
--- a/drivers/input/touchscreen/mcs5000_ts.c
+++ b/drivers/input/touchscreen/mcs5000_ts.c
@@ -272,7 +272,7 @@ static const struct i2c_device_id mcs5000_ts_id[] = {
 MODULE_DEVICE_TABLE(i2c, mcs5000_ts_id);
 
 static struct i2c_driver mcs5000_ts_driver = {
-	.probe_new	= mcs5000_ts_probe,
+	.probe		= mcs5000_ts_probe,
 	.driver = {
 		.name = "mcs5000_ts",
 		.pm   = pm_sleep_ptr(&mcs5000_ts_pm),
diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 89b6020a9a61..32896e5085bd 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1591,7 +1591,7 @@ MODULE_DEVICE_TABLE(i2c, mip4_i2c_ids);
 
 static struct i2c_driver mip4_driver = {
 	.id_table = mip4_i2c_ids,
-	.probe_new = mip4_probe,
+	.probe = mip4_probe,
 	.driver = {
 		.name = MIP4_DEVICE_NAME,
 		.of_match_table = of_match_ptr(mip4_of_match),
diff --git a/drivers/input/touchscreen/migor_ts.c b/drivers/input/touchscreen/migor_ts.c
index 69fcc88d4f80..2384ea69a3f8 100644
--- a/drivers/input/touchscreen/migor_ts.c
+++ b/drivers/input/touchscreen/migor_ts.c
@@ -221,7 +221,7 @@ static struct i2c_driver migor_ts_driver = {
 		.name = "migor_ts",
 		.pm = pm_sleep_ptr(&migor_ts_pm),
 	},
-	.probe_new = migor_ts_probe,
+	.probe = migor_ts_probe,
 	.remove = migor_ts_remove,
 	.id_table = migor_ts_id,
 };
diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 4dbca1aad89d..ac12494c7930 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -638,7 +638,7 @@ static struct i2c_driver mms114_driver = {
 		.pm	= pm_sleep_ptr(&mms114_pm_ops),
 		.of_match_table = of_match_ptr(mms114_dt_match),
 	},
-	.probe_new	= mms114_probe,
+	.probe		= mms114_probe,
 	.id_table	= mms114_id,
 };
 
diff --git a/drivers/input/touchscreen/msg2638.c b/drivers/input/touchscreen/msg2638.c
index b23db689d995..a38af3fee34a 100644
--- a/drivers/input/touchscreen/msg2638.c
+++ b/drivers/input/touchscreen/msg2638.c
@@ -492,7 +492,7 @@ static const struct of_device_id msg2638_of_match[] = {
 MODULE_DEVICE_TABLE(of, msg2638_of_match);
 
 static struct i2c_driver msg2638_ts_driver = {
-	.probe_new = msg2638_ts_probe,
+	.probe = msg2638_ts_probe,
 	.driver = {
 		.name = "MStar-TS",
 		.pm = pm_sleep_ptr(&msg2638_pm_ops),
diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
index 3e551f9d31d7..7f7d879aac6d 100644
--- a/drivers/input/touchscreen/novatek-nvt-ts.c
+++ b/drivers/input/touchscreen/novatek-nvt-ts.c
@@ -290,7 +290,7 @@ static struct i2c_driver nvt_ts_driver = {
 		.name	= "novatek-nvt-ts",
 		.pm	= pm_sleep_ptr(&nvt_ts_pm_ops),
 	},
-	.probe_new = nvt_ts_probe,
+	.probe = nvt_ts_probe,
 	.id_table = nvt_ts_i2c_id,
 };
 
diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index f09f4831bad4..554e179c2e48 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -617,7 +617,7 @@ static struct i2c_driver pixcir_i2c_ts_driver = {
 		.pm	= pm_sleep_ptr(&pixcir_dev_pm_ops),
 		.of_match_table = of_match_ptr(pixcir_of_match),
 	},
-	.probe_new	= pixcir_i2c_ts_probe,
+	.probe		= pixcir_i2c_ts_probe,
 	.id_table	= pixcir_i2c_ts_id,
 };
 
diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 49a06d3876cf..76e7d62d5870 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -1273,7 +1273,7 @@ MODULE_DEVICE_TABLE(of, raydium_of_match);
 #endif
 
 static struct i2c_driver raydium_i2c_driver = {
-	.probe_new = raydium_i2c_probe,
+	.probe = raydium_i2c_probe,
 	.id_table = raydium_i2c_id,
 	.driver = {
 		.name = "raydium_ts",
diff --git a/drivers/input/touchscreen/rohm_bu21023.c b/drivers/input/touchscreen/rohm_bu21023.c
index 833422e5fd6d..240424f06b98 100644
--- a/drivers/input/touchscreen/rohm_bu21023.c
+++ b/drivers/input/touchscreen/rohm_bu21023.c
@@ -1183,7 +1183,7 @@ static struct i2c_driver rohm_bu21023_i2c_driver = {
 	.driver = {
 		.name = BU21023_NAME,
 	},
-	.probe_new = rohm_bu21023_i2c_probe,
+	.probe = rohm_bu21023_i2c_probe,
 	.id_table = rohm_bu21023_i2c_id,
 };
 module_i2c_driver(rohm_bu21023_i2c_driver);
diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
index 371cf4848ad5..998d99d18911 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761.c
@@ -538,7 +538,7 @@ static struct i2c_driver s6sy761_driver = {
 		.of_match_table = of_match_ptr(s6sy761_of_match),
 		.pm = pm_ptr(&s6sy761_pm_ops),
 	},
-	.probe_new = s6sy761_probe,
+	.probe = s6sy761_probe,
 	.remove = s6sy761_remove,
 	.id_table = s6sy761_id,
 };
diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index a37fac089010..9e28f962e059 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -826,7 +826,7 @@ MODULE_DEVICE_TABLE(of, silead_ts_of_match);
 #endif
 
 static struct i2c_driver silead_ts_driver = {
-	.probe_new = silead_ts_probe,
+	.probe = silead_ts_probe,
 	.id_table = silead_ts_id,
 	.driver = {
 		.name = SILEAD_TS_NAME,
diff --git a/drivers/input/touchscreen/sis_i2c.c b/drivers/input/touchscreen/sis_i2c.c
index 5a493b15b25d..426564d0fc39 100644
--- a/drivers/input/touchscreen/sis_i2c.c
+++ b/drivers/input/touchscreen/sis_i2c.c
@@ -393,7 +393,7 @@ static struct i2c_driver sis_ts_driver = {
 		.name	= SIS_I2C_NAME,
 		.of_match_table = of_match_ptr(sis_ts_dt_ids),
 	},
-	.probe_new	= sis_ts_probe,
+	.probe		= sis_ts_probe,
 	.id_table	= sis_ts_id,
 };
 module_i2c_driver(sis_ts_driver);
diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index f49566dc96f8..6475084aee1b 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -384,7 +384,7 @@ static const struct of_device_id st1232_ts_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, st1232_ts_dt_ids);
 
 static struct i2c_driver st1232_ts_driver = {
-	.probe_new	= st1232_ts_probe,
+	.probe		= st1232_ts_probe,
 	.id_table	= st1232_ts_id,
 	.driver = {
 		.name	= ST1232_TS_NAME,
diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index fdbf5e68943c..56e371fd88fa 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -808,7 +808,7 @@ static struct i2c_driver stmfts_driver = {
 		.pm = pm_ptr(&stmfts_pm_ops),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
-	.probe_new = stmfts_probe,
+	.probe = stmfts_probe,
 	.remove = stmfts_remove,
 	.id_table = stmfts_id,
 };
diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
index 52ae73035830..0293c493bc79 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -470,7 +470,7 @@ static struct i2c_driver sx8654_driver = {
 		.of_match_table = of_match_ptr(sx8654_of_match),
 	},
 	.id_table = sx8654_id_table,
-	.probe_new = sx8654_probe,
+	.probe = sx8654_probe,
 };
 module_i2c_driver(sx8654_driver);
 
diff --git a/drivers/input/touchscreen/tsc2004.c b/drivers/input/touchscreen/tsc2004.c
index 45f39eb20638..b5e904c5b7c4 100644
--- a/drivers/input/touchscreen/tsc2004.c
+++ b/drivers/input/touchscreen/tsc2004.c
@@ -68,7 +68,7 @@ static struct i2c_driver tsc2004_driver = {
 		.pm     = pm_sleep_ptr(&tsc200x_pm_ops),
 	},
 	.id_table       = tsc2004_idtable,
-	.probe_new      = tsc2004_probe,
+	.probe          = tsc2004_probe,
 	.remove         = tsc2004_remove,
 };
 module_i2c_driver(tsc2004_driver);
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 21916a30fb76..b3655250d4a7 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -418,7 +418,7 @@ static struct i2c_driver tsc2007_driver = {
 		.of_match_table = tsc2007_of_match,
 	},
 	.id_table	= tsc2007_idtable,
-	.probe_new	= tsc2007_probe,
+	.probe		= tsc2007_probe,
 };
 
 module_i2c_driver(tsc2007_driver);
diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index a145b9105255..f389f9c004a9 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -264,7 +264,7 @@ static struct i2c_driver wacom_i2c_driver = {
 		.pm	= pm_sleep_ptr(&wacom_i2c_pm),
 	},
 
-	.probe_new	= wacom_i2c_probe,
+	.probe		= wacom_i2c_probe,
 	.id_table	= wacom_i2c_id,
 };
 module_i2c_driver(wacom_i2c_driver);
diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 771962af3d0a..cbc4750c53f9 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1169,7 +1169,7 @@ static const struct acpi_device_id wdt87xx_acpi_id[] = {
 MODULE_DEVICE_TABLE(acpi, wdt87xx_acpi_id);
 
 static struct i2c_driver wdt87xx_driver = {
-	.probe_new	= wdt87xx_ts_probe,
+	.probe		= wdt87xx_ts_probe,
 	.id_table	= wdt87xx_dev_id,
 	.driver	= {
 		.name	= WDT87XX_NAME,
diff --git a/drivers/input/touchscreen/zet6223.c b/drivers/input/touchscreen/zet6223.c
index bfa0c637d569..1a034471f103 100644
--- a/drivers/input/touchscreen/zet6223.c
+++ b/drivers/input/touchscreen/zet6223.c
@@ -248,7 +248,7 @@ static struct i2c_driver zet6223_driver = {
 		.name = "zet6223",
 		.of_match_table = zet6223_of_match,
 	},
-	.probe_new = zet6223_probe,
+	.probe = zet6223_probe,
 	.id_table = zet6223_id
 };
 module_i2c_driver(zet6223_driver);
diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 76b194285e1c..5be5112845e1 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -944,7 +944,7 @@ static struct i2c_driver zforce_driver = {
 		.pm	= pm_sleep_ptr(&zforce_pm_ops),
 		.of_match_table	= of_match_ptr(zforce_dt_idtable),
 	},
-	.probe_new	= zforce_probe,
+	.probe		= zforce_probe,
 	.id_table	= zforce_idtable,
 };
 
diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index b6ece47151b8..1b4807ba4624 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -617,7 +617,7 @@ MODULE_DEVICE_TABLE(of, zinitix_of_match);
 #endif
 
 static struct i2c_driver zinitix_ts_driver = {
-	.probe_new = zinitix_ts_probe,
+	.probe = zinitix_ts_probe,
 	.driver = {
 		.name = "Zinitix-TS",
 		.pm = pm_sleep_ptr(&zinitix_pm_ops),

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

