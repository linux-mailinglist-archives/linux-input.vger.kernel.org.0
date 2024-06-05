Return-Path: <linux-input+bounces-4147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC67F8FDB28
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 02:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D32284424
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 00:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE06364;
	Thu,  6 Jun 2024 00:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="bqCD9+p3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF01361;
	Thu,  6 Jun 2024 00:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717632525; cv=none; b=V1fdhUH0bLfs6HnwX6j6lVqAyjJMcQdtfQ1iFA/Ja4vhQ6m6SYPtmiIigs2ecTEjIC8RPMkzA2gurPOvd8p4wWVOKPpJjdvfNZooamWJAdDPA+tLrxFixddkYZntkwkXL8MTzziqyvQRyNCrky6oURIyH777roah5rSUJYJjbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717632525; c=relaxed/simple;
	bh=7lSdRK8+0RYtmNReQjUvhYYc2NdiIGpKwFmZh47w/3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=daaMC/al9F3P0Uc15Jv9gEhl6DJxoheQ4/XkRxcANvNB6YmRk2Ph1vW8Q8WfwvDy6JmDpcMRHe2Q5XnHHBjcMi/M/dS/jbta4Hx9fT9SLzzVz8bCwmDuVJlzU+fggqH3zAPLocch46E7AoGj8pIDj3fo11v0Qi0o7ZcPQjH3V+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=bqCD9+p3; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341555.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455MCwgs016418;
	Wed, 5 Jun 2024 23:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=UmyUA
	sz3kYKSjAgdkqW61v+uUxBxpJPTsNMRS4zcWHE=; b=bqCD9+p33aaa8RTfBi0MV
	qAKVmQWWNAuz1l5rT3uadlMCHK3PXZC2avyHklTflkbhwatZgHjLRc5Qjhitxdfc
	DlZY0wUwdgrC+nmt5spM5MwvoproHNDcCHezgPlnnO9aDxyZH6WaD4fRe3bjFA2L
	cKJW0Y2gUroS3SBErqBMw8nN8PJHFZNKwtX3+OFHQmErvWWk7IPieBEENd99PKNv
	LEvv87VNa42JHTRLWi1MWIcD1FM73V94Htl59UZUS/pRa0Ni8Pnz+A/pgpwssE8v
	2A7DxAPP3Zp70nJ0raNJdFk1ra/VNKvydC5TSz5wVR6oyKIl0Tf1NtqD4G7QgVJN
	g==
Received: from gcc-mail-mx-001.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 3yjyu387kk-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 23:17:50 +0000 (GMT)
Received: from gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) by
 gcc-mail-mx-001.na.plexus.com (10.255.51.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 5 Jun 2024 23:17:48 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 5 Jun 2024 23:17:48 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
Date: Wed, 5 Jun 2024 18:12:46 -0500
Subject: [PATCH v11 3/4] HID: cp2112: Fwnode Support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240605-cp2112-dt-v11-3-d55f0f945a62@plexus.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717629180; l=2253;
 i=danny.kaehn@plexus.com; s=20240605; h=from:subject:message-id;
 bh=7lSdRK8+0RYtmNReQjUvhYYc2NdiIGpKwFmZh47w/3k=;
 b=OseCypQoU0HxxRWRc3RCDXUPSz3N/aiGM8ad4iwzSJu7PIA0j8mW4HTO9U4f0IsEreZFaFBoZ
 LCLVaeANSDuCyBEE0x3M5Ui3usKdDB6ra+D1KL4o43/CRpKk+93clBm
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=+a/HbfS1U7uuw+5dRHN5PsUDyPWbx4dXDnblK41GI2s=
X-Proofpoint-GUID: euC60vgAo402uKM1X9xWPyK1CTpdklhW
X-Proofpoint-ORIG-GUID: euC60vgAo402uKM1X9xWPyK1CTpdklhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxlogscore=950 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050175

Support describing the CP2112's I2C and GPIO interfaces in firmware.

The GPIO chip shares a firmware node with the CP2112. The I2C child
node can either be a child with the name "i2c" or, in ACPI, a device
node with _ADR Zero.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---
 drivers/hid/hid-cp2112.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 20a0d1315d90..b78d81275065 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -27,6 +27,22 @@
 #include <linux/usb/ch9.h>
 #include "hid-ids.h"
 
+/**
+ * enum cp2112_child_acpi_cell_addrs - Child ACPI addresses for CP2112 sub-functions
+ * @CP2112_I2C_ADR: Address for I2C node
+ */
+enum cp2112_child_acpi_cell_addrs {
+	CP2112_I2C_ADR = 0,
+};
+
+/*
+ * CP2112 Fwnode child names.
+ * CP2112 sub-functions can be described by named fwnode children or by ACPI _ADR
+ */
+static const char * const cp2112_cell_names[] = {
+	[CP2112_I2C_ADR]	= "i2c",
+};
+
 #define CP2112_REPORT_MAX_LENGTH		64
 #define CP2112_GPIO_CONFIG_LENGTH		5
 #define CP2112_GPIO_GET_LENGTH			2
@@ -1195,7 +1211,10 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct cp2112_device *dev;
 	u8 buf[3];
 	struct cp2112_smbus_config_report config;
+	struct fwnode_handle *child;
 	struct gpio_irq_chip *girq;
+	const char *name;
+	u32 addr;
 	int ret;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1209,6 +1228,26 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	mutex_init(&dev->lock);
 
+	device_for_each_child_node(&hdev->dev, child) {
+		ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
+		if (ret) {
+			name = fwnode_get_name(child);
+			if (!name)
+				continue;
+			ret = match_string(cp2112_cell_names,
+					ARRAY_SIZE(cp2112_cell_names), name);
+			if (ret < 0)
+				continue;
+			addr = ret;
+		}
+
+		switch (addr) {
+		case CP2112_I2C_ADR:
+			device_set_node(&dev->adap.dev, child);
+			break;
+		}
+	}
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");

-- 
2.25.1


