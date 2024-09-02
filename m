Return-Path: <linux-input+bounces-6046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 801969681BF
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 10:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3774B1F22C4F
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 08:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822C0186617;
	Mon,  2 Sep 2024 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Eg5rDLZ3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD778185B7D;
	Mon,  2 Sep 2024 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265663; cv=none; b=fIcldNzuWtw+njYdaz8lJlptjyAk5aXTB9f1fm78TOIS3pRhlLmETdEhmN/x0LStsPABqYsSY05GHhyCVz4AzyrlvhigLbft/gE8XHFJzwye2YYs3jxc6tp5OHO8FrvumOOzXbuQB0Pa63osULn+4fCejHOUXTNY2lhXNE4WtV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265663; c=relaxed/simple;
	bh=bwCr2cKS3bvq6ljjGjHqWsqogAeGXrGBsmS3vger5CM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oPm89UJins3XMDpW7W0hQJwxRj5qDOoqCFIZPZdySEV2hRogw4FhB6wLrZ+KOXj4mVyt52ZfXk2HUE/+pMqP30bJIHU6DBTF35/8tuQejS/ZZRKM7p/6EgEr+O/4griyKOoHgjVtiRK25Tiy/YvzfBT87FYriiNx3gR6sDIMVj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Eg5rDLZ3; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4823IUPg003128;
	Mon, 2 Sep 2024 04:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=niI3I7JyZS3O6tP9TPghw9Awc8v
	0YPXV7qysyszBa1A=; b=Eg5rDLZ3eKtjPeh354ukZKPWaIE6L2tT4GgkaX0ccUD
	sKlkyr++E+vR9Hxy402sWU8x3cyHlOKO0plFryEN+5ddCqibLLh8qgx7i+bTnof+
	p3tiGsZ7PNZc3P61uY8jkp3v/DpRYh18ZxQaIPwF7vlyPhcxKb9xbepB6ULqqJS0
	blvhtHUsOGl633HW28K6v5wM13BrqDcjnfy7UCWKdLG/mdPJrl4yPifd/viSGwnq
	mfJCsfgj8qyZd/P2PTJuG4cePdsduLKZcDbgbFH6eF5weGb16Vj+p7NW8DfcGLYi
	58Fl/dV4ZIDZ7+t1ezVkUCjRIUyz2kMo/h4rxqJFycA==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 41d5bg8vb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 04:27:24 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 4828RNRT022710
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Sep 2024 04:27:23 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 2 Sep 2024
 04:27:22 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 2 Sep 2024 04:27:22 -0400
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.139])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4828R9oQ014033;
	Mon, 2 Sep 2024 04:27:12 -0400
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Antoniu Miclaus <antoniu.miclaus@analog.com>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] input: touchscreem: ad7877: add match table
Date: Mon, 2 Sep 2024 11:24:31 +0300
Message-ID: <20240902082707.4325-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: HMTvouU1rGNzCmtDj2v7hLqKUcCe7G64
X-Proofpoint-ORIG-GUID: HMTvouU1rGNzCmtDj2v7hLqKUcCe7G64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-02_01,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020068

Add match table for the ad7877 driver and define the compatible string.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
no changes in v2.
 drivers/input/touchscreen/ad7877.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index a0598e9c7aff..7886454a19c6 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -805,10 +805,17 @@ static int ad7877_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(ad7877_pm, ad7877_suspend, ad7877_resume);
 
+static const struct of_device_id ad7877_of_match[] = {
+	{ .compatible = "adi,ad7877", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad7877_of_match);
+
 static struct spi_driver ad7877_driver = {
 	.driver = {
 		.name		= "ad7877",
 		.dev_groups	= ad7877_groups,
+		.of_match_table = ad7877_of_match,
 		.pm		= pm_sleep_ptr(&ad7877_pm),
 	},
 	.probe		= ad7877_probe,
-- 
2.46.0


