Return-Path: <linux-input+bounces-5160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01993C9D7
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 22:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87466B21EDF
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 20:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE0D145A06;
	Thu, 25 Jul 2024 20:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bLe4FTQQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64880143738
	for <linux-input@vger.kernel.org>; Thu, 25 Jul 2024 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721940495; cv=none; b=M1aI5r+mjn+TTE1Je8zSrB2WAFZN95D2CKAJzEXoulrruAEWcUd2QEBsOnhVhjxW8Iy4fnsgSOBNL11K/rKd6sVafbHW8TT202Lwr4x+XZ4zIru+KLE2RUyAEOVq9/nlUXh9RutDVFa0ymR4z1t94kEzm+VgdzB1gXgUh4jen7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721940495; c=relaxed/simple;
	bh=zIezW2gyvZlphHWc2qpY5uwJDFehBqLxbokz8cFiNY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4JMTW1bg+z7mPRsSGe8eg8m/ZTg84MDL6ENjRatyWhh6KWR5VfASbOmZ9HXT7aakZcZp5nLQi89N1TfmgRLvi+hIpwbX8ri01UY7aI9ojladyfJ7G52YKTLAfy4XYPW9+9zY2NA9+68zXy+hXyBzxHct6pArBgUVpbdF+f5l6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=bLe4FTQQ; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id X5MSsJCR06bu3X5MYs692a; Thu, 25 Jul 2024 22:46:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1721940418;
	bh=rozVsuc8wM35stzKu05d3CpPokbEuodbf3R8I1BIa8Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bLe4FTQQ3g1+g+UM+vKQg2QlJcC5pTyw3gt+HfOSqPlsusCQKeCTyoLVq+BtDyx1h
	 ll/mfS6DvWLUdV5c9+ez3XhxfedTY10dJCOUn5/uamnboax9fyAXwhdg+PNWZVAe+U
	 MkXbAOMVq53IlwMFWu0RgSNnn8FMW0ovfElcyi4hOWQrW5ZgHPpeoc2ASqU/XENd1W
	 VjHTzQk6fdCXMm7egNomla7AWjx3FAapdr5DAe9/w2W3gu41dPWzVbSPPdmqAiGX7X
	 vsBe0eYVF4CUyw6QWvkUud87z5SItFlEPLuJUN1HAkuAMNS8ZG12fRHxt5VzXcwQ/r
	 aiXMgEx/AFwMw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 25 Jul 2024 22:46:58 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dmitry.torokhov@gmail.com,
	vipulkumar.samar@st.com,
	viresh.kumar@linaro.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] Input: spear-keyboard - Fix a double put in spear_kbd_remove()
Date: Thu, 25 Jul 2024 22:46:49 +0200
Message-ID: <a39197be6248ebe5385e4f352241b4ba5e857c42.1721939824.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
References: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'input_dev' is a managed resource allocated with
devm_input_allocate_device(), so there is no need to call
input_unregister_device() in the remove function.

In fact, this call was correctly removed in commit 6102752eb354 ("Input:
spear-keyboard - switch to using managed resources"), but silently
re-introduced later in the commit in Fixes.

Fixes: 9336648978c2 ("Input: spear-keyboard - add clk_{un}prepare() support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/input/keyboard/spear-keyboard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 557d00a667ce..5d9fc8dc9433 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -276,7 +276,6 @@ static void spear_kbd_remove(struct platform_device *pdev)
 {
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
 
-	input_unregister_device(kbd->input);
 	clk_unprepare(kbd->clk);
 }
 
-- 
2.45.2


