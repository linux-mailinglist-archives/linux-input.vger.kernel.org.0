Return-Path: <linux-input+bounces-8116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DB9CF21A
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 17:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A28A028350B
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 16:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1C31D5170;
	Fri, 15 Nov 2024 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="BTIaINUq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4801D5166;
	Fri, 15 Nov 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731689460; cv=none; b=Ffs4GcFyleUKWBW+e3ifWFTUJVaA/PFWX2LF6HfNkHOJHLpP/Q5hsfRuxV2tYaYnCe4efgXncMOtab2E8Z1cPhUiMEE1MB7uRjHfmo0OqU8+dhh3Tn/TSwf00AkWN6fBK7VQvhArTv6j5ilWHznQK4aY2TPN/zXL4J6pxerB8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731689460; c=relaxed/simple;
	bh=Dh6VoU9zwjMl9JckDaBsClwL1bYVAj7+lJHn/AxCiw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6Qotmgi4sdxLkst6YWeiXYyUfT7gBKL0Wgk/DZlfCrQOhkvtbKHHsRLrL4tW0QI8GMFPvB2SJc8TXxYJbHtPXUXha4e5TlZgx+22Nv31aXnWeKehQza059f+IbwnPw9hJtwcyyqw9vNA/bSTLW4LANccGCuTxNH0d7k08/k49Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=BTIaINUq; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id BzWytmXWNNywhBzWztDLqn; Fri, 15 Nov 2024 17:50:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731689449;
	bh=D7i3WbUAxo57vU5iXZm97MwKXkcrSqG2y+8GbDnWHjc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BTIaINUqtp9cEkQwJZGcQiOyrwOtgL8ne+lKN3whF/Z942yR4P0uZukGX4WRQb+DM
	 k8eBBPYH661yXWQt1tDRGOoS5YP0mFeQesq7fswBoq0XuVgse5jRwe/At5LFeae9Kn
	 NmEIvI1LtLz6mwMueTrbcgmA498s4Oipnk/uAYZcubJL5BLwh4p6Q/gohmcVU2eL56
	 McVLUwUoq1v0K/4iV6W3JV6QTpUMR/fGTjKRUKO3+V1AAVs/SeadAKS2gAaTB4fR+L
	 nzp7qE6xuWgd3FcPczAn4DFnjjmYKoNkUlHSwIWqiQ0SPLpHo4wOo1Qod+HiUybMXm
	 kvWs3PyAWgx3g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Nov 2024 17:50:49 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: cypress-sf - Constify struct i2c_device_id
Date: Fri, 15 Nov 2024 17:50:37 +0100
Message-ID: <4bc3e3b4d10223d9df850fe4ba48f1cefd197082.1731689418.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct i2c_device_id' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   6438	    618	      0	   7056	   1b90	drivers/input/keyboard/cypress-sf.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   6502	    554	      0	   7056	   1b90	drivers/input/keyboard/cypress-sf.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/input/keyboard/cypress-sf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/cypress-sf.c b/drivers/input/keyboard/cypress-sf.c
index eb1d0720784d..335b72efc5aa 100644
--- a/drivers/input/keyboard/cypress-sf.c
+++ b/drivers/input/keyboard/cypress-sf.c
@@ -208,7 +208,7 @@ static int cypress_sf_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(cypress_sf_pm_ops,
 				cypress_sf_suspend, cypress_sf_resume);
 
-static struct i2c_device_id cypress_sf_id_table[] = {
+static const struct i2c_device_id cypress_sf_id_table[] = {
 	{ CYPRESS_SF_DEV_NAME },
 	{ }
 };
-- 
2.47.0


