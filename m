Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCA32CF86F
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 02:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731295AbgLEBA0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 20:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731294AbgLEBA0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 20:00:26 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4FAC061A4F
        for <linux-input@vger.kernel.org>; Fri,  4 Dec 2020 16:59:45 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id h189so6943950qke.19
        for <linux-input@vger.kernel.org>; Fri, 04 Dec 2020 16:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=Pm8syhfGiv4iiicEYPxhpPRu6lRKP+oBUveOWCh0Kxc=;
        b=TDVfs/dB0T/gJJqhAUgXH4OubDmuhWhpQbsr2+5uqV8bzpoIAvQl9ZOh9du31NTEoj
         33RU2NuVwDMl6v9JGbx5HpTL6t7PjfXE5QufkABHXEa3l5qLG5IlaCm5kWVyR3I4Wi0U
         9Q5eobaD5OK4LALEF6pRNWW6pRFCz0KWFjZXr8Ry9g3JTyweTbSOqYxPxWakCYNmfPmZ
         VAatQmVGoqbUr267yhwu169XDPY2bes4YqN0U09l9UjYT7TevruAUVwB17iZojpL8P3e
         bTx4Tc74MIvXaka845Hmpx1cJ+ej0VpZxgJwcgg+Y2TH/4vF6MCLrGZqavQTZafouuAp
         HEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Pm8syhfGiv4iiicEYPxhpPRu6lRKP+oBUveOWCh0Kxc=;
        b=WshmBXoa3xjPUTaYIB45okgog/nVzTas2txbJxw3RppoAnk4suadRDdVwuOHx4ADsS
         dlH26WV2lcNUZHIogoOgrH1RXulG6x1aeBKKGii6revQ4JXlhgAmcdejZw2Q/1wOWBxy
         RmnXKyF696VXhVVL+y8TTsERmLtX5ixNE1/Zo5vKXWO4+O1yMPC4/HccXye1waLcUC+j
         +/u6mOsRLzaKgqI4V2S73wlY4MSuxlZzQsRG1d9zIcjKYwNQocMoupZONa1wwcngnb8P
         4woL9C7I5eS5oH6g2lTZMsGPjuSDbTU40STWnLcgU3UGAX3pKXHO5uL+nu4z0rzxuYMp
         rmsQ==
X-Gm-Message-State: AOAM5334gCL7NqVtMs3f8IYmlFMu0ayaLUGCxu5oL2fiBrJM5qBHvLtD
        Ku3MjU8clfMD8WSFLIvYU4aJ+hJl+DEY
X-Google-Smtp-Source: ABdhPJzrFFb6XIWUXNQHQv8FFOAGDuk4ZRVPla3ARIEd0aVgg7RjNFvvqAvS8ubMDtKCzmIpf9Ny0M+dnMav
Sender: "furquan via sendgmr" <furquan@furquan.mtv.corp.google.com>
X-Received: from furquan.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:13a4])
 (user=furquan job=sendgmr) by 2002:a0c:e9c7:: with SMTP id
 q7mr8757037qvo.9.1607129984904; Fri, 04 Dec 2020 16:59:44 -0800 (PST)
Date:   Fri,  4 Dec 2020 16:59:41 -0800
In-Reply-To: <CAEGmHFFuJHNpXOjzmBZ0Sjgsz-x19QFdSuns2v_uMFQyPQis=g@mail.gmail.com>
Message-Id: <20201205005941.1427643-1-furquan@google.com>
Mime-Version: 1.0
References: <CAEGmHFFuJHNpXOjzmBZ0Sjgsz-x19QFdSuns2v_uMFQyPQis=g@mail.gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v2] input: raydium_ts_i2c: Do not split tx transactions
From:   Furquan Shaikh <furquan@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Furquan Shaikh <furquan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Raydium device does not like splitting of tx transactions into
multiple messages - one for the register address and one for the
actual data. This results in incorrect behavior on the device side.

This change updates raydium_i2c_read and raydium_i2c_write to create
i2c_msg arrays separately and passes those arrays into
raydium_i2c_xfer which decides based on the address whether the bank
switch command should be sent. The bank switch header is still added
by raydium_i2c_read and raydium_i2c_write to ensure that all these
operations are performed as part of a single I2C transfer. It
guarantees that no other transactions are initiated to any other
device on the same bus after the bank switch command is sent.

Signed-off-by: Furquan Shaikh <furquan@google.com>
---
v2: Added comment in raydium_i2c_{send|read} about why regmap infrastructure
cannot be used for this driver as it splits bank switch and i2c read/write
into separate i2c_transfer calls which is known to create problems with
Raydium device.

 drivers/input/touchscreen/raydium_i2c_ts.c | 126 ++++++++++++++-------
 1 file changed, 88 insertions(+), 38 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index e694a9b2b1e5..603a948460d6 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -137,45 +137,25 @@ struct raydium_data {
 	bool wake_irq_enabled;
 };
 
-static int raydium_i2c_xfer(struct i2c_client *client,
-			    u32 addr, void *data, size_t len, bool is_read)
-{
-	struct raydium_bank_switch_header {
-		u8 cmd;
-		__be32 be_addr;
-	} __packed header = {
-		.cmd = RM_CMD_BANK_SWITCH,
-		.be_addr = cpu_to_be32(addr),
-	};
-
-	u8 reg_addr = addr & 0xff;
-
-	struct i2c_msg xfer[] = {
-		{
-			.addr = client->addr,
-			.len = sizeof(header),
-			.buf = (u8 *)&header,
-		},
-		{
-			.addr = client->addr,
-			.len = 1,
-			.buf = &reg_addr,
-		},
-		{
-			.addr = client->addr,
-			.len = len,
-			.buf = data,
-			.flags = is_read ? I2C_M_RD : 0,
-		}
-	};
+/*
+ * Header to be sent for RM_CMD_BANK_SWITCH command. This is used by
+ * raydium_i2c_{read|send} below.
+ */
+struct __packed raydium_bank_switch_header {
+	u8 cmd;
+	__be32 be_addr;
+};
 
+static int raydium_i2c_xfer(struct i2c_client *client, u32 addr,
+			    struct i2c_msg *xfer, size_t xfer_count)
+{
+	int ret;
 	/*
 	 * If address is greater than 255, then RM_CMD_BANK_SWITCH needs to be
 	 * sent first. Else, skip the header i.e. xfer[0].
 	 */
 	int xfer_start_idx = (addr > 0xff) ? 0 : 1;
-	size_t xfer_count = ARRAY_SIZE(xfer) - xfer_start_idx;
-	int ret;
+	xfer_count -= xfer_start_idx;
 
 	ret = i2c_transfer(client->adapter, &xfer[xfer_start_idx], xfer_count);
 	if (likely(ret == xfer_count))
@@ -189,10 +169,46 @@ static int raydium_i2c_send(struct i2c_client *client,
 {
 	int tries = 0;
 	int error;
+	u8 *tx_buf;
+	u8 reg_addr = addr & 0xff;
+
+	tx_buf = kmalloc(len + 1, GFP_KERNEL);
+	if (!tx_buf)
+		return -ENOMEM;
+
+	tx_buf[0] = reg_addr;
+	memcpy(tx_buf + 1, data, len);
 
 	do {
-		error = raydium_i2c_xfer(client, addr, (void *)data, len,
-					 false);
+		struct raydium_bank_switch_header header = {
+			.cmd = RM_CMD_BANK_SWITCH,
+			.be_addr = cpu_to_be32(addr),
+		};
+
+		/*
+		 * Perform as a single i2c_transfer transaction to ensure that
+		 * no other I2C transactions are initiated on the bus to any
+		 * other device in between. Initiating transacations to other
+		 * devices after RM_CMD_BANK_SWITCH is sent is known to cause
+		 * issues. This is also why regmap infrastructure cannot be used
+		 * for this driver. Regmap handles page(bank) switch and reads
+		 * as separate i2c_transfer() operations. This can result in
+		 * problems if the Raydium device is on a shared I2C bus.
+		 */
+		struct i2c_msg xfer[] = {
+			{
+				.addr = client->addr,
+				.len = sizeof(header),
+				.buf = (u8 *)&header,
+			},
+			{
+				.addr = client->addr,
+				.len = len + 1,
+				.buf = tx_buf,
+			},
+		};
+
+		error = raydium_i2c_xfer(client, addr, xfer, ARRAY_SIZE(xfer));
 		if (likely(!error))
 			return 0;
 
@@ -206,12 +222,46 @@ static int raydium_i2c_send(struct i2c_client *client,
 static int raydium_i2c_read(struct i2c_client *client,
 			    u32 addr, void *data, size_t len)
 {
-	size_t xfer_len;
 	int error;
 
 	while (len) {
-		xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
-		error = raydium_i2c_xfer(client, addr, data, xfer_len, true);
+		u8 reg_addr = addr & 0xff;
+		struct raydium_bank_switch_header header = {
+			.cmd = RM_CMD_BANK_SWITCH,
+			.be_addr = cpu_to_be32(addr),
+		};
+		size_t xfer_len = min_t(size_t, len, RM_MAX_READ_SIZE);
+
+		/*
+		 * Perform as a single i2c_transfer transaction to ensure that
+		 * no other I2C transactions are initiated on the bus to any
+		 * other device in between. Initiating transacations to other
+		 * devices after RM_CMD_BANK_SWITCH is sent is known to cause
+		 * issues. This is also why regmap infrastructure cannot be used
+		 * for this driver. Regmap handles page(bank) switch and writes
+		 * as separate i2c_transfer() operations. This can result in
+		 * problems if the Raydium device is on a shared I2C bus.
+		 */
+		struct i2c_msg xfer[] = {
+			{
+				.addr = client->addr,
+				.len = sizeof(header),
+				.buf = (u8 *)&header,
+			},
+			{
+				.addr = client->addr,
+				.len = 1,
+				.buf = &reg_addr,
+			},
+			{
+				.addr = client->addr,
+				.len = xfer_len,
+				.buf = data,
+				.flags = I2C_M_RD,
+			}
+		};
+
+		error = raydium_i2c_xfer(client, addr, xfer, ARRAY_SIZE(xfer));
 		if (unlikely(error))
 			return error;
 
-- 
2.29.2.576.ga3fc446d84-goog

