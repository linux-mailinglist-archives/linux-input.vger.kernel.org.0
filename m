Return-Path: <linux-input+bounces-3786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CAC8CCA1A
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 02:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001621F21F62
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 00:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB45386;
	Thu, 23 May 2024 00:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="PXg5ilvP"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1319BEC5;
	Thu, 23 May 2024 00:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716424157; cv=none; b=kfUSDu0pTkoOEPkgl2njogb56cOBrmnaopE7uOPwCal4LGJ46AxmxobCBeYFaYyosY6HmBua0UQCHBaprAg5v/7pM1ffcdMFW4BnFsNzOPxk4h/Rd74TM+1xlqOyNp6x0m4RsdsoVsOZ4n8DA82lxRjPF2fV9Ect4KRFoyP44xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716424157; c=relaxed/simple;
	bh=4NT4FkdlsRTCiLWACrqX/HqDJ0fprdPV4OfeQ30nbhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBGtiG5346n7l0x50n/3W1QzPHKB2XD7mdGZyrUMVHf6vAiKCbJTgEeTVPBugRndQK542Vrqa1MeioYZfwEfetqOa1ArKPNIOtVgjcJgfo0ZLou/063w8XWdBAGrZ1cqLc72MlKEP3pIJzLQf4AMJHni0zpxTbQPWVrY5l5BqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=PXg5ilvP; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=p0dZplKGz1Y3n2sLZ6ceBvWzawOMZWQYkOdryBQvX9I=; b=PXg5ilvPQeNXpKLX
	IIpGIPQczydyxHk8fUd96gL+N3xeM4bsUc+fRJbtGDgNwUUjl0Wd5iMgwyRpqbfWSKkmtOp/VRH0X
	2tmyY4Ha4WbhDkrdEUr4s9OsZesJCUAYus19ucsUD1abQ7+E0VWD49API4p9WPFJu3Ad+IEs0rdRG
	j362OFmH/QY/dnvSyx5aDKxbJ8saeHDp/Tes85T0CbhqpZnC1k5Rh3vvGbIfDKoouTRuCBOFeVe1B
	xcahSuAMVSRmSW/EHfUhJMVE831oleafah555oCrjXfKYRuphuOHr5cpSssr9glK9cyayTQolzor9
	uWNCDOIosuYFUA5+oA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1s9wKW-00287Y-0C;
	Thu, 23 May 2024 00:29:12 +0000
From: linux@treblig.org
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] Input: tca6416 remove unused struct 'tca6416_drv_data'
Date: Thu, 23 May 2024 01:29:10 +0100
Message-ID: <20240523002910.492558-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'tca6416_drv_data' is unused since the original
commit 30ba3ead0576 ("Input: add keypad driver for keys interfaced to
TCA6416").
Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/input/keyboard/tca6416-keypad.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index 677bc4baa5d1..b2060229bd0f 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -32,11 +32,6 @@ static const struct i2c_device_id tca6416_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tca6416_id);
 
-struct tca6416_drv_data {
-	struct input_dev *input;
-	struct tca6416_button data[];
-};
-
 struct tca6416_keypad_chip {
 	uint16_t reg_output;
 	uint16_t reg_direction;
-- 
2.45.1


