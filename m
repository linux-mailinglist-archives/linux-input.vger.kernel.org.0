Return-Path: <linux-input+bounces-9567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA5AA1CB76
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C55161B01
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3607A224AE9;
	Sun, 26 Jan 2025 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYYByGQU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E417224AE3;
	Sun, 26 Jan 2025 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903848; cv=none; b=BMLhDHeG1V3fdV7NyCqFQiDxY6vjUrdXZfcXShemVxWd8oPVBnR+Px2UsudE05gdGohETUnetZQZJ2l7r+JQ8/VmuypKuoxdMBPUqfvxyzSE/xEuSiOHvreWptzgxqRiuKUACkQwNPSI8VapJnDjmue8WGaNbjMi3ajJAQA48VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903848; c=relaxed/simple;
	bh=ydhmTrP+GP6gCuQD/s+3rV1pZZ07rCw97kqUuNYn5Hw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lMS5M2ujg7Kuw7G3CJKXODuJZISt7BzPNlex0Im44+UM3Cf7KBagbXtRVlPFoYboS2NT7N22SJdDLYKS6qoTE5qFU2F4OCrltfCxDc8333/JxV6ZkMP4bH6D9RkvpoWM4IbKG+0imwASP3pjajwYTkFEqK4JAtl90ZwFCWKBezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYYByGQU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C978C4CEE2;
	Sun, 26 Jan 2025 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903847;
	bh=ydhmTrP+GP6gCuQD/s+3rV1pZZ07rCw97kqUuNYn5Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kYYByGQU6swiHTplkz1nKykjCaAzpcUz/TghoU5Av/oCpBr+BAON3PJl6ERWSp/nK
	 TDn+r5f2/WyURN0BLhYa5YbJNByiOkRHTWRkIPFhZD0Dry7hXZcRsmZLcQVR/H/bnf
	 n21nDAR8evm+RbhFPf3scv2kf11QPqhcQwQF3TBbSgjJdU+N4RV7R0gtpBaf577e7N
	 p0ED4fc9cc7D5meg6lnCHEv1w/na8UgZAu3fS6mOj4lm3JTZT/i3sIl1AlfxnLXrMr
	 lx26qDIOTYRTCT7WMO2FuxSqPDgLOAfio4Aq2YCGVbdLi6PwFotYoOQ0iotczHIP7X
	 AwlIs1uy4NAOQ==
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
Subject: [PATCH AUTOSEL 6.1 07/17] HID: Wacom: Add PCI Wacom device support
Date: Sun, 26 Jan 2025 10:03:43 -0500
Message-Id: <20250126150353.957794-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150353.957794-1-sashal@kernel.org>
References: <20250126150353.957794-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.127
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
index 3551a6d3795e6..ce54b8354a7d4 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4914,6 +4914,10 @@ static const struct wacom_features wacom_features_0x94 =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define PCI_DEVICE_WACOM(prod)						\
+	HID_DEVICE(BUS_PCI, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -5083,6 +5087,7 @@ const struct hid_device_id wacom_ids[] = {
 
 	{ USB_DEVICE_WACOM(HID_ANY_ID) },
 	{ I2C_DEVICE_WACOM(HID_ANY_ID) },
+	{ PCI_DEVICE_WACOM(HID_ANY_ID) },
 	{ BT_DEVICE_WACOM(HID_ANY_ID) },
 	{ }
 };
-- 
2.39.5


