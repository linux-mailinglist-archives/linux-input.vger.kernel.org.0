Return-Path: <linux-input+bounces-6946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BA98BDFC
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 898BB1F22D9B
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B321C4635;
	Tue,  1 Oct 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="VX3MPuh/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B91C460E;
	Tue,  1 Oct 2024 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789876; cv=none; b=I6wGDwQaYjzhWK7ycPQO7UdB29lEetwclNDZIgUNE2sRu+IuHaksElQFxrMLWrA5hpXzPgLzeVGZwz+EPVX+G0bthCbSPDKxTd6dMjWC897l1JEkKPpsQy+fBsIyU2A6Iua1yj5eHWqUhnxJ8nkSG/IBb0l8lrQd8/RfGe8Fk/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789876; c=relaxed/simple;
	bh=u4JyAzPVNvUTjlYjJbO9oKJ2FWk7Hli9FmLfEzQCTWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Mt2zCuzgABLqxf8M0W/4ndCy/gKoJFIrrbZ0BR0frbUhJn5ZLiCNyrORwjJfPfS2kB7J/y47F0KkeGQ8OF+R6l421AqMEQPvcHu0nSXHBN3uXZdP2uilaLzNE7wo9jAGdj9d3niV3MeSRuxdnvpSIu0XwF/G/AVARRHsEG8Z8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=VX3MPuh/; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491BrqTJ017109;
	Tue, 1 Oct 2024 09:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=jdzmF
	a+MRLExmzfQwmUWSm43/IMd89p0jkyeZQCXkmo=; b=VX3MPuh/y6hAjH1XIuLTu
	I58cPbjV2dXqJqx94tuPpXGp261CCDPld8GvMHSPdOOB48YzWPZBVDjcVNSZWZoe
	mZPZb1PZJFjIQteFmSUAAr0a3PXkuTdQlLbgMN/M3sDIeBrezyxbIkbVaIkOCIsL
	UzS88isaVr9Hw5LutLQ6l2XF4MWTgImDsw2HqweUkOU5pGcDxQc+RJKP3KBFn1yH
	HjIAzMsqzVNO5pLPCYSJxLNR+q4loPjoOR4xHIjOiJDk6NJQLvTa643/eyCc+2OX
	YecmoorQzJpvnp8c5ejJRUFWhMLremerFpzMUjOrGGtb/IWwOhtx0Kp1vJ6jDguI
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:41 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491Dbel6054529
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:40 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 1 Oct 2024
 09:37:40 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:40 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeK022143;
	Tue, 1 Oct 2024 09:37:37 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:32 +0200
Subject: [PATCH 01/13] Input: adp5589-keys: fix NULL pointer dereference
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-1-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=1852;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=u4JyAzPVNvUTjlYjJbO9oKJ2FWk7Hli9FmLfEzQCTWE=;
 b=wp42qtkH7bFPutcEI4+yMWXx2vzDUQZiSODAh03s350tbFNpjzHLA/kVrQR+LmxxVCurBuJx0
 xGsRb3QIvWeDe6YsNAC5SC9m84MrvzZy1EKKWuEBoaIW5TIivFgVBtT
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: Y3CrLkHcDjbZIU2Myjdgka5bT_J6e7Nf
X-Proofpoint-ORIG-GUID: Y3CrLkHcDjbZIU2Myjdgka5bT_J6e7Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 phishscore=0
 mlxlogscore=818 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

We register a devm action to call adp5589_clear_config() and then pass
the i2c client as argument so that we can call i2c_get_clientdata() in
order to get our device object. However, i2c_set_clientdata() is only
being set at the end of the probe function which means that we'll get a
NULL pointer dereference in case the probe function fails early.

Fixes: 30df385e35a4 ("Input: adp5589-keys - use devm_add_action_or_reset() for register clear")
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 8996e00cd63a8203ec53d46ccb922c21ddb47355..68a29d67be57fc22088a912694e3e6e16e46d956 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -936,10 +936,9 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 
 static void adp5589_clear_config(void *data)
 {
-	struct i2c_client *client = data;
-	struct adp5589_kpad *kpad = i2c_get_clientdata(client);
+	struct adp5589_kpad *kpad = data;
 
-	adp5589_write(client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
+	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
 }
 
 static int adp5589_probe(struct i2c_client *client)
@@ -983,7 +982,7 @@ static int adp5589_probe(struct i2c_client *client)
 	}
 
 	error = devm_add_action_or_reset(&client->dev, adp5589_clear_config,
-					 client);
+					 kpad);
 	if (error)
 		return error;
 
@@ -1010,8 +1009,6 @@ static int adp5589_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	i2c_set_clientdata(client, kpad);
-
 	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
 	return 0;
 }

-- 
2.46.1


