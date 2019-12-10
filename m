Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4364C117C49
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 01:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfLJATU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 19:19:20 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:6266 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727419AbfLJATT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 19:19:19 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47X0wr4mhKzF0;
        Tue, 10 Dec 2019 01:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575937004; bh=Ikv5AJJhaGvKrnyC7mUPeJgkvCtgUEaTu7zd0aqxlLs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=msWPI5rc1R7eQNJBVJ0y1ONhFeqLq+Ya6NMp7hIr5yAiJsFkrgU9gYzRw1xuiapYS
         tzMO95K78iAA3jfHVslGSD/mVll3mw1XsQZqKJUjQ4/yjGcQLUV9VTvfP67wJL5TyZ
         ZppSVKPEpBVeGvP6gBr6AdHK12k69dnNSAbB2JJ7C8sg5aoN2aF3SFDumWr+onq0O5
         528Cnu6+3VT1qYIP4Kz7bIqUDZiY3iP8AWrc9U7HIsxcICurop3ugvO/s01zUMa9Qz
         8qF5AsqDOXYVYRfx6ZpAAM8afAFCV2rAGhE0VQsVAPcfJFZ45bCG15kc5aGonoU69t
         hN6WbsuG4hmbg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 10 Dec 2019 01:19:17 +0100
Message-Id: <90aafcc8bac6335924df03610648418314a9dec6.1575936961.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/6] input: elants: document some registers and values
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add information found in downstream kernels, to make the code less
magic.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 29 +++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index d4ad24ea54c8..887888c53996 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -77,7 +77,11 @@
 
 #define HEADER_REPORT_10_FINGER	0x62
 
-/* Header (4 bytes) plus 3 fill 10-finger packets */
+/* Power state */
+#define PWR_STATE_DEEP_SLEEP	0
+#define PWR_STATE_NORMAL	1
+
+/* Header (4 bytes) plus 3 full 10-finger packets */
 #define MAX_PACKET_SIZE		169
 
 #define BOOT_TIME_DELAY_MS	50
@@ -87,10 +91,21 @@
 #define E_ELAN_INFO_BC_VER	0x10
 #define E_ELAN_INFO_TEST_VER	0xE0
 #define E_ELAN_INFO_FW_ID	0xF0
+#define E_POWER_MODE		0x40
+#define E_POWER_STATE		0x50
+#define E_INFO_X_RES		0x60
+#define E_INFO_Y_RES		0x63
 #define E_INFO_OSR		0xD6
 #define E_INFO_PHY_SCAN		0xD7
 #define E_INFO_PHY_DRIVER	0xD8
 
+/* FW write command, 0x54 0x?? 0x0, 0x01 */
+#define E_POWER_MODE_BATTERY	0x40
+#define E_POWER_MODE_AC		0x41
+#define E_POWER_MODE_USB	0x42
+#define E_POWER_STATE_SLEEP	0x50
+#define E_POWER_STATE_RESUME	0x58
+
 #define MAX_RETRIES		3
 #define MAX_FW_UPDATE_RETRIES	30
 
@@ -231,8 +246,8 @@ static int elants_i2c_calibrate(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	int ret, error;
-	static const u8 w_flashkey[] = { 0x54, 0xC0, 0xE1, 0x5A };
-	static const u8 rek[] = { 0x54, 0x29, 0x00, 0x01 };
+	static const u8 w_flashkey[] = { CMD_HEADER_WRITE, 0xC0, 0xE1, 0x5A };
+	static const u8 rek[] = { CMD_HEADER_WRITE, 0x29, 0x00, 0x01 };
 	static const u8 rek_resp[] = { CMD_HEADER_REK, 0x66, 0x66, 0x66 };
 
 	disable_irq(client->irq);
@@ -1295,7 +1310,9 @@ static int __maybe_unused elants_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elants_data *ts = i2c_get_clientdata(client);
-	const u8 set_sleep_cmd[] = { 0x54, 0x50, 0x00, 0x01 };
+	const u8 set_sleep_cmd[] = {
+		CMD_HEADER_WRITE, E_POWER_STATE_SLEEP, 0x00, 0x01
+	};
 	int retry_cnt;
 	int error;
 
@@ -1332,7 +1349,9 @@ static int __maybe_unused elants_i2c_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elants_data *ts = i2c_get_clientdata(client);
-	const u8 set_active_cmd[] = { 0x54, 0x58, 0x00, 0x01 };
+	const u8 set_active_cmd[] = {
+		CMD_HEADER_WRITE, E_POWER_STATE_RESUME, 0x00, 0x01
+	};
 	int retry_cnt;
 	int error;
 
-- 
2.20.1

