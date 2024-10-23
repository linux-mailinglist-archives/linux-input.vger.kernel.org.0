Return-Path: <linux-input+bounces-7656-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 282FC9ACD2A
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C813A1F21B71
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD732139B6;
	Wed, 23 Oct 2024 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ks0Kh7nJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DEB212D1D;
	Wed, 23 Oct 2024 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693963; cv=none; b=THeyxOZczYulhlKxoou6Ctp5Y7YZURY25xif3rZoYftn/Giuh/HC8pABnXEsaU6nuD+jZrOXJkc8fz61/USvbFz8UsG8uE9f8rIsE+mRRlBa61iiyIcetuA8KEGVPwdhoP3s7Puh6HpEpyHrE4sPdnOaBZdFLI+OGBVAexOMuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693963; c=relaxed/simple;
	bh=6pm4+2LkxlcEqFrd2/YsVIJ5bDVvjXdc3DP+gnQtKBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9LOX/5umbBU5mwvs2JrrnMogV8uG+4n0/1xZpOLGa6Sko0HN9fzdIeyKJM3uRPh14o9uiqUlebl+3n7dPl8bBFOqbdfPL7J2ClSfJqhnXuWqZynwwexANuQFhjBFLVFoKgXaaEUNwuiGaDRxIHbGYCi9Ilq3rEwUMa2d58Ib+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ks0Kh7nJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DFAC4CEED;
	Wed, 23 Oct 2024 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693963;
	bh=6pm4+2LkxlcEqFrd2/YsVIJ5bDVvjXdc3DP+gnQtKBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ks0Kh7nJ8yHRl4nhNt7TVgO9FqtpEW0DIiu39ToH0Rf7xj4YtpuQw19FY/WB92Htt
	 rfd4FqLZmwHaxiFS9oHdsvkkNkjChCcdZbBz1tHa057UOQ9m88fkWjS3kg05YY4mW8
	 9c9smsMT4H8B7FZAP+Ly6Tj/d5l1ePLS4a2ye7QSjeyxvXI29D5/10fFXwiGUGyoEg
	 gd9A8FEoii3/I+3BTVixSUkVJ82XijA1TFYDmb5JouSJuEWeRkLrjEIB8keI9oX+hi
	 jnplGQFWLHTsLBKn5cwoeHB3wx3fG73oc5A7pxqN3Id90tun4xz2ZpCRIV84M+Nnf1
	 TwhCg/DhRmv/A==
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
Subject: [PATCH AUTOSEL 5.15 05/10] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Wed, 23 Oct 2024 10:32:26 -0400
Message-ID: <20241023143235.2982363-5-sashal@kernel.org>
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
index 116876d710932..8f6e410af7016 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2087,6 +2087,11 @@ static const struct hid_device_id mt_devices[] = {
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


