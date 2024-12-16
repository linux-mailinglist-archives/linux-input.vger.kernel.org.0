Return-Path: <linux-input+bounces-8599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167B9F2875
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 03:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BAD87A147E
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01A3286A9;
	Mon, 16 Dec 2024 02:18:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 1FD88F9DD;
	Mon, 16 Dec 2024 02:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734315505; cv=none; b=saVyJcI/CXt9uW/XvBMgTlrzche57ljkiYHK2d44lL/QiHq7YTzEBnUcpN3ry3nQ2XacIWmRs55oRP13nIWF6sDZYXp1LBjC4tADCfOMTIUhFvZth4zcsEG8nvc8geNdwvsK+dzmnb6zwl83gJJJjxv8/tco14mKBuOikbKAmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734315505; c=relaxed/simple;
	bh=DzpS8DJ/6Y7quP7GX/kvjg0BkUPIBrPzsE2Gzg+uEz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mBHEvQTDsAOZ0Zqqwuoxlg2TngUimWjwZdUDJYeyFFpEyqFbglrY2ED8DyuxcyNfJYusP+sqWQH4PDkcMUpdfKBM1tispVbfHkBxKEy3psjdojpA+eaXc2C8jWiJnl5Hzo41uWw56RiFrVZEMksIResiFZj1VgBgNThocKFo2tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [103.163.180.3])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPA id 1A12760276F5B;
	Mon, 16 Dec 2024 10:18:16 +0800 (CST)
X-MD-Sfrom: youwan@nfschina.com
X-MD-SrcIP: 103.163.180.3
From: Youwan Wang <youwan@nfschina.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	enze@nfschina.com,
	Youwan Wang <youwan@nfschina.com>
Subject: [PATCH] HID: multitouch: Add quirk for Hantick 5288 touchpad
Date: Mon, 16 Dec 2024 10:18:01 +0800
Message-Id: <20241216021801.22572-1-youwan@nfschina.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device sometimes doesn't send touch release signals when moving
from >=2 fingers to <2 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.

Signed-off-by: Enze Xie <enze@nfschina.com>
Signed-off-by: Youwan Wang <youwan@nfschina.com>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 42c0bd9d2f31..82900857bfd8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2314,6 +2314,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_SIS_TOUCH,
 			HID_ANY_ID) },
 
+	/* Hantick */
+	{ .driver_data = MT_CLS_NSMU,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			   I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288) },
+
 	/* Generic MT device */
 	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
 
-- 
2.25.1


