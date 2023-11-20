Return-Path: <linux-input+bounces-133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 132987F1D57
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 20:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DAD21F25ABF
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 19:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F57D358A4;
	Mon, 20 Nov 2023 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyF4QD/V"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6718DC7
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700508810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nt8SQK/hXhzgfJYU/jIxwbURko4U8ZNeujXCZrmJJ+E=;
	b=eyF4QD/VaS/nEGI4GFG3U3x8j+p6cLq53n02Bc5tsc3ZMm0Os9od4DiTIkg3CO+5KuJFSD
	zzGWMMflgsb2oX+97x1s8tDHcmCrm821YNDbBRLEujYtUmY2T38Ns6bWvk3pA136oszXyT
	u8gFvrWSp3ahQNSl9Va6EWT2KOecFng=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-256-LfkjbUzrPeqcm2RziJ5zfQ-1; Mon,
 20 Nov 2023 14:33:27 -0500
X-MC-Unique: LfkjbUzrPeqcm2RziJ5zfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 924CD1C0755C;
	Mon, 20 Nov 2023 19:33:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9D822166B27;
	Mon, 20 Nov 2023 19:33:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Julian Sax <jsbc@gmx.de>,
	ahormann@gmx.net,
	Bruno Jesus <bruno.fl.jesus@gmail.com>,
	Dietrich <enaut.w@googlemail.com>,
	kloxdami@yahoo.com,
	Tim Aldridge <taldridge@mac.com>,
	Rene Wagner <redhatbugzilla@callerid.de>,
	Federico Ricchiuto <fed.ricchiuto@gmail.com>,
	linux-input@vger.kernel.org
Subject: [RFC v2 1/7] HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
Date: Mon, 20 Nov 2023 20:33:07 +0100
Message-ID: <20231120193313.666912-2-hdegoede@redhat.com>
In-Reply-To: <20231120193313.666912-1-hdegoede@redhat.com>
References: <20231120193313.666912-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

i2c_hid_hwreset() is the only caller of i2c_hid_execute_reset(),
fold the latter into the former.

This is a preparation patch for removing the need for
I2C_HID_QUIRK_NO_IRQ_AFTER_RESET by making i2c-hid behave
more like Windows.

No functional changes intended.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Move the i2c_hid_dbg(... "%s: waiting...\n" ...) to above the
  msleep(100) for the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 81 +++++++++++++-----------------
 1 file changed, 35 insertions(+), 46 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2735cd585af0..74dd145275f1 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -426,49 +426,9 @@ static int i2c_hid_set_power(struct i2c_hid *ihid, int power_state)
 	return ret;
 }
 
-static int i2c_hid_execute_reset(struct i2c_hid *ihid)
-{
-	size_t length = 0;
-	int ret;
-
-	i2c_hid_dbg(ihid, "resetting...\n");
-
-	/* Prepare reset command. Command register goes first. */
-	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
-	length += sizeof(__le16);
-	/* Next is RESET command itself */
-	length += i2c_hid_encode_command(ihid->cmdbuf + length,
-					 I2C_HID_OPCODE_RESET, 0, 0);
-
-	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
-
-	ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
-	if (ret) {
-		dev_err(&ihid->client->dev, "failed to reset device.\n");
-		goto out;
-	}
-
-	if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
-		msleep(100);
-		goto out;
-	}
-
-	i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
-	if (!wait_event_timeout(ihid->wait,
-				!test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
-				msecs_to_jiffies(5000))) {
-		ret = -ENODATA;
-		goto out;
-	}
-	i2c_hid_dbg(ihid, "%s: finished.\n", __func__);
-
-out:
-	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
-	return ret;
-}
-
 static int i2c_hid_hwreset(struct i2c_hid *ihid)
 {
+	size_t length = 0;
 	int ret;
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
@@ -482,21 +442,50 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 
 	ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
 	if (ret)
-		goto out_unlock;
+		goto err_unlock;
 
-	ret = i2c_hid_execute_reset(ihid);
+	/* Prepare reset command. Command register goes first. */
+	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
+	length += sizeof(__le16);
+	/* Next is RESET command itself */
+	length += i2c_hid_encode_command(ihid->cmdbuf + length,
+					 I2C_HID_OPCODE_RESET, 0, 0);
+
+	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+
+	ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
 	if (ret) {
 		dev_err(&ihid->client->dev,
 			"failed to reset device: %d\n", ret);
-		i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
-		goto out_unlock;
+		goto err_clear_reset;
 	}
 
+	i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
+
+	if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
+		msleep(100);
+		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	}
+
+	if (!wait_event_timeout(ihid->wait,
+				!test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
+				msecs_to_jiffies(5000))) {
+		ret = -ENODATA;
+		goto err_clear_reset;
+	}
+	i2c_hid_dbg(ihid, "%s: finished.\n", __func__);
+
 	/* At least some SIS devices need this after reset */
 	if (!(ihid->quirks & I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET))
 		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
 
-out_unlock:
+	mutex_unlock(&ihid->reset_lock);
+	return ret;
+
+err_clear_reset:
+	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
+err_unlock:
 	mutex_unlock(&ihid->reset_lock);
 	return ret;
 }
-- 
2.41.0


