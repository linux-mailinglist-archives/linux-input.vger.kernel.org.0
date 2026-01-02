Return-Path: <linux-input+bounces-16764-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9BCEDC2B
	for <lists+linux-input@lfdr.de>; Fri, 02 Jan 2026 08:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B878B3004409
	for <lists+linux-input@lfdr.de>; Fri,  2 Jan 2026 07:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBAD2E7180;
	Fri,  2 Jan 2026 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="T+XZ7688"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07042E5D17
	for <linux-input@vger.kernel.org>; Fri,  2 Jan 2026 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337433; cv=none; b=uaD6APsypuTzwrdsou23ezf0jw5SFSnZr/Mhbp+Vp43o5zBg93iudvwrqoruBz6fePjxvO/g8BVrHFLAMoXXvrz/zsYhm6Jf/swGPz81R3W2z6ImpzqVHZi+1vY0Pn1XdvZa5IKjA2xPSyWit/mfIrumzpwOtPFs7jWjxVToNAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337433; c=relaxed/simple;
	bh=I6qF/evOtf2u4iP3ou5raDOQR94004IlH8P4CrCJqdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ShSYFdrZSM/7P3Ms1VB7bM9LHlTSqsl9WuR3DZMdkMEv5JxCGwqjBahtTmB942vvG+/E2KORV22Gcl19auYH0KLiWNFT2mRRwaKCWVZlGy1CoUF2oQyWPznH67IgaBnOf+6QT2tmTm5EsMzrtoxpE1aHCdPIwQdFZyQ1dtj2bA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=T+XZ7688; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AF6B63F2A3
	for <linux-input@vger.kernel.org>; Fri,  2 Jan 2026 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1767337024;
	bh=B3pf/RdBWKqNLxIwqxjISgnhd2BJZTuCJG4yZS6xiZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=T+XZ7688nH9FCFEVm2EgH1Dyp9jNyjg9rGui1X+RHEUjpHdg/FQe94xdEslMmtoyc
	 dRRNCVQEROu0Vi9v2O1uS/KxNcK9nNn8raq8JPQeIvEA5fWH8kZVhi4hYLRyxeUwju
	 12yeYwfrCblE/TSJciZDJYjwekj7T9CVrsZ33ttlPEcSUztUjP4Iogs4zL/bKCW30T
	 RtV5/dgSPapdCsM8NKy0Ftw+uFcD7PizerhVGoQRGd3XaaOMQ32D7e3P0r2U29KuUZ
	 OMQlfMz/BmolcL61NQaKhUSORF2F9hGdG6y35aowvuMKJObTMZQU88SS0obuhjgA2P
	 4WNmDxEJ+tewhJ7JkwMWFbFNKGlzJKqfLneO9/3Vs3BSJ+yei7+unwllQRQbTVNMsr
	 hBcZt4FpychD43Fk/awsg5scHtBzi/c/iPZev9m0/CxvcjQ0Kc/OkOl9GPzP3ki6pJ
	 5ow6ro6DuAbohCT7qTDQUpss0gGWQ5U3L3rD+pWoHxUrgZrWe05EMc8i3X4+wh3nZD
	 f01yG3jY1NdvuA6MiDu1HTJaAxoaO9i/v/XFhTbMruKs8xzJP5Ul8qkoaEs7LgRgyr
	 sIsDQVrBMI0oc1Qmmlkyq7g2HS5HohttfR3ucmpfKtEPKkyYgxV5RNJsDBNAxLnSGE
	 4gA4w0YpvZO+0fxOPMQ4mWRc=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430fc83f58dso6555005f8f.2
        for <linux-input@vger.kernel.org>; Thu, 01 Jan 2026 22:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767337024; x=1767941824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3pf/RdBWKqNLxIwqxjISgnhd2BJZTuCJG4yZS6xiZs=;
        b=TbOUCVsWJAKVs0Q0nWjcghDLa+t6WelGHVjVBWNpY4iValRo+YiLuPqVm1vZOiBrye
         J/3Wv6W140OewsxE5UTYdGW68Jm2fliIeFC0fNCg3qwKq88e5DhohKEakqJAtfihVTvw
         Y+uZJJyD3BRMqFaCnDmortn9nA8Lem7gm1yEf8O+sRqj+aDti+6dd+ZvGXLntaL0+Gi2
         /kkz9YNCeDmYA+QmVkjLN5jO8rZixSCRXI0eWs54bJkG+MclVxahmWPkFcGfy/5wgeil
         eUDGuUgY+pcpchNCdNpqudTq+NBvFm00ZeTVHmGP9mJfr5KoAKKO5rB2s06OW1Fas/Xj
         Mrcw==
X-Gm-Message-State: AOJu0YyXZhiIYk3DYRqvr8X93g2ZI8pWpWsurgSnXvKS8MIXUtc8qEJR
	o+C08j2mHmVkaCFWou7kyZCRwmZAWEgtro9S5lyjJAWG2kpTQe58eWSUPi4ICCv/yyrVNg+SKDj
	6k8k430D3eX8qCl6sF/sfdTgrenJ+oRk43d8PU2uWojXPxqZYKiB9ggE05lQFOv9ohPofyIZmAn
	WE7g4r
X-Gm-Gg: AY/fxX7hjGGDV2KAH3CXTnOEZCtx8gSSnkIhffsH3DgN/GW2R2i7Fasobi4XAa949fg
	SOpO1J62E/WCCeBkV+eAFUyk4kKlcNA3tlPhX4kFlbtb5gJMtCNjwLYUTMdMh2iKrIHbuuQM8+H
	tjQ0uFuVgJWqxZxmY+mBHSPiMbJWvEiTcjG+FdVIgbiYFCf3D6BzRipm2dJThIBbvZ3sk0syRA1
	PhgKJFcTtyVAXlnAn52rNSCIdEMWaYVnuUxDnT7NYyTK7e5GGjnMlmizf1rRr30w05yGeOpOQG9
	T73eCgql01XkImyi0JanDBgDzKfPe5yI3FMCNO7Eqsb7ubiEMIgz65qvGoc9t91JrPvrhk0UdAT
	rtLh1p5tpq1K34+75SYUA8LTt+TGu1oSriME5VeHmv+F7Z9hgv1bxUJ/AWwPzu4EJ
X-Received: by 2002:a05:6000:200d:b0:430:fd84:3179 with SMTP id ffacd0b85a97d-4324e4f92bemr53561019f8f.33.1767337024237;
        Thu, 01 Jan 2026 22:57:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFv5Pm1KrVEDfvWwiWGEaibpTcWeUuu4ZKmEAe3P/T2CNjLbcbLg2Iox1OBM8A0AMUmZpi/g==
X-Received: by 2002:a05:6000:200d:b0:430:fd84:3179 with SMTP id ffacd0b85a97d-4324e4f92bemr53561001f8f.33.1767337023766;
        Thu, 01 Jan 2026 22:57:03 -0800 (PST)
Received: from localhost.localdomain (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1b1sm82454071f8f.3.2026.01.01.22.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 22:57:03 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
Date: Fri,  2 Jan 2026 06:56:43 +0000
Message-ID: <20260102065643.1832426-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another Chicony Electronics HP 5MP Camera with USB ID 04F2:B882
reports a HID sensor interface that is not actually implemented.

Add the device to the HID ignore list so the bogus sensor is never
exposed to userspace. Then the system won't hang when runtime PM
tries to wake the unresponsive device.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaec..e8a1a86313b7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -317,6 +317,7 @@
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
 #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA	0xb824
 #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2	0xb82c
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3	0xb882
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c0..3cf7971d4974 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -769,6 +769,7 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
-- 
2.43.0


