Return-Path: <linux-input+bounces-404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C20801F3A
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 23:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CD5A28108D
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 22:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA7922321;
	Sat,  2 Dec 2023 22:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c8yQTBnM"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35E7116
	for <linux-input@vger.kernel.org>; Sat,  2 Dec 2023 14:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fXEWqtHJxfepHRvdxUkCkaOV4iteM4OyBFJ+KZ3Mm/Y=;
	b=c8yQTBnMwFTDh18OtAp+BugYKXoaEBO3Zdp2Cq5FeTBvTg95ZucvGFBHGzOuQ79h6CD9ss
	50agLUKfLzCfKnqF2mSxbBHFf+QvBVU2MgsXj7m4F9t+QajfMlEGBmH2d0xwzlEzFkKabY
	xg0qqAR+iJxQb9vqTSGc7Lb3o503x84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-pupn0uRxNeW0J6xeJZ_BXA-1; Sat, 02 Dec 2023 17:46:27 -0500
X-MC-Unique: pupn0uRxNeW0J6xeJZ_BXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 139A9101A53B;
	Sat,  2 Dec 2023 22:46:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FF4C2166B26;
	Sat,  2 Dec 2023 22:46:25 +0000 (UTC)
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
Subject: [PATCH v3 5/7] HID: i2c-hid: Turn missing reset ack into a warning
Date: Sat,  2 Dec 2023 23:46:12 +0100
Message-ID: <20231202224615.24818-6-hdegoede@redhat.com>
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

On all i2c-hid devices seen sofar the reset-ack either works, or the hw is
somehow buggy and does not (always) ack the reset properly, yet it still
works fine.

Lower the very long reset timeout to 1 second which should be plenty
and change the reset not getting acked from an error into a warning.

This results in a bit cleaner code and avoids the need to add more
I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks in the future.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 400c15a180b5..88a203e920de 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -479,9 +479,9 @@ static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
 		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	} else if (!wait_event_timeout(ihid->wait,
 				       !test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
-				       msecs_to_jiffies(5000))) {
-		ret = -ENODATA;
-		goto err_clear_reset;
+				       msecs_to_jiffies(1000))) {
+		dev_warn(&ihid->client->dev, "device did not ack reset within 1000 ms\n");
+		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	}
 	i2c_hid_dbg(ihid, "%s: finished.\n", __func__);
 
@@ -490,11 +490,6 @@ static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
 		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
 
 	return ret;
-
-err_clear_reset:
-	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
-	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
-	return ret;
 }
 
 static void i2c_hid_get_input(struct i2c_hid *ihid)
-- 
2.41.0


