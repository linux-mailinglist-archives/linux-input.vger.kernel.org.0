Return-Path: <linux-input+bounces-16622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BDCCADCD
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 09:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5F5306D8F1
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 08:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B775F3009FA;
	Thu, 18 Dec 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nj+PhAqJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890EC2F1FDA;
	Thu, 18 Dec 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045500; cv=none; b=FxOkZoyZTWeWOBkdQ1EB5G68+2DIAdtmmDxeIHiF8wwkB+Ljs+qJan9gZjGVx6wE8EngOBx6EZM7JE4rD/RC/fBBEyJuU8B1Sb5/dzDqUHDQ4g//NU0QrRtzed/F/DBXkqwkmMFPJhqYiqQ4Fe3z6IbrQqAufE7/7NmOLnTDy2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045500; c=relaxed/simple;
	bh=0nXB07FG1QyZZmr7nXNMOdOp6Qnxp853fB5haK5cnGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kAKg0A6QNl9F/YH8QCKj2SPUYwCY4QHS/igsuPu0JvEcc291cgmNsPuYDrya/nXhguUP7wTh9AljoWmCMXmMcmscuTjdWJyAE6QFrvBPgWxcg1xObWp8ump7UVaJ6F27+SUuGIImb6j0In/q4qsGCHT6wqO2zjKoXzanSHs9N4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nj+PhAqJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15582C113D0;
	Thu, 18 Dec 2025 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045500;
	bh=0nXB07FG1QyZZmr7nXNMOdOp6Qnxp853fB5haK5cnGI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nj+PhAqJ8yUxH4Mv6itEIrpnd952dQO/smPXexULoGuKPGa0cfM3WwJOTu3mrCzvv
	 TU2SA8GYzEewuo8tG7O4iQiD5X6AiTSS+UGC9SsP/XjhGq1GUGkFY/ukT8x0FpRaSx
	 EWu/KSV65vuE9owMT8pL4atMQ3Oly9SYW4jejos710L7mLWiLUSJwyT4V9h1Vm3c/+
	 RRUInVrJ9CbP3/U9qG19zMXdYnBcqPKK9rXemwrO5l/GQtVeKBoboMSoVFTOyGIvdm
	 e3E6oaedlId63Ka2QcEpl+pyW4XzEtbJo56z//RpQM6djXhZb/YvIc6xZ+ufg8FVwJ
	 xNS01v3OoJSjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B56D68BD9;
	Thu, 18 Dec 2025 08:11:40 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 18 Dec 2025 09:11:26 +0100
Subject: [PATCH] Input: apple_z2: Fix reading incorrect reports after
 exiting sleep
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3Soj3cy8zBLdtMwKXeMkQ5PUNJNkMwtLAyWgjoKiVKAw2LTo2Np
 aAMagJqddAAAA
X-Change-ID: 20251217-z2-init-fix-3b14ef4c6890
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 pitust <piotr@stelmaszek.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045498; l=1783;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=OF8WOCZRA9+JnU6tzC4FoVlFYz2Y9tJ9S+rCxmTtWYo=;
 b=9M/jobQWeFJaXDS54JFsLzWEHIDl+bbiBoVgcNi8y9zH0dzwiavKzcvWquVuCv2w6S35QyEFs
 /Tty1VBEmetC5P+Ey1YYZq8Io8EkRjNjS2pn7tc70FvVJ/n48GX7n+q
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Under certain conditions (more prevalent after a suspend/resume cycle),
the touchscreen controller can send the "boot complete" interrupt before
it actually finished booting. In those cases, attempting to read touch
data resuls in a stream of "not ready" messages being read and
interpreted as a touch report. Check that the response is in fact a
touch report and discard it otherwise.

Reported-by: pitust <piotr@stelmaszek.com>
Closes: https://oftc.catirclogs.org/asahi/2025-12-17#34878715;
Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/input/touchscreen/apple_z2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 0de161eae59a..271ababf0ad5 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -21,6 +21,7 @@
 #define APPLE_Z2_TOUCH_STARTED           3
 #define APPLE_Z2_TOUCH_MOVED             4
 #define APPLE_Z2_CMD_READ_INTERRUPT_DATA 0xEB
+#define APPLE_Z2_REPLY_INTERRUPT_DATA    0xE1
 #define APPLE_Z2_HBPP_CMD_BLOB           0x3001
 #define APPLE_Z2_FW_MAGIC                0x5746325A
 #define LOAD_COMMAND_INIT_PAYLOAD        0
@@ -142,6 +143,9 @@ static int apple_z2_read_packet(struct apple_z2 *z2)
 	if (error)
 		return error;
 
+	if (z2->rx_buf[0] != APPLE_Z2_REPLY_INTERRUPT_DATA)
+		return 0;
+
 	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & 0xfffffffc;
 
 	error = spi_read(z2->spidev, z2->rx_buf, pkt_len);

---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251217-z2-init-fix-3b14ef4c6890

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



