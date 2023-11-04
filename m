Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D557E0F00
	for <lists+linux-input@lfdr.de>; Sat,  4 Nov 2023 12:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjKDLSr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Nov 2023 07:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjKDLSq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Nov 2023 07:18:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EA91BD
        for <linux-input@vger.kernel.org>; Sat,  4 Nov 2023 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699096675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zk4l95jEHoH1JCWxauxXu/AiDVZKo7MG3MMmwMuKEUU=;
        b=KRSsphIEfHpfBKn8B7rm8Kp4pyjLO6oY2xX6KdSz+Pzq9+lqGOQqNeRZx4WmeDC8e44PnK
        pc0TlKKna8bFgGuUC07cgZ3rO6FkNPYV1FLZKleIrrSKVzPUHeeNqlXJ6vD8KWoB1anVdr
        O4pK2fpSDn+3UcNbOmckJ5PX2WgcdeY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-ZgVZI_fFN86CVJvdtGJzNw-1; Sat, 04 Nov 2023 07:17:48 -0400
X-MC-Unique: ZgVZI_fFN86CVJvdtGJzNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F1AE811E7D;
        Sat,  4 Nov 2023 11:17:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 71096502E;
        Sat,  4 Nov 2023 11:17:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 1/7] HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
Date:   Sat,  4 Nov 2023 12:17:37 +0100
Message-ID: <20231104111743.14668-2-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-1-hdegoede@redhat.com>
References: <20231104111743.14668-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i2c_hid_hwreset() is the only caller of i2c_hid_execute_reset(),
fold the latter into the former.

This is a preparation patch for removing the need for
I2C_HID_QUIRK_NO_IRQ_AFTER_RESET by making i2c-hid behave
more like Windows.

No functional changes intended.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 80 +++++++++++++-----------------
 1 file changed, 34 insertions(+), 46 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2735cd585af0..12a9edb23f82 100644
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
@@ -482,21 +442,49 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 
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
 
+	if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
+		msleep(100);
+		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	}
+
+	i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
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

