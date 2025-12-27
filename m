Return-Path: <linux-input+bounces-16699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513DCDF963
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 12:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA21F300982F
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 11:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FBC274FC1;
	Sat, 27 Dec 2025 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="sFW1eEv7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D9311971;
	Sat, 27 Dec 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836778; cv=none; b=eFjBFtrDlOdf7i3lPhjGFsxBfF+l5xZriOrRr3u3yYf+cJsWNgqVARRM8uSdmFETKmSkiuUgi1pT1XfKh+vrfb9qPdiQ2pp/bGTFIww9UhFzIAqw8rbAi/K5lFOwwK0HQWSZlwbmTZKDTBUjc48ltbutuefs6bu/vZ4Zpsj2rDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836778; c=relaxed/simple;
	bh=3nPPkTu5kf9fROP9Wgfhsd6CJck9UhOeakPqJLVjAlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mX2olHwsj3WKSAp0wh1ttSxaSNiFyj57aM2XIHQzJPpyG3LwtpzNZM5e5jQiSnrrd+SwqodK0lA7LOOseQP7zQel7agLU7l2Xs3wqwu8aDuz0M1nGQ4jpRmRUPcdQqjkATn81oeO/fEvVEzwTsh8is0RGFVzARFsM8ZEdKyTqhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=sFW1eEv7; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=qCeFaH//N8sJE9MahB8n+fuPWhDDZwtVNZ3uj7307cY=; b=sFW1eEv7ANxWUwTFMbP6/I47YT
	wF33OChHiWfN8rdr7LP2ooYE8n/Wy9JALyR6ABEDfSnPPXH/VrMYQw5e8m8PIKAlmrO2r40k2P2oM
	WF1jnDVXAgPcAUBxsf0TB1nEqiG5A9WN+XsG9La1ETd9I/N01kvA+hHS9jLjbTAkAa2MdqbglrrKu
	V7KvMrvsTdALKNDWq31YHhjjD7U7VGz3lKcIBObgWTkUuzURfCd3Hwmy7WxHuRgkyzCCddZ6/hnK3
	sB5pEzUc0PyBQnjeSTpFqlr3mqnTur/qi4ItY3M/+wMvS1Tg6M6uBq2COBbK8U9HO5pTpDgX0S+lH
	JpfNIg2g==;
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	andreas@kemnade.info,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH v2] Input: twl4030 - fix warnings without CONFIG_OF
Date: Sat, 27 Dec 2025 12:59:18 +0100
Message-ID: <20251227115918.76969-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are unused variables without CONFIG_OF:
drivers/input/misc/twl4030-pwrbutton.c:41:44: error: unused variable 'twl4030_chipdata' [-Werror,-Wunused-const-variable]
   41 | static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
      |                                            ^~~~~~~~~~~~~~~~
drivers/input/misc/twl4030-pwrbutton.c:46:44: error: unused variable 'twl6030_chipdata' [-Werror,-Wunused-const-variable]
   46 | static const struct twl_pwrbutton_chipdata twl6030_chipdata = {

Fix that by avoiding some #ifdef CONFIG_OF

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512220251.jDE8tKup-lkp@intel.com/
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- replace of.h with proper includes

 drivers/input/misc/twl4030-pwrbutton.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
index d82a3fb28d95..b0feef19515d 100644
--- a/drivers/input/misc/twl4030-pwrbutton.c
+++ b/drivers/input/misc/twl4030-pwrbutton.c
@@ -27,7 +27,8 @@
 #include <linux/errno.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/twl.h>
 
@@ -132,7 +133,6 @@ static void twl4030_pwrbutton_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
 	{
 		.compatible = "ti,twl4030-pwrbutton",
@@ -145,14 +145,13 @@ static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
-#endif
 
 static struct platform_driver twl4030_pwrbutton_driver = {
 	.probe		= twl4030_pwrbutton_probe,
 	.remove		= twl4030_pwrbutton_remove,
 	.driver		= {
 		.name	= "twl4030_pwrbutton",
-		.of_match_table = of_match_ptr(twl4030_pwrbutton_dt_match_table),
+		.of_match_table = twl4030_pwrbutton_dt_match_table,
 	},
 };
 module_platform_driver(twl4030_pwrbutton_driver);
-- 
2.47.3


