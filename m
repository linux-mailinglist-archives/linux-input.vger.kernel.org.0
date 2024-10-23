Return-Path: <linux-input+bounces-7649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 266A99ACC6F
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559121C21099
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EC41CCED5;
	Wed, 23 Oct 2024 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohGw5GRY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF1F1CCEC7;
	Wed, 23 Oct 2024 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693829; cv=none; b=MjZeOF6NrmjlX7Uyxps94qPAFe1Wv23n9fxByZgj7+rGa+oJoLoXO0jvX6CtLtPRd+KJj0YSf60R4ItR5yyvXLIPfCiDYqs0kUoZkgnAIoVi3cLesN/vP+zGohH1a2b9HgY3mO5xcIa528dUnKt4F98Zc+sBfGS4z2UkH51YjCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693829; c=relaxed/simple;
	bh=auV1e6+7gup/MSDm7Fq8PPH1U9pv/A+5FfUNS8jFGdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8PtUPp+89ovdCwFDswcdRkdztWseP+C6xGHbI7tZRYnoJW72+bY9NILocPCqvzzTLFO0QFn/y85JqydWdozBc1TPaGkNvGukYM63mv/R0cQUa+lh4gt/ePaQApTGJA8LUVkZTO7cQGvRQ7YSQ9o7n4u2usTkg4YAj3hgFKFwME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohGw5GRY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8041EC4CECD;
	Wed, 23 Oct 2024 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693828;
	bh=auV1e6+7gup/MSDm7Fq8PPH1U9pv/A+5FfUNS8jFGdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ohGw5GRY6rmi4ODwMQRGl/eL4QlgzJDlc2lXji5w/cL26b0OpA5e6OiAvkohTIRRK
	 W3Q1i0qZIYezBrMuzYUwV6RcKVPVuauiemnnB3/z9oWp+jqaaqUBSbj6cI5ZaJ+4q/
	 Cmp2d9lgiN1LzLz8vD3mplRi3LvSw8XscNxaq9q8B+j56+fPxA+0hVxObK2ec0nWyF
	 Vy6yZvCrMrvyChusiCUG7lPRv2W6O6NguArYHVsoDr9Zt3+yxa85W2EmeM0LiusPk+
	 4LK8RiL1/2X9Q30uuQUmh8uKvF22YI38/uGdrSm1gVCTw1zOk4JyTKJzl9Tkw7ozPS
	 c8BW7WDRp2B8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stefan Blum <stefanblum2004@gmail.com>,
	Stefan Blum <stefan.blum@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 10/30] HID: multitouch: Add support for B2402FVA track point
Date: Wed, 23 Oct 2024 10:29:35 -0400
Message-ID: <20241023143012.2980728-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143012.2980728-1-sashal@kernel.org>
References: <20241023143012.2980728-1-sashal@kernel.org>
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

From: Stefan Blum <stefanblum2004@gmail.com>

[ Upstream commit 1a5cbb526ec4b885177d06a8bc04f38da7dbb1d9 ]

By default the track point does not work on the Asus Expertbook B2402FVA.

From libinput record i got the ID of the track point device:
  evdev:
    # Name: ASUE1201:00 04F3:32AE
    # ID: bus 0x18 vendor 0x4f3 product 0x32ae version 0x100

I found that the track point is functional, when i set the
MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU class for the reported device.

Signed-off-by: Stefan Blum <stefan.blum@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-multitouch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 847462650549e..86ca25b637809 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2017,6 +2017,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_ELAN, 0x3148) },
 
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN, 0x32ae) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
-- 
2.43.0


