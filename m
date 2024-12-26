Return-Path: <linux-input+bounces-8790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F5D9FCE54
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 23:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 758621638F3
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 22:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1EC1474B8;
	Thu, 26 Dec 2024 22:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Scnk9mJC"
X-Original-To: linux-input@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A1139E;
	Thu, 26 Dec 2024 22:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250453; cv=none; b=ZaKotlZE8KCGupP64EmEJVFb8ODBb1R2Rxsn8uVNcLTZ/yhK8gOQBNWlCL56CjfaHibd82bYQTggv8aOrNbmcT8ezGQq7f/RfE/L5246BYmLtr8UDZPqG6Xps3PkkIPfp95XNLlujUOtTTohAvu85bhuiicL3XTHaoZvhiiVmBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250453; c=relaxed/simple;
	bh=BsLDNeMf4f6osRvwzGvSOEpMaWWqYXoAtHN4Pd7x/VU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FN6k0oKgcrzxNX9RdGrh1BXeZkVtAXmpl9vgsW00bDoawoQo4LdfULkfH/an/GwPbjQtVjSuv71QS0iF73w92Qgu7AkSsPf0sDcjjuyu299nPUvCNTPOavRzn5uAI+KGm1jXSqKy+O9qVdIuyvKvq4bLhceDe4iyYVxYR8g6rkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Scnk9mJC; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQM0nG41039030
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 16:00:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250450;
	bh=k2Ok8LIEcrgyfP1ju3IhW9xzfjCxOZm3fC17hcR2SRs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Scnk9mJCLTuloZicVW/TnrqqymLHDYFBk30TgJ5BZh0fZVY5ArRZlbJ0vdrArQLUw
	 7rxoKy+Wef6eyISjN+uKj7CfRNaKu9gbHbyqyVDVWm2qX4Nnvt2fp7vTY+Xqua+MDS
	 BOpViJMFnghcSPOV11GzPrQGYkcACI0zAgRVUINM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQM0nKl077819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 16:00:49 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 16:00:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 16:00:49 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQM0nej059444;
	Thu, 26 Dec 2024 16:00:49 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <dmitry.torokhov@gmail.com>, <u.kleine-koenig@baylibre.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 1/1] input: tps65215: Add support for TI TPS65215 PMIC
Date: Thu, 26 Dec 2024 16:00:49 -0600
Message-ID: <20241226220049.398794-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226220049.398794-1-s-ramamoorthy@ti.com>
References: <20241226220049.398794-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Update descriptions to reflect this file applies to TPS65215 and
TPS65219.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/input/misc/tps65219-pwrbutton.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
index 7a58bae4f1a0..27a8d10d81ac 100644
--- a/drivers/input/misc/tps65219-pwrbutton.c
+++ b/drivers/input/misc/tps65219-pwrbutton.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Driver for TPS65219 Push Button
+// Driver for TPS65215/TPS65219 Push Button
 //
 // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
 
@@ -145,6 +145,6 @@ static struct platform_driver tps65219_pb_driver = {
 };
 module_platform_driver(tps65219_pb_driver);
 
-MODULE_DESCRIPTION("TPS65219 Power Button");
+MODULE_DESCRIPTION("TPS65215/TPS65219 Power Button");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com");
-- 
2.34.1


