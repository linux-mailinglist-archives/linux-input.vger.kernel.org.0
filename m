Return-Path: <linux-input+bounces-16954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C5ED108F7
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 05:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D153307D838
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 04:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88E32F6907;
	Mon, 12 Jan 2026 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlMtxw8i"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E230BF63
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 04:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768191674; cv=none; b=XwLLae75UYakqXX45HH9BKSk5TUOl1KVCjUZvdzpK636iXS//+Pm01jw0pKT4rcKf1wVhYtzGHQZDbzsZyFVZWf4SzHJE2XHv/QUrGt9MgJJaIlgPB6trDAR2oh+SIq/q+ztKF5FzorPZOQM1PyD9nDsbJnDz5pNMuWMLLWtrDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768191674; c=relaxed/simple;
	bh=9z1wDtyXAKdNssFFC3WXPfXTJTLvOapbY7cyoZAzros=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+94GpQzZJKfrHbvIc05bIHMU+j0R5Sma5fFnbnRI6YTDpylzbyDwZETXArGIyJ+gXAYrBp1SPTATVa/QzsGa1ZE/cdtOEWMFt9YZ1vs0P8QBmwtx7ymuBwWDsZzcPfLP0KwG9kaj9c4cFjktrDWChQanDs9bf7rIJ+dYVwTfJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlMtxw8i; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c2f74ffd81so620522485a.1
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 20:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768191667; x=1768796467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP23ZQnFxI3fXmimCDZNTyoOhWpeH9X/COG8zO0+xzo=;
        b=GlMtxw8i5T73Xwe7/8m0AT2cmDLcdvyqtn7SbBVcea+0lFRvPgmSaY0hqtN7l8cVWO
         5X6+icHyrrfosKlGXF62DE/qaNvehwDPs8Kr0ZaRIlmjrB3D3j3v4+vIy8gqVJhSIJsD
         72bPDdgVsZ747IgKwri5qiYmBTMT3mT51/3m5rj5lMTnKtPjgnR7CsjOhTT8kUWz1q0Q
         4CQ7TlJLzx9i/JIf+vd/00aK2vTNiwC+KxB40xgu3Uf0s2w18JpnIkXppol1F69RbRwt
         lqh7ZJKY7Kyrrqm9doXMJ9LzpbQrLpc08fTCO5nZtphUMKqoqSyrstIIiJCXQX9oMBrn
         VZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768191667; x=1768796467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aP23ZQnFxI3fXmimCDZNTyoOhWpeH9X/COG8zO0+xzo=;
        b=xVbLNaP7EjycFUnojyjeatOnQHpkefI5XIgj2Qk02TsLZwORHY5j6FY8UqkN53MhBm
         yG4BTq0cWnSmzhz8M72F43hG32QRrC6FTkWf67+ukOtT6Qita6OdoCTj5jHWCbfjgoK7
         hDPPe8hOpfWPnI6PQb/RD0h+jNyn0ZcD7ZZvpdicezx4a3vROcAK0YXsW4nXF37gpSaq
         yQWvGK3Ygo/mMaSUmknL8LBefXb+Ikfh5ok2gsl/YezAL9ahAdwQ+K52ihosQNG/ilHa
         MScdwygpFaJN+9Lcn9b6eij/zivi0lkE+m9NSBLSpJzfLGYoBAF0pdQdKVpSp3M+jC7T
         1FHA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqylticndq8NycwLCDceet1z8Zi/wAXoO+lOthXC2sGuhCnrFPyIvz5C27Pl63fn52lr833EFsZQrTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbIq64+zA24hS+4gP85G6GGDfxwbzkxm1ZJG7N487Uu9wWpsQ
	JRPzTGU1K8YKcb9d7zXAM1jf2ovUY5T5bQIQ020ePBeBAVbBB+s31MxvhzYVYqqu
X-Gm-Gg: AY/fxX4R+kXZhVYBzXOYZVKP5uCEEjYRRK15DZxFxN0jQx9dbCEp8dfRKiVJlFhbvqa
	JoYWqnVHjJMoac2OoBTwb/uoPzXvPAOShAIAwvzD6LwIwU/184aXx7y9OZ5evNs6u0OWwXpHo0x
	M7HIVQ9zB9gikL+QWJyms1apn9DsDrYPKtmXsg2+SAQP2rCFKltZnHMtvp5pEiiBYQse1qznlGw
	t5J1Trgpymxegbi93syI2WP3+sX8u+8L0eSy185lqukj5z+Bnu/AL7CWqI4uCqTaXDF+5qq0Scd
	90M9vySEpdyAX+aTvR4meeDsgtA2ZKLbq0AwP1laA5SJH/pCYqCmXAMBrAB3QMuKTtpxsOtlSdx
	0eg0I/7VnelmCFEgUm+q5z/2kC0iTYfd/7BfES7RU0Ahn8WntNNPSL7NiMu8VMku66SjwOI5UQr
	YVvR+Jr7nx4aYgK6JJZswdfGoVcgchkNeXfPmK14sBJ80RczI6
X-Google-Smtp-Source: AGHT+IFJK8Z8dti4Mr4gRldP0NZNKTsoKW10kAQzLDudeQierCA2ZPIa0LeymE6qV9ht+TYwtPrNYA==
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c389368bbemr2524180685a.5.1768191667584;
        Sun, 11 Jan 2026 20:21:07 -0800 (PST)
Received: from achantapc.tail227c81.ts.net ([128.172.224.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4cd7a3sm1470618385a.24.2026.01.11.20.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:21:07 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH v2 1/4] HID: hid-ids: Add SteelSeries Arctis headset device IDs
Date: Sun, 11 Jan 2026 23:19:38 -0500
Message-ID: <20260112041941.40531-2-srimanachanta@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112041941.40531-1-srimanachanta@gmail.com>
References: <20260112041941.40531-1-srimanachanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB device IDs for the complete SteelSeries Arctis headset lineup,
including:
- Arctis 1, 1 Wireless, 7, 7P, 7X variants
- Arctis 7+ series (PS5, Xbox, Destiny editions)
- Arctis 9 Wireless
- Arctis Pro Wireless
- Arctis Nova 3, 3P, 3X
- Arctis Nova 5, 5X
- Arctis Nova 7 series (multiple variants and special editions)
- Arctis Nova Pro Wireless and Pro X

This also fixes the existing ARCTIS_1 ID to use the correct product ID
(0x12b3 instead of 0x12b6, which is actually the Arctis 1 Xbox variant).

These IDs will be used by the updated hid-steelseries driver to provide
battery monitoring, sidetone control, and other device-specific features
for these wireless gaming headsets.

Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
---
 drivers/hid/hid-ids.h | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaec..f4f91fb4c2b9 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1303,10 +1303,35 @@
 #define USB_DEVICE_ID_STEAM_CONTROLLER_WIRELESS	0x1142
 #define USB_DEVICE_ID_STEAM_DECK	0x1205
 
-#define USB_VENDOR_ID_STEELSERIES	0x1038
-#define USB_DEVICE_ID_STEELSERIES_SRWS1	0x1410
-#define USB_DEVICE_ID_STEELSERIES_ARCTIS_1  0x12b6
-#define USB_DEVICE_ID_STEELSERIES_ARCTIS_9  0x12c2
+#define USB_VENDOR_ID_STEELSERIES			0x1038
+#define USB_DEVICE_ID_STEELSERIES_SRWS1			0x1410
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_1		0x12b3
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X		0x12b6
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7		0x1260
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P		0x12d5
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X		0x12d7
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2		0x12ad
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS		0x220e
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P	0x2212
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X	0x2216
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY	0x2236
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_9		0x12c2
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO		0x1290
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3		0x12ec
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P	0x2269
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X	0x226d
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5		0x2232
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X	0x2253
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7		0x2202
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X	0x2206
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P	0x220a
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2	0x2258
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO	0x223a
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW	0x227a
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2	0x227e
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2	0x229e
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO	0x12e0
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X	0x12e5
 
 #define USB_VENDOR_ID_SUN		0x0430
 #define USB_DEVICE_ID_RARITAN_KVM_DONGLE	0xcdab
-- 
2.52.0


