Return-Path: <linux-input+bounces-7652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF989ACCC3
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9173B1F210F1
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA9D1FF608;
	Wed, 23 Oct 2024 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJUJIIQ1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9190A1FF602;
	Wed, 23 Oct 2024 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693889; cv=none; b=fIswIbSXiQzAM2kbZ9w2iUudWtoqcVxxMJWa64ZIjSUJWytWX0oHvaI3YpnNPmNT8mh12IlfkgIIMwN09QVRahH84hbu20ruC/4juk+tIENAs/+AmpUP2VvyQ8OkDsg1gWMpCQOadWv72/QFRh6OlT8BvBDMgCCnuwk0y+x4xpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693889; c=relaxed/simple;
	bh=9NR9V/ULjUQ/8dQBa5AwHD9HqO6q4q//JBLJcH2ak+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUy51ucNUONnYTudjcVd5pBOEAIssmqbv2DGaIt99FQnXYX+trsD89OSG5ofuzkWZXrHkVEGxMZLTJwAZiM+wcQ87kUS8Xu5e0Tlx3ONm2Zi9Db3vXD4iAPxFVWqe4YlBqB2ODmCXpAlFH8PeO/QZPr9Xp9YFAt+vbYhFwAXmbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJUJIIQ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BA3C4CEE4;
	Wed, 23 Oct 2024 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693889;
	bh=9NR9V/ULjUQ/8dQBa5AwHD9HqO6q4q//JBLJcH2ak+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJUJIIQ1cloqyD+9ItJD5ezv1n9K3DMlhw3FtHtOoYU1ybWwG+BWpLim7FELAGMr4
	 TFy2nqXfuBeQB6KF6XCOev+XVh7n4yN0aBXY0DZLKHsK3Bk+j6058dr47iV11IahAM
	 nmgyX/uzybO7g7zwYvCCFpGPVCHDehk8TI83VaZgwAKctb5cYEvJupbjXT3tC+fy24
	 3XxhpZw/sG2nqyThx5eozEDYGkNGYCnhF4U7gxD6nzFb8m98XKLiikKnGnvFMo+eSQ
	 Z02ifA3n4Hgdz/1ic6hmrynX1wB00JkuC+hjDTkkVLoqn+B3iZZRuk38WIceRwWzqY
	 k1NtLiujgIQ/Q==
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
Subject: [PATCH AUTOSEL 6.6 08/23] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Wed, 23 Oct 2024 10:30:52 -0400
Message-ID: <20241023143116.2981369-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143116.2981369-1-sashal@kernel.org>
References: <20241023143116.2981369-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.58
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
index 7584e5a3aafeb..c2d79b2d6cdd2 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2093,6 +2093,11 @@ static const struct hid_device_id mt_devices[] = {
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


