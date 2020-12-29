Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9BC2E7245
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 17:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgL2Q0r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 11:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgL2Q0r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 11:26:47 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77723C061798
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 08:26:06 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id AGS4240084C55Sk01GS4Co; Tue, 29 Dec 2020 17:26:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHox-0014bE-Cg; Tue, 29 Dec 2020 17:26:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHow-0092Vz-MW; Tue, 29 Dec 2020 17:26:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrej Valek <andrej.valek@siemens.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] Input: st1232 - do not read more bytes than needed
Date:   Tue, 29 Dec 2020 17:26:00 +0100
Message-Id: <20201229162601.2154566-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201229162601.2154566-1-geert+renesas@glider.be>
References: <20201229162601.2154566-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

st1232_ts_read_data() already reads ts->read_buf_len bytes (8 or 20
bytes) from the touchscreen controller.  This was fine when it was used
to read touch point coordinates only, but is overkill for reading the
touchscreen resolution, which just needs 3 bytes.

Optimize transfers by passing the wanted number of bytes.

Fixes: 3a54a215410b1650 ("Input: st1232 - add support resolution reading")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/touchscreen/st1232.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index f18d4c7e03da17c6..459701056f2bda96 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -47,7 +47,8 @@ struct st1232_ts_data {
 	u8 *read_buf;
 };
 
-static int st1232_ts_read_data(struct st1232_ts_data *ts, u8 reg)
+static int st1232_ts_read_data(struct st1232_ts_data *ts, u8 reg,
+			       unsigned int n)
 {
 	struct i2c_client *client = ts->client;
 	struct i2c_msg msg[] = {
@@ -59,7 +60,7 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts, u8 reg)
 		{
 			.addr	= client->addr,
 			.flags	= I2C_M_RD | I2C_M_DMA_SAFE,
-			.len	= ts->read_buf_len,
+			.len	= n,
 			.buf	= ts->read_buf,
 		}
 	};
@@ -79,7 +80,7 @@ static int st1232_ts_read_resolution(struct st1232_ts_data *ts, u16 *max_x,
 	int error;
 
 	/* select resolution register */
-	error = st1232_ts_read_data(ts, REG_XY_RESOLUTION);
+	error = st1232_ts_read_data(ts, REG_XY_RESOLUTION, 3);
 	if (error)
 		return error;
 
@@ -140,7 +141,7 @@ static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 	int count;
 	int error;
 
-	error = st1232_ts_read_data(ts, REG_XY_COORDINATES);
+	error = st1232_ts_read_data(ts, REG_XY_COORDINATES, ts->read_buf_len);
 	if (error)
 		goto out;
 
-- 
2.25.1

