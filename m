Return-Path: <linux-input+bounces-16193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB65C6AEB9
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 7D8F32CF1E
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DE13DAC02;
	Tue, 18 Nov 2025 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGfBUttg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65C3AA1BE;
	Tue, 18 Nov 2025 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486222; cv=none; b=uPRJsK22JIl+qXAl6MkLUzKFBkq2UC3X5yQqLb98trFvuc+HJz+V1x9PakG/KNQW3+XX+0Kxb8naXNYm08XyWLmSLWOnRtiLCpx+3Obua0Pj4m6HUcIatggMeqXFZlaUku02bY7jiUiMgxlbu7/gsnQe+ifAMDatssxZl5dNsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486222; c=relaxed/simple;
	bh=Q8noAz8wnMu6ZbJ6hQMyPilvy4vghJihogOufWECNWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MiB8K8ZyoRNmGvXQDG8FDhkBwHrP8qgVgb/jnKmctpjLqIYGPjfMTmr/t9YXiuxT3fvKzz7vvE8cgApjDS7BpRedByRJ959XI9ksKciuivzN2sz3naWUVfjHzTIQF7SQbQoWl0qijK8WOvhvpq/iMe+9AWFkvMgnDbw2Zi2et5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGfBUttg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BE3C19422;
	Tue, 18 Nov 2025 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486222;
	bh=Q8noAz8wnMu6ZbJ6hQMyPilvy4vghJihogOufWECNWo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qGfBUttgNyvP7kNZTsPXcIcgdqA4Szh5sLlkWyrYIbDnvQLt0C7Xp+VVvOZc8c8Gz
	 oEWxFuozQUwKKuiVPgknHH6yLlOgT55ViHwXsZrdXgiSAo/5KRyMD5T0fd0YJe92Ej
	 lSVps8jzizqTnRwsNg1U/qaIIzxTTFhFetOccFZyXeCyISjifwvm5W7UeJa9iTSzak
	 p7FQ1hGHJiMeT8pb7c58yYdOsVrLiiaiH4sWd6X9HY42f994rRN8jlz8zvGce6P0e8
	 Ya7TdvU3yAXe0QNlQO+ZyGMQkmEyqHaWXBEh7R4F4e8Nwc2ffQQ4Gxh7JSNlmHFgYd
	 eCXz2qKZAJJsw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Tue, 18 Nov 2025 18:16:31 +0100
Subject: [PATCH 10/10] HID: bpf: fix typo in HID usage table
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-wip-sync-udev-hid-bpf-v1-10-0f8105c54835@kernel.org>
References: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
In-Reply-To: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Colin Ian King <colin.i.king@gmail.com>, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763486193; l=2666;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=Q8noAz8wnMu6ZbJ6hQMyPilvy4vghJihogOufWECNWo=;
 b=QIKD9vmBI5d7bVN8wqHsaXkF3uiZ7G3CXH5FK9nyOp60t801WVK+sbG+3ttx8LIQvVj0CCQlv
 wFaxn1W0OFSB4mXDMeBcNkueUKxcTwodVAGbW6NMx52iDD6sXwUT3Ys
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

We could go to the USB consortium, but it's probably
easier that way.

And update HID usage table json generated file from
https://usb.org/sites/default/files/hut1_6.pdf updated: 01/30/2025

Reported-by: Colin Ian King <colin.i.king@gmail.com>
Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/191
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/hid_report_helpers.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/bpf/progs/hid_report_helpers.h b/drivers/hid/bpf/progs/hid_report_helpers.h
index 9b2a48e4a311b39ca20e7d9819beef8fb70315a6..9944ff54d31d27d664be554afed2ce3710b48c75 100644
--- a/drivers/hid/bpf/progs/hid_report_helpers.h
+++ b/drivers/hid/bpf/progs/hid_report_helpers.h
@@ -143,8 +143,11 @@
  * report with Report ID 0xac of the given size in bytes.
  * The size is inclusive of the 1 byte Report ID prefix.
  *
- * HID-BPF requires that at least one report has
- * the same size as the original report from the device.
+ * The kernel discards any HID reports that are larger
+ * than the largest report in a HID report descriptor.
+ * Thus at least one report must have (at least)
+ * the same size as the largest original report from
+ * the device.
  * The easy way to ensure that is to add this
  * macro as the last element of your CollectionApplication
  * other reports can be of any size less than this.
@@ -295,6 +298,7 @@
 #define Usage_GD_SystemSpeakerMute                     Usage_i8(0xa7)
 #define Usage_GD_SystemHibernate                       Usage_i8(0xa8)
 #define Usage_GD_SystemMicrophoneMute                  Usage_i8(0xa9)
+#define Usage_GD_SystemAccessibilityBinding            Usage_i8(0xaa)
 #define Usage_GD_SystemDisplayInvert                   Usage_i8(0xb0)
 #define Usage_GD_SystemDisplayInternal                 Usage_i8(0xb1)
 #define Usage_GD_SystemDisplayExternal                 Usage_i8(0xb2)
@@ -2669,7 +2673,7 @@
 #define Usage_BS_iDeviceName                           Usage_i8(0x88)
 #define Usage_BS_iDeviceChemistry                      Usage_i8(0x89)
 #define Usage_BS_ManufacturerData                      Usage_i8(0x8a)
-#define Usage_BS_Rechargable                           Usage_i8(0x8b)
+#define Usage_BS_Rechargeable                          Usage_i8(0x8b)
 #define Usage_BS_WarningCapacityLimit                  Usage_i8(0x8c)
 #define Usage_BS_CapacityGranularity1                  Usage_i8(0x8d)
 #define Usage_BS_CapacityGranularity2                  Usage_i8(0x8e)

-- 
2.51.1


