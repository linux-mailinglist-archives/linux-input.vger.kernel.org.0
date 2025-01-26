Return-Path: <linux-input+bounces-9562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F921A1CABC
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D5297A212B
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C3120C02F;
	Sun, 26 Jan 2025 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7suyg8N"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904020C025;
	Sun, 26 Jan 2025 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903753; cv=none; b=FOdnJenq8q6YZpN5HkqMvL2tVUPOHWzU2uL9N0DRYTOF04OpNZBbWpp0Puq8Eq6xeYF3VwwLItYSm+p7FzmS78L6eMq4i2Gm43GBCq7Zp3Qh3myjmkWxKyGiKUt2Q0iSqPbj38kEnDUbQcJO81InLVYftOSgviDL/kqM70S8gVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903753; c=relaxed/simple;
	bh=nF2JtQFrYjrlL2Y0JavtvtnOs/klBYh4mji9sOg5a54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dMU1UhDma50Y1trfB0eHjG5MG4MiY82o8NHaZU4FpR+Af7shQxqABBhp8zrdR0Hjf1zAH0R+6zZdFK3bBy2L4XZSsu3dfQxlCJWSMzqCw32AhA6p0wZ/8ms2t+fzTNWujYrhkv7dZbvKsbk4yd98dIBgERn0BMfSYYAWplFI73g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7suyg8N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEBFC4CEE6;
	Sun, 26 Jan 2025 15:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903753;
	bh=nF2JtQFrYjrlL2Y0JavtvtnOs/klBYh4mji9sOg5a54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I7suyg8Ntn7eZYTvQCdrpQu+vmnw4NaDy+kZa4lVRN3lf6Rn1NOfCsYGC32l0Zom/
	 Kf1ISDTpqFOWqaQYD1RpqKbhwHMVk4wJVzj13iwe+eCyLHPmJjotAruD/3jq2zN2Ej
	 uj3ZLvleGokWtUBBX1xheCRFjTi2406DiTI/x5FAsLRGaq+98n0GAGcRofzyTR7+qO
	 GjUpJuc/ONg7r8TPh+UU1d92/M5Bp9lHyzHfK+pb1rHJPok37wEQXodSK3yRQSXSZU
	 BhFJqbOkC2e71gC4+j8EpMztC54DmrbyDi/tEFpmh4P6TU+bbFzkD0R/mVbssd8eOY
	 4+7BRfAdOb1XQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Even Xu <even.xu@intel.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 12/29] HID: Wacom: Add PCI Wacom device support
Date: Sun, 26 Jan 2025 10:01:53 -0500
Message-Id: <20250126150210.955385-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150210.955385-1-sashal@kernel.org>
References: <20250126150210.955385-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Even Xu <even.xu@intel.com>

[ Upstream commit c4c123504a65583e3689b3de04a61dc5272e453a ]

Add PCI device ID of wacom device into driver support list.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/wacom_wac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 5a599c90e7a2c..c7033ffaba391 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4943,6 +4943,10 @@ static const struct wacom_features wacom_features_0x94 =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define PCI_DEVICE_WACOM(prod)						\
+	HID_DEVICE(BUS_PCI, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -5112,6 +5116,7 @@ const struct hid_device_id wacom_ids[] = {
 
 	{ USB_DEVICE_WACOM(HID_ANY_ID) },
 	{ I2C_DEVICE_WACOM(HID_ANY_ID) },
+	{ PCI_DEVICE_WACOM(HID_ANY_ID) },
 	{ BT_DEVICE_WACOM(HID_ANY_ID) },
 	{ }
 };
-- 
2.39.5


