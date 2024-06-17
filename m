Return-Path: <linux-input+bounces-4387-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7036590B04D
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BB8C1C22B30
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 13:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3977D20FAA2;
	Mon, 17 Jun 2024 13:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uj9UgGps"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB94197A9A;
	Mon, 17 Jun 2024 13:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630671; cv=none; b=urXS+jnZxUCzdXtveDWymJB9Bs/Gm5SBUleGh5snJD3G0njVo7yg1ZZ3Y7g2nQ9FiKWSDA2gZSy8UvRQoWjXSyQcwFDlZcwGUw05EjYDwzpfzzuWRnA/BAl8KvF35IxnHXhy2btimZ9Crf4UVNmTskYaCmLz+XhUiBF2C9R/B1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630671; c=relaxed/simple;
	bh=pYh4gCCVzgUCjIgAwrsYEXm3gW9eBwn7MWaFe1upkUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bePuIZ+7y0V4hlEzCzt+63jZ8t0aaoxu/ZBvBQi57nLb9hnIm67lXaq+FRN+1R1nv5DX8e+zJwl001kGCUwbK4F3cNa00yb57Cd8udCdHJyCuZoBuIn93AP5pbL3vrrYbdKeKUPbLLoS4GjBYQeB3ilokg7OoO8yMSDxNUxuZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uj9UgGps; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A012C2BD10;
	Mon, 17 Jun 2024 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630670;
	bh=pYh4gCCVzgUCjIgAwrsYEXm3gW9eBwn7MWaFe1upkUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uj9UgGpsHb2gKA/d9+Cs4UQ7SfY5DYlFG1NuBtEhl4ASpaLYFYUeTenuAbx/14c3K
	 5CbgHS1VGqrf1jkX1X6sMLqnhcdxrYNncMRSzxkCtqmPb6mBSgYM8P1U7XcDtIYnin
	 kJ9eo8m+osvyC7lMQHqCt/45orPUHB4L8YWpXJfiP4T6Z4SYmHBujWX9zizDadQmYv
	 F8pv087dze0PkY6xrWjvwvZzATv/U83Qb4mx1dLRkL+SlqKTdthQpkhcRfdVs8pn+0
	 cE1iRKWqOL4eyRHoz6BHHWZukSk/JR45oM7MdduHpoWyS9x/Qb1Bdh81o2ouSXGfSj
	 dZHWv+hh7Chaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Louis Dalibard <ontake@ontake.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 35/35] HID: Ignore battery for ELAN touchscreens 2F2C and 4116
Date: Mon, 17 Jun 2024 09:22:33 -0400
Message-ID: <20240617132309.2588101-35-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132309.2588101-1-sashal@kernel.org>
References: <20240617132309.2588101-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.34
Content-Transfer-Encoding: 8bit

From: Louis Dalibard <ontake@ontake.dev>

[ Upstream commit a3a5a37efba11b7cf1a86abe7bccfbcdb521764e ]

At least ASUS Zenbook 14 (2023) and ASUS Zenbook 14 Pro (2023) are affected.

The touchscreen reports a battery status of 0% and jumps to 1% when a
stylus is used.

The device ID was added and the battery ignore quirk was enabled for it.

[jkosina@suse.com: reformatted changelog a bit]
Signed-off-by: Louis Dalibard <ontake@ontake.dev>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h   | 2 ++
 drivers/hid/hid-input.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0a4daff4846ff..cee09538c9aa2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -418,6 +418,8 @@
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
 #define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8
 #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
+#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
+#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
 #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN	0x2544
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 8bb16e9b94aa5..c9094a4f281e9 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -377,6 +377,10 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
-- 
2.43.0


