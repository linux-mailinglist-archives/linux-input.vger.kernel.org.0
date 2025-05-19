Return-Path: <linux-input+bounces-12462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE94ABC9B0
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 23:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F13F1B62F73
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 21:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB6423C8A0;
	Mon, 19 May 2025 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pckjfH67"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449F23C397;
	Mon, 19 May 2025 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689791; cv=none; b=XHby0D+NAnvP4lu1/QiYAebu5rP/Jc2YDKIBErcfK8YPzMS+6s5PUuTm0b3ttqZlsbWO58I9Gke4eXX2InRZoe+1kyJEA18Ib20i4uy3UYACkgk2SytYD+cA7ZueP4P6xFIIZnG2WDIC73R1Yt4M7KVDSK9/BtXg90wmHMGdx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689791; c=relaxed/simple;
	bh=/crDIFDbmnwb7OcWsl0rgbi+Lsyur9GWgoCG0laFSKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oIKOsP1scAa05Bjj6+rJKuYLA60XAIOTdpFH6KvyqtPUW7xVDR+ZmYbvahkgyz8LIzKAKb5cqOfBUb8ATcj4SLh5LWZvFGi6r5oWr+fvAjWxfAm6vYeLzuMWYXxy2Ab/gTgC3BS5cx2//J5KdMfeqS0av0MAMJgSL679D0lLTig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pckjfH67; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34018C4CEE4;
	Mon, 19 May 2025 21:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689791;
	bh=/crDIFDbmnwb7OcWsl0rgbi+Lsyur9GWgoCG0laFSKg=;
	h=From:To:Cc:Subject:Date:From;
	b=pckjfH67nOf/bJGiUTGY0ItyIqHNDFBzl+YuiPnl4WCpkxppX+hjkDCYxpEkULbt1
	 /Ch6M6354Y2MwNPpJIn1VGztPLQTYHI7CBt3AKl/JSHV8B6yXXxJCgtp+KPAfarHpB
	 EI+KUB0/xBuKoQMWepH3WASuB8pGN8KIjiswmQgwpjTcEy89X0ULoVM5iqMgmLxtjD
	 sHciUcZpPRgG0rOn06ZjRCFKtc1+XOv+122ldqOyqCGfts+Y3JcPHBhYNdzh6i/TSk
	 J+MiOSgUZ/fbZY0fL6Bl3DMXqAUYYs9aQ4auCK051Eo5od64Xbbfzuw+4Zk4fZM1be
	 yQxPL8jN10UxA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Milton Barrera <miltonjosue2001@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/7] HID: quirks: Add ADATA XPG alpha wireless mouse support
Date: Mon, 19 May 2025 17:23:02 -0400
Message-Id: <20250519212308.1986645-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.183
Content-Transfer-Encoding: 8bit

From: Milton Barrera <miltonjosue2001@gmail.com>

[ Upstream commit fa9fdeea1b7d6440c22efa6d59a769eae8bc89f1 ]

This patch adds HID_QUIRK_ALWAYS_POLL for the ADATA XPG wireless gaming mouse (USB ID 125f:7505) and its USB dongle (USB ID 125f:7506). Without this quirk, the device does not generate input events properly.

Signed-off-by: Milton Barrera <miltonjosue2001@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h    | 4 ++++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 44825a916eeb2..08494eb652091 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -41,6 +41,10 @@
 #define USB_VENDOR_ID_ACTIONSTAR	0x2101
 #define USB_DEVICE_ID_ACTIONSTAR_1011	0x1011
 
+#define USB_VENDOR_ID_ADATA_XPG 0x125f
+#define USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE 0x7505
+#define USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE_DONGLE 0x7506
+
 #define USB_VENDOR_ID_ADS_TECH		0x06e1
 #define USB_DEVICE_ID_ADS_TECH_RADIO_SI470X	0xa155
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index b5ad4c87daacf..126cadb117fef 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -27,6 +27,8 @@
 static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AASHIMA, USB_DEVICE_ID_AASHIMA_GAMEPAD), HID_QUIRK_BADPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AASHIMA, USB_DEVICE_ID_AASHIMA_PREDATOR), HID_QUIRK_BADPAD },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ADATA_XPG, USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ADATA_XPG, USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE_DONGLE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AFATECH, USB_DEVICE_ID_AFATECH_AF9016), HID_QUIRK_FULLSPEED_INTERVAL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AIREN, USB_DEVICE_ID_AIREN_SLIMPLUS), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AKAI_09E8, USB_DEVICE_ID_AKAI_09E8_MIDIMIX), HID_QUIRK_NO_INIT_REPORTS },
-- 
2.39.5


