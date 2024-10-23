Return-Path: <linux-input+bounces-7653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 680ED9ACCFB
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F2DE1F27654
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB81D20A5F2;
	Wed, 23 Oct 2024 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvxULYXf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163720A5ED;
	Wed, 23 Oct 2024 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693930; cv=none; b=QzDd55EgPoj/bjMkVRkFbNHdSr59bJ5+P6TTZ49tMmSBg/5FRiol4t9DkSZ3bOfk/QbyX+Y/MqfTk5eo3n9PQb/Zrv1zVTnP4sRD+8lFdW8sVLpBubeVmSa+hMZRA367HLIcL4HZBhtopJy9RH0lT0tpXmj+2O0FI2Fu8jJBIrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693930; c=relaxed/simple;
	bh=pcYghkhCFlNV+K8igYqniTQjQduqPOmfkNNo+wdDicQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvNmW8AaVfqmFPwgieMvS4ZH54SZjrJ9Yvj3o1/Daju944Z1v/8odOIXNCvgeuGSXUNQ5Vq81pzjWTEHMrJLUHYZsNZDnqcoyLBYHA8FH4Z4p+hTmCUdJwSII34TJnYa36Qt+GuKy8tj4VPGtzGGontDVTVujRiY3zilmDbpUOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvxULYXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0D7C4CEE4;
	Wed, 23 Oct 2024 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693930;
	bh=pcYghkhCFlNV+K8igYqniTQjQduqPOmfkNNo+wdDicQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvxULYXfzd7B8Ix9So7S/1SHRMEM5Xrke5xfpbY92LlVhYGL3pfu6M3S798NAzpxM
	 KGHKFbZ7kIVKd+7E8dlucaYrhJ1w9vNKNuI7XbU3lX35eQKvQLYwmzqnZ5TXj5HQeF
	 z6VZ0RPQbin0qKD9W0KaZhJGejf32MdMVd++tSfs4TFWMpy7Mqc3K63UlIJaY9ma4D
	 tjaSUQSOicX3WuNHGfIOxpGJFxtu2IIV9b+9nM5cmIW55OkBC0O8yKXw9w6RAPfsRj
	 RIVcbn1Rn8NTj1iaiN9oHedBjUx5+81NsHySBlPf08gZ+3cgjJfQ3tqASOc0/8hsKe
	 AzOmgjAAAhOFQ==
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
Subject: [PATCH AUTOSEL 6.1 05/17] HID: multitouch: Add support for B2402FVA track point
Date: Wed, 23 Oct 2024 10:31:44 -0400
Message-ID: <20241023143202.2981992-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143202.2981992-1-sashal@kernel.org>
References: <20241023143202.2981992-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.114
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


