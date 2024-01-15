Return-Path: <linux-input+bounces-1246-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A27782DBE8
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 15:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34066B22393
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 14:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13828175AE;
	Mon, 15 Jan 2024 14:50:34 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57210796;
	Mon, 15 Jan 2024 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id B3927101657;
	Mon, 15 Jan 2024 14:50:28 +0000 (UTC)
From: Max Staudt <max@enpas.org>
To: "Daniel J . Ogorchock" <djogorchock@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	max@enpas.org
Subject: [PATCH v1] HID: nintendo: Don't fail on setting baud rate
Date: Mon, 15 Jan 2024 23:50:00 +0900
Message-Id: <20240115145000.12777-1-max@enpas.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some third-party controllers can't change the baud rate.

We can still use the gamepad as-is, so let's do that.

Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/hid/hid-nintendo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 997c3a1adaca..8cba0612c3ae 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2164,8 +2164,11 @@ static int joycon_init(struct hid_device *hdev)
 		/* set baudrate for improved latency */
 		ret = joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
 		if (ret) {
+			/*
+			 * We can function with the default baudrate.
+			 * Provide a warning, and continue on.
+			 */
 			hid_err(hdev, "Failed to set baudrate; ret=%d\n", ret);
-			goto out_unlock;
 		}
 		/* handshake */
 		ret = joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
-- 
2.39.2


