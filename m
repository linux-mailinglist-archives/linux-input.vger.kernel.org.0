Return-Path: <linux-input+bounces-3865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC918D039F
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 16:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94312A5848
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 14:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1251802A3;
	Mon, 27 May 2024 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrFNN52V"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9071802A1;
	Mon, 27 May 2024 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819315; cv=none; b=sVLDHy5/vSdzf7lPmvhdsqZV0lgEcxlRcpKNu9moFfOHTgGR2TqFpDLBAtdfEqtYclJkVXUJ2xtGSVthkynsJOe1dEfUSejy0pVFeyY1W9U4nZaVwH4S1KSfRYO1ozNQqsq/9VygWEekTcZFF4a7V4hKOZUCu+9MBGb/wbg35HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819315; c=relaxed/simple;
	bh=5LfVtdxZ27nRcD4d7R58w7NK8PLqR6710aI2XAR26Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFEhVIheGPELvPxOJltbve+xeZAw0oUtCF9qmeQ8Hpi6mV7lMtrJTW3p+Q4aIuXSRCKDsHBJpdH04nW0zcVIZpKQaVO8+1/rQhudeMPL9T5CeEVQ9qmGMqBBINL7uim7J12hChvpTKcpd90u+Uy1vvEPbCXDYCks5Qt5dc9HfY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrFNN52V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA053C4AF08;
	Mon, 27 May 2024 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819314;
	bh=5LfVtdxZ27nRcD4d7R58w7NK8PLqR6710aI2XAR26Og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lrFNN52VDqi0Tz1TQ5ZcgLdA6nsraG3FWsrDpCPQXi4ZTK5doCUYRg/Wje/Cxrt9e
	 oAOBYF0tpdVwcvPfyUmAfJ2/nuXHGEDh8AhpShT/wmKo9Z/kHUNb4ih6LzxIr+hdr/
	 oPzuAtBoyIlRHfPmRU230AuGtOaUco7FwUDtWgBwvZY1goAA5l80rxTPkskgePABH+
	 LFoH/ADEf8oo7dYdIgW0KVjFrmyiLGg1Kt7Ntm2EGfV9W8x2bCmLciOsQaM30h0Rtu
	 Jvm7wTxHKTrHrSVtssqdGloTWWwKFo4bREHvt84ynhymW4Bp196JJ6qUlGj4OQlUKB
	 5WMA7SN0SgEkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean O'Brien <seobrien@chromium.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 24/30] HID: Add quirk for Logitech Casa touchpad
Date: Mon, 27 May 2024 10:13:33 -0400
Message-ID: <20240527141406.3852821-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141406.3852821-1-sashal@kernel.org>
References: <20240527141406.3852821-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
Content-Transfer-Encoding: 8bit

From: Sean O'Brien <seobrien@chromium.org>

[ Upstream commit dd2c345a94cfa3873cc20db87387ee509c345c1b ]

This device sometimes doesn't send touch release signals when moving
from >=4 fingers to <4 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.

MT_QUIRK_FORCE_MULTI_INPUT is not necessary for this device, but does no
harm.

Signed-off-by: Sean O'Brien <seobrien@chromium.org>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 175b6680087e0..58111132ec528 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -823,6 +823,7 @@
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
+#define USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD	0xbb00
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3e91e4d6ba6fa..94ca12ee74956 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2082,6 +2082,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB) },
 
+	/* Logitech devices */
+	{ .driver_data = MT_CLS_NSMU,
+		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LOGITECH,
+			USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD) },
+
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
 		MT_USB_DEVICE(USB_VENDOR_ID_ASUS,
-- 
2.43.0


