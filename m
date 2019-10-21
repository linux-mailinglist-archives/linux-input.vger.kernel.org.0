Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E92CDDF3F0
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 19:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfJURNz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 13:13:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33262 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfJURNy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 13:13:54 -0400
Received: by mail-pg1-f193.google.com with SMTP id i76so8203744pgc.0;
        Mon, 21 Oct 2019 10:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fr8kACGN6fySPtvxuLKztrODPU5WAmzHqgszhCcrPhw=;
        b=lZRa18BdRZXw1hCTon3pl5U7dib/zzVQkq4D7itZkJskLytwjSVR76mvV/4GM4py8j
         7rM6ZvwrFgES98p7ZGipRuqlj1lRx6fZHuEBEDLq/mSUUrZp+h36t9zFN0ICOrYM3mzQ
         AKos16550AVPa4aoBiA9YMAGLIPOLwjk5iX/hTvmYxlcf1HZ0TrNPSdZuzhdLO3H7Qkj
         5gTAQIapgzO3oeDl6fxK7ZO0M0mqXaRtiARaEvO49Cu29JGxmARlDaiH/J7c119LzmyP
         zY3M4otrfl0SNs8cDnv9Py1Yihl8o0QOweVLdC82UCtZsHzn5QLS3TcHbh8sV0YQeEGT
         fKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fr8kACGN6fySPtvxuLKztrODPU5WAmzHqgszhCcrPhw=;
        b=Xg8dhiX27uIq7+ySTQkiGHRU/i78s1O8uzz3jUeQFz40PCZpp56Bm8Nel4hJd8WTl5
         Q4ORVTOhzVLHV8e/ifuzTRsxpQ9SAGbyFQ79bQLmd2RaKgzhuHG38hlH50mB0/knXywz
         744IgTurCH4WPwaRcipdmDrwDOTiiJC0HmnpypV03OBVy137dVvOB36beFyVWuK55Y8U
         se8TnXw1flfh2q6XW/5h1vJq5GzwHGwTurVozei8wMcjh2JX/6gnXmbc0nXyKbcCQ0UQ
         5msZEskLyGH0yyfqAxH9HKh54KZ94I/hGeXrTdmkoQI2yaQVc21HzDRAMKot5Fjf5CCf
         w0gg==
X-Gm-Message-State: APjAAAUqD9CW3AFFSNCQo8i41RQ+7GiyPS/TXwbZ771HUiXKTCmuh4WI
        SUCBrYl8Pqcy9WX3AorroR8=
X-Google-Smtp-Source: APXvYqxNnqDS42rf39Iu1oC/V8IK1fpr+At4FvxRSZnGGXewvLvKGT6RnqF6dgBe316zxgEc9ZO1fg==
X-Received: by 2002:a65:434c:: with SMTP id k12mr27378496pgq.141.1571678033805;
        Mon, 21 Oct 2019 10:13:53 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id w2sm7631378pgm.18.2019.10.21.10.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 10:13:52 -0700 (PDT)
Date:   Mon, 21 Oct 2019 10:13:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>, rydberg@bitmath.org,
        kuninori.morimoto.gx@renesas.com, robh@kernel.org,
        matthias.fend@wolfvision.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver:st1633: fixed multitouch incorrect coordinates
Message-ID: <20191021171350.GT35946@dtor-ws>
References: <1566209314-21767-1-git-send-email-dixitparmar19@gmail.com>
 <8cfedf751fc87f5f1c660cfda69d36ce@posteo.de>
 <20191020082919.GB3917@Dixit>
 <9de64de8-7581-808d-e930-315aca05687c@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de64de8-7581-808d-e930-315aca05687c@posteo.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 21, 2019 at 09:10:23AM +0200, Martin Kepplinger wrote:
> On 20.10.19 10:29, Dixit Parmar wrote:
> > Any review comments for this?
> > Or it should be merged?
> > 
> > Thanks.
> 
> My comment and tag is there. This fixes multitouch and should be merged.

Missed it earlier, sorry. I am applying it, but I wonder if we shoudl
not do the patch below as I find the version with 2 loop variables quite
confusing.

Thanks.

-- 
Dmitry

Input: st1232 - simplify parsing of read buffer

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/st1232.c |   50 ++++++++++++++++++------------------
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
 
