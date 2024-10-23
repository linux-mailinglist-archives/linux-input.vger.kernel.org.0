Return-Path: <linux-input+bounces-7650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 315629ACC72
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D163D1F25622
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BC31CDA2F;
	Wed, 23 Oct 2024 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOmmTuyd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4821C3318;
	Wed, 23 Oct 2024 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693830; cv=none; b=UZyqcp1mO0vR6xgjHKtvzvc3NtaCiQsVkFCUlRSKaXkbyHK79MsWs9FX8+m3cULdjLSAS4a1J2UkKd1MxEayeN6orxP31AUr4Tlo2wvc3BmtaXX8xgZljsyrSBQmyuvZco1Rb7toJL/s6vvVVqowlU4smyI52VlExfgONxHqzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693830; c=relaxed/simple;
	bh=ANizjCcs8Hw6o1PZB+ifobuIwh8rqlEOrhbx93AluY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBwYotXs7UM2uVbMssUO3L32oWgI9QnUwNziXep3htANMCNNiOv+OvZ+f9T2NjTrj3dEE3Z3/G24EsYHH4Ay+3h7GOy+oOSfAs1l6IFsWl9JbPuqpiwiji05RcKxrbyKD0o4kJHZC5mL9VBCiMvy/hFqDjoxr+zZJ563+mTAuws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOmmTuyd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE396C4CEC6;
	Wed, 23 Oct 2024 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693830;
	bh=ANizjCcs8Hw6o1PZB+ifobuIwh8rqlEOrhbx93AluY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOmmTuydETLcte0vxFYY5Zxph60bsg+CIlQp2QTz2jSwPgD2tX6wLBEkucPr/2km/
	 Tq5CbOwRqc8FDQrFO05AWaSUjBoA4WMLfJdZPpysVJYf36ACgOLDcjSHOwFeMkqflS
	 nozVsZJajQEeJbSaGAuBYJsJ2DsCE/6EyrlB57hvlShcgD1GZbDxnIGg6waNlR6rgv
	 oWqEisyv5eWmEJaa/fuikZprPGYonTyjAcf8PaQCNXcEoyWUIONazFg/w2GdHXrHdQ
	 wp7i8YjWtnqOW0KhLI3nY0gF9L8+dAi95HjbucKhqZeEHxEz9TZlLe72ikTkdz9m9f
	 P9aOjJzMZKqoA==
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
Subject: [PATCH AUTOSEL 6.11 11/30] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Wed, 23 Oct 2024 10:29:36 -0400
Message-ID: <20241023143012.2980728-11-sashal@kernel.org>
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
index 86ca25b637809..871d7417824b8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2090,6 +2090,11 @@ static const struct hid_device_id mt_devices[] = {
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


