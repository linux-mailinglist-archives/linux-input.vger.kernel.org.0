Return-Path: <linux-input+bounces-17134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24854D32046
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 14:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53231314D36E
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 13:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C003283FCE;
	Fri, 16 Jan 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="EG23HQ8D"
X-Original-To: linux-input@vger.kernel.org
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121D20DD51;
	Fri, 16 Jan 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570659; cv=none; b=ZagBsUIYtlxH0D92MUhBqKWwtDa2MpX/IN24+z+AV3jV9ylw2LuD8XLWQyDV8C+FDnI4i7HDf1beKBKiYwywb2oIzmaJZCSnJuOYtWLku9xHqpYi7XKXyrLZkSt6ZMZfCZfOrUuVIx3XQi0i396b8PCtyLaAcdhMtNt+xV3QL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570659; c=relaxed/simple;
	bh=7B00bWTFczRZotRf5p6Jzti5MO+LG/J9cuFWikevjtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkTKh+L+Dw1NbJguG29zQDFAfACforAIXGmMheosKMZKN9iKNlKJ46RGIvhSPCymt2u3v635jJvSPuyaAXAa341iwgHCOTTkuw0X1EtjNZhI9s0zX/5VJ7p2eUmPzA/hp+GxIggoz3R+lmSut7qx8p1k2caRySrZfcI2Do1vHq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=EG23HQ8D; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id D76E34088E;
	Fri, 16 Jan 2026 13:32:05 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 2E206408A7;
	Fri, 16 Jan 2026 13:32:05 +0000 (UTC)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c3:fefd:0:42c:a43d:2848:c282])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id CF00C20253A;
	Fri, 16 Jan 2026 15:32:03 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768570324;
	bh=/GlAVvn2CO0NZJ1bdhUEo/jKU/saNux1zwkagaLT4+U=; h=From:To:Subject;
	b=EG23HQ8DNK8GH5r/iY25SlwNHr44DWOamXpU1xagd9Ln+clUfcs6X/uJMzFX8pubJ
	 QTMAwcdG6d0coJzXwxFaiRsGOW0ktnf2mnwoN4OJ71E+T7mpy3YE+W2QnYJjRsssYM
	 ac2aIzcdvgNyBxF/PlqC+dOm7mJK4MtN9fNQ4F3wOO8olEQ61j1aKaKou/t6V5C4Q/
	 /zjK5q5QlHMkYLxz3HN23ymHZzsywNl5pO9/YpNUoHmMxk9LAf9QUB5buxAo6pPXJt
	 LPMEi4+JFxAoj02PxJM8ILUI38XUbAJqTPD/g7D4OndLqaxG7BAj2A3wA7/IwDdHHv
	 IpAeVlVRcsTsQ==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c3:fefd:0:42c:a43d:2848:c282) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
	Denis Benato <denis.benato@linux.dev>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v11 06/11] HID: asus: early return for ROG devices
Date: Fri, 16 Jan 2026 14:31:45 +0100
Message-ID: <20260116133150.5606-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116133150.5606-1-lkml@antheas.dev>
References: <20260116133150.5606-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176857032467.3552611.9181164287335716018@linux3247.grserver.gr>
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

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 428481aa2083..90dc1fcd54ac 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1232,6 +1232,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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



