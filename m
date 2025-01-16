Return-Path: <linux-input+bounces-9287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0CA144A0
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D756A188A0D3
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 22:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C1524224C;
	Thu, 16 Jan 2025 22:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="up2Bsqj1"
X-Original-To: linux-input@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C82419F4;
	Thu, 16 Jan 2025 22:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067213; cv=none; b=GF7ZhC7vnFHNwgWlBKFUpEJWDv1U+hR7DdXXs8amx4bMcdc6qw82A6tQI0TG+YqtqvHDK2QwaD/VkbyesZNZmVd/Irlpsov2TAFy54C1fMWLI46MIkdfSf1CcWJL7qHbNJYfyDSe1/aCH9xLIUqjLXRq4SfKR5rGE1pldgYxuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067213; c=relaxed/simple;
	bh=I/2vTp+aktN/0LSdfaEusxR723oZozfHiFmjWz4gDls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QvsjTUb5xo9AJKvrZqBqMxN/rYmfKQ3FimkMy4ofdIvIavXtVvlBT+BZJqxL90FMp9STISDs0yxKIgwmvLZ129eFPdRgHAXbSRHGr+ZviMKA14SWY9SY3rWbEIs1hCtX14+g1P4EcLxmgliBtLulwawoSVeM5x/FRc6b7+N2uKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=up2Bsqj1; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMe9Bm089905
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 16:40:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067209;
	bh=Zqo8/XS6GwaurHobCGLqCfdAPYiRPwlXL6YLW/FlgSg=;
	h=From:To:CC:Subject:Date;
	b=up2Bsqj1XAAt7PoKzzqtFLQ2QPe1hYURzwJInd+QDBFkzJa5blwyYNEio/ghuSM68
	 F48tSCNscX/R3R04zINw9CBJd/UmQZ/N7Ykfocla83Z5pIJXn/e7b9uHCt3fYi2KUi
	 P5c7sJ0EPuWElrOW1tOhyp8C6QzuUsuYBNe0VY+A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMe9i2026934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 16:40:09 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:40:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:40:09 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMe9Lx032403;
	Thu, 16 Jan 2025 16:40:09 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <dmitry.torokhov@gmail.com>, <u.kleine-koenig@baylibre.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/1] Add TI TPS65214 PMIC Input Support
Date: Thu, 16 Jan 2025 16:40:08 -0600
Message-ID: <20250116224009.430622-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TPS65214 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65215 and TPS65219. The series 
introduces TPS65214 and adds the device to the multi-PMIC support driver.

TPS65215 Driver Series:
GPIO: https://lore.kernel.org/all/20250113225530.124213-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20250113230750.124843-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20250113231018.125426-1-s-ramamoorthy@ti.com/
Input: https://lore.kernel.org/all/20241226220049.398794-1-s-ramamoorthy@ti.com/

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

- TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
- TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
- TPS65214's LDO1 maps to TPS65219's LDO3.
- A key difference between TPS65215 & TPS65214 are the LDO current and
  voltage output ranges and the configurable options available.
- The remaining features for both devices are the same.

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30

AM62L + TPS65214 Test Logs:
https://gist.github.com/ramamoorthyhs/0793f7813332d94423ca1baee02f62c9

Shree Ramamoorthy (1):
  input: tps65214: Add support for TI TPS65214 PMIC

 drivers/input/misc/tps65219-pwrbutton.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


