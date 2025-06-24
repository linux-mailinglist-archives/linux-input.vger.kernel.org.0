Return-Path: <linux-input+bounces-13021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE9AE71D5
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B43171E63
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266DA25BF0F;
	Tue, 24 Jun 2025 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GpXpzSia"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254225A357;
	Tue, 24 Jun 2025 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802258; cv=none; b=TfTvT0ScFrTZSdjm6x0RhjNcTsu0DY9ckVwqbwlhxmuI+xJYf2zrM5LB/Y040sytcjXs60uA9ApIDSuh+CJss26n+0Q9G/nbbmcBPfonXH2tR90STzWb2cm7XAhSXlwFVhE/QJeG9cECjSBS9etmx3tsT+QFHQKSXg/kuZIKRjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802258; c=relaxed/simple;
	bh=3kYGVwPyJ8cw8TilAeMlutk4VBHZhsJ+YyIWA+UbmkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbDSz7uR2LxpefpbZXwFK3dJYIU0zwpwoifpSonTUGpSQROosXSU4WF7C/h3Uh7JZEzX6yKHQP3NKXkbDI/m7s8LtqxSroNyXlk56MSleK5Ed5Wp35aMXTTufs4ucFjboVKlsFtBsN/a+0oYEC21i5BncpY1LJhMj+OqBWY7aB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GpXpzSia; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802253;
	bh=3kYGVwPyJ8cw8TilAeMlutk4VBHZhsJ+YyIWA+UbmkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GpXpzSiak+uBMIxuydUQ5OXLpmHbiIzFEvhhZ56rfrFjrbHJoiSJkUnoHYHJ45e08
	 EkYSjILvCUnbNgrnCEQ5mJZeNtYor1SyTPz76tAbnH0LJpeDc8FvfYBujhm5BsuEgs
	 U9huF8lub4SFrKJmxiBA7wHCDmEGcjqDqUUAGDCn0Mwe3zbKfvZ29W8Pwzy8rcKAPz
	 DT6NVEBe3UB1ZzpAY9Zc+Fd1+GiaNv7BJ8ALho0E+Q0hhl1ug4PL9BhKF19IiBy4ui
	 S/PAEnMPAazQ6ZIHfTcVG7NZkSpp2jtkr0dXFmkKnRqRKElSu9RgaEskOrYnC1FSrP
	 0sSl0SEdotrew==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0941517E07F2;
	Tue, 24 Jun 2025 23:57:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:49 +0300
Subject: [PATCH v2 05/11] HID: playstation: Correct spelling in comment
 sections
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-5-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Handle a couple of spelling complaints from checkpatch.pl:

  CHECK: 'connectd' may be misspelled - perhaps 'connected'?
  CHECK: 'Comptabile' may be misspelled - perhaps 'Compatible'?

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 78d28a0eb697ecb3d0ad7601c89383b67f9a53d8..349d6cac964a5b4fb1a311498b9573e03a3b7a01 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -338,7 +338,7 @@ struct dualsense_output_report {
 /* Battery status within batery_status field. */
 #define DS4_BATTERY_STATUS_FULL		11
 /* Status1 bit2 contains dongle connection state:
- * 0 = connectd
+ * 0 = connected
  * 1 = disconnected
  */
 #define DS4_STATUS1_DONGLE_STATE	BIT(2)
@@ -2169,7 +2169,7 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	if (ds4->update_lightbar) {
 		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED;
-		/* Comptabile behavior with hid-sony, which used a dummy global LED to
+		/* Compatible behavior with hid-sony, which used a dummy global LED to
 		 * allow enabling/disabling the lightbar. The global LED maps to
 		 * lightbar_enabled.
 		 */

-- 
2.49.0


