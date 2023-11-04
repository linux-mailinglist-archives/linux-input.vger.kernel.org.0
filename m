Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678457E0EFE
	for <lists+linux-input@lfdr.de>; Sat,  4 Nov 2023 12:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbjKDLSk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Nov 2023 07:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjKDLSk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Nov 2023 07:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAC7B7
        for <linux-input@vger.kernel.org>; Sat,  4 Nov 2023 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699096673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zSbIs7xQ43DgpxbZyVRIiEzTxV58/zDB2X1TMbD8Ytk=;
        b=Z41MQXWQLV5cfqwMNHN4v4ver4q/OyHShqwqUJE8CXcdnHdceXaRH1PG4yHFPWCsDBShwC
        WvtlZZ3rOP0INU+mbXkyc1awjeEJJWJ8MmBzWs8DJZV5Q/WRU5Sv76TxW3uvBzmRhvfr0Y
        +IjfKKX1GdMk7kduTSQbq7ei68jkIns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-59zBLMGvNg6mFZBGQLC8ww-1; Sat, 04 Nov 2023 07:17:50 -0400
X-MC-Unique: 59zBLMGvNg6mFZBGQLC8ww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F28FD185A780;
        Sat,  4 Nov 2023 11:17:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 50AEC502E;
        Sat,  4 Nov 2023 11:17:48 +0000 (UTC)
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
Subject: [PATCH 2/7] HID: i2c-hid: Split i2c_hid_hwreset() in start() and finish() functions
Date:   Sat,  4 Nov 2023 12:17:38 +0100
Message-ID: <20231104111743.14668-3-hdegoede@redhat.com>
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

Split i2c_hid_hwreset() into:

i2c_hid_start_hwreset() which sends the PWR_ON and reset commands; and
i2c_hid_finish_hwreset() which actually waits for the reset to complete.

This is a preparation patch for removing the need for
I2C_HID_QUIRK_NO_IRQ_AFTER_RESET by making i2c-hid behave
more like Windows.

No functional changes intended.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 12a9edb23f82..8105b84fb539 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -426,7 +426,7 @@ static int i2c_hid_set_power(struct i2c_hid *ihid, int power_state)
 	return ret;
 }
 
-static int i2c_hid_hwreset(struct i2c_hid *ihid)
+static int i2c_hid_start_hwreset(struct i2c_hid *ihid)
 {
 	size_t length = 0;
 	int ret;
@@ -460,6 +460,20 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 		goto err_clear_reset;
 	}
 
+	return 0;
+
+err_clear_reset:
+	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
+err_unlock:
+	mutex_unlock(&ihid->reset_lock);
+	return ret;
+}
+
+static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
+{
+	int ret = 0;
+
 	if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
 		msleep(100);
 		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
@@ -484,7 +498,6 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 err_clear_reset:
 	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
-err_unlock:
 	mutex_unlock(&ihid->reset_lock);
 	return ret;
 }
@@ -732,7 +745,9 @@ static int i2c_hid_parse(struct hid_device *hid)
 	}
 
 	do {
-		ret = i2c_hid_hwreset(ihid);
+		ret = i2c_hid_start_hwreset(ihid);
+		if (ret == 0)
+			ret = i2c_hid_finish_hwreset(ihid);
 		if (ret)
 			msleep(1000);
 	} while (tries-- > 0 && ret);
@@ -975,10 +990,13 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 	 * However some ALPS touchpads generate IRQ storm without reset, so
 	 * let's still reset them here.
 	 */
-	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
-		ret = i2c_hid_hwreset(ihid);
-	else
+	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME) {
+		ret = i2c_hid_start_hwreset(ihid);
+		if (ret == 0)
+			ret = i2c_hid_finish_hwreset(ihid);
+	} else {
 		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
+	}
 
 	if (ret)
 		return ret;
-- 
2.41.0

