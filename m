Return-Path: <linux-input+bounces-3862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 909358D0462
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 16:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42216B2928F
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0E716F0F6;
	Mon, 27 May 2024 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4L5XRQ6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FAB16F0EF;
	Mon, 27 May 2024 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819195; cv=none; b=AAWVmUGxNWXwWVko2OHr50LY8DsrLyNMgtf+g5ZQ4aVioQUQgjR7stJun1yv091AI3LGk95eJvdGsk6GgdUmppZ8eA8G/Yj/mcTK/W6bQQPb31rQ0andFUrqpqkiMW9O0gKMcAXzKdyKxBbL+sLumG8+LQbknb8wM/0K7HEMhC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819195; c=relaxed/simple;
	bh=ETcJdqbSScuSY4Yy7oqB29b8RsjwPd19paZ2rBpxt5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAnWjh58hzDC56hKH6xKDtmVSf++0A+p7MPdixiGrDY1v29a+GVgiSyPasN2bbzb9fiBW6S30rMtKbKsNdnHA5O9jqO0N2GokeXY0cMfR1ZwINukHO9Vp4rFhM3U272/H6Rodbxqx4xgFOywZnyprRApqgbofS9oWld09zL3aKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4L5XRQ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6CAC2BBFC;
	Mon, 27 May 2024 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819195;
	bh=ETcJdqbSScuSY4Yy7oqB29b8RsjwPd19paZ2rBpxt5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4L5XRQ6u2dmmxfEC5SCZ4unDBPaDEeh1xk9XOqnbvsMVnCwiWS1jA/VpM+OU5yaB
	 lXF65F3uwVwfXKw7yxsxRh67o35JUruG+8ioj/Azc8NqmlmbgfR9sigfQtqu1YK8q+
	 38yJkVvmjLb5Et4pH0qyvrz7ocYEu8Cxr+G4KUs2jqRMlzfID5mCbAwjrR8BJlHtJb
	 jQ1IbuOjtq2XzKY+w7BC3ULhuyM4f5VLi1qt9+wfJzqpOmvqwS6Y86blJM1bSxvaBC
	 NICB9g3QEGiy0Ntiy/be1IcXAUTuG+kDDqmYnLG0E2dqi6Kd9VNDV99UmKqKEDO9nr
	 7xurGlghsJRRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean O'Brien <seobrien@chromium.org>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 28/35] HID: Add quirk for Logitech Casa touchpad
Date: Mon, 27 May 2024 10:11:33 -0400
Message-ID: <20240527141214.3844331-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141214.3844331-1-sashal@kernel.org>
References: <20240527141214.3844331-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.2
Content-Transfer-Encoding: 8bit

From: Sean O'Brien <seobrien@chromium.org>

[ Upstream commit dd2c345a94cfa3873cc20db87387ee509c345c1b ]

This device sometimes doesn't send touch release signals when moving
from >=4 fingers to <4 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.

MT_QUIRK_FORCE_MULTI_INPUT is not necessary for this device, but does no
harm.

Signed-off-by: Sean O'Brien <seobrien@chromium.org>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8376fb5e2d0b4..68b0f39deaa9a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -823,6 +823,7 @@
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
+#define USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD	0xbb00
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 04a014cd2a2f6..56fc78841f245 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2081,6 +2081,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB) },
 
+	/* Logitech devices */
+	{ .driver_data = MT_CLS_NSMU,
+		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LOGITECH,
+			USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD) },
+
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
 		MT_USB_DEVICE(USB_VENDOR_ID_ASUS,
-- 
2.43.0


