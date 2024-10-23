Return-Path: <linux-input+bounces-7651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A399ACCC0
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B733281755
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9311FEFDD;
	Wed, 23 Oct 2024 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqXit12c"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C858C1FEFD9;
	Wed, 23 Oct 2024 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693887; cv=none; b=s7uQqC2jX4EpG4QpylIeAwjdnrYO4cGhFEUPOrMqIgYHOqu5zFwczcQRPrglALFYNH04WxZbrLFkYEixSq5y6Kl6qhNZ+Xzc/pQOJz2OUjiYPvfPNyhvoVMP0mIZGUQpzylsQkikMTBZigSaa6dYJ+0mDwgtSeC5hfQSWS6UvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693887; c=relaxed/simple;
	bh=pcYghkhCFlNV+K8igYqniTQjQduqPOmfkNNo+wdDicQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iv1Fv9W9fq1axxnfqt8Jz7yVAPE0isRCqo42HeZrHk/Uk06Ef6NG2NqA/DxaVvilNUuyl5ca/HCYMMsmzu/eFeIFXIr7yJTw2Ixuab0yjofwF2m3FN0bY+5noN37XKgSz0MULVn3vpV9f1wHHGB/EkyzgOioEjUlFaCa+4PCxQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqXit12c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4BDC4CEE6;
	Wed, 23 Oct 2024 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693887;
	bh=pcYghkhCFlNV+K8igYqniTQjQduqPOmfkNNo+wdDicQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqXit12cZgN3mdMQXZUtx7kPK9V4G82YwPgVtVQdEBMl0cF2AEp4/Ynje1SYz8z/S
	 2ozxRJZ0uzXTIpQLMwEuQs1wZJRtHrC8ZdllpRO638gfgwgJ+q56jCUjqxyFWSMzrl
	 6RKpVvHkhK6I3NNXGw/MOKRlHO96pjP6hIM434r81MkglZ7RycA0InrE9U6hUEoBbc
	 Sb6fn2StzzPKG53uob0lrNRoqAcnvpG2NnRo3QE9CKkTjxWFZGFb462F5B+ao7L/8X
	 c8s9kgZG/b+MMnVLkUC0kzLUVmphh/A5HH77LOPrMTvzsZclUZFajGJ59jUTLBP5JN
	 xpdPZVpFpP7cg==
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
Subject: [PATCH AUTOSEL 6.6 07/23] HID: multitouch: Add support for B2402FVA track point
Date: Wed, 23 Oct 2024 10:30:51 -0400
Message-ID: <20241023143116.2981369-7-sashal@kernel.org>
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
index e7199ae2e3d91..7584e5a3aafeb 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2020,6 +2020,10 @@ static const struct hid_device_id mt_devices[] = {
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


