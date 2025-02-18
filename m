Return-Path: <linux-input+bounces-10150-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F57A3A9E4
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0D5016FD0C
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD52284B9F;
	Tue, 18 Feb 2025 20:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFheAs2v"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F8284B9A;
	Tue, 18 Feb 2025 20:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910561; cv=none; b=hN060/GbN9WGeJ68PnnJLUGAiA2JGUyeLYwJ7elhArxjnvgb0uP8aTNXJaZI+B2+jNnNVlhtVhtq6eOXOz0uB9Jq4+S3pbCe974+6Hr49EspPHbcflMcl9/hL+3AMVqaXOoofPIFohyRWyY6r2HupdycM8ilEztXUixWdokuRvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910561; c=relaxed/simple;
	bh=wkQVhxqwS06nehDZIJ56Gfgj705sfgZktdk3h9XaAYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uJ7poe0dhafwwQ76pOBGhVDVOiHvf64v3L90ewDuWQAbfhz15sG8DYRj+xULg9cT6QNBHqD9/CsinyeGIUUWo2mGYWN7T7OjS4p+IdB9ldS+iQdjraU5HXjMhuFKOqhrf5Pb8Bxfy3qV4/q3gUeL1vqihwRHkZgjGKS/4G2PNEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFheAs2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFB7C4CEE8;
	Tue, 18 Feb 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910560;
	bh=wkQVhxqwS06nehDZIJ56Gfgj705sfgZktdk3h9XaAYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFheAs2vgZWSht8bX4hCui1KGpP6tt/C1yuYg+PaPDeZrseOBOXBBsHnDpb2pzeMX
	 NdTlbyuwtJg41WANb/lVz7toRn+ylwdpaqsF0Z5EbyOWuEUeM64/PDif9wxN6Fz+lK
	 ctBm7+wFLQjnsBJ/fWV7g7HCVGy/m4WvTkWk5GaojIlk8oo1906wU6HUqVXfUMTxHn
	 1H7TUs8V252NZfMmPusPuNbbh8nzLfpuVby+YChJMuR6JAM7D+1BOJyX7FTxq0F/Ix
	 ANoVQjgS7g9MY9dXzmPK/CJ8LdBa1eIGnsBNCWPqC51Xdz8b/sp81wC4pENGilpf31
	 Q34rFd+6J5yeg==
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
Subject: [PATCH AUTOSEL 5.4 2/3] HID: ignore non-functional sensor in HP 5MP Camera
Date: Tue, 18 Feb 2025 15:29:12 -0500
Message-Id: <20250218202914.3594039-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202914.3594039-1-sashal@kernel.org>
References: <20250218202914.3594039-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.290
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
index bc0115548a579..d5369577b4755 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1005,6 +1005,7 @@
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3001		0x3001
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3003		0x3003
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3008		0x3008
+#define USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473		0x5473
 
 #define I2C_VENDOR_ID_RAYDIUM		0x2386
 #define I2C_PRODUCT_ID_RAYDIUM_4B33	0x4b33
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 99009fda7b80a..9b375ca53946e 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -876,6 +876,7 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, USB_DEVICE_ID_SYNAPTICS_DPAD) },
 #endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
 	{ }
 };
 
-- 
2.39.5


