Return-Path: <linux-input+bounces-311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAA7FC792
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F43B28645E
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6563144C8E;
	Tue, 28 Nov 2023 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObBqXwQY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4193C42ABF;
	Tue, 28 Nov 2023 21:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D477FC43395;
	Tue, 28 Nov 2023 21:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205795;
	bh=e9PbmeTufKXFrUYtsn5zXoXH688KxkKlSgNdTftZWkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ObBqXwQY2as7Y6CSS+zZXlVUyEvTPkID9QBqsNU79gaHseNR4TQPFg6nBBkBb/sud
	 Cfm+nY7lLHlPnZnxyi0ge+4ngQsNketET6G/bwT80ElVjLQnJFkH14qIuou9lj11pu
	 DxDAGALUlqQIhEXVYO4KObpL9HrOEpoem3T6dwXXpuGCPPAA9kgCbfMUUcULSIlZqa
	 Zyn8v5HjlzKuN+A2KrmqGwoBOzZOnfU9oDKxplhQUjfg52WDIGegvh0CN1TkEQ1d0W
	 s3p8mO/urDkOeC7HwZfYngVQBfWVNYBs138KwnFqt8cVgGtep+A3ECUGKgVhlA9Rnt
	 E0M/7hskCG9bA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aoba K <nexp_0x17@outlook.com>,
	Jiri Kosina <jkosina@suse.cz>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 09/11] HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
Date: Tue, 28 Nov 2023 16:09:33 -0500
Message-ID: <20231128210941.877094-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210941.877094-1-sashal@kernel.org>
References: <20231128210941.877094-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.262
Content-Transfer-Encoding: 8bit

From: Aoba K <nexp_0x17@outlook.com>

[ Upstream commit 9ffccb691adb854e7b7f3ee57fbbda12ff70533f ]

Honor MagicBook 13 2023 has a touchpad which do not switch to the multitouch
mode until the input mode feature is written by the host.  The touchpad do
report the input mode at touchpad(3), while itself working under mouse mode. As
a workaround, it is possible to call MT_QUIRE_FORCE_GET_FEATURE to force set
feature in mt_set_input_mode for such device.

The touchpad reports as BLTP7853, which cannot retrive any useful manufacture
information on the internel by this string at present.  As the serial number of
the laptop is GLO-G52, while DMI info reports the laptop serial number as
GLO-GXXX, this workaround should applied to all models which has the GLO-GXXX.

Signed-off-by: Aoba K <nexp_0x17@outlook.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 590b25460456b..c37399f61c67b 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2003,6 +2003,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_HANVON_ALT,
 			USB_DEVICE_ID_HANVON_ALT_MULTITOUCH) },
 
+	/* HONOR GLO-GXXX panel */
+	{ .driver_data = MT_CLS_VTL,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			0x347d, 0x7853) },
+
 	/* Ilitek dual touch panel */
 	{  .driver_data = MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
-- 
2.42.0


