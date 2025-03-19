Return-Path: <linux-input+bounces-10985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9229A698E5
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA9EF482C6B
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1085E218AA5;
	Wed, 19 Mar 2025 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="zuHRTYdS"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6F1215173;
	Wed, 19 Mar 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411617; cv=none; b=NxJ/6BBQeobas0Ohpve5916TAumd4FlXV5JVEIwORwuqQr4PwB510NcHy9M84BO8kkx4a2cWtTS8N+9Su/c56sTz6J/wt4584joW6cB9b/McVVIxr7eg5+RAE+a3UIpqAUsLVoXKLGjWPLhoNWPWikdOZruzkZLMIbVWv8k3V0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411617; c=relaxed/simple;
	bh=FSChMSzRlun5F9Gth0PQbQ/Y4HmeD8MHv4+WUmwxsD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQmwaGxqhxmecSMD2nEnGIFPc6JDAfzYB2lIPgJBspvITY3n/tETomIRzWiiK2mBcXHuzjtu6+pzCrVcPTHEgIdYJT6he6Zd+mKedRO7Ir3IbkgsT1HuE6BTWVxtKlB21obxzmhlSENEmJ6PUDdjcvveRlOCbLyy2DU9SnRerlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=zuHRTYdS; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 335892E095E4;
	Wed, 19 Mar 2025 21:13:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411613;
	bh=X5MzDAHYvzPqz68MFT4gIzxZ2Qr5Ms9s5Nr8impCml4=; h=From:To:Subject;
	b=zuHRTYdSxusJpEKG+TD90BwoqP6/sdQ0KhUEaMpBvdO+h7hADpMLrqtUsY6laY0XC
	 PG1iWg2BVTRxO7RIEGYpCrcswyo67EB/Jz4kc1aR1dWdGZJPa1JUI1NCDWm60Gw/E7
	 wn+BX7JNeV4r9wWpIpg6IuhPd+0sdlnALKtpFuts=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 06/11] HID: asus: introduce small delay on Asus Z13 RGB init
Date: Wed, 19 Mar 2025 20:13:14 +0100
Message-ID: <20250319191320.10092-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241161347.8125.1358787755995757663@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The folio keyboard of the Z13 can get stuck in its BIOS mode, where the
touchpad behaves like a mouse and the keyboard start button is not
reliable if we perform the initialization too quickly. This mostly
happens during boot, and can be verified to be caused by hid-asus
through simple blacklisting. A small delay fixes it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 85ae75478b796..5b75ee83ae290 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -571,6 +571,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	unsigned char kbd_func;
 	int ret;
 
+	/* Wait a bit before init to prevent locking the keyboard */
+	if (dmi_match(DMI_PRODUCT_FAMILY, "ROG Flow Z13"))
+		msleep(500);
+
 	ret = asus_kbd_init(hdev);
 	if (ret < 0)
 		return ret;
-- 
2.48.1


