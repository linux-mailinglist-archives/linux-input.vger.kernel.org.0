Return-Path: <linux-input+bounces-7655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7A9ACD27
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E54D91C219D8
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929A8212F04;
	Wed, 23 Oct 2024 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaVwHj5g"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C68212EFB;
	Wed, 23 Oct 2024 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693962; cv=none; b=WzuZnuMaumU8XTHtZj28pw1BB/kGHtZ4liBhoUG/67Lk/Ausu6qxn2iB4xekMIwpzJquRjM54XMel6m0KkT2m4Wjgv0qFeFWZI/5fQHZKJ8mAvPJ/c/wCZYfHpAmCCrI1buXxnH4UWwo+cyHfQ8KGfm4Bnu8vmvZY+xzc4dwkJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693962; c=relaxed/simple;
	bh=0s/sSlUW922wNbOlRL3IxXWYz3e8KOVME6YhB9erIDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPbf9Q6NuIrFyxzSuLhLuJyfQsU1idag1ny1+VnKOOD6FVCFfHqTQPls1QKbEwA92vEue62Of7Lf9HMtu/3+0oAz4XtB3+f0Dz7jUnEwa3aZ3P+FRDb9+B1uqErZjer/Z+hbbnUj89mxME4QI+xDjhcEHZSPDrv2XsDltfaNWIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaVwHj5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5140C4CEE8;
	Wed, 23 Oct 2024 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693961;
	bh=0s/sSlUW922wNbOlRL3IxXWYz3e8KOVME6YhB9erIDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OaVwHj5g4RPWHb1JN1H2pRUF0tLXjfwFhGhZjH5k+Wh3AltqfK7MXNsygPiT2tpTa
	 Wt8FxzkLXrdcCML8uSfQXbCXr27MBZwhCAcNd+aswIH+qMgRFzBq/yc2aXqAk2t9oD
	 +qcsaLRyYJ2VLeX/FIG7w/J+nege55g8R+FEp1xPwObrQYDYYXJMKKw07iluYFdrls
	 07NLmrtsysElFk8qOScVlWGpPEkbfBiQ6V0Zkstqc6rLJMhUajkQl/Hp8JpaEzIZdq
	 ysciyo7fTsRat4JxcDA6X2O6Wg9vzzuFSIm8KExvFPx8X3reTo1REZx8+x7KjE/H1j
	 4caC3AaP+4zKg==
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
Subject: [PATCH AUTOSEL 5.15 04/10] HID: multitouch: Add support for B2402FVA track point
Date: Wed, 23 Oct 2024 10:32:25 -0400
Message-ID: <20241023143235.2982363-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143235.2982363-1-sashal@kernel.org>
References: <20241023143235.2982363-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.169
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
index 6a3f4371bd109..116876d710932 100644
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


