Return-Path: <linux-input+bounces-2764-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63037895181
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 13:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 195111F23799
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 11:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E40959176;
	Tue,  2 Apr 2024 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PUvKoY5C"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2463511
	for <linux-input@vger.kernel.org>; Tue,  2 Apr 2024 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056224; cv=none; b=I3RVpGPzkkAgbuA/FXzC3xUs+hUpYtPz9XX6GN8Wh25knBp6Ubvvzdnhzulo63b9cOAaRLrX4LST28cvn/wm6cQi/hS/g5NgrLMaSd5saKoDLeKJnDUjUMGXlcAEEZwFmDDzqp5sC0VUqt1tLfsknvchtRwAUTO6M1Y7AVqhqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056224; c=relaxed/simple;
	bh=D82Cu+k7soY7muyH2dTK24VwPrkWKYANjR2Lou+kH1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WNPP5YAqimMyKTvubIcEsJuu09a8ymoU2tv11SxMcIEfvPOI+K6LNz1ePO7MyfOJawXMaw76DJ1WwFBM0aS6kM74+Q8Y3R8V/XK8mttfA1XdYFrAskCeHy6JwALZ09c0VJ3Uaw4hL22gYJUsk9ZLWtqi/Xn9apbn+vkg8TxIrb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PUvKoY5C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712056221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DLT5ckQGMXEvE99iwSwMB8TwwirxI50ACS3O2c0dAd0=;
	b=PUvKoY5C1B7YQZq0aKdOpoGr4AV9MAaWqzUJjxHn35XjQ2ejUUH2qPUQ08C3U1vv4GIDZI
	36xPU76K1Ku1e2N81Atls7tST6b9tfd6keFRJekBqkJJQoERPahyficcW8ppx8ugXHJv0A
	TnuE/Ae4CWxe6M6KnRay/zNnXSO1v2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-xwur5C-EPCmniNxv3V7M-w-1; Tue, 02 Apr 2024 07:10:18 -0400
X-MC-Unique: xwur5C-EPCmniNxv3V7M-w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 530F8101A533;
	Tue,  2 Apr 2024 11:10:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11F73492BD4;
	Tue,  2 Apr 2024 11:10:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Kenny Levinsen <kl@kl.wtf>
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Philip=20M=C3=BCller?= <philm@manjaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Julian Sax <jsbc@gmx.de>,
	ahormann@gmx.net,
	Bruno Jesus <bruno.fl.jesus@gmail.com>,
	Dietrich <enaut.w@googlemail.com>,
	kloxdami@yahoo.com,
	Tim Aldridge <taldridge@mac.com>,
	Rene Wagner <redhatbugzilla@callerid.de>,
	Federico Ricchiuto <fed.ricchiuto@gmail.com>,
	linux-input@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] HID: i2c-hid: Revert to await reset ACK before reading report descriptor
Date: Tue,  2 Apr 2024 13:10:04 +0200
Message-ID: <20240402111004.161434-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

From: Kenny Levinsen <kl@kl.wtf>

In af93a167eda9, i2c_hid_parse was changed to continue with reading the
report descriptor before waiting for reset to be acknowledged.

This has lead to two regressions:

1. We fail to handle reset acknowledgment if it happens while reading
   the report descriptor. The transfer sets I2C_HID_READ_PENDING, which
   causes the IRQ handler to return without doing anything.

   This affects both a Wacom touchscreen and a Sensel touchpad.

2. On a Sensel touchpad, reading the report descriptor this quickly
   after reset results in all zeroes or partial zeroes.

The issues were observed on the Lenovo Thinkpad Z16 Gen 2.

The change in question was made based on a Microsoft article[0] stating
that Windows 8 *may* read the report descriptor in parallel with
awaiting reset acknowledgment, intended as a slight reset performance
optimization. Perhaps they only do this if reset is not completing
quickly enough for their tastes?

As the code is not currently ready to read registers in parallel with a
pending reset acknowledgment, and as reading quickly breaks the report
descriptor on the Sensel touchpad, revert to waiting for reset
acknowledgment before proceeding to read the report descriptor.

[0]: https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/plug-and-play-support-and-power-management

Fixes: af93a167eda9 ("HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the report-descriptor")
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2271136
Cc: stable@vger.kernel.org
Signed-off-by: Kenny Levinsen <kl@kl.wtf>
Link: https://lore.kernel.org/r/20240331182440.14477-1-kl@kl.wtf
[hdegoede@redhat.com Drop no longer necessary abort_reset error exit path]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2df1ab3c31cc..13d67d7c67b4 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -735,12 +735,15 @@ static int i2c_hid_parse(struct hid_device *hid)
 	mutex_lock(&ihid->reset_lock);
 	do {
 		ret = i2c_hid_start_hwreset(ihid);
-		if (ret)
+		if (ret == 0)
+			ret = i2c_hid_finish_hwreset(ihid);
+		else
 			msleep(1000);
 	} while (tries-- > 0 && ret);
+	mutex_unlock(&ihid->reset_lock);
 
 	if (ret)
-		goto abort_reset;
+		return ret;
 
 	use_override = i2c_hid_get_dmi_hid_report_desc_override(client->name,
 								&rsize);
@@ -750,11 +753,8 @@ static int i2c_hid_parse(struct hid_device *hid)
 		i2c_hid_dbg(ihid, "Using a HID report descriptor override\n");
 	} else {
 		rdesc = kzalloc(rsize, GFP_KERNEL);
-
-		if (!rdesc) {
-			ret = -ENOMEM;
-			goto abort_reset;
-		}
+		if (!rdesc)
+			return -ENOMEM;
 
 		i2c_hid_dbg(ihid, "asking HID report descriptor\n");
 
@@ -763,23 +763,10 @@ static int i2c_hid_parse(struct hid_device *hid)
 					    rdesc, rsize);
 		if (ret) {
 			hid_err(hid, "reading report descriptor failed\n");
-			goto abort_reset;
+			goto out;
 		}
 	}
 
-	/*
-	 * Windows directly reads the report-descriptor after sending reset
-	 * and then waits for resets completion afterwards. Some touchpads
-	 * actually wait for the report-descriptor to be read before signalling
-	 * reset completion.
-	 */
-	ret = i2c_hid_finish_hwreset(ihid);
-abort_reset:
-	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
-	mutex_unlock(&ihid->reset_lock);
-	if (ret)
-		goto out;
-
 	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
 
 	ret = hid_parse_report(hid, rdesc, rsize);
-- 
2.44.0


