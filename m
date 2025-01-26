Return-Path: <linux-input+bounces-9565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78015A1CB5A
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E65D33A8EDC
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D4E21C16D;
	Sun, 26 Jan 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+r5dVax"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D40221C167;
	Sun, 26 Jan 2025 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903812; cv=none; b=L3u7TvyV1vRltsSdMK16FFERo0ci8k+Bfg8yz5fIOstCU9XgTmQzRp/l9w7GEagvE5VYaiJEVQwsC+kNgG7ZjnYJ8KJjQ+5GgvtuOJ8Trin4dTeb/InlXRwOPH/H3b8okHBuJCH1s3zqf473MFevQsx1vCd6ChR5JKa3XfWatKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903812; c=relaxed/simple;
	bh=uJGWuaL6SOAiJ7Jbqv4NqSyun5v3ralAEyjALZAoHpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RPghfyZCk2rLiLK4RW/QStVXH0AsCCMH2qX5RD8vh60AnwK8gLJ3hKRWtNzVluOAVxWHK9RdBEooG1ZC23KgNuf0cMcsH4aZ79a6puzn3UGGsc1+b9Ttsk2b4tpCdxwX02TU5DeXR68+sdMJ5vXOZlhSh4wsY0yxXruGfwnA9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+r5dVax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A3BC4CED3;
	Sun, 26 Jan 2025 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903811;
	bh=uJGWuaL6SOAiJ7Jbqv4NqSyun5v3ralAEyjALZAoHpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H+r5dVaxdkHkQjgfpshcGoSiD0aKajQEroLcLkZbc5hLuRiY/LT9Kw8RYVnogw3qp
	 MocFUsGBKnt1DpyZ3hTtuuUTWZjkt2ZvwH22kgDm8TcmD6RICGh9GoeVlz0it9il8M
	 0nMGPEgh1wEkD75ls2fCkHfh0HI0uSK9aPYht2gyqY+/kVp3NZBnHyI2aH3koknZH+
	 UbQemEqUBqvFto0qpOUekkPJyGZogFwwdsbS7ihxGWV5Z8ptSC+tkgbZE9RbWb7aOi
	 FMfgFT52rpsmp9JJ77HoDmoUeigi/m4mAzz/VkhrYQar673Flo9IYioTA4ZS1Sg70D
	 eCk663jhbclCQ==
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
Subject: [PATCH AUTOSEL 6.6 09/19] HID: Wacom: Add PCI Wacom device support
Date: Sun, 26 Jan 2025 10:03:04 -0500
Message-Id: <20250126150315.956795-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150315.956795-1-sashal@kernel.org>
References: <20250126150315.956795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
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
index 33466c71c9da7..dd44373ba930e 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4911,6 +4911,10 @@ static const struct wacom_features wacom_features_0x94 =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define PCI_DEVICE_WACOM(prod)						\
+	HID_DEVICE(BUS_PCI, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -5080,6 +5084,7 @@ const struct hid_device_id wacom_ids[] = {
 
 	{ USB_DEVICE_WACOM(HID_ANY_ID) },
 	{ I2C_DEVICE_WACOM(HID_ANY_ID) },
+	{ PCI_DEVICE_WACOM(HID_ANY_ID) },
 	{ BT_DEVICE_WACOM(HID_ANY_ID) },
 	{ }
 };
-- 
2.39.5


