Return-Path: <linux-input+bounces-6958-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0527598BE15
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE4241F22F17
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707CA1C68A5;
	Tue,  1 Oct 2024 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="aGzdJfsc"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E771C6897;
	Tue,  1 Oct 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789884; cv=none; b=G2ASrYSxw1uERrfmwYsDXxqLPGYlfLhfe+V5ZLMfaEvvPy+THfr702L62Xubq+7FYjyuFZJPPWZqeihqYYIcoamDC0HcPSbz9NRJx2twy2Z4g7bqfsV8Z1uoFxZ+EeVAp4iLojeOx8DoA8ymb4zhLX+qZ6P0qF9xLbL3FtF9nqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789884; c=relaxed/simple;
	bh=/frtW8ntDXQ5Ik7ENk4o+f5CaYehduCwg1NlNKd98Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Rob6cO357Ii433eCAtL82QxGE/6LJRXDlM/WOPB9IjrSpbtsTHXhanlR8RWZcRhxgFPYR236zmG8YPpB9NQYWnwZ82JV6mAn8o2sKDdmzMMiR8c4ZB11W3da/k+/nhGvZ9zP9bXh2OChAoX/tD+pVDOVEwQRmYuZtkggoVi/uSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=aGzdJfsc; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491C3bSL017051;
	Tue, 1 Oct 2024 09:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=VXhGt
	+Hv1GloUMPxriT4VjWKaDaFPkGeQDuGehZ2F7Q=; b=aGzdJfscAalkxmGibm+vF
	WARzdIvtkWgK45JwYxUAZBptuotMBmEbqfqqxC5lCqonFdtCu0rTFKljEuz9BkED
	gcHFDERoO0RblmtQtEyc5NqTV6ia+hJ+cUhK99+1JEbBl7C1weVvm7Q/UcQbvgYq
	0uYmVjoLhizNDpI5ZUo9VEox7L8T9TREuU63DuFnfkgFtHASZYDS9N3YYR9eU9Ee
	Sg0V1lP7ehDwa6+3QhT5rzM8mmgViPrA4XptZ2vR+cUPJgVAaqid3x2hvAxjrphT
	PWxKUJRwq4BTBLRZ2yA15p70TiQPejIas8+miqtU97UCaI8uIbPkoMKk4lS9fllm
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:55 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491Dbsdw054580
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:54 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:54 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:54 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeW022143;
	Tue, 1 Oct 2024 09:37:51 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:44 +0200
Subject: [PATCH 13/13] Input: adp5589-keys: add regulator support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-13-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=787;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=/frtW8ntDXQ5Ik7ENk4o+f5CaYehduCwg1NlNKd98Qg=;
 b=9X2s3bDrng75BJMwJe8p+YQu1g6AnaXr2buJ/HvMbGVhzcikCSv8mU1pRophi23vKtpGaOKsM
 5dLls4yaIfDB8SC9QNqF8kFLSAWrtbeki9AgBQSEIEqQFcaVL31oQkO
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: mbQMY1ix08rEYg17P8-A3rN8QrLgHHvL
X-Proofpoint-ORIG-GUID: mbQMY1ix08rEYg17P8-A3rN8QrLgHHvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=816 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Support feeding VCC through a regulator.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index a3d51e36132b73ef07715f256b82e428c81bd6f6..f3a0ea1bec4a7a8ed0a5a96211decc5d86728b71 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1445,6 +1445,10 @@ static int adp5589_probe(struct i2c_client *client)
 	if (!kpad->info)
 		return -ENODEV;
 
+	error = devm_regulator_get_enable(&client->dev, "vcc");
+	if (error)
+		return error;
+
 	error = devm_add_action_or_reset(&client->dev, adp5589_clear_config,
 					 kpad);
 	if (error)

-- 
2.46.1


