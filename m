Return-Path: <linux-input+bounces-5086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1593493B
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 09:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 953C31F21E7B
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 07:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA016F312;
	Thu, 18 Jul 2024 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdIxMQxy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1DB75804;
	Thu, 18 Jul 2024 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288977; cv=none; b=A/6bAGVuzKEHHaDK0bgVrM94EDUEnX7qp6wc9oL7rH1ecTq6Tzuqjrhts2Gwmqj0pamELtcNWoJy7NMSUqWheEk4ezpH7ZKRZSTLctvFiA7KTHtodH5hBa7T439ufWHU9Zg2wcPXRF0BdooA6EBRl5GIMcr/rk7vHcuvEj876rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288977; c=relaxed/simple;
	bh=QTc8Un5upPXJIhlGhjl7ubZAXV0Z5YsCy7aukHFflpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ao0hJHzCiH6fY1ttr2nuGpk65CVhXbGxsRPKdSMO9I5bChe1dkIVkeUnZ+mT0FmSnx2HxfBl9v+VoZunRWH75ipTLYt54XgaGeYDvTM6IEr0e6yWvON+NQwDJefXYa+QXbLrR0QcqaV0TzIEIcobPIj3hwmeQyPXHo4VS6QyP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdIxMQxy; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-389ccd2f0abso1650085ab.2;
        Thu, 18 Jul 2024 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721288975; x=1721893775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=crzw/d+f/3t32IpPYEw2grNnNxXUQHVB18xLlsRWPEY=;
        b=gdIxMQxyiu7Nc8EV8zTLksENKj8iP2ymL/eP//Q6Z+19cHN245hwZSIRIymEod9d9s
         8YrOrPrlvn3bNCz0yjHisgQ8mXL8gBSCBLyDK82E+bJ1m0nJvJEq6QVlGtYX0xtPNnTv
         rNoKR7+BquiV5nGmyKyv2Xpr2YGnMpkV1J7UbpfYIZoHx32DarQnqrZ/7gquFzIrMeDT
         cJGRYmzwMueAI4MgFR+4IFrL+/bXmh8GKAIu3TMlP2IYD05k96VseVxUg/mb5LzPkR56
         aKf1Lukonvi1JmEyTxpYE6oFiJDU2sAlPGl6xYF8GPFsjuGZ9QYkSgn90dT296vRDM+c
         y/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721288975; x=1721893775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crzw/d+f/3t32IpPYEw2grNnNxXUQHVB18xLlsRWPEY=;
        b=WjlNhiwyhR5BZijLf605hmR9fKC7Wvo34Icdp06GMKS7nWsFVuXoJL6JFkoeOugDr7
         gcsZ/9emYb65C94YRnSsJ1ZxRkapkfUvgHfKaBMg1rKGZecZsv0TjcuUrRz5s6DsT19v
         nqlKOoM1YSf49kwvRc1VjCn40Xk7a+hDH8TyDdyQwCj8sLUpOI0NhiovS1oUB7TF6NEi
         dYmkUW4BJ8PyAHDpi9NABNesdBcnkZqc1v6Tu6VaXoHbv8ItnGcloTh/mzgkPtqFxaCv
         kg/wG9SuCAVAcsmo4cYs3znNFa2l88JqQd62mfBMhY7XyFoX9rDbvrf8+6fx/WNntY2l
         fS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1bnFxv/l3/HP/MYhnHXjedrYl1DRct1EC9Ap0ETDr1NfcC+gdsD95E8uVBtQa2KJ9XTwyZ6Ri8G8DAvAlTUKHnxiuvOsRQOAvT1sK
X-Gm-Message-State: AOJu0Yx/MIskDE2L4/dtniVUbBxnmd3WEYMBbIEXYnfuvYhZUMnt+JDT
	ZP/hJUYsijWAINIx1WPW4MbdywpmS5kt2WCRTvsfheWW23MHyBlNTtjEO8ep
X-Google-Smtp-Source: AGHT+IHhOYm6z/NSf5t5yzcsvPFJDNLCfFlR456J19tntfH6MwJnRzpPZIdSaAhucLvT6UOspsTChw==
X-Received: by 2002:a92:c542:0:b0:397:2481:7acd with SMTP id e9e14a558f8ab-39724817c3cmr1211545ab.10.1721288974064;
        Thu, 18 Jul 2024 00:49:34 -0700 (PDT)
Received: from sis-tammy.. ([2402:7500:4d8:362f:664:b744:64a4:16d8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7d2bcsm9656642b3a.99.2024.07.18.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:49:33 -0700 (PDT)
From: tammy tseng <tammy0524@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tammy tseng <tammy0524@gmail.com>
Subject: [PATCH] hid: add patch for sis multitouch format
Date: Thu, 18 Jul 2024 15:48:03 +0800
Message-ID: <20240718074804.1316064-1-tammy0524@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch is to add quirks for sis multitouch format

Signed-off-by: tammy tseng <tammy0524@gmail.com>
---
 drivers/hid/hid-multitouch.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841f24..9f49bc7a157c 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -212,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -396,6 +397,11 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name = MT_CLS_SIS,
+		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
+			MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_CONTACT_CNT_ACCURATE,
+	},
 	{ }
 };
 
@@ -1787,6 +1793,9 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
 
+	if (hdev->vendor == USB_VENDOR_ID_SIS_TOUCH)
+		hdev->quirks |= HID_QUIRK_NOGET;
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret)
 		return ret;
@@ -2243,6 +2252,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8, USB_VENDOR_ID_GOOGLE,
 			USB_DEVICE_ID_GOOGLE_WHISKERS) },
 
+	/* sis */
+	{ .driver_data = MT_CLS_SIS,
+		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_SIS_TOUCH,
+			HID_ANY_ID) },
+
 	/* Generic MT device */
 	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
 
-- 
2.43.0


