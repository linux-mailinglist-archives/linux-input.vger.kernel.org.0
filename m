Return-Path: <linux-input+bounces-16675-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC7CD6682
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 15:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CEB73046F88
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2572ECE97;
	Mon, 22 Dec 2025 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="owDMaDNw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F082E8DEA;
	Mon, 22 Dec 2025 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414583; cv=none; b=FXsjj0ug+gkFErwPiBQARawizzHbP2JKtc90Q68Q6CcKK6oLi6NQCPAaCg0NxWEqiLFQxCIsi4anA9cqVU1y9tSR7yinMp9t/R2nYXxT5WMHbsHyG45TkzMwAi0X6KX/TkGuPEuujcO0AlIwExP1MPKCoqiVOBTO6V6/0jPwUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414583; c=relaxed/simple;
	bh=WJveqUQMALCscvaxV1+/dVpmXOPJmTA8bm7D1ybVWXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IKdtN51Da/u+2u4agNijF6GOUg4R8S6tzWozEIEHv9/mdP6zDWzPun/Wwt1qjn8Lugb92XnXXTlR0xD3H8h3ZWeXflYlUpg3GmZ0a2gCg+yFBrMyZtj5BGh8aiTPjpHC6YvuYO56AtaWiQfdOddF5DUWul5iUA6poyfN1jC8gsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=owDMaDNw; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=+SxswLbi3EgwUY1Ul+Vs7GTheX7FRUUKTCyDNsPrlLw=; b=owDMaDNwBfW0HKxH9EgSS67oqX
	7K9Lf1fRAqIflKQUoV5AfpjEjAdHymBcJrJVw8UsIjiMXZaxLb1IZrxHe/jjK0wMkPu5/tpFPdeRD
	UcAZfTJ4rolSou/eXghDgMrIvT+RkYPcNaRsqE1Mvhf2ie82vT8wGvfrlBcDJ4Q6iojx701GIQI1r
	0SidsV3z2o0A1tG+bz1xMDb0wil4UBr1q5P8rV74BjWvY3MWPEDuWsVz640wfPmZR3RPktSmrypNB
	8w08SV2gxauuutZLfuIck+IkOwwwc+krf7s/oqIoUeQN0ucf9SYtl3ZiYSAxSvEzahRHv+KcoXNrD
	+E6udmag==;
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	andreas@kemnade.info,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] Input: twl4030 - fix warnings without CONFIG_OF
Date: Mon, 22 Dec 2025 15:42:49 +0100
Message-ID: <20251222144250.453508-1-andreas@kemnade.info>
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
 drivers/input/misc/twl4030-pwrbutton.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
index d82a3fb28d95..7468d0d3e97a 100644
--- a/drivers/input/misc/twl4030-pwrbutton.c
+++ b/drivers/input/misc/twl4030-pwrbutton.c
@@ -132,7 +132,6 @@ static void twl4030_pwrbutton_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
 	{
 		.compatible = "ti,twl4030-pwrbutton",
@@ -145,7 +144,6 @@ static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
-#endif
 
 static struct platform_driver twl4030_pwrbutton_driver = {
 	.probe		= twl4030_pwrbutton_probe,
-- 
2.47.3


