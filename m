Return-Path: <linux-input+bounces-401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B24B801F38
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 23:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589621C209B9
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 22:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AB62232B;
	Sat,  2 Dec 2023 22:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5ckIxKQ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41350116
	for <linux-input@vger.kernel.org>; Sat,  2 Dec 2023 14:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tFzRAWoR+dx2zxJrMSDZyasEFZfoY7FlHgiwVRFecsc=;
	b=G5ckIxKQJ+VG+uiRZyWPCHlchZoGbMp0oZjGr/yBq2feT+WrMU6nxVTI7mzu05mDozvqBK
	I9TsejrJaUiVVopc8q9UvuF5sL8UbfGemGiKedSHMu2KHOZiPz2xnvqEMlDui4LEiMzW63
	MmWqztW/OG80oYquRhNN5VvNGlFXkvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-oVpfeHTINqKd2NqXzRydbw-1; Sat, 02 Dec 2023 17:46:22 -0500
X-MC-Unique: oVpfeHTINqKd2NqXzRydbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AB2880C343;
	Sat,  2 Dec 2023 22:46:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E33362166B26;
	Sat,  2 Dec 2023 22:46:19 +0000 (UTC)
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
Subject: [PATCH v3 2/7] HID: i2c-hid: Split i2c_hid_hwreset() in start() and finish() functions
Date: Sat,  2 Dec 2023 23:46:09 +0100
Message-ID: <20231202224615.24818-3-hdegoede@redhat.com>
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

Split i2c_hid_hwreset() into:

i2c_hid_start_hwreset() which sends the PWR_ON and reset commands; and
i2c_hid_finish_hwreset() which actually waits for the reset to complete.

This is a preparation patch for removing the need for
I2C_HID_QUIRK_NO_IRQ_AFTER_RESET by making i2c-hid behave
more like Windows.

No functional changes intended.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Move the mutex_[un]lock(&ihid->reset_lock) calls from
 i2c_hid_start_hwreset() / i2c_hid_finish_hwreset() to the callers
 to make the locking more clear
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 38 ++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index ca2a4ccb9abf..21d65ca32866 100644
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
@@ -438,11 +438,11 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 	 * being reset. Otherwise we may lose the reset complete
 	 * interrupt.
 	 */
-	mutex_lock(&ihid->reset_lock);
+	lockdep_assert_held(&ihid->reset_lock);
 
 	ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	/* Prepare reset command. Command register goes first. */
 	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
@@ -460,6 +460,18 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 		goto err_clear_reset;
 	}
 
+	return 0;
+
+err_clear_reset:
+	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
+	return ret;
+}
+
+static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
+{
+	int ret = 0;
+
 	i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
 
 	if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
@@ -477,14 +489,11 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
 	if (!(ihid->quirks & I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET))
 		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
 
-	mutex_unlock(&ihid->reset_lock);
 	return ret;
 
 err_clear_reset:
 	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
-err_unlock:
-	mutex_unlock(&ihid->reset_lock);
 	return ret;
 }
 
@@ -731,7 +740,11 @@ static int i2c_hid_parse(struct hid_device *hid)
 	}
 
 	do {
-		ret = i2c_hid_hwreset(ihid);
+		mutex_lock(&ihid->reset_lock);
+		ret = i2c_hid_start_hwreset(ihid);
+		if (ret == 0)
+			ret = i2c_hid_finish_hwreset(ihid);
+		mutex_unlock(&ihid->reset_lock);
 		if (ret)
 			msleep(1000);
 	} while (tries-- > 0 && ret);
@@ -974,10 +987,15 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 	 * However some ALPS touchpads generate IRQ storm without reset, so
 	 * let's still reset them here.
 	 */
-	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
-		ret = i2c_hid_hwreset(ihid);
-	else
+	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME) {
+		mutex_lock(&ihid->reset_lock);
+		ret = i2c_hid_start_hwreset(ihid);
+		if (ret == 0)
+			ret = i2c_hid_finish_hwreset(ihid);
+		mutex_unlock(&ihid->reset_lock);
+	} else {
 		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
+	}
 
 	if (ret)
 		return ret;
-- 
2.41.0


