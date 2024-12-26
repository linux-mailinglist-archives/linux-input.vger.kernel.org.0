Return-Path: <linux-input+bounces-8791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A49FCE55
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 23:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 068CB163912
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 22:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1430418871F;
	Thu, 26 Dec 2024 22:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FinYT19z"
X-Original-To: linux-input@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109C450F2;
	Thu, 26 Dec 2024 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250454; cv=none; b=HwivCWeYDCFVVIScfJHxQCuM/5ugkaHvCsEVw56db+/4/75KB6mLXIv4zeXQy62yl+cDoOwK9H2ZnFqKSV0SsiN3Tqhq+BvZCCznweuJvq5mEVJMePH+aH3Nk5UAlSp74BSksM+u0uYvlc1hUZL9C8Z2hlTmT6sWJFVXxRS+Bpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250454; c=relaxed/simple;
	bh=LoICUvjAbwFnv9G5XNLgaAMyifQz/FYTYm6eP6AhNEQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rFlQ42Jl93ZWf9N137Cpr/oV+LGY4MbO5jTiKqbokthEyOd7kLGJddlHZpShxDToacnAgkVuvZLP/l51LHDitvVJEU/KhWHZ/1P9HKm+jwuvEKTPxtU9lDTP25gLCmMrKV9p8EvCbcxZPkRgba5MNxr6W/aALar3uf3rWz3mpZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FinYT19z; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BQM0nc3066733;
	Thu, 26 Dec 2024 16:00:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250449;
	bh=UO/5cjGbxCHuxTSUU7likX72K7exwyd+u+MoLTU6Gn0=;
	h=From:To:CC:Subject:Date;
	b=FinYT19zuNsjKMtjBTuQu7SwAaUq5jJDjNOHUHQfnJvH6Ptzn/XuT0j81sQH1iqh/
	 bGKumcLqBAgwwZdGwRDiyBnxCYXCxdR7VCejz4FXQ8xQjam7ZiDazdaK+an50tDtLN
	 +8n9eaosVOIg5lFCuKjsa2lenFae2xn4YfPV/xOU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQM0nkd105839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 16:00:49 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 16:00:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 16:00:49 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQM0nei059444;
	Thu, 26 Dec 2024 16:00:49 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <dmitry.torokhov@gmail.com>, <u.kleine-koenig@baylibre.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/1] Add TI TPS65215 PMIC Input Support
Date: Thu, 26 Dec 2024 16:00:48 -0600
Message-ID: <20241226220049.398794-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Happy Holidays!

TPS65215 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. Add TPS656215 to the 
description to indicate to users that this driver supports both PMICs.

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

- Both TPS65215 and TPS65219 have 3 Buck regulators.
- TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
- TPS65215 and TPS65219's LDO1 are the same.
- TPS65215's LDO2 maps to TPS65219's LDO3.
- TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
- The remaining features are the same.

TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

AM62L + TPS65215 Test Logs:
https://gist.github.com/ramamoorthyhs/7560eca6110fafc77b51894fa2c0fd22

Shree Ramamoorthy (1):
  input: tps65215: Add support for TI TPS65215 PMIC

 drivers/input/misc/tps65219-pwrbutton.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


