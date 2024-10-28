Return-Path: <linux-input+bounces-7734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 823089B2D8B
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39E3E1F22B05
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 10:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D788B1DD884;
	Mon, 28 Oct 2024 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d56vsFA9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC081D54D1;
	Mon, 28 Oct 2024 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112696; cv=none; b=MZVSE5DARGvs/aIakiNq3y5rXSbLXUaNsrhqI3jNPN0abx+dtRjNdMUaDA4DTFiBgI1dSng+rEfaeS0yV0VgjOL5gqHuZEgV4z0JvATo81Pf63KuUWjA3btqkI3LvBkPuXSfLrYq0TS1texrspmjHe6STDPxbzHa6IIs+POCCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112696; c=relaxed/simple;
	bh=j1XqaA8crak242NohMyT5cFttbGQ5jyCsQxpcfag5EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQSPHlgksQyiKVYKkw4IY5QA7yd9f9WQuR8wbaykITZQsiWAKIa2RlB2kI01AVUd3iR5E2ZUkqKeEe9UMSi86utrVlNySaC7WofBXcSaCS8J6C6UsIFhkm1E/a1zQ6/Nh+Wi6uYzmEG6YIOYrssAxLhc65qSBC1CFHCKSPaKn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d56vsFA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91046C4CEE3;
	Mon, 28 Oct 2024 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112696;
	bh=j1XqaA8crak242NohMyT5cFttbGQ5jyCsQxpcfag5EA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d56vsFA9kGwq7YkCQJ4IeZRsML8idePPFPcIXBQ7IdCYJ/H7BohTIcTcM5V744yIm
	 OYxoshOhrlwSrFCfMWDHPu/7tuw75qpnwuMPKXZSaty6GJk3OBxI9+s53X6gmXyo/i
	 KbcRDeHnD/y3a+V5A8lF6bziunIKnflPWFR7GDVwAOvTtF63MJuaZ6Mtl/aDHbEx9y
	 26o8L95d5I8XjaYh77QmVZlXu4b2DyuGgkwxphwfFUXRvMQKH6eJjG/yWfn5a0CC84
	 uqUTYe59X3FMWwjzYICuzqKt0BOAFixXaLWA5btDRcfXdCxQfA8qAbhKUvdy3QQb9L
	 OClgf9IvBLT9Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kenneth Albanowski <kenalba@chromium.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 16/32] HID: multitouch: Add quirk for Logitech Bolt receiver w/ Casa touchpad
Date: Mon, 28 Oct 2024 06:49:58 -0400
Message-ID: <20241028105050.3559169-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
Content-Transfer-Encoding: 8bit

From: Kenneth Albanowski <kenalba@chromium.org>

[ Upstream commit 526748b925185e95f1415900ee13c2469d4b64cc ]

The Logitech Casa Touchpad does not reliably send touch release signals
when communicating through the Logitech Bolt wireless-to-USB receiver.

Adjusting the device class to add MT_QUIRK_NOT_SEEN_MEANS_UP to make
sure that no touches become stuck, MT_QUIRK_FORCE_MULTI_INPUT is not
needed, but harmless.

Linux does not have information on which devices are connected to the
Bolt receiver, so we have to enable this for the entire device.

Signed-off-by: Kenneth Albanowski <kenalba@chromium.org>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 25f96494700d8..92cff3f2658cf 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -869,6 +869,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
+#define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER	0xc548
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 847462650549e..462f2e6789bbc 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2128,6 +2128,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_LOGITECH,
 			USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD) },
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LOGITECH,
+			USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER) },
 
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
-- 
2.43.0


