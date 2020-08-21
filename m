Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17C024CAE7
	for <lists+linux-input@lfdr.de>; Fri, 21 Aug 2020 04:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgHUCkM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Aug 2020 22:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgHUCkK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Aug 2020 22:40:10 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5791EC061385
        for <linux-input@vger.kernel.org>; Thu, 20 Aug 2020 19:40:10 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e12so656813ybc.18
        for <linux-input@vger.kernel.org>; Thu, 20 Aug 2020 19:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6rVnCt2FiXUsIQwKt4IS0oDsX5R26yFSWMp0JwpugAM=;
        b=PrjjwNbLpjEcouLaubzzmkf1YoUpSYJ76d+sUzpngrlbCj38SsXmzSZuebI1R2YobP
         TWDUVkrxk/el+cRjo+a8ggnKQs5L3iY2t8IdcePzvS/wAbNoAhtyBoKgZPwuF2wS4kqK
         BbPdOrgmPhwN9H0WybWAD7NwdR90Tu1Z3u1RVhS+GcZiQXsXKjJCXKVIfPEm9Lnq04FI
         n3egQ2Yu/GJ9lV4tDZc9ARtnhszPrdzwyGnToVOf0dHD9ufI6W3IcpwpzjKVqsNWvVdU
         gJ4nZ4lKqx05goksC9oFH+DLrG0/vgFC5vQMUlMNQ5chsgQ1QldcqF4IxBb3TxJIxxZw
         r6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6rVnCt2FiXUsIQwKt4IS0oDsX5R26yFSWMp0JwpugAM=;
        b=QbV50oWXIFShETRTrQwxjsuH4KkWFQ15bKgaf1b03RmGnbvw/Qznw2P6810+RYrKZU
         e/h11vx/XZIew00FZfkAMJqLefVaQB262tGxrz+YJmgmnPUlWU0ma+MCOE+aqzT041Tb
         3SHBCRRiM5gS9ZyUP9lXfU0xUHB4wh2Pyagl68zHW6oWp5QIVck/nMtz5BAgAyzczyeU
         F4Kh1ObtHi6xvG4n8ox4t19RvzHKHn4jscseElWFIVCQqFCb5TUr26YkYI2QFqrhjvvm
         68EAeS6T+W3tzKn67H12ZdfwwAKx5rGCAJej9pEH+jAvKrpTM0q4FZkvpmN8zdVubvTB
         hiQg==
X-Gm-Message-State: AOAM532bDS4jRxXnusR4Q3J984xJ933E0k6QbgpF4gTE6IrlzTJcbFeM
        BLpDbcMv0g1mQ94+MPEMInc9jtMm3L+n
X-Google-Smtp-Source: ABdhPJymeydRCNhqTc9JDCu7EK2Zww/It0EmyhFBLUMikcKGejKs9CISdL7RwXxT2mg84ReiP2IdYUTP7HZ7
X-Received: from furquan.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:13a4])
 (user=furquan job=sendgmr) by 2002:a25:414:: with SMTP id 20mr967624ybe.97.1597977609596;
 Thu, 20 Aug 2020 19:40:09 -0700 (PDT)
Date:   Thu, 20 Aug 2020 19:40:06 -0700
In-Reply-To: <20200820224551.GX1665100@dtor-ws>
Message-Id: <20200821024006.3399663-1-furquan@google.com>
Mime-Version: 1.0
References: <20200820224551.GX1665100@dtor-ws>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2] drivers: input: Use single i2c_transfer transaction when
 using RM_CMD_BANK_SWITCH
From:   Furquan Shaikh <furquan@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        adurbin@google.com, Furquan Shaikh <furquan@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On an AMD chromebook, where the same I2C bus is shared by both Raydium
touchscreen and a trackpad device, it is observed that interleaving of
I2C messages when `raydium_i2c_read_message()` is called leads to the
Raydium touch IC reporting incorrect information. This is the sequence
that was observed to result in the above issue:

* I2C write to Raydium device for RM_CMD_BANK_SWITCH
* I2C write to trackpad device
* I2C read from trackpad device
* I2C write to Raydium device for setting address
* I2C read from Raydium device >>>> This provides incorrect
  information

This change adds a new helper function `raydium_i2c_xfer()` that
performs I2C transactions to the Raydium device. It uses the register
address to decide if RM_CMD_BANK_SWITCH header needs to be sent to the
device (i.e. if register address is greater than 255, then bank switch
header is sent before the rest of the transaction). Additionally, it
ensures that all the I2C operations performed as part of
`raydium_i2c_xfer()` are done as a single i2c_transfer. This
guarantees that no other transactions are initiated to any other
device on the same bus in between. Additionally,
`raydium_i2c_{send|read}*` functions are refactored to use this new
helper function.

Verified with the patch across multiple reboots (>100) that the
information reported by the Raydium  touchscreen device during probe
is correct.

Signed-off-by: Furquan Shaikh <furquan@google.com>

---
v2: Added a new helper function raydium_i2c_xfer so that all read and
send transfers are handled using the same path. This helper function
uses register address > 255 to decide whether to send
RM_CMD_BANK_SWITCH command. Additionally, __packed keyword is moved
to be placed after the structure defintion.

 drivers/input/touchscreen/raydium_i2c_ts.c | 132 +++++++++------------
 1 file changed, 58 insertions(+), 74 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index fe245439adee..261e4a290836 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -51,6 +51,7 @@
 
 /* Touch relative info */
 #define RM_MAX_RETRIES		3
+#define RM_RETRY_DELAY_MS	20
 #define RM_MAX_TOUCH_NUM	10
 #define RM_BOOT_DELAY_MS	100
 
@@ -136,114 +137,98 @@ struct raydium_data {
 	bool wake_irq_enabled;
 };
 
-static int raydium_i2c_send(struct i2c_client *client,
-			    u8 addr, const void *data, size_t len)
+static int raydium_i2c_xfer(struct i2c_client *client, u32 addr, void *data,
+				size_t len, bool is_read)
 {
-	u8 *buf;
-	int tries = 0;
-	int ret;
-
-	buf = kmalloc(len + 1, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	buf[0] = addr;
-	memcpy(buf + 1, data, len);
-
-	do {
-		ret = i2c_master_send(client, buf, len + 1);
-		if (likely(ret == len + 1))
-			break;
-
-		msleep(20);
-	} while (++tries < RM_MAX_RETRIES);
-
-	kfree(buf);
-
-	if (unlikely(ret != len + 1)) {
-		if (ret >= 0)
-			ret = -EIO;
-		dev_err(&client->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
-	}
+	struct raydium_bank_switch_header {
+		u8 cmd;
+		__be32 be_addr;
+	} __packed header = {
+		.cmd = RM_CMD_BANK_SWITCH,
+		.be_addr = cpu_to_be32(addr),
+	};
 
-	return 0;
-}
+	u8 reg_addr = addr & 0xff;
 
-static int raydium_i2c_read(struct i2c_client *client,
-			    u8 addr, void *data, size_t len)
-{
 	struct i2c_msg xfer[] = {
+		{
+			.addr = client->addr,
+			.len = sizeof(header),
+			.buf = (u8 *)&header,
+		},
 		{
 			.addr = client->addr,
 			.len = 1,
-			.buf = &addr,
+			.buf = &reg_addr,
 		},
 		{
 			.addr = client->addr,
-			.flags = I2C_M_RD,
 			.len = len,
 			.buf = data,
+			.flags = is_read ? I2C_M_RD : 0,
 		}
 	};
+
+	/*
+	 * If address is greater than 255, then RM_CMD_BANK_SWITCH needs to be
+	 * sent first. Else, skip the header i.e. xfer[0].
+	 */
+	int xfer_start_idx = (addr > 0xff) ? 0 : 1;
+	size_t xfer_count = ARRAY_SIZE(xfer) - xfer_start_idx;
 	int ret;
 
-	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
-	if (unlikely(ret != ARRAY_SIZE(xfer)))
-		return ret < 0 ? ret : -EIO;
+	ret = i2c_transfer(client->adapter, &xfer[xfer_start_idx], xfer_count);
+	if (likely(ret == xfer_count))
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
-static int raydium_i2c_read_message(struct i2c_client *client,
-				    u32 addr, void *data, size_t len)
+static int raydium_i2c_send(struct i2c_client *client, u32 addr,
+				const void *data, size_t len)
 {
-	__be32 be_addr;
+	int tries = 0;
+	int ret;
+
+	do {
+		ret = raydium_i2c_xfer(client, addr, (void *)data, len, false);
+		if (likely(ret == 0))
+			return 0;
+
+		msleep(RM_RETRY_DELAY_MS);
+	} while (++tries < RM_MAX_RETRIES);
+
+	dev_err(&client->dev, "%s failed\n", __func__);
+	return -EIO;
+}
+
+static int raydium_i2c_read(struct i2c_client *client, u32 addr, void *data,
+				size_t len)
+{
+	int ret;
 	size_t xfer_len;
-	int error;
 
 	while (len) {
 		xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
+		ret = raydium_i2c_xfer(client, addr, data, len, true);
 
-		be_addr = cpu_to_be32(addr);
-
-		error = raydium_i2c_send(client, RM_CMD_BANK_SWITCH,
-					 &be_addr, sizeof(be_addr));
-		if (!error)
-			error = raydium_i2c_read(client, addr & 0xff,
-						 data, xfer_len);
-		if (error)
-			return error;
+		if (unlikely(ret != 0))
+			return ret;
 
 		len -= xfer_len;
 		data += xfer_len;
 		addr += xfer_len;
 	}
-
 	return 0;
 }
 
-static int raydium_i2c_send_message(struct i2c_client *client,
-				    u32 addr, const void *data, size_t len)
-{
-	__be32 be_addr = cpu_to_be32(addr);
-	int error;
-
-	error = raydium_i2c_send(client, RM_CMD_BANK_SWITCH,
-				 &be_addr, sizeof(be_addr));
-	if (!error)
-		error = raydium_i2c_send(client, addr & 0xff, data, len);
-
-	return error;
-}
-
 static int raydium_i2c_sw_reset(struct i2c_client *client)
 {
 	const u8 soft_rst_cmd = 0x01;
 	int error;
 
-	error = raydium_i2c_send_message(client, RM_RESET_MSG_ADDR,
-					 &soft_rst_cmd, sizeof(soft_rst_cmd));
+	error = raydium_i2c_send(client, RM_RESET_MSG_ADDR, &soft_rst_cmd,
+					sizeof(soft_rst_cmd));
 	if (error) {
 		dev_err(&client->dev, "software reset failed: %d\n", error);
 		return error;
@@ -295,9 +280,8 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 		if (error)
 			continue;
 
-		error = raydium_i2c_read_message(client,
-						 le32_to_cpu(query_bank_addr),
-						 &ts->info, sizeof(ts->info));
+		error = raydium_i2c_read(client, le32_to_cpu(query_bank_addr),
+						&ts->info, sizeof(ts->info));
 		if (error)
 			continue;
 
@@ -834,7 +818,7 @@ static irqreturn_t raydium_i2c_irq(int irq, void *_dev)
 	if (ts->boot_mode != RAYDIUM_TS_MAIN)
 		goto out;
 
-	error = raydium_i2c_read_message(ts->client, ts->data_bank_addr,
+	error = raydium_i2c_read(ts->client, ts->data_bank_addr,
 					 ts->report_data, ts->pkg_size);
 	if (error)
 		goto out;
-- 
2.28.0.297.g1956fa8f8d-goog

