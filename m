Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5431AE0CDC
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733018AbfJVT42 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:28 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35897 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbfJVT41 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so11304651pfr.3;
        Tue, 22 Oct 2019 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v2iQyZaNPZ/YhUqBuQfgPfyRrypQdi8sg7nD0u1rVjw=;
        b=M1X4k/4zlbz/KNGR2xwrXo2e0X8r9qgqfelrR2wI9PxQhTxb5GxVan0qNd2mY4Ytsz
         4HgPIDcQHFRgEe4qMB0C0nOZVSTAGZ3ofjKT7N9mlEFrUK6ZCodrucHaPdDY9BUU/geh
         CCXXunmcckQxe5LALtPrBXCdmwr8jFIL70+69XITWf/epEzZvlZ3AScCKhmFR4UpJgOJ
         ER2oGECPBHT2oZBiOgZjtwiE6m2JE8vQGMuE9BgcNuVK7a1Ix0OVXnwnF0OpnO5GIp5I
         4NCCRszgIlVoRGkeTVgNf30XZanxmkyT1WOPx2Z/roJ536/92Fwun6gL+8swaR5LkzGZ
         mCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v2iQyZaNPZ/YhUqBuQfgPfyRrypQdi8sg7nD0u1rVjw=;
        b=JeQL4VGAfdAsCwkut+5400QvvnqQCM2r3A8muvcdga+NB5f8yd6E6IPGtGyYLT9l9K
         HSDWmsT1dGH4HpBma3B2XH1oMyk3ZZaRC0JoyI1h+v1uV+UaX+uCXJhm63r7HzMtHkFK
         //eA/eSPre9mlmlzLCRRl9/RFeG/ur5z6ytYfMjj2f+K/V2+mBWhIcJYZEYXx8F1Wl6h
         +Rs1Us8JnwQy6UmIt3BGrirbxcttyHvrKR4IE1J+O5PASFgcYvxA+HRDO2vAm2x9yKNs
         Ae8B6+WSuTnqTwozK83rMSfTd3eO63NSvv1X/zHIDm8VtvdBSJKANqN9Q94VB3O1AlO6
         vj1w==
X-Gm-Message-State: APjAAAXlbhK+hes/TyU8/lTOMd4XizunS8T5Ft7B4fXzhFXBVkxuQ0sx
        2wIw2gqeWss6cijP1u6wVAU=
X-Google-Smtp-Source: APXvYqwS3goQM0aCfd+HgBD2kZYBRkYSiB++EnTHqzAOX2Ppu5jElBfDxxDkGFd6xy2kagX/+EXmCA==
X-Received: by 2002:aa7:8ac5:: with SMTP id b5mr6221397pfd.66.1571774186887;
        Tue, 22 Oct 2019 12:56:26 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:26 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] Input: st1232 - simplify parsing of read buffer
Date:   Tue, 22 Oct 2019 12:56:15 -0700
Message-Id: <20191022195622.66976-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Avoid complex 2-variable loop when parsing touchscreen data to make the
code clearer.

Acked-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/st1232.c | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 1139714e72e2..47033ef3749a 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -57,38 +57,38 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts)
 {
 	struct st1232_ts_finger *finger = ts->finger;
 	struct i2c_client *client = ts->client;
-	struct i2c_msg msg[2];
-	int error;
-	int i, y;
 	u8 start_reg = ts->chip_info->start_reg;
-	u8 *buf = ts->read_buf;
-
-	/* read touchscreen data */
-	msg[0].addr = client->addr;
-	msg[0].flags = 0;
-	msg[0].len = 1;
-	msg[0].buf = &start_reg;
-
-	msg[1].addr = ts->client->addr;
-	msg[1].flags = I2C_M_RD;
-	msg[1].len = ts->read_buf_len;
-	msg[1].buf = buf;
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.len	= sizeof(start_reg),
+			.buf	= &start_reg,
+		},
+		{
+			.addr	= client->addr,
+			.flags	= I2C_M_RD,
+			.len	= ts->read_buf_len,
+			.buf	= ts->read_buf,
+		}
+	};
+	int ret;
+	int i;
+	u8 *buf;
 
-	error = i2c_transfer(client->adapter, msg, 2);
-	if (error < 0)
-		return error;
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret != ARRAY_SIZE(msg))
+		return ret < 0 ? ret : -EIO;
 
-	for (i = 0, y = 0; i < ts->chip_info->max_fingers; i++, y += 3) {
-		finger[i].is_valid = buf[i + y] >> 7;
+	for (i = 0; i < ts->chip_info->max_fingers; i++) {
+		buf = &ts->read_buf[i * 4];
+		finger[i].is_valid = buf[0] >> 7;
 		if (finger[i].is_valid) {
-			finger[i].x = ((buf[i + y] & 0x0070) << 4) |
-					buf[i + y + 1];
-			finger[i].y = ((buf[i + y] & 0x0007) << 8) |
-					buf[i + y + 2];
+			finger[i].x = ((buf[0] & 0x70) << 4) | buf[1];
+			finger[i].y = ((buf[0] & 0x07) << 8) | buf[2];
 
 			/* st1232 includes a z-axis / touch strength */
 			if (ts->chip_info->have_z)
-				finger[i].t = buf[i + 6];
+				finger[i].t = ts->read_buf[i + 6];
 		}
 	}
 
-- 
2.23.0.866.gb869b98d4c-goog

