Return-Path: <linux-input+bounces-1675-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7EF84A110
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 18:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9FF1C22859
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 17:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E587F44C67;
	Mon,  5 Feb 2024 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="GSXAYWaA"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A1445035;
	Mon,  5 Feb 2024 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707154767; cv=none; b=HB7+hZ2s6JliuWwKLP4ZPAGxjD5BtceAogpjIZvs0aZjAfoqiGipfaFdcZbTte3WAExMs0WCJsrX7x0UASDkl8jWR6sra832zFIC7u36GYDucF+mbxLXL7/TWCMxJB3IyiNS4NFM/Uob9Csemb906sSPZTzbp0dETCDTP3XKPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707154767; c=relaxed/simple;
	bh=J1Ty7HT+EcPsN48eKGCq00T/+JXCPX8XZZHVey7nC8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLwTjwzdhIC6mCC0ugPCAKayE6OhM45KSswtyxGZA5dGS20kS7I/KkahLqih7jIHMNkYi4COfs1DBxQpP1QG45r0VJiHNx5FgRdTUlOh5jQAyp/WRpVDlw0XYMtq+pMCWO0Ym6SXgwIgA2WXaUSpdEyyN9U5aWcwiY6NXX7i2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=GSXAYWaA; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415942dD006589;
	Mon, 5 Feb 2024 11:10:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=pps1;
	 bh=zmCLHNxG2Yjs2btIT/AyYeLs9CECTuFCT2Y40q2eIWw=; b=GSXAYWaAErdc
	F0HGg34mPpL8TiGYK54USTDc0EMThtTi2wviAAKp1zAKLGlWl/ZccxTx8PGxXL4l
	ntwYMdGUciWT5WuWKhL+Fru/Wayu8HKBphw6C82ZwjHGide7swMzkaPo6uERudHt
	sPf3JdT3ZKJ3OImEyMyOMIfrEj88Qb7Ni+ZG5oQxZzZ8S2gI3+KniwS4xp1RU3q3
	k0vkDhEFv0HbJ+lZghDQMfZ2VrRG18Wybe8QykcbRWvqofN68VJCWtGBehMB71Ti
	gsppZelOkXzLiC/fSzlJ6jDz6pMDwt9BA7XFY83zYm3wpNEHMLuYtleT4bVGirBl
	gO+Y/KWWKw==
Received: from dcc-mail-mx-002.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3w2vqg148j-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 05 Feb 2024 11:10:32 -0600 (CST)
Received: from dcc-mail-mx-001.na.plexus.com (10.249.48.15) by
 Dcc-mail-mx-002.na.plexus.com (10.249.48.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 17:10:31 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 17:10:31 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andriy.shevchenko@linux.intel.com>, <bentiss@kernel.org>
CC: <jikos@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <niyas.sait@linaro.org>, <dmitry.torokhov@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <ethan.twardy@plexus.com>, Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH v10 3/3] HID: cp2112: Fwnode Support
Date: Mon, 5 Feb 2024 11:09:22 -0600
Message-ID: <20240205170920.93499-4-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240205170920.93499-1-danny.kaehn@plexus.com>
References: <20240205170920.93499-1-danny.kaehn@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OedAvNDX2QasoI_qyuG8ppnWFyQ9otif
X-Proofpoint-ORIG-GUID: OedAvNDX2QasoI_qyuG8ppnWFyQ9otif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_11,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050130

Support describing the CP2112's I2C and GPIO interfaces in firmware.

I2C and GPIO child nodes can either be children with names "i2c" and
"gpio", or, for ACPI, device nodes with _ADR Zero and One,
respectively.

Additionally, support configuring the I2C bus speed from the
clock-frequency device property.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---

Modeled this version based on Andy's email [1], but made the following
primary changes:
1. Use enum instead of #defines at Benjamin's request
2. Change if() else on checking name existence to allow a fwnode to
have a name that doesn't match to still be checked for its ACPI address
(since fwnode_get_name() _does_ still return a name for ACPI nodes)
3. Continue gracefully / silently if matching fwnodes fails

ACPI compatibility re-tested in QEMU as per conversations in v8.

NOTE: now that I'm not using device_get_named_child_node(), I am no longer
being left with a fwnode reference. I am not entirely sure if I
_need_ one for how I am using the handles, so I have left out the calls
to fwnode_handle_get() and fwnode_hand_put() for now. Plese correct me if
this is a situation where a reference should be held until the driver
is removed. Note that this has been present since v9, but I intended to
include this comment on that patch.

[1] https://lore.kernel.org/all/ZBhYXwjPeRiZwxMT@smile.fi.intel.com/

 drivers/hid/hid-cp2112.c | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 20a0d1315d90..2ec0e5b95845 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -27,6 +27,25 @@
 #include <linux/usb/ch9.h>
 #include "hid-ids.h"
 
+/**
+ * enum cp2112_child_acpi_cell_addrs - Child ACPI addresses for CP2112 sub-functions
+ * @CP2112_I2C_ADR: Address for I2C node
+ * @CP2112_GPIO_ADR: Address for GPIO node
+ */
+enum cp2112_child_acpi_cell_addrs {
+	CP2112_I2C_ADR = 0,
+	CP2112_GPIO_ADR = 1,
+};
+
+/**
+ * CP2112 Fwnode child names.
+ * CP2112 sub-functions can be described by named fwnode children or by ACPI _ADR
+ */
+static const char * const cp2112_cell_names[] = {
+	[CP2112_I2C_ADR]	= "i2c",
+	[CP2112_GPIO_ADR]	= "gpio",
+};
+
 #define CP2112_REPORT_MAX_LENGTH		64
 #define CP2112_GPIO_CONFIG_LENGTH		5
 #define CP2112_GPIO_GET_LENGTH			2
@@ -1195,7 +1214,11 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct cp2112_device *dev;
 	u8 buf[3];
 	struct cp2112_smbus_config_report config;
+	struct fwnode_handle *child;
 	struct gpio_irq_chip *girq;
+	struct i2c_timings timings;
+	const char *name;
+	u32 addr;
 	int ret;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1209,6 +1232,30 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	mutex_init(&dev->lock);
 
+	device_for_each_child_node(&hdev->dev, child) {
+		name = fwnode_get_name(child);
+		if (name) {
+			ret = match_string(cp2112_cell_names,
+							ARRAY_SIZE(cp2112_cell_names), name);
+			if (ret >= 0)
+				addr = ret;
+		}
+		if (!name || ret < 0)
+			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
+
+		if (ret < 0)
+			continue;
+
+		switch (addr) {
+		case CP2112_I2C_ADR:
+			device_set_node(&dev->adap.dev, child);
+			break;
+		case CP2112_GPIO_ADR:
+			dev->gc.fwnode = child;
+			break;
+		}
+	}
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
@@ -1254,6 +1301,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_power_normal;
 	}
 
+	i2c_parse_fw_timings(&dev->adap.dev, &timings, true);
+
+	config.clock_speed = cpu_to_be32(timings.bus_freq_hz);
 	config.retry_time = cpu_to_be16(1);
 
 	ret = cp2112_hid_output(hdev, (u8 *)&config, sizeof(config),
-- 
2.25.1


