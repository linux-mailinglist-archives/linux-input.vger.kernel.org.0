Return-Path: <linux-input+bounces-15143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E12BA7499
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 18:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385013B8386
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 16:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255AA1DE8A4;
	Sun, 28 Sep 2025 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=it-lobb.de header.i=@it-lobb.de header.b="iNkgAjCq"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56821BEF7E;
	Sun, 28 Sep 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759076803; cv=none; b=KcKA6skuqdK5eM9qm4Yarrl4JREpTs78ujzLzaXT3NqvvDnwDuOBZSdb7u4EOI8KNzLweTWr8Sqx8rv6fQP0NcQPmlxR1WUiBabK/BYdrgYmIzq9XTIRNVdTZ79tjSb473bKmpWV3WQfSLTES56OIsdVimY7Q6nqn/MTe5+wuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759076803; c=relaxed/simple;
	bh=AHtZu5ICjc2NQfb/+Dr2pZNynD9xvoPGlV4wIj0BerE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qrfvPz4fQrM96AJ2ZGmi2D7WZQW4smOF9x9tPazMTrrw9SUekTVqOew52ComVXFeSW4bOXNvOD/LIsvvzLQhEkTY/GLcWDdiAPUivCcxtO+nqE8BStROBxKUF8UzhMnheitK28MmXYV1t925RDODfYldyEQdCR48f32aYFmo3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=it-lobb.de; spf=pass smtp.mailfrom=it-lobb.de; dkim=pass (2048-bit key) header.d=it-lobb.de header.i=@it-lobb.de header.b=iNkgAjCq; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=it-lobb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=it-lobb.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cZV7n219pz9ssx;
	Sun, 28 Sep 2025 18:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=it-lobb.de; s=MBO0001;
	t=1759076789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PSgsQwICSqCvJ6lryGQVAJWlM/hvzc4IQjjw22uC0x4=;
	b=iNkgAjCq92WH0WGTRqgHWf5P0C+9ZgbS2lesNYIWFQ1Xpf/aEuWG2Sc41CKljrcGoOYDX1
	u/LWEXWShkX+38F2KcS5hxqAysPVftnbYvHCJiiaeN0LiHANwqYQvL2XbGaqUf/ypWDmq3
	xkgF67R1gkSUgLcK1SQmSFK+GO5rojwW+HWmalzOMGXBVa4Vj69Jkihi/Uj0uBP2CboCGU
	uWj81UEnlpUagmHN/mg04/TlByiS76UpVqqM2/wqC1niycBk8EH+atSlKLTS2CsOpQq1HP
	v97EFd/DXwpgrJijYCS3R3WD642n8cKlbmWthB5CLBbURcySjtbDIeL3/sJCsQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tristan.lobb@it-lobb.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tristan.lobb@it-lobb.de
From: Tristan Lobb <tristan.lobb@it-lobb.de>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Lobb <tristan.lobb@it-lobb.de>
Subject: [PATCH] HID: quirks: avoid Cooler Master MM712 dongle wakeup bug
Date: Sun, 28 Sep 2025 18:25:43 +0200
Message-ID: <20250928162543.226114-1-tristan.lobb@it-lobb.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4cZV7n219pz9ssx

The Cooler Master Mice Dongle includes a vendor defined HID interface
alongside its mouse interface. Not polling it will cause the mouse to
stop responding to polls on any interface once woken up again after
going into power saving mode.

Add the HID_QUIRK_ALWAYS_POLL quirk alongside the Cooler Master VID and
the Dongle's PID.

Signed-off-by: Tristan Lobb <tristan.lobb@it-lobb.de>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 149798754570..47a7f295764b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -342,6 +342,9 @@
 #define USB_DEVICE_ID_CODEMERCS_IOW_FIRST	0x1500
 #define USB_DEVICE_ID_CODEMERCS_IOW_LAST	0x15ff
 
+#define USB_VENDOR_ID_COOLER_MASTER	0x2516
+#define USB_DEVICE_ID_COOLER_MASTER_MICE_DONGLE	0x01b7
+
 #define USB_VENDOR_ID_CORSAIR		0x1b1c
 #define USB_DEVICE_ID_CORSAIR_K90	0x1b02
 #define USB_DEVICE_ID_CORSAIR_K70R      0x1b09
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index f619ed10535d..95acc3f76d4b 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -57,6 +57,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_FLIGHT_SIM_YOKE), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_PEDALS), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_THROTTLE), HID_QUIRK_NOGET },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_COOLER_MASTER, USB_DEVICE_ID_COOLER_MASTER_MICE_DONGLE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB_RAPIDFIRE), HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K70RGB), HID_QUIRK_NO_INIT_REPORTS },
-- 
2.51.0


