Return-Path: <linux-input+bounces-16707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8372CE4B98
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 13:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40BB0300EE4A
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 12:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B54A2C21CC;
	Sun, 28 Dec 2025 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aibebcRX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1C233722
	for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766924439; cv=none; b=jgJGRuhZulTxsoyaN//ACvO6275lsabR6qb1tw2E7RYnw4EuIKdOCNZjAuhMAQbs87nrXZkQmJRHfnty4FNKZYt80rG4DHcP/4iB6LLrAFFnJaT8x3YetLZVdMe0FI3/fKmUf0qyBvpTEtLyLp2v8/3jR9vW8z7m2WMHuiIVMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766924439; c=relaxed/simple;
	bh=9z1wDtyXAKdNssFFC3WXPfXTJTLvOapbY7cyoZAzros=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jN6QE/AUh2kbyL4UTTQtA2GmVFncVaK7t1yglgADyKCdxl2n5aCQRs+vhG6K8cFYq1B8KjdrYptQ5OHChBKZbzO2VSvQ7JxaRA2aR2Mf0vttXinfGN/FLTIsLVdkEO+d3NndDOpADiifWA//QHm+hvsNRwIf5GeguQUoD22yFtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aibebcRX; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8ba0d6c68a8so940017585a.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 04:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766924437; x=1767529237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP23ZQnFxI3fXmimCDZNTyoOhWpeH9X/COG8zO0+xzo=;
        b=aibebcRXfnw1hqj8dOdrlTXP24I/983D9y7mHXiD8mqL2fZcThKG5TF+SFI/FFPxAf
         5Znd2feXRPYyjRKFd6tncSIiHWyo3nNqOE4H7DnSL9taLEKr7Ek+s/DzEASkUadW/6N6
         8NDby8U1svX60vN+j3v88v+5BnqHtJkCPgP5KeX6mHgIwvXFsdg0N/FTgUdmvALcSR0c
         KcvZw1kZJ/3ebj71st632ihGQ70sqDilYNvSW2ieBFVpk8b99sVuMx9WaTAT9ky6mKAl
         JF76D4dG5P9z3pQDOetlR1MAlYLBJVHXb+TKBy74eGfFeuY6Dl6urbO550kPQMOIUJr2
         Oyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766924437; x=1767529237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aP23ZQnFxI3fXmimCDZNTyoOhWpeH9X/COG8zO0+xzo=;
        b=OGxWJ3cAOWfmjtrumhhpP0oI/6Jr8PkZEpCssOrll8CuwaMm47BfmvWNEpcLHIQkO8
         l5+7uj9QdjE1tr22C7GzOmlcJFHs0VeDAlMxOVS8+/vCYM9H7hDIMI956D5FnZ2X2DSt
         QtCV41UWsk/ZG4lSID/s9SqCpcrybt75ZkNE9gvfpmrRTveEyKhBWZVZdKQJfA91Eb/y
         1AufT3pq1Xy+paIDq0tRXCcSpC3AMOwc4qH41a7vCX5/D7je44gIJwSFiOrQ1hKQlvRp
         6CFHUhfI7Qmiu/sn8HczdhxtRk6zZKwy/eMuFSlmJ5DZH91Kc63LypKfZXZzWPzt3wUx
         bIEw==
X-Forwarded-Encrypted: i=1; AJvYcCUCRGMc++ISiOP/36gF9VlyxrkTznauqb3yP70LrooL7p4iJrKY0i5l//7JyLNzH/GGqElh+kMRKivbvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqz97ImeIg1BSU0nEMhLW1QtK7DJfznJyn9ucWdY9LjcQicf62
	D29U8kplY5AsZt2Y/egZ6G/XND6oP1wpzFN2eCLtK2b4gg2ZAsEvHnsh
X-Gm-Gg: AY/fxX4l0CNYwDvlO8gKh0Azh+ezKI7pBhT4WrKn6aGnqWaS6qYYFXwMgL8g3Mp7vn5
	UJoFKXMLMa6FOrkCYscqC/3RP8K+KNqznMzK2XdfO+YpAdie2124zKqvx2ZaaUB6qd6OEPC3dEl
	hrQMk9RDN4PEYt4FuNmCKHqnIMgQQ77lOsMXioQflI5vvwS74gqLHuv7gPhRj4PBakuLklr0Rw8
	+HPXKCgRuY68Q8MYKis1JqGT8awbRW1hFYQVuasJYe0zOFn9eCCzhFU/JqPBdzXfwMTINVRHlRv
	dS+1tFyzaoXGBOX2cbyXPJ7okmL9mqsYOE9LjsOssFBk19FAmEkbl8Tzl9bh4bm5xQNER6XNOI8
	yAJtH/3kKxG1vlwVwl7VNRFby2CnkHmjInw2X5juOC6H/Tz3Cd13akDj5YgEPihHlyBwiB7uJVy
	E0SEM5xYtfgLe77Nd/Fl5g6kqIWJicYiSybf/S4EY3DwMpGAs=
X-Google-Smtp-Source: AGHT+IGKUm4qnxjKkhPlQb42QA9R0SWF/N4glxGsf2Sm+I4oeaJUdgpdp5qWE7nMKBxPxMaUiHG+PQ==
X-Received: by 2002:a05:6214:2306:b0:88a:309d:d780 with SMTP id 6a1803df08f44-88d82234e21mr538433766d6.29.1766924436608;
        Sun, 28 Dec 2025 04:20:36 -0800 (PST)
Received: from achantapc.mynetworksettings.com ([2600:4040:1233:de00:c673:8e0d:7a28:6166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm208744456d6.43.2025.12.28.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:20:36 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH 1/4] HID: hid-ids: Add SteelSeries Arctis headset device IDs
Date: Sun, 28 Dec 2025 07:20:22 -0500
Message-ID: <20251228122025.154682-2-srimanachanta@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228122025.154682-1-srimanachanta@gmail.com>
References: <20251228122025.154682-1-srimanachanta@gmail.com>
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


