Return-Path: <linux-input+bounces-9558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E726A1CA83
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 570FD1886DB5
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8F51DE8BC;
	Sun, 26 Jan 2025 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faDGhvwC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA601DE8B0;
	Sun, 26 Jan 2025 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903686; cv=none; b=hEiArRdoQcXqTrHhwZh55LiND+9eh3u3VCs+VsxkngD6PKUAPhlkjelC1OGd5qdhhTkyMCjSJnWDaDmMiBg8EC3kr+N1D3+8Uv9SmvHXDNwioEzrYsrTP95vNBM/qrtAZXV8koAdXoWI7aBM9wGt5TFLRPL9+elDlUHniwo0l6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903686; c=relaxed/simple;
	bh=7pBUvITrL8B4D9MHJDNjsMrH5vHILma0pAJ934qTueQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Np2E91/0+7mYwsfQdSfyZ84X7gaNOe4JAH+LpQn3/slDjTgnC679hMbYnIAWIwLEVJ2EkhAw1Kkqi2nP/V71iT3vDSatEJ4TicX/R9oz/sV3T1VoxzzovvJ+wpeBOfnWmf4frnc/Ag66TcDCkvcvhN+BWAHFH5rb0b6Ss5VCfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faDGhvwC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0181C4CEE4;
	Sun, 26 Jan 2025 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903686;
	bh=7pBUvITrL8B4D9MHJDNjsMrH5vHILma0pAJ934qTueQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=faDGhvwChBjmg3X92PYp4VA57GaG/HI8KeHVnsB4zrOoe1f+OICFARiuo33CHtUh1
	 06v4zclSQwmy65CESqhSFBbCiCKRuomDaVNjSHGt5Lkv8lgZyLewzwzTaBNNgAccA4
	 DM7VTuSRDSRuIXABwI3h/sAzCZisv1ZVDu611r8+pvlpnUXFah5cWytz79tPUVuXhQ
	 kO0VVg5vJXav7ZW/eDRUkXPyKd/K4ekZ5Uz1XRAmYP+/xpFOf+rI6IqWeQ7efKp4Eo
	 QvcPj15L9O4r0rb4IRC0VlpFeHNdWdPte5TPwYM23MecNCxZp+6lLWFBSN0nRA3Du/
	 fSq5MXFSRLO5Q==
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
Subject: [PATCH AUTOSEL 6.13 16/35] HID: Wacom: Add PCI Wacom device support
Date: Sun, 26 Jan 2025 10:00:10 -0500
Message-Id: <20250126150029.953021-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150029.953021-1-sashal@kernel.org>
References: <20250126150029.953021-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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
index 5501a560fb07f..b60bfafc6a8fb 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4946,6 +4946,10 @@ static const struct wacom_features wacom_features_0x94 =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define PCI_DEVICE_WACOM(prod)						\
+	HID_DEVICE(BUS_PCI, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -5115,6 +5119,7 @@ const struct hid_device_id wacom_ids[] = {
 
 	{ USB_DEVICE_WACOM(HID_ANY_ID) },
 	{ I2C_DEVICE_WACOM(HID_ANY_ID) },
+	{ PCI_DEVICE_WACOM(HID_ANY_ID) },
 	{ BT_DEVICE_WACOM(HID_ANY_ID) },
 	{ }
 };
-- 
2.39.5


