Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D80F2C975E
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 07:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgLAGBf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 01:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725918AbgLAGBf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 01:01:35 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287BBC0613CF
        for <linux-input@vger.kernel.org>; Mon, 30 Nov 2020 22:00:55 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id r4so1099794ybs.1
        for <linux-input@vger.kernel.org>; Mon, 30 Nov 2020 22:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=BXjmZ1sOwVvPO8ExUuMoZV+zGQg9arf+EXCDwTRHuko=;
        b=E6zHA3wLXar2YcIt1Ch+JhfmbvesOH/4+qlCbyxw3JlCPKSlLjWrx9P+IELhyOsg6Q
         XCIv0WtBd0w/cKYKVThJmyAXU7C3riXuic0YCfOVJL1su0tq+33xaEdfEyuzAby/W3aU
         ftUZCG/zW3nX+apfTWK0L9Pj+9GD5arv/jSpvrh+YWcXCf/SIIOywUbJG6Mx311uzNc2
         th+AwoNMum0HpEw2h5daw+SVsZ+sMPi/Zp3Y/EIwsJtR2bJf6aXR2hZ5OcbhxwlzAFV7
         0pHyxevGkdEtaSwerY1KvRyjFzr/yzNwc61v6krTVZeyi8Clt40VoTOW43brp3b43Cm3
         6sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=BXjmZ1sOwVvPO8ExUuMoZV+zGQg9arf+EXCDwTRHuko=;
        b=Ynqc7tBQdxFE7gzkrde5k3RP4XfuEaKIYObwVqFXzkJcBB8XqtTNks+TMlg/Bj3boQ
         dtwwAL1GRizls65PIzzytDp1m5hFFwUfLdPFkHAPeSdqmcocKDCr0eCR7KrNfEf6qDTY
         40+tgtD3xG1XSi1THrSdnOWNqcSikVia0vDbOtVzRHwLf1egYwWTA+3xp11oMD7Qbsgb
         s5t7QaxvE/SfE7LtdgYKj0uN4vye3ATSnDIJ9kD4/BJwHrKPikaLV4JqtDNi0mzgPdB2
         iSR2iURkWJ7ig4PtIC2TZNadLzzYvU8OVM2N0dAJJRjjzWscnUZCou85AIKSp5Gje+EJ
         nVFg==
X-Gm-Message-State: AOAM531BBTqgcPrTxxSZs4IbQCl0Ctshu86jl5cvzJMGJ624DBT1DgHK
        axhhB4Ia0eqOZSMsEJngJ8Rxlg7DVlTD
X-Google-Smtp-Source: ABdhPJzWcXtzYl8QF7TpX00GV5xEh9A/0dTa3AeOcRBE/+7NNC4r0q4+QJ+OlNzjEI9MHQBTrCHnIh+CjSqa
Sender: "furquan via sendgmr" <furquan@furquan.mtv.corp.google.com>
X-Received: from furquan.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:13a4])
 (user=furquan job=sendgmr) by 2002:a25:2e4e:: with SMTP id
 b14mr1389084ybn.259.1606802454260; Mon, 30 Nov 2020 22:00:54 -0800 (PST)
Date:   Mon, 30 Nov 2020 22:00:50 -0800
Message-Id: <20201201060050.1193986-1-furquan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH] input: raydium_ts_i2c: Do not split tx transactions
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
 drivers/input/touchscreen/raydium_i2c_ts.c | 120 ++++++++++++++-------
 1 file changed, 82 insertions(+), 38 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index e694a9b2b1e5..259ecfdf33f1 100644
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
@@ -189,10 +169,43 @@ static int raydium_i2c_send(struct i2c_client *client,
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
+		 * issues.
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
 
@@ -206,12 +219,43 @@ static int raydium_i2c_send(struct i2c_client *client,
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
+		 * issues.
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
2.29.2.454.gaff20da3a2-goog

