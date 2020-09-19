Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9182710B5
	for <lists+linux-input@lfdr.de>; Sat, 19 Sep 2020 23:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgISVtu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Sep 2020 17:49:50 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:5170 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbgISVtu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Sep 2020 17:49:50 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Bv4012VnPzHm;
        Sat, 19 Sep 2020 23:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1600551681; bh=3doK0FUutvkvWAsR9+JjynwPIbyNyVd+O7Di1WbQwyM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=puozsXpuo7xKpssaq0FGYBcxdO7aTszp1cIztgTJdzTmlGR1uMJV3//Ei8DC+bBEy
         LI1ZxzKvqOthkbAywHEinoTuA0s/FjED6sCzYGjjt+yfdesHPFJU5DoDBc979+jh8N
         VJ2fp8wILLw9RuUn1+hZkLeFaMDxhhgcu1r9NORWb6uNPIAy75SmL2GKyi1nevmhWv
         9qbna6WoElMtGtDRBX/Y00pS7plT0iVkdiYJvpn8kpdmRyOf5VitRwNG7Z/dLK2eec
         A1QIZH5XjYPwhvVVMR2bm6Vd6J5c9b9wmCNqiuqGWUQWMYjpfa5OyC8mFqN7ggGgIy
         c9hq/bLC48XGA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sat, 19 Sep 2020 23:41:21 +0200
Message-Id: <1d2d6d628c00a292a2fc230ab6f274fd22ad78e1.1600551334.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1600551334.git.mirq-linux@rere.qmqm.pl>
References: <cover.1600551334.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v7 1/4] input: elants: document some registers and values
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Harry Cutts <hcutts@chromium.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add information found in downstream kernels, to make the code less
magic.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 50c348297e38..d51cb910fba1 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -82,7 +82,7 @@
 
 #define HEADER_REPORT_10_FINGER	0x62
 
-/* Header (4 bytes) plus 3 fill 10-finger packets */
+/* Header (4 bytes) plus 3 full 10-finger packets */
 #define MAX_PACKET_SIZE		169
 
 #define BOOT_TIME_DELAY_MS	50
@@ -97,6 +97,10 @@
 #define E_INFO_PHY_SCAN		0xD7
 #define E_INFO_PHY_DRIVER	0xD8
 
+/* FW write command, 0x54 0x?? 0x0, 0x01 */
+#define E_POWER_STATE_SLEEP	0x50
+#define E_POWER_STATE_RESUME	0x58
+
 #define MAX_RETRIES		3
 #define MAX_FW_UPDATE_RETRIES	30
 
@@ -269,8 +273,8 @@ static int elants_i2c_calibrate(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	int ret, error;
-	static const u8 w_flashkey[] = { 0x54, 0xC0, 0xE1, 0x5A };
-	static const u8 rek[] = { 0x54, 0x29, 0x00, 0x01 };
+	static const u8 w_flashkey[] = { CMD_HEADER_WRITE, 0xC0, 0xE1, 0x5A };
+	static const u8 rek[] = { CMD_HEADER_WRITE, 0x29, 0x00, 0x01 };
 	static const u8 rek_resp[] = { CMD_HEADER_REK, 0x66, 0x66, 0x66 };
 
 	disable_irq(client->irq);
@@ -1388,7 +1392,9 @@ static int __maybe_unused elants_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elants_data *ts = i2c_get_clientdata(client);
-	const u8 set_sleep_cmd[] = { 0x54, 0x50, 0x00, 0x01 };
+	const u8 set_sleep_cmd[] = {
+		CMD_HEADER_WRITE, E_POWER_STATE_SLEEP, 0x00, 0x01
+	};
 	int retry_cnt;
 	int error;
 
@@ -1425,7 +1431,9 @@ static int __maybe_unused elants_i2c_resume(struct device *dev)
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

