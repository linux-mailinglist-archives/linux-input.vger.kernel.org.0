Return-Path: <linux-input+bounces-14355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970BB386DB
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 17:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A973E462F0F
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 15:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D00A2E0910;
	Wed, 27 Aug 2025 15:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="OcAiS4F1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail1.khirnov.net (quelana.khirnov.net [94.230.150.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE262D3A65;
	Wed, 27 Aug 2025 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.150.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309300; cv=none; b=N1tl1lrB8X2L07czFEsxsRzAZT5yD5vP32DcvafzIuBJ/Igr/cr+l31A1GUilD8mGDwPJgxLV4VouBtb6ttct/zQYIZbbrl+7hmT5jZeV6BLqcEaeNIloMjBxiLsLuatys3jYYCztfCPt8Tfg6kwpK+FS6aHdVp6YTKflHd1hJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309300; c=relaxed/simple;
	bh=gD8kF92HRH+Visy2lZQ4To2uQb0bha9BsVW+KZEj9NM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I6TWQHpbDslxIegiq6QLhav1Ye5xPR2ps/crktyYz0VcA3A2OYYUInCu9Ynbs5hXP9VVmc5Hk41/cBDCZsDT8YTyXFN3IQTVeyi4w/xOgvhl9RPlqVsbspsU0dJ7228hKOXmj9kk9oWdnGe8v20PZqoXKnK4qOS2N7e4XrSKWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=OcAiS4F1; arc=none smtp.client-ip=94.230.150.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail1.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=OcAiS4F1;
	dkim-atps=neutral
Received: from localhost (mail1.khirnov.net [IPv6:::1])
	by mail1.khirnov.net (Postfix) with ESMTP id B4A653FBB;
	Wed, 27 Aug 2025 17:33:16 +0200 (CEST)
Received: from mail1.khirnov.net ([IPv6:::1])
 by localhost (mail1.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id HlDlsPuRrlJc; Wed, 27 Aug 2025 17:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1756308795; bh=gD8kF92HRH+Visy2lZQ4To2uQb0bha9BsVW+KZEj9NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcAiS4F1TM0sAH2xf00NluMr02l9WAEIRZ+8V6v7+poH47Tpza93r/7G8FRVPmLSI
	 avsjPcC0NX9nRAUrTcj/JnpLHX5yFQrOSvgjGMNS9RryX439Jp+/ycMC7uPEmFw8l0
	 glnoqUvOn433rk8je/BR2cPhvQnOLza4py0N+oUwdvpEZOpD8xiFWNj+cNqKa5WBYe
	 vW0mM9n25FVCBkmhZAvkLozhWDgkJe17Y5ts9hhWza4ZmYJakryPv/PyZQeuwSAnBF
	 dwnEYgS/1O7fwNfuMama9H1ClOYBM2RGmwbBsBQgOpl3Cqv9ABtJPqz2xaWPc5JAvV
	 hNw9cHBWedlGA==
Received: from dev0.khirnov.net (dev0.khirnov.net [IPv6:2a00:c500:561:201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "dev0.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail1.khirnov.net (Postfix) with ESMTPS id 8DCE23248;
	Wed, 27 Aug 2025 17:33:15 +0200 (CEST)
Received: by dev0.khirnov.net (Postfix, from userid 1000)
	id 75EF5402C62; Wed, 27 Aug 2025 17:33:15 +0200 (CEST)
From: Anton Khirnov <anton@khirnov.net>
To: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Anton Khirnov <anton@khirnov.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: asus-wmi: map more keys on ExpertBook B9
Date: Wed, 27 Aug 2025 17:29:54 +0200
Message-Id: <20250827152954.4844-1-anton@khirnov.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <e39cf267-0784-4b56-a989-349e84487bbf@kernel.org>
References: <e39cf267-0784-4b56-a989-349e84487bbf@kernel.org>
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

Signed-off-by: Anton Khirnov <anton@khirnov.net>
---
Hi Hans,
would you mind applying this version of the patch, with the Fn+space
mapping left out for now?

Thanks
---

 drivers/platform/x86/asus-nb-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index f84c3d03c1de..dba3c1488db2 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -618,6 +618,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
 	{ KE_KEY, 0x95, { KEY_MEDIA } },
 	{ KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
+	{ KE_KEY, 0X9D, { KEY_FN_F } },
 	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
 	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
 	{ KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
@@ -632,6 +633,8 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
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


