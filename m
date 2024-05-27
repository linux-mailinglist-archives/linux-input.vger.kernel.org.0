Return-Path: <linux-input+bounces-3874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC18D0496
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 16:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FB0BB30298
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 14:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD0073464;
	Mon, 27 May 2024 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoGG2lPX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230773460;
	Mon, 27 May 2024 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819521; cv=none; b=BVAKikHQuT9PG9MvwMSBG6GRWHg64z4er+FSP3Q1NfBLgW1mwdjHhkItQir0p8e7c6G1YjBjyP0f7bbJ5JqLhaMacegDgFG60mmOK0Aq9fX+0Wgtnwf+Y/aYmPDa4IUhR+miT8zzRkfqenwOXwuy4CMriHyg6zeuSS91jLskBA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819521; c=relaxed/simple;
	bh=8YHwRPAkqUfLaCoJKSO1bxrUEqC8j5uyJ/GMZaoTkMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsTroyG39xUcMFp/VPhfP/9uMleQN5eOknYizvt5rw+dfoXXVT+vCKR4dc6cwM+pOOF455EkKBy64QabGepz4lzCeN4ypSZaKliu0KEmOlWrULLn51b7FghACZFqLOdV0hvq6F+HeARKRrr1m2gN8NEHYJuoEBPYDPZ89d2ZCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoGG2lPX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF09C4AF07;
	Mon, 27 May 2024 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819521;
	bh=8YHwRPAkqUfLaCoJKSO1bxrUEqC8j5uyJ/GMZaoTkMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OoGG2lPXH4yG7ZRWz7UxvEO8A6mmEJiFoR9Vc56j3F6eyCrZ+MbGp94kwC/B4F1Mi
	 qcTL3YkoWr6xVwyrDEFxM9+EB1/uDjNJPE3xg4unzZeEKtLhG0jF5sljEAca1c34Nt
	 b1HYmBz8xVg5Okq4iYNBBweWUQ2CuHcNZfWSji0n3g8Bc+iqVKh6j3XydhsCtJQLq4
	 4+JUMloQ999mMmFa//fMYPTlE7iujfVJev7j9zhaPfu79YDGB/txowEzpzUH6RKP/v
	 isrvWvnCfvI3g8qPrOeiZfyOOZke48zOVqcC9nMwVdNxtCcEzAuURZchFNr46xtpe3
	 y2+KAaz7tzdOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean O'Brien <seobrien@chromium.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/13] HID: Add quirk for Logitech Casa touchpad
Date: Mon, 27 May 2024 10:18:04 -0400
Message-ID: <20240527141819.3854376-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141819.3854376-1-sashal@kernel.org>
References: <20240527141819.3854376-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.160
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
index 7b1fdfde5b405..0504bdd465013 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -777,6 +777,7 @@
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
+#define USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD	0xbb00
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2e14e3071aa69..fea27d66d91c0 100644
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


