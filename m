Return-Path: <linux-input+bounces-3684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA08C3584
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 10:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D98281F2134C
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 08:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B3E1757E;
	Sun, 12 May 2024 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aZb+cq2d"
X-Original-To: linux-input@vger.kernel.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAEEF4FB;
	Sun, 12 May 2024 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715502334; cv=none; b=J4pJE8iU1um1MA2psYq+W+5ShQYUd0y1gPjz0hiCJhz4jW7RD45AXvBfhclhWNBpzp4gjkAEWHfWvZTf6ZZH9P536taL/ert1uRHdNokTyVt8RhKUyzfzlQtg8Zr7r5qce/J7oHC1JB2SXj0mNwsWYSBvPR+aLhrnIGDboxj/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715502334; c=relaxed/simple;
	bh=3bropaEuO+HDjP2gQM23pQyv3+GAl2eSHPXjLwrxc58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ladg/YLoXBYsmOZGZQgOz92WB9tOCrBcr+1USq8JWmuqPg9bjKFQCdYjp9gojIpPIQUaBQ3ylrp7qerEPH1wzPcsyyZJbRsA+z3geqyboqX/otih8ttlZWD6w7w299gsk4X7QNHhmAcK25q2hxvOMlaTDsnoFJzlGvr1+Ql0DDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=aZb+cq2d; arc=none smtp.client-ip=193.252.22.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 64WPsyoweU2oV64WPsDA52; Sun, 12 May 2024 10:25:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715502330;
	bh=56iz0oI+WX/kH2ILFWTh8WmhpFc2Q7uosN2/CPWH/4o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=aZb+cq2d6zcgJbbWJcuq9i5bn94KbhTK7EHFkccvy1eN1gjkhFsMMY7BEB9X2k8/3
	 h/Lb6wW2ELiCout1iNRuVP8/4MnIcb/BfaCG+x1Sbh79VX95cOhyn6jsooToNuI0dy
	 30nxCjLMA30BejOOAM+oFS+A9UnGMC6YVN58opjS3NWJDM7wI2ePr7O8mVUX/ospVb
	 QsmGzQ1VlSUJT92tETgv9GsixZ7Ry/ANrgdCE9qFxJci1W/J6+2sbRLvFPBGAIL0i3
	 LKSxpSwUo8988LYo1K2mm+9zmheaTe/YvhG+3szhOu7xcg/i67XP6mxP2o9NbbCq38
	 TnXGrfaUCsM5g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 May 2024 10:25:29 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: chipone_icn8505 - remove an unused field in struct icn8505_data
Date: Sun, 12 May 2024 10:25:17 +0200
Message-ID: <37443a675ca07c91c5f0118ce255406e6e3c08f5.1715502304.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "struct icn8505_data", the 'wake_gpio' field is unused.
There is also nothing about gpio neither in this driver nor in the
data-sheet.

So, remove it.

Found with cppcheck, unusedStructMember.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

It was added in the initial commit e7330fa032bb ("Input: add support for
ChipOne icn8505 based touchscreens") but was never used.
---
 drivers/input/touchscreen/chipone_icn8505.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
index b56954830b33..c1b4fc28fa8d 100644
--- a/drivers/input/touchscreen/chipone_icn8505.c
+++ b/drivers/input/touchscreen/chipone_icn8505.c
@@ -68,7 +68,6 @@ struct icn8505_touch_data {
 struct icn8505_data {
 	struct i2c_client *client;
 	struct input_dev *input;
-	struct gpio_desc *wake_gpio;
 	struct touchscreen_properties prop;
 	char firmware_name[32];
 };
-- 
2.45.0


