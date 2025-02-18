Return-Path: <linux-input+bounces-10146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5AAA3A9D1
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682191889E4B
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08A427FE65;
	Tue, 18 Feb 2025 20:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qa7hQTI+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5B27FE64;
	Tue, 18 Feb 2025 20:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910534; cv=none; b=norm1Ii990JZQBfQpZQNtyQbtsy8Vhyfv1fJJ8uCrs8dGUu9K4KAjH0E9fr+bRXK0lcD7Y/IIIrjlkOKlJ3W2qzq3LXBiXvxwjjLx8+om2b3JvbX15kpR7XyTy53/kuVu0c2ES0nquicvrrPmAlD1xOY+4vIwLgKyo4aPUiLZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910534; c=relaxed/simple;
	bh=MoxdYyP+uYBZocdXSRHassXut4ej2lAVGobKAOdgYY8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GoWjb2cAN4UdRvK1tXsJsr+bUnUNOISrCO6dkME9wMM6Q/TePEXBLcHkIvIMu5oNneqbmSgTqIKBU6I3T2LX908/xjoulHFvjoYCoz4vKnwK/cGSii4otGUnSQu0+K1MNS3ZzPxFE6BrnEnEQxjYZjfRBm/P4r1RzxHUEQ96veY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qa7hQTI+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E340C4CEE8;
	Tue, 18 Feb 2025 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910534;
	bh=MoxdYyP+uYBZocdXSRHassXut4ej2lAVGobKAOdgYY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qa7hQTI+uRNkHyMOI0xrHkXnaCC+1NWSRn+gUFzkqsLMr/AuC/fIohDwIwEi/vcQF
	 o9fpbCiqGpC4NEMzhEhK0teNbCyt3QiMHTYH57uiLQMJc/HD0UPlT34Gf6kRX9E2A4
	 06Vp0q6J37d673puYo7BErycovszAhcgU7HfYGiklFfE8ODymVaHM/sL2VWHZxtLaB
	 u7EEly4TZftXPK2F29VpWjv4gE63O/YFmGdLo+rjvRDwgTQZmgAB1LgAhR094o2Ok4
	 TOEqm4VaJ01noxVV7ws1IiZQDIkyqwN/loOkfQvNfKDrVniwvFyGTwxqy14nwYYUpY
	 hd5YrrPZl60hg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 2/6] HID: ignore non-functional sensor in HP 5MP Camera
Date: Tue, 18 Feb 2025 15:28:43 -0500
Message-Id: <20250218202848.3593863-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202848.3593863-1-sashal@kernel.org>
References: <20250218202848.3593863-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.178
Content-Transfer-Encoding: 8bit

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

[ Upstream commit 363236d709e75610b628c2a4337ccbe42e454b6d ]

The HP 5MP Camera (USB ID 0408:5473) reports a HID sensor interface that
is not actually implemented. Attempting to access this non-functional
sensor via iio_info causes system hangs as runtime PM tries to wake up
an unresponsive sensor.

  [453] hid-sensor-hub 0003:0408:5473.0003: Report latency attributes: ffffffff:ffffffff
  [453] hid-sensor-hub 0003:0408:5473.0003: common attributes: 5:1, 2:1, 3:1 ffffffff:ffffffff

Add this device to the HID ignore list since the sensor interface is
non-functional by design and should not be exposed to userspace.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 81db294dda408..44825a916eeb2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1037,6 +1037,7 @@
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3001		0x3001
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3003		0x3003
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3008		0x3008
+#define USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473		0x5473
 
 #define I2C_VENDOR_ID_RAYDIUM		0x2386
 #define I2C_PRODUCT_ID_RAYDIUM_4B33	0x4b33
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 80e4247a768bd..b5ad4c87daacf 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -871,6 +871,7 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, USB_DEVICE_ID_SYNAPTICS_DPAD) },
 #endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
 	{ }
 };
 
-- 
2.39.5


