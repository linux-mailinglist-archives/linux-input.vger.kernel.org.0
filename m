Return-Path: <linux-input+bounces-6949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4F98BE02
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44022284D11
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51451A3BAD;
	Tue,  1 Oct 2024 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jEfPe2jU"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B871C4625;
	Tue,  1 Oct 2024 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789878; cv=none; b=Cm85pC0xHYB85EUqBcdUlaakf7IQzlPkrEWXeunIWWTgp2tbHRtB/HX+mcD3WhUg2avEOxkNneamqysAjJjiOspfMU4w4d9QxWq1apYcWbgfO/XJLFSKa5btOvTBMT+wO9yxQT1IN6oVteCgAvGaAeajb1lr5TBPFKOxEW1bc3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789878; c=relaxed/simple;
	bh=Kede2kNz9uD1Zvw+ix3OdCUtB0mk9gWfXQDaIjSrS7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y1D4HJHe6jTzMyAd18Xdc7MhMMRw3nqCJbyHfA5uGMfDSNnV6zCBc+ibk3FdDwGLLDubCgM+vsTh97vWaMn6K2Audb8ePMCSb6BZE2Oz70zgrEzEBxsDCYjcmH01XFEnVFJ2kmD4GvgtcsbUBKLJ3vC2sg/ihv86nSy6HybB9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jEfPe2jU; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491BAhJZ030544;
	Tue, 1 Oct 2024 09:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=HpX8U
	xsH7c3NbSAwMXDGl2Mu3QAbK8SjtqOE7USj9fc=; b=jEfPe2jUSYLlxFS77yuBu
	p5pnPs7CypZhCl32J6+NdUKIcxM9IMdcVGTlDvPcTZ/FQHNvZd7RUYOsV4bXmWvT
	mKdI35MDmUe8rYeGFFQPMzdMYyBkf85II1fdHZ6fAYuChDqGKyA0CsRyicky81nP
	c0WmBz3Gpd1bigxIQw1CvxMik0abBHl+IW7Dg3IL5nv7rMLv2l6wlPnMO1LZQ0Ro
	ogZM/YPhtjBE/DxiLADcdCghGi3wOVox95TMBxxkg3eEIsGhK5Ssf0EjyrIhhs0I
	59D9pr47ah8K8K7wmYB0yN04E1Q1fD2P9BaZIXXNLjwUQsfgRRMuZ0UBK19zXZ9z
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41yp2rxtrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:42 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491DbfMc054535
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:41 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 1 Oct 2024
 09:37:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:41 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeL022143;
	Tue, 1 Oct 2024 09:37:38 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:33 +0200
Subject: [PATCH 02/13] Input: adp5589-keys: fix adp5589_gpio_get_value()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-2-fca0149dfc47@analog.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mike Frysinger
	<vapier@gentoo.org>, Dmitry Torokhov <dtor@mail.ru>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=1590;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Kede2kNz9uD1Zvw+ix3OdCUtB0mk9gWfXQDaIjSrS7w=;
 b=ZqzvwDD+3IqtGQ/m/rItdyLT91QE9KBk+ZAzlmOuih2pRYZnqSVsLPVWbJbAgaw81UKvCRajj
 mQG9qMkfmFpA/kcFssa7F8D7xQSaTDBLq1Er31DDd0Z4151Fa19jNpJ
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: juiQDPAc0cxeF1XGf8zSAn_EmIGFvobx
X-Proofpoint-ORIG-GUID: juiQDPAc0cxeF1XGf8zSAn_EmIGFvobx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

The adp5589 seems to have the same behavior as similar devices as
explained in

commit 910a9f5636f5 ("Input: adp5588-keys - get value from data out when
dir is out").

Basically, when the gpio is set as output we need to get the value from
ADP5589_GPO_DATA_OUT_A register instead of ADP5589_GPI_STATUS_A.

Fixes: 9d2e173644bb ("Input: ADP5589 - new driver for I2C Keypad Decoder and I/O Expander")
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 68a29d67be57fc22088a912694e3e6e16e46d956..922d3ab998f3a5dfbaf277f10eb19e5cd1b35415 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -391,10 +391,17 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
+	int val;
 
-	return !!(adp5589_read(kpad->client,
-			       kpad->var->reg(ADP5589_GPI_STATUS_A) + bank) &
-			       bit);
+	mutex_lock(&kpad->gpio_lock);
+	if (kpad->dir[bank] & bit)
+		val = kpad->dat_out[bank];
+	else
+		val = adp5589_read(kpad->client,
+				   kpad->var->reg(ADP5589_GPI_STATUS_A) + bank);
+	mutex_unlock(&kpad->gpio_lock);
+
+	return !!(val & bit);
 }
 
 static void adp5589_gpio_set_value(struct gpio_chip *chip,

-- 
2.46.1


