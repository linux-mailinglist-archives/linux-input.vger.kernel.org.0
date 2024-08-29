Return-Path: <linux-input+bounces-5942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA13963FC7
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 11:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC07D287321
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C64818CC01;
	Thu, 29 Aug 2024 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rQWLWFoz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F23E47B;
	Thu, 29 Aug 2024 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923262; cv=none; b=Ej/nYy0TomP8zB449OmevkWilRwYW+XsgT0aXwewyDxxURhO5gNgYOXvRB6mKSoI8CBIAzdnwFbAm1J4kEh9+GOAaaaF8rOVxo6wfu+aqAs7BXf7iQUPUkTFA19n1nlNgpc40vu2veqQev5QpK0vr5AwSnEGltHh+JollkfZvas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923262; c=relaxed/simple;
	bh=z5H1n5+yj1DYotcoI4dZUwHA/y/DLWWWYsqvbvVPZ3c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jaWJiZ+h3tv8Xaz1q8RiwL1DUD7LbeXUz8Ri7MHKnr9+6zBVxZr+i+eXFRuy+LI/Rzuq2A5RmfcQNLihbTkEZ0cliY2rx2vQSRU7jKg1Zl/7elb1f2FAPopqyP6uNLndVoP2g/sI0YsFP66vUmEPE6YqUyPvhNGHZWLcbqeBaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rQWLWFoz; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5dbPl023793;
	Thu, 29 Aug 2024 05:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=AQNCInblHQuSFMuSF5tBSnjYSi0
	WvZHihfo3gUj7uyo=; b=rQWLWFozz3S2LIb/V/WRU0oybnvv6R/cEytLXpPAbKg
	kheAL3RwAkzkDipaP+90+BOHiv3xS/lAjKY+6YY4/DSzlpvM8uNl0EU1iKOdVQq7
	fRNyCUiFHr2InNVktUETE+S/KTggFNRBwa+k8WXcSuGK5mmNNQf17PYI24R2Fs0W
	AfeteK+ra35NR71cGIhlY15G3b4pOShPQVLlhvJ8JIqBy5guC/W0vJ9UXifn7wzY
	9bl71FeP0jgxlc7SnJB//eS5CTLjdgGCbuhyHzE1DYatlOUkQfD3lQ+AT0/kTHaY
	uTwbnWXnYDSNY/tDTlEpuM8S7dACgURCAZw91Y49+Fw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 41ak1mgth5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 05:20:44 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 47T9KhKo021794
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Aug 2024 05:20:43 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 29 Aug 2024 05:20:42 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 29 Aug 2024 05:20:42 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 29 Aug 2024 05:20:42 -0400
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.124])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 47T9KVkT016079;
	Thu, 29 Aug 2024 05:20:33 -0400
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
Subject: [PATCH 1/2] input: touchscreem: ad7877: add match table
Date: Thu, 29 Aug 2024 12:19:35 +0300
Message-ID: <20240829092007.25850-1-antoniu.miclaus@analog.com>
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
X-Proofpoint-GUID: oUjQVsubJo4Y5fLDUdtmaKYkSBXEBSz6
X-Proofpoint-ORIG-GUID: oUjQVsubJo4Y5fLDUdtmaKYkSBXEBSz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290068

Add match table for the ad7877 driver and define the compatible string.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
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


