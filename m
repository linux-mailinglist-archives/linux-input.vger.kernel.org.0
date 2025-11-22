Return-Path: <linux-input+bounces-16287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D4C7CD34
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 12:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30DEF3A89F8
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 11:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9602F2FCC1B;
	Sat, 22 Nov 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="FcENXlw/"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957A236D4E7;
	Sat, 22 Nov 2025 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809277; cv=none; b=HNdAAhE+UHDANABJNZlQfMBbr3y+he574+uMMflLmYZUeTlIrk2UdsnG7YJOZyZtHUurHouZTH63aaNqnmhxM2STTVjXRTzTSmqiMLEnQbq/gUVJGtXYZX1poSQazakSyoSH5DrMPHuaI9hU++oKGB7DNoUliDdB/XUhkySEiy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809277; c=relaxed/simple;
	bh=IuDNMm3KLCYXPhzB/AoRaX7aPtmhcm2KlnKBs6vc6Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPnTK98AOpktl+Exq3aTkF1Vm5hq5P6Fob2KhSlZp+7F2QxAoDtDCneCsEmRI9Inq1WNR1q3Y2Ni7ZC9BdNuMR3/H6C98bSVeg/wLTCGKcvOfXAWo2kFGK1EcLMLACxreHQVoFKgFCdD0aH5li7oxlj/H8b4cftBV/ro8Frg6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=FcENXlw/; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 4C9CCC16A9;
	Sat, 22 Nov 2025 13:01:07 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id D8EADC1679;
	Sat, 22 Nov 2025 13:01:06 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id DBB3A200E45;
	Sat, 22 Nov 2025 13:01:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763809266;
	bh=140TIH+X7IsBcEB9qEu0cPVWSyXR2X/IymDVePal/Zs=; h=From:To:Subject;
	b=FcENXlw/ASlzlKuC/9QPctDNm7t55kucRUxPGrKCTF8EQdHxrVS5K1djZKjaYIC5T
	 iZqkCO9z1uJMmCu9sb239RxHIxXR7pFS3WHHGmGGPZi2sdxpkPnVbk33Kyr9GeH7Mf
	 djNM//jwEyR8a7h1Z+7E7K4Y2vB2LBh0vF6G41wiqPb3j9V0jmY6ri7OLQLURoNICd
	 xwuAaer8VE3PvJZw7vjufD3h6BllJ5/2w/e4WskuHQYlrQwJRFbOgVGYdW4d4RyHeu
	 ij3F+jdcpjgrbmhoRemelWSAxsyJbWX9TdqZuWBegEohSgkHcWOz1Z/yh/j+aosRky
	 vzWusovL4ZSLw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v10 06/11] HID: asus: early return for ROG devices
Date: Sat, 22 Nov 2025 12:00:27 +0100
Message-ID: <20251122110032.4274-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>
References: <20251122110032.4274-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176380926645.360346.1130284874696123184@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Some ROG devices have a new dynamic backlight interface for control by
Windows. This interface does not create an ->input device, causing the
kernel to print an error message and to eject it. In addition, ROG
devices have proper HID names in their descriptors so renaming them is
not necessary.

Therefore, if a device is identified as ROG, early return from probe to
skip renaming and ->input checks.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index faac971794c0..461b0f8efdfb 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1235,6 +1235,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	    asus_kbd_register_leds(hdev))
 		hid_warn(hdev, "Failed to initialize backlight.\n");
 
+	/*
+	 * For ROG keyboards, skip rename for consistency and ->input check as
+	 * some devices do not have inputs.
+	 */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
+		return 0;
+
 	/*
 	 * Check that input registration succeeded. Checking that
 	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
-- 
2.52.0



