Return-Path: <linux-input+bounces-400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C77801F37
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 23:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C9128103C
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 22:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E2722319;
	Sat,  2 Dec 2023 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYH1Py/3"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F9BA4
	for <linux-input@vger.kernel.org>; Sat,  2 Dec 2023 14:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doS7qrM7XkdcqwLR81e8dlLCF0RheqcFKJXx9jkLw9M=;
	b=KYH1Py/3frivMklt4cMa4dSqOc4FiqV8Lz8/3XjlpC9NsHJX5bLMgK2ZC3kwB+scLm/4Dj
	04LbYtJmrJFg5G7tC2JzeIlgBF4pjW0zfPDVxnhWojVCiP6Inm+bnIoZJLpQE3llQq9TZH
	9AACN78mGSIZXXBdl/7R1ncMelIhimQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-9U7nM74SOC2Te5suSz2kDw-1; Sat, 02 Dec 2023 17:46:20 -0500
X-MC-Unique: 9U7nM74SOC2Te5suSz2kDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B17A8101A52D;
	Sat,  2 Dec 2023 22:46:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 108262166B26;
	Sat,  2 Dec 2023 22:46:17 +0000 (UTC)
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
Subject: [PATCH v3 1/7] HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
Date: Sat,  2 Dec 2023 23:46:08 +0100
Message-ID: <20231202224615.24818-2-hdegoede@redhat.com>
In-Reply-To: <20231202224615.24818-1-hdegoede@redhat.com>
References: <20231202224615.24818-1-hdegoede@redhat.com>
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
Changes in v3:
- Use "else if" to only wait for reset timeout when
  the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk is not set

Changes in v2:
- Move the i2c_hid_dbg(... "%s: waiting...\n" ...) to above the
  msleep(100) for the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 79 +++++++++++++-----------------
 1 file changed, 33 insertions(+), 46 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2735cd585af0..ca2a4ccb9abf 100644
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
@@ -482,21 +442,48 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 
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
+	} else if (!wait_event_timeout(ihid->wait,
+				       !test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
+				       msecs_to_jiffies(5000))) {
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


