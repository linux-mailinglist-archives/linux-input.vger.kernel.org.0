Return-Path: <linux-input+bounces-3868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BCF8D03F5
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 16:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8691C2154F
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 14:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAA31A38D0;
	Mon, 27 May 2024 14:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkDDN5yY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4713F1A38CC;
	Mon, 27 May 2024 14:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819404; cv=none; b=GZ1uQ8jDIO6qBbPch5o32UR1Qhb1FHSWirTLIleVuFttJl2SP0xiQcbARXv4knZf9Qnwy4nMOzzqp+8L7LtYAi9HlG0P8hFbmmC7J3V3FN3mVVSOPVHBGuooEFntrZXsjZY7yLM2v+SGAO30MqMsyw9LHsk9Wo4v9SoOspOMHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819404; c=relaxed/simple;
	bh=RzDAvwiTxYB9AEyEwF/mqDfTEluIT+dle8jQ2Jb1pKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNpkXu4IHz+zhM9XOshIc00M+5Zh8Uj6+7k3ogTibNte7t6iyIkA0R4/7eDyhwysbfK0lgpKLEr3FhaxoTYg/F9m0SlqP3C5LpN3WXHpKTqnu+JSqpVW8o06jOXOJv39ORtg3XURQw4wS8TxUOiDVVxGLP5T+ERmCzV4SbPMt1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkDDN5yY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415D7C32789;
	Mon, 27 May 2024 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819404;
	bh=RzDAvwiTxYB9AEyEwF/mqDfTEluIT+dle8jQ2Jb1pKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkDDN5yY3Hx51CumrpltdOb9UdIjP4En4Nz53K2VC9vn+qj0L7s8FSc3h9FvyF35x
	 cX8zTdOLTrSGnflIPXyLj6d9qiJEhLq+1F1yufX6Rcd88PGdQRf65gDz2AoWIdQDIC
	 xwV8fZuS3cQtteFMxEIGHokk1pvSeVCwxjFGXSad+vdBtUeB9GOFIG5LAOuR6FKHIk
	 3VHWaHGiJDv91s6qbVzSgOsFU04h+4vmjWy+iGVt3lIQ+b6OhyUZOPmFI15ZPKxyBn
	 gtIDwpho18NCPSUhrdVwMMZk48FArpeZ3reZj1iZzqFvcJPsp/oT5/IWxpdtuXUxyz
	 BZWJFndCO3t1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean O'Brien <seobrien@chromium.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 17/21] HID: Add quirk for Logitech Casa touchpad
Date: Mon, 27 May 2024 10:15:28 -0400
Message-ID: <20240527141551.3853516-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141551.3853516-1-sashal@kernel.org>
References: <20240527141551.3853516-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
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
index 0a4daff4846ff..89aef5874202c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -820,6 +820,7 @@
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
+#define USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD	0xbb00
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3816fd06bc953..17efe6e2a1a44 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2084,6 +2084,12 @@ static const struct hid_device_id mt_devices[] = {
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


