Return-Path: <linux-input+bounces-3654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFBB8C143C
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 19:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792D41F22204
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 17:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071B8537F2;
	Thu,  9 May 2024 17:44:08 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713DA71742
	for <linux-input@vger.kernel.org>; Thu,  9 May 2024 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715276647; cv=none; b=rVg679yM9HRsAd78ZKMi6fykRmzh3NKJQuBY9H4lMDDf8acFdRVQl6gdqkq1fsb4INKiRzUhJAZj8J2xBy6lO+Mo1USL3h4P9VnzKZa5TXc4P3UuyELgt+nL0HSieizHEAdWXDxLOBQWyCaAwHciUTQ6oIwna8Cmeb7ZE95mlxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715276647; c=relaxed/simple;
	bh=1tNbz1fXIu/iz8cjJkwdsrA7j4V0eedd2tC0DZFm1Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nm/4Z1hD7lzkI9o9TQgpvhmkQRKwtUrU4lhIf9S7/sE4S2JufoqQHOA8NeaeS4MGCWhUXcg7RhHCE71w+aehbGy7oy+S5e5mwfWdlML5v9+irvYuXMsqouOxR10kUMef5VNk4kuAEo7bSSWj7tWc7tRGWORCfrBDmGzlhar5xTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s57oI-0007Rx-O8; Thu, 09 May 2024 19:44:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s57oI-000Ujx-1z; Thu, 09 May 2024 19:44:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s57oH-001Q6V-3A;
	Thu, 09 May 2024 19:44:01 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] Input - Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Thu,  9 May 2024 19:41:59 +0200
Message-ID: <20240509174158.2211071-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=36069; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1tNbz1fXIu/iz8cjJkwdsrA7j4V0eedd2tC0DZFm1Uw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmPQrnc8d294SArzNjO00DcFDHuqtI6DeLNJwmb No9uAytKaKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZj0K5wAKCRCPgPtYfRL+ ThCuB/9B+jZ8tItTmfhABGDnCW6lNJIBeX1PypOyidS2d6z2BKo4Q8Q3pZqv1uHEkzSUfnQAN17 FhWMquvMgArxLPyD435oI/DKciNA5lkOURXSAqZbnc1bXjqN4dZS7jivq3Udq4NeDKN1p4JB2fl GQk16zuRM/nN/3bLwEr3sijeq+fz637GO+k47s3EZffGqy+BUyJc1If2kKsRWZQRZxd5ye8hXOf hIonGHyxp0LMNMjuTDHilO6Iilb++bCIK6KomM+djF2xs992f1tuanQaGjdUkdMqFsXAdSBwhlK Kjk2IFO31QS/ERJ1Om26SN5svexmCb3B2w7w8li75gob0P38
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While add it, also remove commas after the sentinel entries.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/joystick/as5011.c                 |  2 +-
 drivers/input/joystick/qwiic-joystick.c         |  4 ++--
 drivers/input/keyboard/adp5588-keys.c           |  4 ++--
 drivers/input/keyboard/cypress-sf.c             |  2 +-
 drivers/input/keyboard/dlink-dir685-touchkeys.c |  2 +-
 drivers/input/keyboard/lm8323.c                 |  2 +-
 drivers/input/keyboard/lm8333.c                 |  2 +-
 drivers/input/keyboard/max7359_keypad.c         |  2 +-
 drivers/input/keyboard/mpr121_touchkey.c        |  2 +-
 drivers/input/keyboard/qt1070.c                 |  4 ++--
 drivers/input/keyboard/qt2160.c                 |  2 +-
 drivers/input/keyboard/tm2-touchkey.c           |  4 ++--
 drivers/input/misc/ad714x-i2c.c                 | 10 +++++-----
 drivers/input/misc/adxl34x-i2c.c                |  2 +-
 drivers/input/misc/apanel.c                     |  2 +-
 drivers/input/misc/atmel_captouch.c             |  2 +-
 drivers/input/misc/bma150.c                     |  6 +++---
 drivers/input/misc/cma3000_d0x_i2c.c            |  4 ++--
 drivers/input/misc/drv260x.c                    |  2 +-
 drivers/input/misc/drv2665.c                    |  2 +-
 drivers/input/misc/drv2667.c                    |  2 +-
 drivers/input/misc/kxtj9.c                      |  4 ++--
 drivers/input/misc/mma8450.c                    |  4 ++--
 drivers/input/misc/pcf8574_keypad.c             |  2 +-
 drivers/input/mouse/cyapa.c                     |  4 ++--
 drivers/input/mouse/elan_i2c_core.c             |  4 ++--
 drivers/input/mouse/synaptics_i2c.c             |  4 ++--
 drivers/input/rmi4/rmi_i2c.c                    |  2 +-
 drivers/input/rmi4/rmi_smbus.c                  |  2 +-
 drivers/input/touchscreen/ad7879-i2c.c          |  4 ++--
 drivers/input/touchscreen/ar1021_i2c.c          |  4 ++--
 drivers/input/touchscreen/atmel_mxt_ts.c        | 10 +++++-----
 drivers/input/touchscreen/auo-pixcir-ts.c       |  2 +-
 drivers/input/touchscreen/bu21013_ts.c          |  2 +-
 drivers/input/touchscreen/bu21029_ts.c          |  2 +-
 drivers/input/touchscreen/cy8ctma140.c          |  2 +-
 drivers/input/touchscreen/cyttsp4_i2c.c         |  2 +-
 drivers/input/touchscreen/cyttsp5.c             |  2 +-
 drivers/input/touchscreen/cyttsp_i2c.c          |  2 +-
 drivers/input/touchscreen/eeti_ts.c             |  2 +-
 drivers/input/touchscreen/egalax_ts.c           |  2 +-
 drivers/input/touchscreen/ektf2127.c            |  4 ++--
 drivers/input/touchscreen/goodix.c              |  2 +-
 drivers/input/touchscreen/goodix_berlin_i2c.c   |  2 +-
 drivers/input/touchscreen/hideep.c              |  2 +-
 drivers/input/touchscreen/himax_hx83112b.c      |  2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c       |  4 ++--
 drivers/input/touchscreen/max11801_ts.c         |  2 +-
 drivers/input/touchscreen/mcs5000_ts.c          |  2 +-
 drivers/input/touchscreen/melfas_mip4.c         |  4 ++--
 drivers/input/touchscreen/migor_ts.c            |  2 +-
 drivers/input/touchscreen/mms114.c              |  2 +-
 drivers/input/touchscreen/raydium_i2c_ts.c      |  4 ++--
 drivers/input/touchscreen/rohm_bu21023.c        |  2 +-
 drivers/input/touchscreen/s6sy761.c             |  4 ++--
 drivers/input/touchscreen/silead.c              | 12 ++++++------
 drivers/input/touchscreen/sis_i2c.c             |  4 ++--
 drivers/input/touchscreen/stmfts.c              |  4 ++--
 drivers/input/touchscreen/tsc2004.c             |  2 +-
 drivers/input/touchscreen/tsc2007_core.c        |  2 +-
 drivers/input/touchscreen/wacom_i2c.c           |  4 ++--
 drivers/input/touchscreen/wdt87xx_i2c.c         |  2 +-
 drivers/input/touchscreen/zet6223.c             |  2 +-
 drivers/input/touchscreen/zforce_ts.c           |  2 +-
 64 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/drivers/input/joystick/as5011.c b/drivers/input/joystick/as5011.c
index f1822c19a289..407062bcc84b 100644
--- a/drivers/input/joystick/as5011.c
+++ b/drivers/input/joystick/as5011.c
@@ -337,7 +337,7 @@ static void as5011_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as5011_id[] = {
-	{ MODULE_DEVICE_ALIAS, 0 },
+	{ MODULE_DEVICE_ALIAS },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, as5011_id);
diff --git a/drivers/input/joystick/qwiic-joystick.c b/drivers/input/joystick/qwiic-joystick.c
index 7d88d76b14d6..6f989d00d3ec 100644
--- a/drivers/input/joystick/qwiic-joystick.c
+++ b/drivers/input/joystick/qwiic-joystick.c
@@ -126,8 +126,8 @@ MODULE_DEVICE_TABLE(of, of_qwiic_match);
 #endif /* CONFIG_OF */
 
 static const struct i2c_device_id qwiic_id_table[] = {
-	{ KBUILD_MODNAME, 0 },
-	{ },
+	{ KBUILD_MODNAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, qwiic_id_table);
 
diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 61e8e43e9c2b..1b0279393df4 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -832,8 +832,8 @@ static int adp5588_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(adp5588_dev_pm_ops, adp5588_suspend, adp5588_resume);
 
 static const struct i2c_device_id adp5588_id[] = {
-	{ "adp5588-keys", 0 },
-	{ "adp5587-keys", 0 },
+	{ "adp5588-keys" },
+	{ "adp5587-keys" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adp5588_id);
diff --git a/drivers/input/keyboard/cypress-sf.c b/drivers/input/keyboard/cypress-sf.c
index 2bacd9d80ecf..eb1d0720784d 100644
--- a/drivers/input/keyboard/cypress-sf.c
+++ b/drivers/input/keyboard/cypress-sf.c
@@ -209,7 +209,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(cypress_sf_pm_ops,
 				cypress_sf_suspend, cypress_sf_resume);
 
 static struct i2c_device_id cypress_sf_id_table[] = {
-	{ CYPRESS_SF_DEV_NAME, 0 },
+	{ CYPRESS_SF_DEV_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cypress_sf_id_table);
diff --git a/drivers/input/keyboard/dlink-dir685-touchkeys.c b/drivers/input/keyboard/dlink-dir685-touchkeys.c
index 6c065eff5a5a..993cdbda509e 100644
--- a/drivers/input/keyboard/dlink-dir685-touchkeys.c
+++ b/drivers/input/keyboard/dlink-dir685-touchkeys.c
@@ -127,7 +127,7 @@ static int dir685_tk_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dir685_tk_id[] = {
-	{ "dir685tk", 0 },
+	{ "dir685tk" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dir685_tk_id);
diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index 7bee93e9b0f5..cf67ba13477a 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -792,7 +792,7 @@ static int lm8323_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(lm8323_pm_ops, lm8323_suspend, lm8323_resume);
 
 static const struct i2c_device_id lm8323_id[] = {
-	{ "lm8323", 0 },
+	{ "lm8323" },
 	{ }
 };
 
diff --git a/drivers/input/keyboard/lm8333.c b/drivers/input/keyboard/lm8333.c
index 1c070c499c85..384baabf9924 100644
--- a/drivers/input/keyboard/lm8333.c
+++ b/drivers/input/keyboard/lm8333.c
@@ -194,7 +194,7 @@ static int lm8333_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm8333_id[] = {
-	{ "lm8333", 0 },
+	{ "lm8333" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm8333_id);
diff --git a/drivers/input/keyboard/max7359_keypad.c b/drivers/input/keyboard/max7359_keypad.c
index faab7691c219..c10726b5e4d1 100644
--- a/drivers/input/keyboard/max7359_keypad.c
+++ b/drivers/input/keyboard/max7359_keypad.c
@@ -270,7 +270,7 @@ static int max7359_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(max7359_pm, max7359_suspend, max7359_resume);
 
 static const struct i2c_device_id max7359_ids[] = {
-	{ "max7359", 0 },
+	{ "max7359" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max7359_ids);
diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index d434753afab1..21827d2497fa 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -369,7 +369,7 @@ static int mpr_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(mpr121_touchkey_pm_ops, mpr_suspend, mpr_resume);
 
 static const struct i2c_device_id mpr121_id[] = {
-	{ "mpr121_touchkey", 0 },
+	{ "mpr121_touchkey" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mpr121_id);
diff --git a/drivers/input/keyboard/qt1070.c b/drivers/input/keyboard/qt1070.c
index 9b093b042bf1..b3db2c7d0957 100644
--- a/drivers/input/keyboard/qt1070.c
+++ b/drivers/input/keyboard/qt1070.c
@@ -234,8 +234,8 @@ static int qt1070_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(qt1070_pm_ops, qt1070_suspend, qt1070_resume);
 
 static const struct i2c_device_id qt1070_id[] = {
-	{ "qt1070", 0 },
-	{ },
+	{ "qt1070" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, qt1070_id);
 
diff --git a/drivers/input/keyboard/qt2160.c b/drivers/input/keyboard/qt2160.c
index 7e3b09642ab7..53f5255fd19d 100644
--- a/drivers/input/keyboard/qt2160.c
+++ b/drivers/input/keyboard/qt2160.c
@@ -393,7 +393,7 @@ static int qt2160_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id qt2160_idtable[] = {
-	{ "qt2160", 0, },
+	{ "qt2160" },
 	{ }
 };
 
diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
index 0fd761ae052f..55d699d9037d 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -326,8 +326,8 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tm2_touchkey_pm_ops,
 				tm2_touchkey_suspend, tm2_touchkey_resume);
 
 static const struct i2c_device_id tm2_touchkey_id_table[] = {
-	{ TM2_TOUCHKEY_DEV_NAME, 0 },
-	{ },
+	{ TM2_TOUCHKEY_DEV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tm2_touchkey_id_table);
 
diff --git a/drivers/input/misc/ad714x-i2c.c b/drivers/input/misc/ad714x-i2c.c
index 679fcfea942c..2adb7a058362 100644
--- a/drivers/input/misc/ad714x-i2c.c
+++ b/drivers/input/misc/ad714x-i2c.c
@@ -72,11 +72,11 @@ static int ad714x_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad714x_id[] = {
-	{ "ad7142_captouch", 0 },
-	{ "ad7143_captouch", 0 },
-	{ "ad7147_captouch", 0 },
-	{ "ad7147a_captouch", 0 },
-	{ "ad7148_captouch", 0 },
+	{ "ad7142_captouch" },
+	{ "ad7143_captouch" },
+	{ "ad7147_captouch" },
+	{ "ad7147a_captouch" },
+	{ "ad7148_captouch" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad714x_id);
diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34x-i2c.c
index 6b880e282d99..d4014e367c77 100644
--- a/drivers/input/misc/adxl34x-i2c.c
+++ b/drivers/input/misc/adxl34x-i2c.c
@@ -106,7 +106,7 @@ static void adxl34x_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adxl34x_id[] = {
-	{ "adxl34x", 0 },
+	{ "adxl34x" },
 	{ }
 };
 
diff --git a/drivers/input/misc/apanel.c b/drivers/input/misc/apanel.c
index b5219bbe856d..d43aebd785b7 100644
--- a/drivers/input/misc/apanel.c
+++ b/drivers/input/misc/apanel.c
@@ -192,7 +192,7 @@ static void apanel_shutdown(struct i2c_client *client)
 }
 
 static const struct i2c_device_id apanel_id[] = {
-	{ "fujitsu_apanel", 0 },
+	{ "fujitsu_apanel" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, apanel_id);
diff --git a/drivers/input/misc/atmel_captouch.c b/drivers/input/misc/atmel_captouch.c
index b6a30044e814..f9744cf0ca80 100644
--- a/drivers/input/misc/atmel_captouch.c
+++ b/drivers/input/misc/atmel_captouch.c
@@ -257,7 +257,7 @@ static const struct of_device_id atmel_captouch_of_id[] = {
 MODULE_DEVICE_TABLE(of, atmel_captouch_of_id);
 
 static const struct i2c_device_id atmel_captouch_id[] = {
-	{ "atmel_captouch", 0 },
+	{ "atmel_captouch" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atmel_captouch_id);
diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index 0fb4cc628f29..4cc2a0dcaa75 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -536,9 +536,9 @@ static int __maybe_unused bma150_resume(struct device *dev)
 static UNIVERSAL_DEV_PM_OPS(bma150_pm, bma150_suspend, bma150_resume, NULL);
 
 static const struct i2c_device_id bma150_id[] = {
-	{ "bma150", 0 },
-	{ "smb380", 0 },
-	{ "bma023", 0 },
+	{ "bma150" },
+	{ "smb380" },
+	{ "bma023" },
 	{ }
 };
 
diff --git a/drivers/input/misc/cma3000_d0x_i2c.c b/drivers/input/misc/cma3000_d0x_i2c.c
index a4dfb3052dc0..f892c5b1e4bd 100644
--- a/drivers/input/misc/cma3000_d0x_i2c.c
+++ b/drivers/input/misc/cma3000_d0x_i2c.c
@@ -90,8 +90,8 @@ static const struct dev_pm_ops cma3000_i2c_pm_ops = {
 };
 
 static const struct i2c_device_id cma3000_i2c_id[] = {
-	{ "cma3000_d01", 0 },
-	{ },
+	{ "cma3000_d01" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cma3000_i2c_id);
diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 6717e3c9549b..61b503835aa6 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -600,7 +600,7 @@ static int drv260x_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(drv260x_pm_ops, drv260x_suspend, drv260x_resume);
 
 static const struct i2c_device_id drv260x_id[] = {
-	{ "drv2605l", 0 },
+	{ "drv2605l" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, drv260x_id);
diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index de27e6079d84..f98e4d765307 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -283,7 +283,7 @@ static int drv2665_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(drv2665_pm_ops, drv2665_suspend, drv2665_resume);
 
 static const struct i2c_device_id drv2665_id[] = {
-	{ "drv2665", 0 },
+	{ "drv2665" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, drv2665_id);
diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index 11c5855256e8..ad49845374b9 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -460,7 +460,7 @@ static int drv2667_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(drv2667_pm_ops, drv2667_suspend, drv2667_resume);
 
 static const struct i2c_device_id drv2667_id[] = {
-	{ "drv2667", 0 },
+	{ "drv2667" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, drv2667_id);
diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
index d47269b10e9a..837682cb2a7d 100644
--- a/drivers/input/misc/kxtj9.c
+++ b/drivers/input/misc/kxtj9.c
@@ -531,8 +531,8 @@ static int kxtj9_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(kxtj9_pm_ops, kxtj9_suspend, kxtj9_resume);
 
 static const struct i2c_device_id kxtj9_id[] = {
-	{ NAME, 0 },
-	{ },
+	{ NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, kxtj9_id);
diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
index 662b436d765b..08412239b8e6 100644
--- a/drivers/input/misc/mma8450.c
+++ b/drivers/input/misc/mma8450.c
@@ -186,8 +186,8 @@ static int mma8450_probe(struct i2c_client *c)
 }
 
 static const struct i2c_device_id mma8450_id[] = {
-	{ MMA8450_DRV_NAME, 0 },
-	{ },
+	{ MMA8450_DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mma8450_id);
 
diff --git a/drivers/input/misc/pcf8574_keypad.c b/drivers/input/misc/pcf8574_keypad.c
index 536cedeb38e6..3632cb206e34 100644
--- a/drivers/input/misc/pcf8574_keypad.c
+++ b/drivers/input/misc/pcf8574_keypad.c
@@ -189,7 +189,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(pcf8574_kp_pm_ops,
 				pcf8574_kp_suspend, pcf8574_kp_resume);
 
 static const struct i2c_device_id pcf8574_kp_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8574_kp_id);
diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 256f757a1326..2f2d925a55d7 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -1459,8 +1459,8 @@ static const struct dev_pm_ops cyapa_pm_ops = {
 };
 
 static const struct i2c_device_id cyapa_id_table[] = {
-	{ "cyapa", 0 },
-	{ },
+	{ "cyapa" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cyapa_id_table);
 
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 8a72c200ccb5..c2aec5c360b3 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1392,8 +1392,8 @@ static int elan_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(elan_pm_ops, elan_suspend, elan_resume);
 
 static const struct i2c_device_id elan_id[] = {
-	{ DRIVER_NAME, 0 },
-	{ },
+	{ DRIVER_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, elan_id);
 
diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
index af5cc64c622d..56e9ba396858 100644
--- a/drivers/input/mouse/synaptics_i2c.c
+++ b/drivers/input/mouse/synaptics_i2c.c
@@ -630,8 +630,8 @@ static DEFINE_SIMPLE_DEV_PM_OPS(synaptics_i2c_pm, synaptics_i2c_suspend,
 				synaptics_i2c_resume);
 
 static const struct i2c_device_id synaptics_i2c_id_table[] = {
-	{ "synaptics_i2c", 0 },
-	{ },
+	{ "synaptics_i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, synaptics_i2c_id_table);
 
diff --git a/drivers/input/rmi4/rmi_i2c.c b/drivers/input/rmi4/rmi_i2c.c
index 091d4e23b629..3c0c5fd44702 100644
--- a/drivers/input/rmi4/rmi_i2c.c
+++ b/drivers/input/rmi4/rmi_i2c.c
@@ -365,7 +365,7 @@ static const struct dev_pm_ops rmi_i2c_pm = {
 };
 
 static const struct i2c_device_id rmi_id[] = {
-	{ "rmi4_i2c", 0 },
+	{ "rmi4_i2c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rmi_id);
diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index b0b099b5528a..f3d0b40721df 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -413,7 +413,7 @@ static const struct dev_pm_ops rmi_smb_pm = {
 };
 
 static const struct i2c_device_id rmi_id[] = {
-	{ "rmi4_smbus", 0 },
+	{ "rmi4_smbus" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rmi_id);
diff --git a/drivers/input/touchscreen/ad7879-i2c.c b/drivers/input/touchscreen/ad7879-i2c.c
index 5c094ab74698..e5b99312c3d9 100644
--- a/drivers/input/touchscreen/ad7879-i2c.c
+++ b/drivers/input/touchscreen/ad7879-i2c.c
@@ -42,8 +42,8 @@ static int ad7879_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad7879_id[] = {
-	{ "ad7879", 0 },
-	{ "ad7889", 0 },
+	{ "ad7879" },
+	{ "ad7889" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad7879_id);
diff --git a/drivers/input/touchscreen/ar1021_i2c.c b/drivers/input/touchscreen/ar1021_i2c.c
index 64dfb749386f..8a588202447d 100644
--- a/drivers/input/touchscreen/ar1021_i2c.c
+++ b/drivers/input/touchscreen/ar1021_i2c.c
@@ -164,8 +164,8 @@ static DEFINE_SIMPLE_DEV_PM_OPS(ar1021_i2c_pm,
 				ar1021_i2c_suspend, ar1021_i2c_resume);
 
 static const struct i2c_device_id ar1021_i2c_id[] = {
-	{ "ar1021", 0 },
-	{ },
+	{ "ar1021" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ar1021_i2c_id);
 
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 542a31448c8f..8a606bd441ae 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3443,11 +3443,11 @@ MODULE_DEVICE_TABLE(acpi, mxt_acpi_id);
 #endif
 
 static const struct i2c_device_id mxt_id[] = {
-	{ "qt602240_ts", 0 },
-	{ "atmel_mxt_ts", 0 },
-	{ "atmel_mxt_tp", 0 },
-	{ "maxtouch", 0 },
-	{ "mXT224", 0 },
+	{ "qt602240_ts" },
+	{ "atmel_mxt_ts" },
+	{ "atmel_mxt_tp" },
+	{ "maxtouch" },
+	{ "mXT224" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mxt_id);
diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index 90c682e7407f..8db2a112a476 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -617,7 +617,7 @@ static int auo_pixcir_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id auo_pixcir_idtable[] = {
-	{ "auo_pixcir_ts", 0 },
+	{ "auo_pixcir_ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, auo_pixcir_idtable);
diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 652439a79e21..6baebb7ec089 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -597,7 +597,7 @@ static int bu21013_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(bu21013_dev_pm_ops, bu21013_suspend, bu21013_resume);
 
 static const struct i2c_device_id bu21013_id[] = {
-	{ DRIVER_TP, 0 },
+	{ DRIVER_TP },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bu21013_id);
diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index e1dfbd92ab64..686d0a6b1570 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -441,7 +441,7 @@ static int bu21029_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(bu21029_pm_ops, bu21029_suspend, bu21029_resume);
 
 static const struct i2c_device_id bu21029_ids[] = {
-	{ DRIVER_NAME, 0 },
+	{ DRIVER_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, bu21029_ids);
diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
index ea3895167b82..567c9dcaac91 100644
--- a/drivers/input/touchscreen/cy8ctma140.c
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -322,7 +322,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(cy8ctma140_pm,
 				cy8ctma140_suspend, cy8ctma140_resume);
 
 static const struct i2c_device_id cy8ctma140_idtable[] = {
-	{ CY8CTMA140_NAME, 0 },
+	{ CY8CTMA140_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, cy8ctma140_idtable);
diff --git a/drivers/input/touchscreen/cyttsp4_i2c.c b/drivers/input/touchscreen/cyttsp4_i2c.c
index 80a6890cd45a..da32c151def5 100644
--- a/drivers/input/touchscreen/cyttsp4_i2c.c
+++ b/drivers/input/touchscreen/cyttsp4_i2c.c
@@ -50,7 +50,7 @@ static void cyttsp4_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cyttsp4_i2c_id[] = {
-	{ CYTTSP4_I2C_NAME, 0 },
+	{ CYTTSP4_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cyttsp4_i2c_id);
diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 68527ede5c0e..3ca246ab192e 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -935,7 +935,7 @@ static const struct of_device_id cyttsp5_of_match[] = {
 MODULE_DEVICE_TABLE(of, cyttsp5_of_match);
 
 static const struct i2c_device_id cyttsp5_i2c_id[] = {
-	{ CYTTSP5_NAME, 0, },
+	{ CYTTSP5_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cyttsp5_i2c_id);
diff --git a/drivers/input/touchscreen/cyttsp_i2c.c b/drivers/input/touchscreen/cyttsp_i2c.c
index 127a8fda1da4..bf13b3448a6b 100644
--- a/drivers/input/touchscreen/cyttsp_i2c.c
+++ b/drivers/input/touchscreen/cyttsp_i2c.c
@@ -48,7 +48,7 @@ static int cyttsp_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cyttsp_i2c_id[] = {
-	{ CY_I2C_NAME, 0 },
+	{ CY_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cyttsp_i2c_id);
diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 5e4167f6c63e..48c69788b84a 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -273,7 +273,7 @@ static int eeti_ts_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(eeti_ts_pm, eeti_ts_suspend, eeti_ts_resume);
 
 static const struct i2c_device_id eeti_ts_id[] = {
-	{ "eeti_ts", 0 },
+	{ "eeti_ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, eeti_ts_id);
diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index a7f7e7308267..f4e950920e84 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -218,7 +218,7 @@ static int egalax_ts_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id egalax_ts_id[] = {
-	{ "egalax_ts", 0 },
+	{ "egalax_ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, egalax_ts_id);
diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
index cc3103b9cbfb..ab8159e1c99d 100644
--- a/drivers/input/touchscreen/ektf2127.c
+++ b/drivers/input/touchscreen/ektf2127.c
@@ -335,8 +335,8 @@ MODULE_DEVICE_TABLE(of, ektf2127_of_match);
 #endif
 
 static const struct i2c_device_id ektf2127_i2c_id[] = {
-	{ "ektf2127", 0 },
-	{ "ektf2132", 0 },
+	{ "ektf2127" },
+	{ "ektf2132" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ektf2127_i2c_id);
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index b068ff8afbc9..435714f18c23 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1510,7 +1510,7 @@ static int goodix_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(goodix_pm_ops, goodix_suspend, goodix_resume);
 
 static const struct i2c_device_id goodix_ts_id[] = {
-	{ "GDIX1001:00", 0 },
+	{ "GDIX1001:00" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
index 6ed9aa8088cb..2e7098078838 100644
--- a/drivers/input/touchscreen/goodix_berlin_i2c.c
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -47,7 +47,7 @@ static int goodix_berlin_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id goodix_berlin_i2c_id[] = {
-	{ "gt9916", 0 },
+	{ "gt9916" },
 	{ }
 };
 
diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index eae90676f4e5..682abbbe5bd6 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -1095,7 +1095,7 @@ static int hideep_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id hideep_i2c_id[] = {
-	{ HIDEEP_I2C_NAME, 0 },
+	{ HIDEEP_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, hideep_i2c_id);
diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 4f6609dcdef3..bafabd06dabc 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -335,7 +335,7 @@ static int himax_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(himax_pm_ops, himax_suspend, himax_resume);
 
 static const struct i2c_device_id himax_ts_id[] = {
-	{ "hx83112b", 0 },
+	{ "hx83112b" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, himax_ts_id);
diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index fc4e39b6651a..3eb762896345 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -634,8 +634,8 @@ static int ilitek_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(ilitek_pm_ops, ilitek_suspend, ilitek_resume);
 
 static const struct i2c_device_id ilitek_ts_i2c_id[] = {
-	{ ILITEK_TS_NAME, 0 },
-	{ },
+	{ ILITEK_TS_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ilitek_ts_i2c_id);
 
diff --git a/drivers/input/touchscreen/max11801_ts.c b/drivers/input/touchscreen/max11801_ts.c
index 8be6dade118c..f39633fc8dc2 100644
--- a/drivers/input/touchscreen/max11801_ts.c
+++ b/drivers/input/touchscreen/max11801_ts.c
@@ -213,7 +213,7 @@ static int max11801_ts_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max11801_ts_id[] = {
-	{"max11801", 0},
+	{ "max11801" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max11801_ts_id);
diff --git a/drivers/input/touchscreen/mcs5000_ts.c b/drivers/input/touchscreen/mcs5000_ts.c
index ac28019ba4c3..5aff8dcda0dc 100644
--- a/drivers/input/touchscreen/mcs5000_ts.c
+++ b/drivers/input/touchscreen/mcs5000_ts.c
@@ -266,7 +266,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(mcs5000_ts_pm,
 				mcs5000_ts_suspend, mcs5000_ts_resume);
 
 static const struct i2c_device_id mcs5000_ts_id[] = {
-	{ "mcs5000_ts", 0 },
+	{ "mcs5000_ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mcs5000_ts_id);
diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 78e1c63e530e..b99a0e3c4084 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1569,8 +1569,8 @@ MODULE_DEVICE_TABLE(acpi, mip4_acpi_match);
 #endif
 
 static const struct i2c_device_id mip4_i2c_ids[] = {
-	{ MIP4_DEVICE_NAME, 0 },
-	{ },
+	{ MIP4_DEVICE_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mip4_i2c_ids);
 
diff --git a/drivers/input/touchscreen/migor_ts.c b/drivers/input/touchscreen/migor_ts.c
index 2384ea69a3f8..7511a134e302 100644
--- a/drivers/input/touchscreen/migor_ts.c
+++ b/drivers/input/touchscreen/migor_ts.c
@@ -211,7 +211,7 @@ static int migor_ts_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(migor_ts_pm, migor_ts_suspend, migor_ts_resume);
 
 static const struct i2c_device_id migor_ts_id[] = {
-	{ "migor_ts", 0 },
+	{ "migor_ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, migor_ts_id);
diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index af233b6a16d9..9f947044c4d9 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -677,7 +677,7 @@ static int mms114_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(mms114_pm_ops, mms114_suspend, mms114_resume);
 
 static const struct i2c_device_id mms114_id[] = {
-	{ "mms114", 0 },
+	{ "mms114" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mms114_id);
diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 13c500e776f6..92d75057de2d 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -1227,8 +1227,8 @@ static DEFINE_SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,
 				raydium_i2c_suspend, raydium_i2c_resume);
 
 static const struct i2c_device_id raydium_i2c_id[] = {
-	{ "raydium_i2c", 0 },
-	{ "rm32380", 0 },
+	{ "raydium_i2c" },
+	{ "rm32380" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, raydium_i2c_id);
diff --git a/drivers/input/touchscreen/rohm_bu21023.c b/drivers/input/touchscreen/rohm_bu21023.c
index 4493ad0c9322..06fa3a19d266 100644
--- a/drivers/input/touchscreen/rohm_bu21023.c
+++ b/drivers/input/touchscreen/rohm_bu21023.c
@@ -1165,7 +1165,7 @@ static int rohm_bu21023_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rohm_bu21023_i2c_id[] = {
-	{ BU21023_NAME, 0 },
+	{ BU21023_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, rohm_bu21023_i2c_id);
diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
index 149cc2c4925e..a529217e748f 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761.c
@@ -520,8 +520,8 @@ MODULE_DEVICE_TABLE(of, s6sy761_of_match);
 #endif
 
 static const struct i2c_device_id s6sy761_id[] = {
-	{ "s6sy761", 0 },
-	{ },
+	{ "s6sy761" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s6sy761_id);
 
diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 62f562ad5026..bbd366dcb69a 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -785,12 +785,12 @@ static int silead_ts_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(silead_ts_pm, silead_ts_suspend, silead_ts_resume);
 
 static const struct i2c_device_id silead_ts_id[] = {
-	{ "gsl1680", 0 },
-	{ "gsl1688", 0 },
-	{ "gsl3670", 0 },
-	{ "gsl3675", 0 },
-	{ "gsl3692", 0 },
-	{ "mssl1680", 0 },
+	{ "gsl1680" },
+	{ "gsl1688" },
+	{ "gsl3670" },
+	{ "gsl3675" },
+	{ "gsl3692" },
+	{ "mssl1680" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, silead_ts_id);
diff --git a/drivers/input/touchscreen/sis_i2c.c b/drivers/input/touchscreen/sis_i2c.c
index ed56cb546f39..2023c6df416f 100644
--- a/drivers/input/touchscreen/sis_i2c.c
+++ b/drivers/input/touchscreen/sis_i2c.c
@@ -374,8 +374,8 @@ MODULE_DEVICE_TABLE(of, sis_ts_dt_ids);
 #endif
 
 static const struct i2c_device_id sis_ts_id[] = {
-	{ SIS_I2C_NAME,	0 },
-	{ "9200-ts",	0 },
+	{ SIS_I2C_NAME },
+	{ "9200-ts" },
 	{ /* sentinel */  }
 };
 MODULE_DEVICE_TABLE(i2c, sis_ts_id);
diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 85010fa07908..119cd26851cf 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -789,8 +789,8 @@ MODULE_DEVICE_TABLE(of, stmfts_of_match);
 #endif
 
 static const struct i2c_device_id stmfts_id[] = {
-	{ "stmfts", 0 },
-	{ },
+	{ "stmfts" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, stmfts_id);
 
diff --git a/drivers/input/touchscreen/tsc2004.c b/drivers/input/touchscreen/tsc2004.c
index 89c5248f66f6..b673098535ad 100644
--- a/drivers/input/touchscreen/tsc2004.c
+++ b/drivers/input/touchscreen/tsc2004.c
@@ -48,7 +48,7 @@ static void tsc2004_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tsc2004_idtable[] = {
-	{ "tsc2004", 0 },
+	{ "tsc2004" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tsc2004_idtable);
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index b3655250d4a7..8d832a372b89 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -400,7 +400,7 @@ static int tsc2007_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tsc2007_idtable[] = {
-	{ "tsc2007", 0 },
+	{ "tsc2007" },
 	{ }
 };
 
diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index f389f9c004a9..486230985bf0 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -253,8 +253,8 @@ static int wacom_i2c_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(wacom_i2c_pm, wacom_i2c_suspend, wacom_i2c_resume);
 
 static const struct i2c_device_id wacom_i2c_id[] = {
-	{ "WAC_I2C_EMR", 0 },
-	{ },
+	{ "WAC_I2C_EMR" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
 
diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 32c7be54434c..698fc7e0ee7f 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1148,7 +1148,7 @@ static int wdt87xx_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(wdt87xx_pm_ops, wdt87xx_suspend, wdt87xx_resume);
 
 static const struct i2c_device_id wdt87xx_dev_id[] = {
-	{ WDT87XX_NAME, 0 },
+	{ WDT87XX_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wdt87xx_dev_id);
diff --git a/drivers/input/touchscreen/zet6223.c b/drivers/input/touchscreen/zet6223.c
index 1a034471f103..70fe57fbbdbd 100644
--- a/drivers/input/touchscreen/zet6223.c
+++ b/drivers/input/touchscreen/zet6223.c
@@ -238,7 +238,7 @@ static const struct of_device_id zet6223_of_match[] = {
 MODULE_DEVICE_TABLE(of, zet6223_of_match);
 
 static const struct i2c_device_id zet6223_id[] = {
-	{ "zet6223", 0},
+	{ "zet6223" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, zet6223_id);
diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 5680075f0bb8..fdf2d1e770c8 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -923,7 +923,7 @@ static int zforce_probe(struct i2c_client *client)
 }
 
 static struct i2c_device_id zforce_idtable[] = {
-	{ "zforce-ts", 0 },
+	{ "zforce-ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, zforce_idtable);

base-commit: 704ba27ac55579704ba1289392448b0c66b56258
-- 
2.43.0


