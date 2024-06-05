Return-Path: <linux-input+bounces-4148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00D8FDB46
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 02:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA2781F2127E
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 00:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28331396;
	Thu,  6 Jun 2024 00:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="DK2hbQrF"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073881361;
	Thu,  6 Jun 2024 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717632999; cv=none; b=lzbom+ZpCSHVC8qtYlkEkEnIcEXf2uCatPfjWdxA4JSipBxcImFBhPD49P0tETXOTY4ro2PXbqB3u6vsyQ3lYBt6f0thxniZxpi6iSUSyATl4N27Gs97bmxtyhoT0AhqdN4ukrXVApl8NX/30ropozgndHDlJ2wcF73o2d5V9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717632999; c=relaxed/simple;
	bh=iXIn4/cfpRBfQSLNVlHO1LCS5qH4+6FWhqutMxFO+hY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hwfz5FBNinlJeBwBGBUM2bWPgAgLakNq6wEQPhm6cSPksOZt6fH0a6L8NSDAdTo9Y7q9s7pssT6kzePx0pPAUHtLxdw0evIqsLwpR1+ULFBqI5UcnH2JHEE7c8rkPeihvz0AMk0Y6sWJCu4aEE7zocy48ODEYVPdEUWVxN29gvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=DK2hbQrF; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341555.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455MCwgt016418;
	Wed, 5 Jun 2024 23:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=9TM+j
	8WAWTNRLztQwA8QKiisx3gl+m0cW1rwMHooefE=; b=DK2hbQrF5vZaIydumQZ2O
	ghqF78jXF7a9YrG9V9n5pA6Z+J/gYsXLkv109HpndjQX9+X2fCEIJBvyOi5A6MJ+
	soAb10eDZ2+I6YIl+vVMtvEZh3iJsuh4B6kMbX+87zNBYKWgfZY8k7hgC/DAAAyt
	IyQkgmJ0HMovT9VXARIpDz22rwcUboAUD9PSRBWl0rYH2sGDB7OO2AIMMeZMVK3c
	5mEp+oAg4mpDAslvKt9rBtYM70xyK4CRQ6TyMGm+V+W0SjOUNmdGZ9122jfGGiPy
	UBIQ0LolHiegxSH9R8Gd9yq1ffYl/F33ZV7vFoy6DsKf++2OB7foa/NSC3v1ZtRb
	Q==
Received: from gcc-mail-mx-001.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 3yjyu387kk-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 23:17:51 +0000 (GMT)
Received: from gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) by
 gcc-mail-mx-001.na.plexus.com (10.255.51.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 5 Jun 2024 23:17:48 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 5 Jun 2024 23:17:48 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
Date: Wed, 5 Jun 2024 18:12:47 -0500
Subject: [PATCH v11 4/4] HID: cp2112: Configure I2C Bus Speed from Firmware
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240605-cp2112-dt-v11-4-d55f0f945a62@plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
In-Reply-To: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Danny Kaehn <danny.kaehn@plexus.com>
CC: Jiri Kosina <jikos@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ethan Twardy
	<ethan.twardy@plexus.com>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717629180; l=1099;
 i=danny.kaehn@plexus.com; s=20240605; h=from:subject:message-id;
 bh=iXIn4/cfpRBfQSLNVlHO1LCS5qH4+6FWhqutMxFO+hY=;
 b=aRkxPpiuxFKqA/yJgeKE7Id0yHH0EiaeA2wNYRz2ylGBBU5qUEY6JBpzZMS1DhA4sgSs0ejc5
 WptPlo63cADAtRh9vdAkGdBwodkbrD3iliYosXS1mZ99mdwp9XUpjpk
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=+a/HbfS1U7uuw+5dRHN5PsUDyPWbx4dXDnblK41GI2s=
X-Proofpoint-GUID: asXZZwh37Y5Y9YZpp8b3d8G_SVAax8fv
X-Proofpoint-ORIG-GUID: asXZZwh37Y5Y9YZpp8b3d8G_SVAax8fv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050175

Now that the I2C adapter on the CP2112 can have an associated firmware
node, set the bus speed based on firmware configuration

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---
 drivers/hid/hid-cp2112.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index b78d81275065..547c2cbd410f 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1213,6 +1213,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct cp2112_smbus_config_report config;
 	struct fwnode_handle *child;
 	struct gpio_irq_chip *girq;
+	struct i2c_timings timings;
 	const char *name;
 	u32 addr;
 	int ret;
@@ -1293,6 +1294,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_power_normal;
 	}
 
+	i2c_parse_fw_timings(&dev->adap.dev, &timings, true);
+
+	config.clock_speed = cpu_to_be32(timings.bus_freq_hz);
 	config.retry_time = cpu_to_be16(1);
 
 	ret = cp2112_hid_output(hdev, (u8 *)&config, sizeof(config),

-- 
2.25.1


