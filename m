Return-Path: <linux-input+bounces-7654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DD9ACD00
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B393283D54
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC7320ADF8;
	Wed, 23 Oct 2024 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDLOihz+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255A120ADEE;
	Wed, 23 Oct 2024 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693932; cv=none; b=Z8ImzvYbZsdxtdPU47+GBjBoctcPu5F6sq02Cq866H+ZtlVZa2FFPvJGu9Nigp6PgTJ4HsKqSylytZMsi8chpkdXTKGDUnP02jcVuBFdvywDH+brM3iYHY7d7oRrwivR59Q6DaM4TWUAd32X3LcHMAepq7Qz0toyJue+XTGjUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693932; c=relaxed/simple;
	bh=9NR9V/ULjUQ/8dQBa5AwHD9HqO6q4q//JBLJcH2ak+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnGdTqKIkjnF3PaQfr9N+nV5gTpDiYVAATjCwGqKCtE6qc9iFZzkdvAfSJSSJc/jqtx4hL9FyxUpEP/ATV+aVnch+WylSKkt7cjp9HAZ/hdeDBz34fpEk7aS7I+Eemb3IylJotpdRkfRGlf4cfRZW5XZnIw4ghQSuXxIp5Lno4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDLOihz+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C017CC4CECD;
	Wed, 23 Oct 2024 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693931;
	bh=9NR9V/ULjUQ/8dQBa5AwHD9HqO6q4q//JBLJcH2ak+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tDLOihz+aI/nLY03f0L2QXSPH8RbWIHEdy+YTiyEVseL6PNm3oKoM8lWf3mVVHgBy
	 LlGPIwNFkonPPO7xb3z9AGle9kx+XX7FsA/limPeA3x1c9muWOK0TbmUu1iDu5ts2g
	 kaFVFyeplen2fyN9RI7SezV1PqG9uGKiMRGz1nW3/r1Rgx+zdU8RqmZUJk0JdyhdQ4
	 uGo9uH0iZS8DmaRUxkXfQQ8kTKx4hDTTJ+j8jg8vs0fnO/vAJiBKJGAFha6aJHiaAM
	 XLX07/fMYKsR8lFZnVLrGrHH0xGxyu4X7C20UE/7dh7yDb06HTFHIR7Qwkydj28S+g
	 5KM+VVimDtxtw==
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
Subject: [PATCH AUTOSEL 6.1 06/17] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Wed, 23 Oct 2024 10:31:45 -0400
Message-ID: <20241023143202.2981992-6-sashal@kernel.org>
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


