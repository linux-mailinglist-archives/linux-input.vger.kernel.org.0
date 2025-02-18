Return-Path: <linux-input+bounces-10136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C9A3A9A3
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936A33B9338
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4046421507A;
	Tue, 18 Feb 2025 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw0DF62U"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DFF215075;
	Tue, 18 Feb 2025 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910474; cv=none; b=M7oTY5Y8GsXYmIMA+sgtTy/ICNC/w7QI56InLaiSK++92A58fHn0CIAcW5TgjZh1FzFhFvpe2xAqvGc7gKkKANjYK33Z5/LBS9mUDpvCDmOWUGVYfN8sjXGu62pJRQ30GrpEpkejXOTLyq4D64Vrq8r0YpKnIw4pOdw39s+LDwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910474; c=relaxed/simple;
	bh=quaDW4ilmiJ5G5g4zyEK9fiu6rbxDkyGw0HMaBztHnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rYDg1NorHfK8iPFhOOJ6tzePZn8pBbK9TS916VLNZAra8tDUk1GcDq7vfWWZNL/KsDA6Hj69aSz9jSKwLaWoGKZK2mLshQosGoBq0Hn5o/qt6KlNJBun0phTvv9KR5WF6+wuaiSOZxxojgLRELvhYkUzs7joPUCXpIUHWzCt7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw0DF62U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67764C4CEE2;
	Tue, 18 Feb 2025 20:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910473;
	bh=quaDW4ilmiJ5G5g4zyEK9fiu6rbxDkyGw0HMaBztHnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aw0DF62U6uWXJsyub3NBqO7bSLAC41MQe29g8F6wBnYfmNiBwUuEtYQfOkCB2SQtN
	 is9Ko5v16/7nbJWGt9MdhTCiI83GQ/scBAdI6gKFqcC/ReG0wr8cYLTfUhdaVD17Sf
	 puThJkcKOWTcWXzm0VcvjzVPSOJPQW3+qiy8tC/wVm3ZP0/eMiBrV0xK88isX1pNwf
	 nicLxsXjOe9jZOF6fgFavS+7cSrLYquiveovG9QkN9qWMsujVlmAtWrZcUwPqj8xA1
	 iyFtO32zNYDW8VfLd9PScVL0iuHTWhG5yGDVazDJzXcusbw1Fi7kroDNgmzMCORIU5
	 p+e6lO1lLtDDw==
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
Subject: [PATCH AUTOSEL 6.6 03/17] HID: ignore non-functional sensor in HP 5MP Camera
Date: Tue, 18 Feb 2025 15:27:27 -0500
Message-Id: <20250218202743.3593296-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202743.3593296-1-sashal@kernel.org>
References: <20250218202743.3593296-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.78
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
index 1174626904cb0..ff996accd371d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1085,6 +1085,7 @@
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3001		0x3001
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3003		0x3003
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3008		0x3008
+#define USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473		0x5473
 
 #define I2C_VENDOR_ID_RAYDIUM		0x2386
 #define I2C_PRODUCT_ID_RAYDIUM_4B33	0x4b33
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e0bbf0c6345d6..5d7a418ccdbec 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -891,6 +891,7 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, USB_DEVICE_ID_SYNAPTICS_DPAD) },
 #endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
 	{ }
 };
 
-- 
2.39.5


