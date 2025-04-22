Return-Path: <linux-input+bounces-11929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE001A97499
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 20:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96B483BF763
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 18:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DD622C35B;
	Tue, 22 Apr 2025 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="xKFJqQ2K"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4041E3793;
	Tue, 22 Apr 2025 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347422; cv=none; b=I7+bdOUXd066BBg4SQsSyyGYy1N+RJaAplG+uYZRrmTiqC11Yo/Fq5xfsbBjGr64EOTFkEO4+XUoV8HvCtRHDOMQjWagu/rNPEk2swepGBj1hMqS3hgXFqFM7Ygn3THclkSF6eO82kRA0hiAhsy8ajuE+NtQjKYidhL4Ot6cw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347422; c=relaxed/simple;
	bh=Jr7Q2cyZOe/JomFSDXsqaXxHxSTcdk3JVAvECSbQZOs=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=FgJeBQsE6uKgeDbVFAH1PzGMxAG36Jh+Z6iPw3Wyf/FqMuzjVjvkTvjSRWTh9TQozVnr6t8D/npi8w3N/ZBa7jbIHCSw243MqX9G1lubLYH9G2VhnYmc0ndYDGVfwmkwD/GiqJOuBQqjsryZ6dfSmORRphpO0nbEh1UATuJ5ruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=xKFJqQ2K; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=MCD4Bjw6ygld9iM8pOQAa6sfQIFiXZamnUclPKNh28Y=; b=xKFJqQ2KBTSMX42HViVQQotMhq
	6Qt0jIxBwKy8bw1dK32q6fsXiCjwY74D+7t0Q0tlrcG9R1Bk1guUKFbwnDwOSZ056uA0nBAUt2hQ0
	8FS3BqjnWpvrSb7/v/RvckSZsoJiBK7PL+fNpT5x6jQ24KETnNrGA00U/LjUk6Znvv+4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:44486 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1u7Iad-00031m-D9; Tue, 22 Apr 2025 14:43:27 -0400
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
Date: Tue, 22 Apr 2025 14:43:24 -0400
Message-Id: <20250422184324.3181215-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] Input: cyttsp5 - fix power control issue on wakeup
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
---
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


