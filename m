Return-Path: <linux-input+bounces-13769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC4B19472
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79D5F3B6D78
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 16:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B5813E898;
	Sun,  3 Aug 2025 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jsqVw89X"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506BAA927;
	Sun,  3 Aug 2025 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754236981; cv=none; b=XWL3AcuFEp+oPQEeG2KK2PpeWGYTz+qAasxLlBGwLkJpciano2Cis4YqM3avP/sEK1gUfo60WZKQkWSkNTSL07oHYgvJYjGglHg3QdkAcg6y/riZ9F8PEnNf7xREJe3xRUV30ctJ2tVPJrn1wFQSEF3eWGybVb9fWRndx9YS0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754236981; c=relaxed/simple;
	bh=DhXkVvqYK67HUD0X7L7vAEhJH9rCLXOnTe93zJ+xraY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWTcmNxNRccL980YPzD+YFKOHEv+ViLQDZcXS1WNWXYkMSxa7S0f4YnotE7PqzXmnnKBNaikGOcsLXU2x/q/5EM5ULe14eiSB8S6qopb/VMjRTP9i17ykIOGr3zRKnOtDmVIVBuHNwBt0yA/fFy9XXJ5rEYID6aZgtFjAIbZhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jsqVw89X; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 98A7747244;
	Sun,  3 Aug 2025 19:02:57 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 2FE6547250;
	Sun,  3 Aug 2025 19:02:57 +0300 (EEST)
Received: from antheas-z13 (unknown [IPv6:2a02:2149:8bf7:1200:9e45:7272:4009:7cbe])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 19AA91FE3BF;
	Sun,  3 Aug 2025 19:02:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1754236976;
	bh=h3CTsbyVq6Gc+osFum5TicXzOpwPj43B75L4QMAJ2Uk=; h=From:To:Subject;
	b=jsqVw89Xf1IGXc24psn1ubZhuCgQO7AdCIDG4lwoDvd5HguIHuwj7AcaA4x2ICmw3
	 5yRDRowJAK8IazaRsuEjj35INnx9lsmoj+05bkgvHQCGugZ6oXzRYKG5bXEC+ZtGPf
	 swqoS7msm/ZhzTK92/O63qkmawm1A2JECad6BIWHbILvCIFzNgYIai84uPMuzhnOHq
	 wzg5Qss209Satz2q+MSDSIMvjx5ggFUCUObl7WsAbMFj+2thCXerqURxV3hYJhEJcZ
	 C0ZfcJ4qAg765eQoFwnXNaNevG2rMGPQxVdAuNpNwSRJuwSSYZiLj25aq+jb4ckH5/
	 LLddk5tG+80Wg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a02:2149:8bf7:1200:9e45:7272:4009:7cbe) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1] HID: mf: add support for Legion Go dual dinput modes
Date: Sun,  3 Aug 2025 18:02:53 +0200
Message-ID: <20250803160253.12956-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <175423697677.1977220.16120075393321365676@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.0.9 at linux3247.grserver.gr
X-Virus-Status: Clean

The Legion Go features detachable controllers which support a dual
dinput mode. In this mode, the controllers appear under a single HID
device with two applications.

Currently, both controllers appear under the same event device, causing
their controls to be mixed up. This patch separates the two so that
they can be used independently.

In addition, the latest firmware update for the Legion Go swaps the IDs
to the ones used by the Legion Go 2, so add those IDs as well.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-ids.h    | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5a1096283855..f849b1c2efb9 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -834,6 +834,8 @@
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E	0x602e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6093	0x6093
+#define USB_DEVICE_ID_LENOVO_LEGION_GO_DUAL_DINPUT	0x6184
+#define USB_DEVICE_ID_LENOVO_LEGION_GO2_DUAL_DINPUT	0x61ed
 
 #define USB_VENDOR_ID_LETSKETCH		0x6161
 #define USB_DEVICE_ID_WP9620N		0x4d15
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ff11f1ad344d..88c89fe91689 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -124,6 +124,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_T609A), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LABTEC, USB_DEVICE_ID_LABTEC_ODDOR_HANDBRAKE), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_LEGION_GO_DUAL_DINPUT), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_LEGION_GO2_DUAL_DINPUT), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019), HID_QUIRK_ALWAYS_POLL },

base-commit: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
-- 
2.50.1



