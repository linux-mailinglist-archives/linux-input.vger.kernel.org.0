Return-Path: <linux-input+bounces-7659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 236949ACD5E
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2FCB1F258D0
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032FE218319;
	Wed, 23 Oct 2024 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rv4ryarA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0E218314;
	Wed, 23 Oct 2024 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694005; cv=none; b=fbLJJUpsWLSFgxzqPahisYAXPBkWsOiJGCLfdpmeDNGBvb80QfX3MTJ/0vtjLYPQpdiUD7dWCDARsThEOEqeQOWxHNOk2Qi2mdpmSL393B0pmDw83ZDsdnBR0qLYtskpVLsvoy01LWSRUuduR2zfauU/DstksOMj0eYrZj/M2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694005; c=relaxed/simple;
	bh=2Alo/y2CiuDSAXuTtnuzS2QputKZAQEV420KfnxkseQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7D8iT+KKLTEs0E0UgDYAmgwUXAGOzI5M6jnZpBh575QPWj3AxJyXxy7m4kRDDglN/r7VYw7cpTKHDFahDqP4QCzB6HeiVVHNhP7J+XCq7l8hWJQ7SP4/5g075NlC7XPzIRwz5z7YxLBTQV/OwdBKRuGO4oJM67bDcTGsrd1KAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rv4ryarA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BD8C4CEE4;
	Wed, 23 Oct 2024 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729694005;
	bh=2Alo/y2CiuDSAXuTtnuzS2QputKZAQEV420KfnxkseQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rv4ryarAiupdTERspq8qLcavkNczHEJ6azm+TymvLzxzWkA57ug4tgJvHUqe7v356
	 Sa6cokjRH+aCg2ztUu+7ghZV7EGq7Je3rqWtyhLYX27D4PAv12/2Ty9PYeNYMIuHnT
	 jPoRlES+3BZxo2/9Snl97bLLfgiq8CcUOl54I3wxzIdnT3NwFcLcI62yDrusCepL6m
	 sUPSfRLbgcU8akTmqdyCdaelyTrxFXGlbQ0fd6NYM287pJcWJYFmMrhQ8Em0swNTkT
	 09avW61Kv6FgD+vjQhFxOpsNtPDoRlJ8HxZtbhRNKEwKnCQ6ivvHIwKD5oO16DTTmj
	 135iro6IHMopQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: WangYuli <wangyuli@uniontech.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/5] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Wed, 23 Oct 2024 10:33:17 -0400
Message-ID: <20241023143321.2982841-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143321.2982841-1-sashal@kernel.org>
References: <20241023143321.2982841-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.322
Content-Transfer-Encoding: 8bit

From: WangYuli <wangyuli@uniontech.com>

[ Upstream commit 7a5ab8071114344f62a8b1e64ed3452a77257d76 ]

The behavior of HONOR MagicBook Art 14 touchpad is not consistent
after reboots, as sometimes it reports itself as a touchpad, and
sometimes as a mouse.

Similarly to GLO-GXXX it is possible to call MT_QUIRK_FORCE_GET_FEATURE as a
workaround to force set feature in mt_set_input_mode() for such special touchpad
device.

[jkosina@suse.com: reword changelog a little bit]
Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1040
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 14dc5ec9edc69..6e975d639c36b 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1986,6 +1986,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			0x347d, 0x7853) },
 
+	/* HONOR MagicBook Art 14 touchpad */
+	{ .driver_data = MT_CLS_VTL,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			0x35cc, 0x0104) },
+
 	/* Ilitek dual touch panel */
 	{  .driver_data = MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
-- 
2.43.0


