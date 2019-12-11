Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9141211B6ED
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 17:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388798AbfLKQDY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 11:03:24 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:37834 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730957AbfLKQDY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 11:03:24 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Y1td2hxmzW9;
        Wed, 11 Dec 2019 17:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576080201; bh=Ikv5AJJhaGvKrnyC7mUPeJgkvCtgUEaTu7zd0aqxlLs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Jubjc+TYmgIGzoOJa8ZjH7Tph9hGlFcnMmu3I4CN8muzcVDBbuidTBk4IfBDSlI48
         gEA3UJvTvi1aX2iu4Qyo/cBrlic5YPja3g+Ot43vrB7wJr76xz+HxVJRTQ/9lB1ulo
         rRfbFrsHkyY2lTnnJ9x233mMMHh/k1z9f+72hEe481UlGW7ueX6KwzYlhotJ9V4uG/
         RNo+j4JLZmMJrIa89Q6ImPvYuA5NOjsf2XgVaasM+eK2JdtuqaRzdTZ/HXsPzFbCd4
         8l8RfqusnrxgYtpOmUPeU/YmpLGZQGFb23F//3Yo6HsZscf6dW6+Kjf2FdxeZFfDbx
         1lb7zBqYaGgvA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 17:03:21 +0100
Message-Id: <82f3e18f260a3f372944401d12f8f92bd64bc9d2.1576079249.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 1/9] input: elants: document some registers and values
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
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

