Return-Path: <linux-input+bounces-16953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A3D108F1
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 05:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A64307CA53
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 04:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD2A30C616;
	Mon, 12 Jan 2026 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grjjtd0I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920730BF78
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 04:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768191674; cv=none; b=kFZ486FrQrqFx6Q+lPOtSQCYefi97s54bAglmBcO81YzH4KHzLxHyCLgK4TYSQmnrkUuMDaRr4CgONMm4Hb4PyqDzJ8l1R13wIBP6Q1nB1TTRVfV7HkbsHfktQCThEcRimcHuRVroRyNEZAb/1HL7m60FEmIBZ3yPqpGiAGcKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768191674; c=relaxed/simple;
	bh=G4hkui2frOo0G/r9Uz0v4AWWhohtaM7V20BKdV6se6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrhVzqh0uLlM4AYDNVyUImZW3CQzlguSwwzk+VObQTIHtlWKhOm4s65Vx6i2W0wDBFlzTqnM1mNehXdVclKp8M5IxkpN5/nEENY0O05fMcAEa4W+TCQ2qqBOkDN5rkZI9FiYzAiYXbnmaOJVplu65RUUuHW5WvvjQA/JB0Zrjn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grjjtd0I; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b23b6d9f11so651446185a.3
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 20:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768191668; x=1768796468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJByTbifGyBY6Vqv1f83yZO8v3AvpdnFvxtb7bJ0Bn4=;
        b=grjjtd0IBhaGSzUf6eKEOmVpfZIMDfXWJZ0V7J67aXKpRnCM+7FoqK+2By0pMw/E+C
         HVv3dbYE280tFzzJcPtsygaDizvknJ0MnsV+Vev2UmG/+s1THBvkuPuIPtRzD0mOGjaf
         zL1DKtoee8Ry1on9AHk//qVHyXj4C0iK1Gr1GrAxx9YPH7Rn/KUxGTZOnXjHUJcgDFmD
         lkIa6/mu+KjHA4WyDa8XzVN51/xyEPOJHt9xvMmxFgaQokDetvU8QF14lmQ/H1EBx4ty
         EppMlcZdDhA1ymdQukXIY/AbRQon6SYb/xu/9nFFysdt9em2sahIE10iQaJrMOK/wtA8
         hBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768191668; x=1768796468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJByTbifGyBY6Vqv1f83yZO8v3AvpdnFvxtb7bJ0Bn4=;
        b=ZfnmnGaR3RqSX33La956ACxZqBXz9O7WiUs7FivhJ/groC0uimtobqIq/azsn3os5L
         lTeXKI/TBv9rvoNcOkqD0X1it6Eq1po8Zw8sy5tvolzHs3S1XrH3aXfudJqqOZTUqQqQ
         mlpT2FMNyUNWj0lgmjYBqqwA0udHvwmKV6NnE8XAEgurCRhfIMnH3/IrIPHVICO2deg/
         iqutL/edr5K+f7Q5RdOXDY1z6m/PKLpvjHwHrXwwo1KcEggBwvCi5C66Iesa+1xVhGu/
         xpWS9epMIp3xg2QS4tzsPTTnIRzi/rNv4X1ziOU8ATC7dovR0atCTDvTWkAlx5ODEV31
         APbA==
X-Forwarded-Encrypted: i=1; AJvYcCW8EEUJ5DgeM9aJ9Pnu+c9OTAlUqzTeiDa5PpWMQgHX6LvR/+BiCf1sU5cLWLbTjgNHA81PdykTYA/pew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtPoubDgsqVpYUjuyPDWBiD91v4jCj5cb3oxDVo/wRts3YNKj
	cSUPuX5qfguN7B6YTYIuDXVTFla3qBXYyVWBOm46ne6IeDe9jgopg46b
X-Gm-Gg: AY/fxX7juh26Czk+twnnRllqPkCcfBvagVk1b0t0EieTcEW1o4Du9nbzHkOQkwBEjo3
	Wd6fPF6PZhIZaDoMZAm09dQW6J0eXoKzuVkmidnBb/qczmcETExSBiTrl7SK5fz6Lmvhl6KFTOd
	bF2HHR9tdFYZKj/yp72b3zb24RWGwK4nUmLf2iixvFXrkO2FiNxxJKwtRQvvJB8UwLgZio2jUxO
	yqEzDn4Bc4tcaL1lCQOIvpqzaUN+jSBxTiEROofpUdQEUVQ8ruWQu5cGkvtSIEspzzze1gtxE7j
	J5FvnKv5bMMcpU6d+2EbIOb1SnC1PoNO/JknN045WPxqOvaqmVFni6pO/4NuThx1acBsViAjH4l
	66cwl+kRe7WUQL7oJPc/iGLJyFzKPpj5H8LM/ZZUIRFlSL34pLFb/YhlL5Mfy0Gdw5W4CeB8W6F
	mcDLLOe4ELK27nHhegnLtJKThJoDfT0dh5hdX9sg==
X-Google-Smtp-Source: AGHT+IHE8Tv1WFOJ+iS9My+2h1MSUFzPQ1qnC1S1DXFaENWTYlgXCLtOScVhFa56J3G5hjhmbJ4MuA==
X-Received: by 2002:a05:620a:7101:b0:891:3606:7f3a with SMTP id af79cd13be357-8c3893ef6c5mr2252812085a.45.1768191668172;
        Sun, 11 Jan 2026 20:21:08 -0800 (PST)
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
Subject: [PATCH v2 2/4] HID: quirks: Add INPUT_CONFIGURED quirk for SteelSeries Arctis headsets
Date: Sun, 11 Jan 2026 23:19:39 -0500
Message-ID: <20260112041941.40531-3-srimanachanta@gmail.com>
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

Add HID_QUIRK_INPUT_CONFIGURED for all SteelSeries Arctis headsets that
require the hid-steelseries driver. This quirk ensures proper device
initialization and prevents conflicts with generic HID drivers.

The quirk is necessary because these devices expose multiple HID
interfaces, and the hid-steelseries driver needs to bind to specific
interfaces based on the device capabilities. Without this quirk, the
generic HID driver may interfere with device-specific functionality like
battery monitoring and feature controls.

Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
---
 drivers/hid/hid-quirks.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c0..8a7c3f433040 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -699,7 +699,32 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_STEELSERIES)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_SRWS1) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_1) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_9) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X) },
 #endif
 #if IS_ENABLED(CONFIG_HID_SUNPLUS)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SUNPLUS, USB_DEVICE_ID_SUNPLUS_WDESKTOP) },
-- 
2.52.0


