Return-Path: <linux-input+bounces-6699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0460985B4E
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 14:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E5528477F
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7801BC9E0;
	Wed, 25 Sep 2024 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrvj/Bkn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230071BC09A;
	Wed, 25 Sep 2024 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264890; cv=none; b=UXISFUaa7rKxut/bHQzZ+LYMSMZNQ7I6GIb3bvCiCCw2Vrp1LIEoXCz5+4N6K7Xyf03fLdPIvOvoj6MZ18YJB4rIgQDEwhGRdWUT452t6xIhzYUkLOgaCQV0/xXI532pQQqZfF5zBgbcvTxIkrkrREFpJFqwk4Feqh/ZN4Efqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264890; c=relaxed/simple;
	bh=F0kKh2SMWKDTW1U5UKiVhxtjowaPAs6sF56XLrLYC1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVYSZkzjyw4tTPN2RnlfwZV0bvqFbfOUwnoC2YEVsIknbPxLWrUL91zueie+XM/tjc2NWTCbT3sHkiHe/6ZCapFXWVBqPQ1580SxS2TAIdlcj94G5C5fvuXOFtSS8qzsM/7StV7V9y1CJbomcn28MYci7R/0Q0u37d538+ccVkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrvj/Bkn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9F1C4CEC3;
	Wed, 25 Sep 2024 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264889;
	bh=F0kKh2SMWKDTW1U5UKiVhxtjowaPAs6sF56XLrLYC1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hrvj/BknDhDXhUM1PT6UR2xQEY7U5Xaq3QURWNKP0CeLkuHEbqu8Y4YpFoi/aX7w2
	 83muPDLO/v4RBhacdswmcLPxNuvWsXt0zLTKHMsvybdhwhvpCGgbGGsaXSjDmT8t2n
	 3f0remoXRmheVm71fSWNlsL2BJa8qDGuxLgung51ILWTa8cKmYg5xwLYM300Kp8pc7
	 A+/VBlEgSgV96jhjF5vbJu4oYd7PZm7Ghm8/vkYJYyT5CnHaKBiyLeqCtOLYQy7Q2P
	 Lo8rhwg9EUemEwPdTw+tcfr0DnB0c/GLXsYCX96lI5xBLSNZoNMj0HY8h7j8lohr6T
	 6nzxuUjoqJFOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 173/244] HID: multitouch: Add support for Thinkpad X12 Gen 2 Kbd Portfolio
Date: Wed, 25 Sep 2024 07:26:34 -0400
Message-ID: <20240925113641.1297102-173-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
Content-Transfer-Encoding: 8bit

From: Vishnu Sankar <vishnuocv@gmail.com>

[ Upstream commit 65b72ea91a257a5f0cb5a26b01194d3dd4b85298 ]

This applies similar quirks used by previous generation device, so that
Trackpoint and buttons on the touchpad works.  New USB KBD PID 0x61AE for
Thinkpad X12 Tab is added.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 53655f81d9950..06104a4e0fdc1 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -794,6 +794,7 @@
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
+#define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
 #define USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E	0x600e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99812c0f830b5..c4a6908bbe540 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2113,6 +2113,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB) },
 
+	/* Lenovo X12 TAB Gen 2 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_X12_TAB2) },
+
 	/* Logitech devices */
 	{ .driver_data = MT_CLS_NSMU,
 		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.43.0


