Return-Path: <linux-input+bounces-9286-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0951A1449F
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 050CF7A4086
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 22:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BAC22BAD5;
	Thu, 16 Jan 2025 22:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UsnzTpdF"
X-Original-To: linux-input@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A011DCB24;
	Thu, 16 Jan 2025 22:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067212; cv=none; b=j31W+wE9pd2qMycQNQNqd85emTx151ZlH32Fq/BTdg4maa7jhITTUaZUVNRMLYBJnrSLOvpdwOOxtrBFAzhq/RloUjucoH0vOJrd2e+TDqOwcPnKW4vdVQxOmg6ZbIeeSpglTouowvn0JTNXiw79dljKZWfqH1muWwOkMCrdlyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067212; c=relaxed/simple;
	bh=+pnXfl+f8UuoBW0CV7Wyo2lhd4/gnE7ZUZbQo2uEkn4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVNAE8pTaOSxAOQcbUpcnTqtJxcmQoAW9VD/90iEMjacaa4rKZLkYvgSvBamqN5+rwgRqp7Z6hITBWTroNKjN7Vakb7YqrWhEmL9rBRk11qhtO0VHtsjLTF0RTouce4XgYJctHaBzLopD5YGw5uBjwTu39K2Aj7dCVCxcu8H1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UsnzTpdF; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMe9sn080140
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 16:40:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067209;
	bh=xpOrjgRj/vh2bd9oLaRmSJbGxMnpiEzV3chXe6/GzNI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UsnzTpdFDpImLpe1eg1/qOIZIp4/PSbraCib3hKcd0hwYQyiZ9MyoZWSbUENm1Kqn
	 a3tMXuA6Re2igZhbRwUA+8TAyRJFYsKo1lrAd4RTffOFE7CwOepRBl8oShqbySYVau
	 NfSnQL0hyZw4Hf4T7zviAbUb1qai2aMh4Qop1jPo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMe9g0051255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 16:40:09 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:40:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:40:09 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMe9M0032403;
	Thu, 16 Jan 2025 16:40:09 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <dmitry.torokhov@gmail.com>, <u.kleine-koenig@baylibre.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 1/1] input: tps65214: Add support for TI TPS65214 PMIC
Date: Thu, 16 Jan 2025 16:40:09 -0600
Message-ID: <20250116224009.430622-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116224009.430622-1-s-ramamoorthy@ti.com>
References: <20250116224009.430622-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Update descriptions to reflect this input driver  applies to TPS65214,
TPS65215, and TPS65219.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/input/misc/tps65219-pwrbutton.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
index 27a8d10d81ac..385007608401 100644
--- a/drivers/input/misc/tps65219-pwrbutton.c
+++ b/drivers/input/misc/tps65219-pwrbutton.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Driver for TPS65215/TPS65219 Push Button
+// TPS65214/TPS65215/TPS65219 Power Button Driver
 //
 // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
 
@@ -145,6 +145,6 @@ static struct platform_driver tps65219_pb_driver = {
 };
 module_platform_driver(tps65219_pb_driver);
 
-MODULE_DESCRIPTION("TPS65215/TPS65219 Power Button");
+MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 Power Button");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com");
-- 
2.43.0


