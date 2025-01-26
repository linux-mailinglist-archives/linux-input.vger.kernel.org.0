Return-Path: <linux-input+bounces-9568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A23A1CBA9
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 043EB16271C
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE4E2288FC;
	Sun, 26 Jan 2025 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/rhQHUl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468FC2288FA;
	Sun, 26 Jan 2025 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903884; cv=none; b=WLj6RUYG+rhtCDgKbohsPY3ZNihiJP9Hs+kIi3dWdFfVaE0JJ3TEUn9HvTKyGNzDk8/A7c4ZHcD0nFTAuYokt/cgse8MToCa/ycyfOiW79iDe4uI3HjVfXTXoPcjihrMRiFfPppa3fRW6CbmUlbJdBiSVJDc3m2V27atEpRcUSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903884; c=relaxed/simple;
	bh=K03HTKfQXO0CbT74Wq8y5/oEOW0uBw+Z76g/lKwK1kM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qGrjkP5h4I6pG1DbMAE9sDkji0ihvMiR4puky2QKtsQ+B3suIJerzXAdUxBvOn1Ux1oJ3MKDu3O+RUbi7uOE7Hye+iPArdkmjglFZsgbkftZyDDRl6P8kG9EI4KtjaS4D4ZS9k1foSMlqgYxaah2k7tD1RRVFD7J59iK4MPvFYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/rhQHUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FDEC4CED3;
	Sun, 26 Jan 2025 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903882;
	bh=K03HTKfQXO0CbT74Wq8y5/oEOW0uBw+Z76g/lKwK1kM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/rhQHUlCTFRhRvI+7dgFhTHvnwYYaxvbI+nGGj6XwX8auac3A6/osd+6nnc3sIzV
	 LHSD/dUhmvSqvShEzw1vUuRFTdUwBzqYmLKn9riX1TSGGWAOMCsO+nCEgoEl9QwojQ
	 Lop4ihOXE/WEy9951S/Y1XA/3ZqjFd3Us28jFP8y02nY4wmOiSFWkrUj1XTdJa75tT
	 tyGGMg5AmsNHfKKeVdAsdAG6egoB19DHLQTWjJdXuy6fbHrZqdKTNtb3jop//SuuBA
	 ho7MztPZbmHS8bIIR/ad4l8KWxa/qQKpBN1oT+CPdDP38SPR8FbDxV8EHHfEPY1ZnG
	 zlvJ1+3RC+mfg==
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
Subject: [PATCH AUTOSEL 5.15 06/14] HID: Wacom: Add PCI Wacom device support
Date: Sun, 26 Jan 2025 10:04:22 -0500
Message-Id: <20250126150430.958708-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150430.958708-1-sashal@kernel.org>
References: <20250126150430.958708-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.177
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
index 9a82cd124918f..a5e6c16c883dc 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -4882,6 +4882,10 @@ static const struct wacom_features wacom_features_0x94 =
 	HID_DEVICE(BUS_I2C, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
 
+#define PCI_DEVICE_WACOM(prod)						\
+	HID_DEVICE(BUS_PCI, HID_GROUP_WACOM, USB_VENDOR_ID_WACOM, prod),\
+	.driver_data = (kernel_ulong_t)&wacom_features_##prod
+
 #define USB_DEVICE_LENOVO(prod)					\
 	HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, prod),			\
 	.driver_data = (kernel_ulong_t)&wacom_features_##prod
@@ -5051,6 +5055,7 @@ const struct hid_device_id wacom_ids[] = {
 
 	{ USB_DEVICE_WACOM(HID_ANY_ID) },
 	{ I2C_DEVICE_WACOM(HID_ANY_ID) },
+	{ PCI_DEVICE_WACOM(HID_ANY_ID) },
 	{ BT_DEVICE_WACOM(HID_ANY_ID) },
 	{ }
 };
-- 
2.39.5


