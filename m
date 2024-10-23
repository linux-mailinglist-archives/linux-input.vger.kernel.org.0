Return-Path: <linux-input+bounces-7658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE119ACD4F
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B78281CFE
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09F61CF2B0;
	Wed, 23 Oct 2024 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DK/vEbsG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60362170CF;
	Wed, 23 Oct 2024 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693994; cv=none; b=m781OXmzoIdCWSDc4jANhMygfnxcTpvml1Ahzy1l9M9uS2+ycqUBgvpAJo0lFaP1ie9OuTdebT4Mn6JogS+LK+9siEpOz5bXwdeDd+tBcpvjYiMDsHj4AixV8EcfTvE5Y64KgjOgJFKrbCv/42CYOSpkk7k14azRSDcl3jYb6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693994; c=relaxed/simple;
	bh=TluvFe3twprDcJ5sIkgBOrOGRgjandOXNjvKISZ22A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+e9tLOgewNQoyx33hOTyakEO4d/AUkVycM2be4uk4Po4fDMtJvzabvXVNsc52vB1BmUtS3VapoTBG179A9F1c1QpbXPtcZ2Jz7/RfclEgqt6wIxl8L+aZhZ1U3+/JYAuIB3MBNpHKOmOVf/k0Eca/cCUcDL2PSBGcBbN7vB1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DK/vEbsG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89634C4CEC6;
	Wed, 23 Oct 2024 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693994;
	bh=TluvFe3twprDcJ5sIkgBOrOGRgjandOXNjvKISZ22A0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DK/vEbsGCeRHorI1oG7IrOJgyNCK3pPfyVU3defCQVIExiF8vXEWMA8w8JPbXrvzh
	 H2vSmnW/S6wvwfUA+FLU+vLcK7xZWyUhL2R4/IrDL2pxhkF1CsQ3MlK3rA9rs9uFJ0
	 FLhYDwGOqF0SwT9u9I0eBX9pCDYLTGvY75/0uRH21ypLOYIK+YV/WzAizVg8W8ZOqM
	 qopVnTq+AsYzPnIkttH5Zc2Gt+rF+lTwnHQEZt3dhJho1UL+wEWADCgC+lMWKYOOqr
	 yKbTiZp+fZKCXzgfKbRtPs9673NbTSdnkX+xkk2LMG/sg8hCtD4kJyahwsNDU8ParJ
	 hN94LRuVcDixA==
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
Subject: [PATCH AUTOSEL 5.4 2/5] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Wed, 23 Oct 2024 10:33:05 -0400
Message-ID: <20241023143310.2982725-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143310.2982725-1-sashal@kernel.org>
References: <20241023143310.2982725-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.284
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
index c3810e7140a55..5994e7d1b82d9 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2008,6 +2008,11 @@ static const struct hid_device_id mt_devices[] = {
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


