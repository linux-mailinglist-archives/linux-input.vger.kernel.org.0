Return-Path: <linux-input+bounces-11948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF3A98BE2
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 15:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 329261B6334C
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 13:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7291A4F12;
	Wed, 23 Apr 2025 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="iJrkxxYc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3175F1A23AC;
	Wed, 23 Apr 2025 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416377; cv=none; b=Zr2X+kE+1LIiGdiDBe4UGOph4eP6SrCtfGtppxdg5HRJWwKhWnNl/t+CA5x5rHpRX5qxWP+KCIx/+ePyZdybT4B0Dqgxcy75oWtqW4fTjaylgBKYxZvlk8iPgJTpFZsZWXbLcy0RAycJocvBVIFStyF4yUgIHt2/KInbMlZewaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416377; c=relaxed/simple;
	bh=KUKZbHAriJOIzQIQdzNGHbT7RDZY7bT+Pa+gg0mDIgk=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Content-Type:Subject; b=asrgR5/BF3wpTAsXIiRX309maDkMDXi+Fs8lg6H1pDUIDXJn/r6wtIokZbe5oHJ3jcEcSEgL3IStCDm8U826ahOrKI9MN26yhhgAI7ltExG6HHEQL+V1BaIdDssXzMfP4OM05caRbKUsvrtBxIxZi/6E4hwcZoP/R4kpOK4/ffA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=iJrkxxYc; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=tnvSs/gBKw3NOmvliWJyDFCWiOaJ4p22Yq2ks0Z5jtM=; b=iJrkxxYcQU+qkY8IBTfpSk+aL+
	qSjSaTtWys+QoMP09vAn+SIsYkOvavZXxyrASufxZUTJGNmula3W0ruGxzJQjBg2XIswsXH4/FP1B
	KVzJs7Uy37rtNcftcwjAe0k7ux/RpRgdgytv7y0sNjmgTygu05CuE5kqefp95KI+pQxk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:38616 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1u7aWr-0000FT-Gr; Wed, 23 Apr 2025 09:52:45 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Alistair Francis <alistair@alistair23.me>
Cc: hugo@hugovil.com,
	Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>,
	stable@vger.kernel.org,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 23 Apr 2025 09:52:43 -0400
Message-Id: <20250423135243.1261460-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH v2] Input: cyttsp5 - fix power control issue on wakeup
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>

The power control function ignores the "on" argument when setting the
report ID, and thus is always sending HID_POWER_SLEEP. This causes a
problem when trying to wakeup.

Fix by sending the state variable, which contains the proper HID_POWER_ON or
HID_POWER_SLEEP based on the "on" argument.

Fixes: 3c98b8dbdced ("Input: cyttsp5 - implement proper sleep and wakeup procedures")
Cc: stable@vger.kernel.org
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
---
Changes for v2:
 - Add Mikael SOB tag

 drivers/input/touchscreen/cyttsp5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index eafe5a9b89648..86edcacb4ab3e 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -580,7 +580,7 @@ static int cyttsp5_power_control(struct cyttsp5 *ts, bool on)
 	int rc;
 
 	SET_CMD_REPORT_TYPE(cmd[0], 0);
-	SET_CMD_REPORT_ID(cmd[0], HID_POWER_SLEEP);
+	SET_CMD_REPORT_ID(cmd[0], state);
 	SET_CMD_OPCODE(cmd[1], HID_CMD_SET_POWER);
 
 	rc = cyttsp5_write(ts, HID_COMMAND_REG, cmd, sizeof(cmd));

base-commit: 7adf8b1afc14832de099f9e178f08f91dc0dd6d0
-- 
2.39.5


