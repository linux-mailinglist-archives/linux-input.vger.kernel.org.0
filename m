Return-Path: <linux-input+bounces-7657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E629ACD41
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C7051F21DD8
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 14:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A77C1CEEA2;
	Wed, 23 Oct 2024 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL3r969J"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E73215039;
	Wed, 23 Oct 2024 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693980; cv=none; b=U9MD/DmAvvH2jT2TnS2OpM6M5nx/OAsnSU6HFSqb5SLSAlA3n1ppCfYCg0mTO2G8vsAI2luF3yguTJR8vhzFqt2onaPJwBQ9biQz4v0T4isWyQsF00t9Q0zCPu4oJve+SgV1PaVhHjFsPQ29bA0/6ZD7KReTcdPLkXWxNFagPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693980; c=relaxed/simple;
	bh=pec6a4Lcqk+IPiPMaQTySU2YfcnPqfpdmBjJv64oY5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LymW80tHQCID230LbJI+iwlzOxuBgpbpXIaR1QLjWZ8s8BPHi/gLoFwtehMnJzNNfSA8MLE7EOtyrrvFZ9EE3n2QqlS7AsRTcB8ogv5+w9vIkEnetIHp5WM+7PPjZ2Qc+MjnFZDpCvrsA3mXpjyCVJ8PPXzUhqhDvEfHLCIx5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL3r969J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9715C4CEE5;
	Wed, 23 Oct 2024 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693980;
	bh=pec6a4Lcqk+IPiPMaQTySU2YfcnPqfpdmBjJv64oY5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uL3r969JFFaRhkHzLJBZUJS6XZEOOE0XVCwPs0Df+Wk8fHwxxPMlzksOi3WclxAAK
	 yi51C/bXL4RbKLH3YZ3LyyAfq03OmziF3GGqCIhl8fYZ0JrqVwvqcA73LzV2eQmbFW
	 3EPJdStt5FWKPVu/cFdUNnxXvXReJk8zC17QxyDfyPQ54OJHbuBvB+XTvwbA2s2HjE
	 luWTYN9tvZbRe9PV+P4Q2DVZeIZybGEvTCNC5hW3wYwGplcRqfqYpQnd6294eHmQKX
	 uLEFdlnPEXecL1KiiLuTp5uetQFyXXbAdmbSIXTOG3JMXcWm9+8MoHVe3dzEFAOjIW
	 3horEgz/NxkKA==
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
Subject: [PATCH AUTOSEL 5.10 2/6] HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
Date: Wed, 23 Oct 2024 10:32:49 -0400
Message-ID: <20241023143257.2982585-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143257.2982585-1-sashal@kernel.org>
References: <20241023143257.2982585-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.228
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
index e7b047421f3d9..f36ddcb4e2ef2 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1967,6 +1967,11 @@ static const struct hid_device_id mt_devices[] = {
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


