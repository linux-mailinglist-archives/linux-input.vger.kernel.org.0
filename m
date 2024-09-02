Return-Path: <linux-input+bounces-6047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92439681C6
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 10:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E361C21812
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 08:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41DF186E5F;
	Mon,  2 Sep 2024 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xh3pE920"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CA31865EA;
	Mon,  2 Sep 2024 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265671; cv=none; b=YdIv1NYhSXcJE7SOrKzvE0lktmPg0GJPHMH1lS7t1S2tpFBmLJnAKXDvR8pIRrTzLeCT892KVrbj6MStVO4IPS5nexPmvLFOhq6Buol+5gXe+0BGz4OlG56XR/ZpH1gJsHfALDU8lEOpezGjH0h4uMMZ/dfLxh64sjoCh1LZ2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265671; c=relaxed/simple;
	bh=2rV9WA1wgyzNu7CXowfMopgSRtfFPFaKCAR+gsofEsI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyG/spjKB2ZX1A+ETOaTqrsGo9xyC12hYKKNtPwkzn29yQqqhesC2i9dg7sZDV2ucIFhXdhYb02vqqXy2Pzjt0YXpuuHdUmpp0OgSJGOIITKdn+tn9mia8SGAcCCR1rryPkvpS+xiPFgyhhGQGxYMS0gOsaGqMGcML8CZC8GeCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xh3pE920; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4825R4sC011481;
	Mon, 2 Sep 2024 04:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=dLcIl
	PPI0BpAh2tyPpPa8zuotT/0hdrn7SOoHSdAkbo=; b=xh3pE920jwxu37nsKt8ol
	MhkQlorG0nugqCJEBDLOqpz9ye+QAru0ZTZQGbfLxAo6S0BAphCnBK62z5Vb8K29
	/7j4u0w0p3NMi1Co2ybh0btGaRfS9Mra7Tk1XNC7KHA3Ga9j81V7qe0uYJZI8QN8
	ToqMoE+CjnKirY5Eo8JZejeIVvmPhtNQsnAx83fSgzhRe5ZQywKY9+jXDQmzhxnF
	ltl7WEOHfU3yWT8sniY5I9y6f6wKBoC3mECGPYDXMYQX+tGz+q96gBmSh3e17vil
	J1Fv30XNuLvp6vH06wulhVSlhToX2w/+IjQjYGBOZTAp+uQheAvfOS9Fh0QcEN3S
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41c031x5uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 04:27:46 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 4828Rj8S022735
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Sep 2024 04:27:45 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 2 Sep 2024 04:27:44 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 2 Sep 2024 04:27:43 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 2 Sep 2024 04:27:43 -0400
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.139])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4828R9oR014033;
	Mon, 2 Sep 2024 04:27:37 -0400
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
Subject: [PATCH v2 2/3] input: touchscreen: ad7877: add dt support
Date: Mon, 2 Sep 2024 11:24:32 +0300
Message-ID: <20240902082707.4325-2-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902082707.4325-1-antoniu.miclaus@analog.com>
References: <20240902082707.4325-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: v8yQB1dpA9xOJpSBWzmxGpHZZhgCOWwc
X-Proofpoint-GUID: v8yQB1dpA9xOJpSBWzmxGpHZZhgCOWwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-02_01,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409020068

Add devicetree support within the driver.

Make the old platform data approach optional.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
new in v2.
 drivers/input/touchscreen/ad7877.c | 68 +++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index 7886454a19c6..3fa38043b561 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -27,6 +27,7 @@
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/ad7877.h>
@@ -667,6 +668,68 @@ static void ad7877_setup_ts_def_msg(struct spi_device *spi, struct ad7877 *ts)
 	}
 }
 
+static struct ad7877_platform_data *ad7877_parse_props(struct device *dev)
+{
+	struct ad7877_platform_data *pdata;
+	u32 value, average;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->model = (uintptr_t)device_get_match_data(dev);
+
+	device_property_read_u8(dev, "adi,stopacq-polarity",
+				&pdata->stopacq_polarity);
+	device_property_read_u8(dev, "adi,first-conv-delay",
+				&pdata->first_conversion_delay);
+	device_property_read_u8(dev, "adi,pen-down-acc-interval",
+				&pdata->pen_down_acc_interval);
+	device_property_read_u8(dev, "adi,acquisition-time",
+				&pdata->acquisition_time);
+
+	device_property_read_u16(dev, "adi,vref-delay-usecs",
+				 &pdata->vref_delay_usecs);
+
+	device_property_read_u32(dev, "touchscreen-x-plate-ohms", &value);
+	pdata->x_plate_ohms = (u16)value;
+	device_property_read_u32(dev, "touchscreen-y-plate-ohms", &value);
+	pdata->y_plate_ohms = (u16)value;
+	device_property_read_u32(dev, "touchscreen-min-x", &value);
+	pdata->x_min = (u16)value;
+	device_property_read_u32(dev, "touchscreen-min-y", &value);
+	pdata->y_min = (u16)value;
+	device_property_read_u32(dev, "touchscreen-max-x", &value);
+	pdata->x_max = (u16)value;
+	device_property_read_u32(dev, "touchscreen-max-y", &value);
+	pdata->y_max = (u16)value;
+	device_property_read_u32(dev, "touchscreen-max-pressure", &value);
+	pdata->pressure_max = (u16)value;
+	device_property_read_u32(dev, "touchscreen-min-pressure", &value);
+	pdata->pressure_min = (u16)value;
+	device_property_read_u32(dev, "touchscreen-average-samples", &average);
+	switch (average) {
+	case 1:
+		pdata->averaging = 0;
+		break;
+	case 4:
+		pdata->averaging = 1;
+		break;
+	case 8:
+		pdata->averaging = 2;
+		break;
+	case 16:
+		pdata->averaging = 3;
+		break;
+	default:
+		dev_err(dev,
+			"touchscreen-average-samples must be 1, 4, 8, or 16\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return pdata;
+}
+
 static int ad7877_probe(struct spi_device *spi)
 {
 	struct ad7877			*ts;
@@ -681,8 +744,9 @@ static int ad7877_probe(struct spi_device *spi)
 	}
 
 	if (!pdata) {
-		dev_dbg(&spi->dev, "no platform data?\n");
-		return -ENODEV;
+		pdata = ad7877_parse_props(&spi->dev);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
 	}
 
 	/* don't exceed max specified SPI CLK frequency */
-- 
2.46.0


