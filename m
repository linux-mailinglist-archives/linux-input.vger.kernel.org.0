Return-Path: <linux-input+bounces-7740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F509B2E08
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 12:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC07D280C54
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229102022C2;
	Mon, 28 Oct 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxUVh9km"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E474D1D63CD;
	Mon, 28 Oct 2024 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112800; cv=none; b=FD1rYHKlx91dqChqp4ZFkxwfbYvGVZ9VVL6hTbFuRT6TfbI7zEZi+2ELC3L3TyPDX1FWaqpBTReUgph04LGDs+KLe6bdzUnHXkgKK8VqhJ9cHxFi3L8gfPzZCe2sswOg2BxBeKiaFenejpQ8rOUnNL7lQIoL1haZituEm22GXHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112800; c=relaxed/simple;
	bh=8YctB3KDr70A/mrgIcg/DTHzLxf2NxDfHdwZYfqXQ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELH+vIRneawWPuOAGG2MbjNwwxNeONOsKUa7Mni7Lx4t5YV03UkUAbYEBmUhwj2QmT1GDBJD2Z0pQL9zTODsAjD9XgD2PV1wPy6SgM7Ia37N5Sm2iZln4B1Q2xrWmJwhbwvjRiKxRkjsPA8V69cg762ls0kIWJxFfUMg471WIIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxUVh9km; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A42C4CEEA;
	Mon, 28 Oct 2024 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112799;
	bh=8YctB3KDr70A/mrgIcg/DTHzLxf2NxDfHdwZYfqXQ0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bxUVh9kmKDZKv/Rh4HD9pTe14Z52xF9uoy4H7d1yOizvkrQUIKGcEicbWjcNz6z6H
	 iK5p77b+3MPr+qzVjiEiVno2sbX1941C4/28EHgxdxnLb4DgMoRUpD9ECE6bUOLLYE
	 jU3aDMlkYALopCitkBHwymUoRM/uosJ8yjSfobKVgxzpUlZ3/L6MJSHX9Q5JXCxPCQ
	 Bnqvj+jeS1LNFdOK1pK458xxrfz5P2QgeO0Ikq4USSYWWRU6nnYtkvwbPD/BA31ncj
	 xQP51XlVpjLzAfpAvfPE3rRYD05+x/D9mBzZz5U7V8ck1sIng9r6PHZbE11mOkRvUz
	 THWOhQVIm/dMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kenneth Albanowski <kenalba@chromium.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 4/7] HID: multitouch: Add quirk for Logitech Bolt receiver w/ Casa touchpad
Date: Mon, 28 Oct 2024 06:53:06 -0400
Message-ID: <20241028105311.3560419-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105311.3560419-1-sashal@kernel.org>
References: <20241028105311.3560419-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.169
Content-Transfer-Encoding: 8bit

From: Kenneth Albanowski <kenalba@chromium.org>

[ Upstream commit 526748b925185e95f1415900ee13c2469d4b64cc ]

The Logitech Casa Touchpad does not reliably send touch release signals
when communicating through the Logitech Bolt wireless-to-USB receiver.

Adjusting the device class to add MT_QUIRK_NOT_SEEN_MEANS_UP to make
sure that no touches become stuck, MT_QUIRK_FORCE_MULTI_INPUT is not
needed, but harmless.

Linux does not have information on which devices are connected to the
Bolt receiver, so we have to enable this for the entire device.

Signed-off-by: Kenneth Albanowski <kenalba@chromium.org>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 110c59622a2d8..81db294dda408 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -831,6 +831,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
+#define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER	0xc548
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 6a3f4371bd109..9b7ec01cc7c6d 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2125,6 +2125,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_LOGITECH,
 			USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD) },
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LOGITECH,
+			USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER) },
 
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
-- 
2.43.0


