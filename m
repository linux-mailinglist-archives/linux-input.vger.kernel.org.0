Return-Path: <linux-input+bounces-3685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174A8C35E4
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 11:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CCD82815FC
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 09:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73041C69D;
	Sun, 12 May 2024 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="XWh1fYaN"
X-Original-To: linux-input@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B21C2AD;
	Sun, 12 May 2024 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715507973; cv=none; b=I3zJUiZUWl8Ds3jAevzR4IkDbZteNAprT2cIosvxhFK4mlUmGKboWBGQD14zt/QhV7OdYHoH2M+QPby4q5ZhHy1k6QatudSenhX5Ys6L8TLDs/ida+8zws5VYW16Qv7lWhA4nbTr8BiqrGDI74Ji17rwFpNOgBzNg8I57Dfvk3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715507973; c=relaxed/simple;
	bh=8FO2pFl3lkJJbZeEoxEUP35Je1WWVwtKCL9O+iPwV/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewYyYCTpMOfz9Oyv96yVRqt1u53rQhJZng/G1La1pXDe46FRT4QX/+7qs/bxg5UHGZxrfuzlyXoUeYvK+Nw44ZXG4+RWZLghvGDyX4kiOXTo9XEPULgBStG03+DfRrrmAkdHQVNZ8jsVoKs0u2lTxLMAe49LvBCCrvqga63VKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=XWh1fYaN; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 65y5sl8nbps3t65y5sKfZD; Sun, 12 May 2024 11:58:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715507890;
	bh=QeVJXEiY1Oon2HgNphnIfoNk7xFyqVbQ0qMzYFx+tac=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XWh1fYaNBjRRqIrGr7bVdGScLFrdVssVwtuJUPA8N+VXm6Uhf5TZDSFaNEAi3sC7h
	 EcjjYCoFZQjARhO6GBZuAmGTwOnOzOf/iDnBF7AEHsX7lH1nIRZgkSYxTN/RznqepJ
	 Zs0v0G1NW6fJ/2HtM6ff9kzlN4rSNW1ZLN6cfYXKtohF/v80kh3oXmY+lLE9oUTvmf
	 HpYsAxBEpTW5tMvHIXcFMoZF7Bgi3+pIxMROex8LqcrsBTTRzHzn27cKOB8PyXaq9w
	 KauHc2Fe0MoGt4SH9H9feM8OngtyDF7GFxNPccTCfLLvzYrbMU4jwBn9y6liuFlrsM
	 PFHpcNLoG/IdQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 May 2024 11:58:10 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: zet6223 - remove an unused field in struct zet6223_ts
Date: Sun, 12 May 2024 11:58:00 +0200
Message-ID: <3065d885341e2730dd3e7905d75514796a8c25e4.1715507858.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "struct zet6223_ts", the 'vcc' and 'vio' fields are unused.

So, remove them.

Found with cppcheck, unusedStructMember.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

It was added in the initial commit 83f66a6f08fa ("Input: add driver for
Zeitec ZET6223") but was never used.
---
 drivers/input/touchscreen/zet6223.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/zet6223.c b/drivers/input/touchscreen/zet6223.c
index 1a034471f103..ec3fca4a48c0 100644
--- a/drivers/input/touchscreen/zet6223.c
+++ b/drivers/input/touchscreen/zet6223.c
@@ -25,8 +25,6 @@
 struct zet6223_ts {
 	struct i2c_client *client;
 	struct input_dev *input;
-	struct regulator *vcc;
-	struct regulator *vio;
 	struct touchscreen_properties prop;
 	struct regulator_bulk_data supplies[2];
 	u16 max_x;
-- 
2.45.0


