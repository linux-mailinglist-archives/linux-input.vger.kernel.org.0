Return-Path: <linux-input+bounces-9561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67457A1CAE6
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AAA616D9D9
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA1C20B7EC;
	Sun, 26 Jan 2025 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8pLO9h0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7263720B217;
	Sun, 26 Jan 2025 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903751; cv=none; b=ORb2Qpt7wtQSGmCGvv5DFUrF9yI7xdJ/irspHK9U/ol91M3CVGF4sBqWZ5wMCWsCBm81Rr6IP3+z7VHbb+Ic4Chcqghrnz4ZC/2NYn1Gl+0gYpQ3BJ5xwWfu8faJGhY+rahZAr5Erismj9B7A3SVADJVZdB0pk/iNZmXjNiwL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903751; c=relaxed/simple;
	bh=UxDtir6KIQ2RGr7VqMhs5XzKoRvly/KWG8bhp7yp+Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0KMvb88xt40P86iQRDdKrAnyEcWe2SHMXcAAiiU2TA92XwPUzODZmGpxtIxfX+MyhHMbFTZyKXemjESrsf/3iOp5FSVTgHc0NAsATy5cjYePvpMg/nT8KL/8kZI3EtfwilGBbwyguqCjt2iU/YQq5x9jIGxxKHBCpxFFYR7Pxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8pLO9h0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD24C4CEE2;
	Sun, 26 Jan 2025 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903751;
	bh=UxDtir6KIQ2RGr7VqMhs5XzKoRvly/KWG8bhp7yp+Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8pLO9h0OdYpa12znscb0Z46812ZT6Iy1Y4b9QdkyidZvMVIgepePbHKi0ilXX1Se
	 HoqIZS+9RRGmnjmMd61Vqm0S3SvNtdqSgQY1DwbUPpzB/ISkvlc/DkYx2ATgNi6BBn
	 XaSKlVsmh4GYoK2LJew1ddc9xl4PFVZkX3/88EroGnZLPIC2Z5iDxzdjoeDoO6esEy
	 usDrvQvdX2XeYjRpSe+b1ySaSj0aLtxldICYSZ0INPBP4lhiQsRrarShJv7jz91tNQ
	 FLyxRfdxQugxcgS2bXvRe+hSnmyu2Df/1QsMT3i5wsnQGmqi14f852/TJIdIiyBTwF
	 Zk0OIviD1q04w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Youwan Wang <youwan@nfschina.com>,
	Enze Xie <enze@nfschina.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 11/29] HID: multitouch: Add quirk for Hantick 5288 touchpad
Date: Sun, 26 Jan 2025 10:01:52 -0500
Message-Id: <20250126150210.955385-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150210.955385-1-sashal@kernel.org>
References: <20250126150210.955385-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Youwan Wang <youwan@nfschina.com>

[ Upstream commit b5e65ae557da9fd17b08482ee44ee108ba636182 ]

This device sometimes doesn't send touch release signals when moving
from >=2 fingers to <2 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.

Signed-off-by: Enze Xie <enze@nfschina.com>
Signed-off-by: Youwan Wang <youwan@nfschina.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index d1b7ccfb3e051..160bab6e50cda 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2308,6 +2308,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_SIS_TOUCH,
 			HID_ANY_ID) },
 
+	/* Hantick */
+	{ .driver_data = MT_CLS_NSMU,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			   I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288) },
+
 	/* Generic MT device */
 	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
 
-- 
2.39.5


