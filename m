Return-Path: <linux-input+bounces-5254-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11501943630
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 21:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F13D1C22473
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 19:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE1216D9D9;
	Wed, 31 Jul 2024 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKMbEuce"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD416D9D1;
	Wed, 31 Jul 2024 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453240; cv=none; b=gYIbxZcBCJH4cGxqnXq/drVteXC7ykkbYX8/RER4BTsMYJ25hUylaCUZ7eY+5KOzkRKlLyE4ULUYbVNbB1A1yb3l7GUQ/L3FDf2T1L8+jWWfsBrRjOROSrU1WWr0y50ZgmlViPuCJFTig1e2el0kd7fVOhArN/znMnnySgHMzdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453240; c=relaxed/simple;
	bh=E/H2fromnOj3s47tII1H4W5Ybkd5KSpan3YUmWuWjzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D06+erlBdIFCgW8a5zrLeKIEenVn7tDmjGI2VZouQ1/DjrzW3bM7gufKDkOj+vt8Mv3tpni9bdnE+Xpmt223UCnjLgA5v/kZbHwL5umj1iIsspLOZwThyUxRybhhcj/U0RHfOa/d8MaP8C1zUEkl9ygyN/G4CJY/hFDYoHmhCIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKMbEuce; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE6C116B1;
	Wed, 31 Jul 2024 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453239;
	bh=E/H2fromnOj3s47tII1H4W5Ybkd5KSpan3YUmWuWjzQ=;
	h=From:To:Cc:Subject:Date:From;
	b=PKMbEucem5ub7PdiuFLJuW05dXOpoEzNS5kQTKomNRV/xSK0KqAee3pYD339l731O
	 yMDH79aogZu8SLRzzrYov1V86Gnh3MX0ZT98O1gqGpyCuyMNZV+PRzaGCEDzos3iIs
	 Shw+p1xzbnzTY3TEuvWjcE47WZ3Ms4mnqqckZpLDNPHab4FBeS4FFRDGa9wgiAR5Ik
	 oWL+r7AHTm/8zLsNBY1km7hnjU/VLLRnjcC2t970/7FR81JcWAgYI4A9njDVbFrZ4E
	 NBudeYATmkeMGE93gOg7ScOEwoL575bBqP8/mMpK2g2/72lM3nVleGTYHbPxTlmEm7
	 i9LifrUl4EbMw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] input: tc3589x: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:52 -0600
Message-ID: <20240731191312.1710417-14-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_present() to test for property presence rather than
of_get_property(). This is part of a larger effort to remove callers
of of_get_property() and similar functions. of_get_property() leaks
the DT property data pointer which is a problem for dynamically
allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/input/keyboard/tc3589x-keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/tc3589x-keypad.c b/drivers/input/keyboard/tc3589x-keypad.c
index b0d86621c60a..11988cffdfae 100644
--- a/drivers/input/keyboard/tc3589x-keypad.c
+++ b/drivers/input/keyboard/tc3589x-keypad.c
@@ -325,7 +325,6 @@ tc3589x_keypad_of_probe(struct device *dev)
 	struct tc3589x_keypad_platform_data *plat;
 	u32 cols, rows;
 	u32 debounce_ms;
-	int proplen;
 
 	if (!np)
 		return ERR_PTR(-ENODEV);
@@ -346,7 +345,7 @@ tc3589x_keypad_of_probe(struct device *dev)
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (!of_get_property(np, "linux,keymap", &proplen)) {
+	if (!of_property_present(np, "linux,keymap")) {
 		dev_err(dev, "property linux,keymap not found\n");
 		return ERR_PTR(-ENOENT);
 	}
-- 
2.43.0


