Return-Path: <linux-input+bounces-16233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89CC734A4
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6599D356C18
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0655B30FF3B;
	Thu, 20 Nov 2025 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="TrmQBBit"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E70C2F0C7D;
	Thu, 20 Nov 2025 09:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631997; cv=none; b=FDeYHGqARWXLyZjA0t6cYYjbEUcGJmixx8CwUL48jVxQJST2iJ1Em1ZJ+0R+g8jE0wUyGjFDmuImXRE4TP2DKshOkc898kr31Xg3mv2ZvQvoHJ9AWqsR7xOIb/M83tL7bo0rUM6iqGmF79R6al7DtFYYz4gay8MM7s3O5U3+6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631997; c=relaxed/simple;
	bh=wWg8QNr0FyH7xFsLomv4FjvFmb3WDim7ZRLGcEqJhqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyFuy5I1mLfGrVGfluHbhBfq5vrq/UY6mcVsIB+U4G/AaloqxjGfTDfJR13WQTd0zMQs8CsqMEVpD4Mt6IwAeYXno5TU8hIN7z1AVNEXSp8JSOF4d9OtY9a6XW/Fl0k5JK4Kf94jQx+YeRPLYgab/pX9GnN1DnmtiN+24gruqTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=TrmQBBit; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id AC8DE5E5F2;
	Thu, 20 Nov 2025 11:46:34 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 38AC05E567;
	Thu, 20 Nov 2025 11:46:34 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id BD6DA1FE2E1;
	Thu, 20 Nov 2025 11:46:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631993;
	bh=PE0/ftMO6HMWnVP4uB//u99l0xua7PGR+qAAsD061oU=; h=From:To:Subject;
	b=TrmQBBits5+RcyqMDrOMbSZWCNcKZ7NEvuBUxRSPxGe6/JMmoXWe6LDIPDXwQ7ATq
	 cw1NnTRtJyMcsqFCa2maOsSAXnSjStbtLf4qutJyL7q6EBk7H6dpAt97e5GbqIHY3/
	 0lxIWwo4Vw1YpZrh5EIJFBvW6dzlKpEuHCz/1hM8lSZKfzPv+R/p6wUHpcFqeBUDhO
	 IAnOSCbfNCQyr8LZ2EaGzDwA5iAgIWaWO8BoCbTnIt7NnZqAkvMq5FGpXebs2VGBIy
	 J78zraYXcJkMEtSp+qVqrOqDLhBA4ekU0EpYCzt2QwrNSGhxR0ciIVDYkSQHZvVKjv
	 b+23UXzMAOEkQ==
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
Subject: [PATCH v9 06/11] HID: asus: early return for ROG devices
Date: Thu, 20 Nov 2025 10:46:12 +0100
Message-ID: <20251120094617.11672-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120094617.11672-1-lkml@antheas.dev>
References: <20251120094617.11672-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363199334.1475148.7340417949826744481@linux3247.grserver.gr>
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
index 3047bc54bf2e..6193c9483bec 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1236,6 +1236,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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



