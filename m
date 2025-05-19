Return-Path: <linux-input+bounces-12461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A22ABC99D
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 23:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4F71B6436D
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 21:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349622367D4;
	Mon, 19 May 2025 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFtfWVyK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F3B21FF58;
	Mon, 19 May 2025 21:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689778; cv=none; b=pm14p15VuCFH+YcTMFf8Gh/5EcEvU8VroNFGaJDoslYBVlnMn1RZcfgjWnZZuBMlaTHqMlB+apknc45GtJYV+BL1bIiTiyeMt2r6+a7RA7X5cTT5KFCBvbN7Iu2dSnH3wr/fR/8yhZ1Fge5lM6yLW7wR250Zq8rSCvK1pVSRNT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689778; c=relaxed/simple;
	bh=rfIa65vyum64jopcZ+d1JrwUkCLf/hipxO+zAZcHBqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BZ0e8YdAMQCKzBT1/oylGMjBQPK6y0jcjmCJktZgMEgdlDcLoR75lSLO8/ClwpOcK19ubwUgLN3uadyYJfwt/ak+l83O6rF341gukUsjXG0YU7lDTfB9n8yYBmhWvUnK7KFj7XqLYjwAoC9/DNVZjEgYSIeVII/382XPqBVbELs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFtfWVyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D134BC4CEE9;
	Mon, 19 May 2025 21:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689777;
	bh=rfIa65vyum64jopcZ+d1JrwUkCLf/hipxO+zAZcHBqg=;
	h=From:To:Cc:Subject:Date:From;
	b=BFtfWVyKAUR+MW0qqCmlvzpNHq5r5sSfrl4Yqky+oJWP3GPQ8cow26PI9yulhxksn
	 RQOSqY1l6NAJA3h4Ofm/N6VBBDYwT1UDYNNimb5yxT2h3haDFjSd9l7GluXbP4tPfc
	 nsFFTn0ToN0a8DtTWDOfy8nCvR4qlmP44OE0sdg0H2vsMHcgecFpLIWUqsVXjbJCBL
	 SoSovIGeCe+9Zp2L1BnTfK0o9SHjul8I7dEkZn7W3e0lz9bSHmPVJYuoP6M3UAbUEb
	 MIELFqiOHGJ8K4E0trtrNJ4pJ938anhwLr8u14gGChlR7SooGZFEwwGgHzQZ9ivw4R
	 c7cTpq08f1nBQ==
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
Subject: [PATCH AUTOSEL 6.1 1/8] HID: quirks: Add ADATA XPG alpha wireless mouse support
Date: Mon, 19 May 2025 17:22:48 -0400
Message-Id: <20250519212255.1986527-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.139
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
index 4187d890bcc1a..e078d2ac92c87 100644
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
index 875c44e5cf6c2..d8c5c7d451efd 100644
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


