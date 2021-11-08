Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C38C44781D
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 02:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhKHA4e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 19:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237279AbhKHA4X (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Nov 2021 19:56:23 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1C5C061714
        for <linux-input@vger.kernel.org>; Sun,  7 Nov 2021 16:53:08 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2444A8379D;
        Mon,  8 Nov 2021 01:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636332784;
        bh=HvImjaGHo6zymceLROsIW/d86c3SjNa2efh7hXMaBgY=;
        h=From:To:Cc:Subject:Date:From;
        b=nQbWuhKguHrIkMnFlJHBz7OlKuNmWCJ+vUojJmXI4QlUbRDfIpHSr5XWmwB5llk7E
         5MH87MyhFdZWG/tnWZmDmBB6gMQF8aipP/lmE1IMPNUSXXGV37mhA2/wGEyaEysqqr
         F0+js7tDUX8O+eKPLg3Wcj6N2xlYa15lqRXLMxFHMHTHqDv2Wl0z9obbOO5YG1PTWB
         xOcLJXWCjedkTfq5j2BdWagWiwbGbBv2BA1Uqb7rLVv1/pKqPuzHyGyxSGT6maxHbo
         5VZzRwwQlKtWkhsg7k1X5Q3RUGxwnH8Js6oYDw58O8u++1t6SFYHmPmowWQCNPBgbX
         STBxNpKLhDGRA==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH] Input: ili210x - Special case ili251x sample read out
Date:   Mon,  8 Nov 2021 01:52:59 +0100
Message-Id: <20211108005259.480545-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ili251x touch controller needs 5ms delay between sending I2C device
address and register address, and, writing or reading register data.

According to downstream ili251x example code, this 5ms delay is not
required when reading touch samples out of the controller. Implement
such a special case.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
 drivers/input/touchscreen/ili210x.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index b2d9fe1e1c707..6dd5095be567f 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -225,15 +225,17 @@ static const struct ili2xxx_chip ili212x_chip = {
 	.has_calibrate_reg	= true,
 };
 
-static int ili251x_read_reg(struct i2c_client *client,
-			    u8 reg, void *buf, size_t len)
+static int ili251x_read_reg_common(struct i2c_client *client,
+				   u8 reg, void *buf, size_t len,
+				   unsigned int delay)
 {
 	int error;
 	int ret;
 
 	ret = i2c_master_send(client, &reg, 1);
 	if (ret == 1) {
-		usleep_range(5000, 5500);
+		if (delay)
+			usleep_range(delay, delay + 500);
 
 		ret = i2c_master_recv(client, buf, len);
 		if (ret == len)
@@ -245,12 +247,18 @@ static int ili251x_read_reg(struct i2c_client *client,
 	return ret;
 }
 
+static int ili251x_read_reg(struct i2c_client *client,
+			    u8 reg, void *buf, size_t len)
+{
+	return ili251x_read_reg_common(client, reg, buf, len, 5000);
+}
+
 static int ili251x_read_touch_data(struct i2c_client *client, u8 *data)
 {
 	int error;
 
-	error = ili251x_read_reg(client, REG_TOUCHDATA,
-				 data, ILI251X_DATA_SIZE1);
+	error = ili251x_read_reg_common(client, REG_TOUCHDATA,
+					data, ILI251X_DATA_SIZE1, 0);
 	if (!error && data[0] == 2) {
 		error = i2c_master_recv(client, data + ILI251X_DATA_SIZE1,
 					ILI251X_DATA_SIZE2);
-- 
2.33.0

