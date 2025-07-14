Return-Path: <linux-input+bounces-13528-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FBDB0442C
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 767D8188FCD7
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3730B27280A;
	Mon, 14 Jul 2025 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="O0U5Xbgi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail1.khirnov.net (quelana.khirnov.net [94.230.150.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519662727F2;
	Mon, 14 Jul 2025 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.150.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506906; cv=none; b=NFowidE0lSNV6EGs13gmOj4lS7xq5dz5d7OTwAHmU6cqgBtZG8MEgeSTVtSxG/56t5SuJtLS+cVKLOZ7OF706JqHfKbJo6tAnf2yxX1xH4YlPDIHJy2+IUuwhd35DKmbiazuT+Vi7mmd5eitwcM2lzUT/ql5j/LCpL4QuL86j6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506906; c=relaxed/simple;
	bh=P2IpnwbWDRDWxydiOVjH3s3BlBz5c8M4bMFpvikwU6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ifM5fqRI2jMUDWqOgr3l+ins4Aed/AaLTyaG9ljqYm24s+DH7VpIL1n9DZ8RFgP1TKT597jHyHleKPm3vscw5btTRssZpZ3kWNUbjdhH+5uwoVs2Jg0cy/3b2bMS/MNVCi5wtaKWZCym1GIez4WZaqxi04cnU6J4IqSrVNBNvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=O0U5Xbgi; arc=none smtp.client-ip=94.230.150.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail1.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=O0U5Xbgi;
	dkim-atps=neutral
Received: from localhost (mail1.khirnov.net [IPv6:::1])
	by mail1.khirnov.net (Postfix) with ESMTP id 755D23290;
	Mon, 14 Jul 2025 17:20:10 +0200 (CEST)
Received: from mail1.khirnov.net ([IPv6:::1])
 by localhost (mail1.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id DeuxzCk7fRZA; Mon, 14 Jul 2025 17:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1752506404; bh=P2IpnwbWDRDWxydiOVjH3s3BlBz5c8M4bMFpvikwU6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0U5XbgiFRvbQLrPJzaQ/BtNisKyo5CViK4KPAwq0ufz82Hn0gSJL8FOjv/LfJ9nZ
	 4kNx2pr/ErjXF8V/b3P+BEXKAF3XUjR1aizLirgi9MyWFQDeLVQt7Et02oAIIe2tvG
	 O7r4teV6f2nHthrW+mfkQ8nVsaqmrOHNMaUOLE1hZ6Na1zTV2DyW+TnitWQ0l5cYeW
	 3zuKHneiPCKApXRp8iqu3hsiB4+B/2KVBkgKuvOg/jPoT8ghJH708XJoOjB6gAK5RD
	 WGbWIM7PX7eEuBhsEG22znz7baJvwYY6JCG+/cVd701Aq5WSnpQSgmS/bb03p5V2IG
	 UC8y9Uc9SH1hg==
Received: from dev0.khirnov.net (dev0.khirnov.net [IPv6:2a00:c500:561:201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "dev0.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail1.khirnov.net (Postfix) with ESMTPS id 78E8CEFB;
	Mon, 14 Jul 2025 17:20:04 +0200 (CEST)
Received: by dev0.khirnov.net (Postfix, from userid 1000)
	id C67E8404ED6; Mon, 14 Jul 2025 17:18:30 +0200 (CEST)
From: Anton Khirnov <anton@khirnov.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: asus-wmi: map more keys on ExpertBook B9
Date: Mon, 14 Jul 2025 17:07:59 +0200
Message-Id: <20250714150756.21197-3-anton@khirnov.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714150756.21197-1-anton@khirnov.net>
References: <20250714150756.21197-1-anton@khirnov.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* there is a dedicated "noise cancel" key in top row, between mic mute
  and PrintScreen; it sends 0xCA when pressed by itself (mapped to F13),
  0xCB with Fn (mapped to F14)
* Fn+f sends 0x9D; it is not documented in the manual, but some web
  search results mention "asus intelligent performance"; mapped to FN_F
* Fn+space sends 0x5B; it is not documented or mentioned anywhere I
  could find; mapped to FN_SPACE

Signed-off-by: Anton Khirnov <anton@khirnov.net>
---
 drivers/platform/x86/asus-nb-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index f84c3d03c1de..9d2fd7bc3ce1 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -582,6 +582,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x55, { KEY_CALC } },
 	{ KE_IGNORE, 0x57, },  /* Battery mode */
 	{ KE_IGNORE, 0x58, },  /* AC mode */
+	{ KE_KEY, 0x5B, { KEY_FN_SPACE } },
 	{ KE_KEY, 0x5C, { KEY_F15 } },  /* Power Gear key */
 	{ KE_KEY, 0x5D, { KEY_WLAN } }, /* Wireless console Toggle */
 	{ KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
@@ -618,6 +619,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
 	{ KE_KEY, 0x95, { KEY_MEDIA } },
 	{ KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
+	{ KE_KEY, 0X9D, { KEY_FN_F } },
 	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
 	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
 	{ KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
@@ -632,6 +634,8 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_IGNORE, 0xC0, }, /* External display connect/disconnect notification */
 	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
 	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
+	{ KE_KEY, 0xCA, { KEY_F13 } }, /* Noise cancelling on Expertbook B9 */
+	{ KE_KEY, 0xCB, { KEY_F14 } }, /* Fn+noise-cancel */
 	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
 	{ KE_IGNORE, 0xCF, },	/* AC mode */
 	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
-- 
2.39.5


