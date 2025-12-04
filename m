Return-Path: <linux-input+bounces-16457-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2641CA327D
	for <lists+linux-input@lfdr.de>; Thu, 04 Dec 2025 11:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 530023142DB4
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 10:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A3C3321D0;
	Thu,  4 Dec 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4erN8qc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0D330D35;
	Thu,  4 Dec 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764842671; cv=none; b=qq5zcpYh/rXQ5fpHhfPfBmJ5eMYIq5y+4Q4se+dynMIbz6NvodEXCX7jKneSRUBmmWwm1lVrin/MTKjmECedpnANKbnzkWYfucNmUKfmP4XLpaM1GTh4wfhrjGRfpr0X6mSkLoIki+SiWXqtRQrTKWaTtd3sTb9wHg1ozh4lOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764842671; c=relaxed/simple;
	bh=Zm9Bxl21IYm9TpV5lRA/HbsbXCWNorMxXFOpNmlHBt0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jwjmkG2mHFYwy15G69mYx2IYrQkKsuZKF2RBwYqoel48eXzrKz7kwxF/gdtObOng+6ImhpoQFKnQzYhqVTqznKAjXLh5yTYOdia476211mkxYK/UmEEBnyD7dMfv/xrxMxQNwMwGVquou4eb8ROWTtBqKFRX7R2V5ysB4NkFXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4erN8qc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7033C4CEFB;
	Thu,  4 Dec 2025 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764842670;
	bh=Zm9Bxl21IYm9TpV5lRA/HbsbXCWNorMxXFOpNmlHBt0=;
	h=From:To:Cc:Subject:Date:From;
	b=g4erN8qcqAiUbrisBxuU2kA6FYuYm0vLBUxQ3+6Hz5upVF4gD2tx6IW0ccOGJJXkt
	 cfgU4VnGPYvKuivmwanglkuiyyG9WECNftCvx3WSQViiGv1Voy9CfmMQ7qd7FXOBwn
	 bUjYnykY5qhAJbqxH1edl0AtlqkZvDLnbupZB9O0HYy8uuVJYjEFNrAtQTtzHzTKkN
	 /IhbSgQJkXfpxmc4jJXBgZCM2cPz+WL5dBAghCx8ZNlppmnTXhzg55F71/BVhPN2DN
	 o+L7tHLl1EpP3SBUAj29/4ENdS/+OZx6c0fVBYlz6OUaqJUVUn77l4ztgk3E7/oWdH
	 Oxt0suMRYLoLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Samuel Kayode <samkay014@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	imx@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: pf1550 - convert to DEFINE_SIMPLE_DEV_PM_OPS
Date: Thu,  4 Dec 2025 11:04:20 +0100
Message-Id: <20251204100425.1035159-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

SIMPLE_DEV_PM_OPS() is deprecated and used incorrectly in this new
driver:

drivers/input/misc/pf1550-onkey.c:154:12: error: 'pf1550_onkey_resume' defined but not used [-Werror=unused-function]
  154 | static int pf1550_onkey_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~
drivers/input/misc/pf1550-onkey.c:133:12: error: 'pf1550_onkey_suspend' defined but not used [-Werror=unused-function]
  133 | static int pf1550_onkey_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~

Convert to the modern DEFINE_SIMPLE_DEV_PM_OPS() that avoids these warnings.

Fixes: 9acb215cbebd ("Input: pf1550 - add onkey support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/misc/pf1550-onkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
index 9be6377151cb..a636ceedfc04 100644
--- a/drivers/input/misc/pf1550-onkey.c
+++ b/drivers/input/misc/pf1550-onkey.c
@@ -173,8 +173,8 @@ static int pf1550_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
-			 pf1550_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
+				pf1550_onkey_resume);
 
 static const struct platform_device_id pf1550_onkey_id[] = {
 	{ "pf1550-onkey", },
-- 
2.39.5


