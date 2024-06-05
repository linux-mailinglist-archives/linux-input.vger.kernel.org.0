Return-Path: <linux-input+bounces-4150-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBAB8FDB5D
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 02:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE4AEB2123A
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 00:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89092525E;
	Thu,  6 Jun 2024 00:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="JvGvtY2o"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76FD173;
	Thu,  6 Jun 2024 00:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717633279; cv=none; b=AMclPBEPhvQG9B0JEBdKATGqu/VVSYx0jKaUysukO0EGvLHlqyxDsvpH5XLP3kqPjQAidqDRO1jc7GQiboIRcvlMMpDNGELJE1Dgz+jy839wWenE7Jz04GI+lVvGIGJLRaw0qXJeGPU2DsSabkrKY1BWQD1h2mCa6AwwXtkumgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717633279; c=relaxed/simple;
	bh=p/ENPCayabTlcHXB5bmkUIvHlNXCalofVESa/auPyas=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uoXMmoEA2esXTGqHrFSQjhWrYflWk1OLuUVN3KV3/f1znuukBhFoaAshRlgOm10ojSOUIz5jRELqpn0Fj4T2dWrIrk39EMkt1ZFxt5ux+2S8nn7yAZEPQT0FmtekaxI6OZQRcRFRysJBqT0Fn2eK+OzHqWkVd3kd4JuktnwKIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=JvGvtY2o; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341555.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455MCwgp016418;
	Wed, 5 Jun 2024 23:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=GxgW7Z/4D6qnA1EP7/4DABZRqJF
	cYIl8U5O+vv2vby8=; b=JvGvtY2oOJgeU96xCoEU01HWgsIOSpRphmcyG3pxZpO
	tfKFQaggbslyEf3lhWpsMHVMB3LH9zLF/xLVqstOPgIC/wQ8t/JMNzP8TDPVrQjC
	luLcJ+ees1ibkdZI12l23hmZ9hfP0NW42Pwv7Rmy7jX7IBU9I2N03FfFwlZ6/bMe
	yuT5lvfUXZaHq6L5A2UFz2ZnuV2D8LKH7/j1fVmWHsSY+MVZYTTTynyjKgHkBt3A
	zIIdnMpekzCZ93QBXEd39dxs3vD2eWIabqcDyTIM8uMSX18oPT/URSSHRWEZT/Ut
	tAAPYuPlwoHgh37Y8Cr9KEAZFO3LZTlTf9fFqsfgulg==
Received: from gcc-mail-mx-001.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 3yjyu387kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 23:17:48 +0000 (GMT)
Received: from gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) by
 gcc-mail-mx-001.na.plexus.com (10.255.51.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 5 Jun 2024 23:17:47 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 5 Jun 2024 23:17:47 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH v11 0/4] Firmware Support for USB-HID Devices and CP2112
Date: Wed, 5 Jun 2024 18:12:43 -0500
Message-ID: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvwYGYC/0XMQQ7CIBCF4as0sxYyINjiynsYF4ROhWiBQDU1T
 e8ucePyf3n5NqhUAlU4dxsUeocaUmwhxKED5228EwtjG0CiVHhCzVyWQkg2Lqx3ozNaqYEGC+2
 fC01h/WHXW+uppJktvpD9CxK16NFI5OaojGENsjF++MOSj5f8pPVVuUsz7PsX3hod+pwAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717629180; l=3513;
 i=danny.kaehn@plexus.com; s=20240605; h=from:subject:message-id;
 bh=p/ENPCayabTlcHXB5bmkUIvHlNXCalofVESa/auPyas=;
 b=FY5sfQ0DygsVJB7thxf1sooCwz2oGGXbAc7Dk/7a8Hv2i60FCoXJeEysvpIlALz553oY6cgk6
 nXAhW+JKKj1BU59qnZRnmitbD736G6FjLptNqj2K7AGgMW3MkcCPBRr
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=+a/HbfS1U7uuw+5dRHN5PsUDyPWbx4dXDnblK41GI2s=
X-Proofpoint-GUID: h9kO78V1uXoYedV-agMnFFTR0YwhBiQC
X-Proofpoint-ORIG-GUID: h9kO78V1uXoYedV-agMnFFTR0YwhBiQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 spamscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050175

This patchset allows USB-HID devices to have Firmware bindings through sharing
the USB fwnode with the HID driver, and adds such a binding and driver
implementation for the CP2112 USB to SMBus Bridge (which necessitated the
USB-HID change). This change allows a CP2112 permanently attached in hardware to
be described in DT and ACPI and interoperate with other drivers.

Changes in v11:
- Eliminate 'gpio' subnode for DT and ACPI for the CP2112 per comment
    from Rob H.
- Edit hid-cp2112.c to match for ACPI index and fall back to matching by
    name (instead of the other way around)
- Separate CP2112 I2C bus speed configuration into a separate patch

Changes in v10:
- Define an enumeration and mapping for CP2112 ACPI _ADRs and devicetree
    child node names, and use these in the scanning of child nodes
- Address other miscellaneous

Changes in v9:
- Add _ADR-based ACPI binding of child nodes (I2C is _ADR Zero, GPIO is _ADR One)
- Use a loop-based approach for assigning child nodes within probe().
    As a consequence, hid-cp2112.c no longer maintains references to the
    child fwnodes during the lifetime of the device. (plese correct if this
    is actually needed for this use-case)

Changes in v8:
- Apply Review tags retroactively to patches previously reviewed

Changes in v7:
- Use dev_fwnode when calling fwnod_handle_put in i2c_adapter in hid-cp2112.c
- Capitalize I2C and GPIO in commit message for patch 0003

Changes in v6:
- Fix fwnode_handle reference leaks in hid-cp21112.c
- Simplify hog node pattern in silabs,cp2112.yaml

Changes in v5:
 - Use fwnode API instead of of_node api in hid-core.c and hid-cp2112.c
 - Include sda-gpios and scl-gpios in silabs,cp2112.yaml
 - Additional fixups to silabs,cp2112.yaml to address comments
 - Submit threaded interrupt bugfix separately from this patchset, as requested

Changes in v4:
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/i2c

Changes in v3:
 - Additional fixups to silabs,cp2112.yaml to address comments

Changes in v2:
 - Added more detail to silabs,cp2112.yaml dt-binding
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/input
 - Added support for setting smbus clock-frequency from DT in hid-cp2112.c
 - Added freeing of of_nodes on error paths of _probe in hid-cp2112.c

Danny Kaehn (3):
  dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
  HID: usbhid: Share USB device firmware node with child HID device
  HID: cp2112: Fwnode Support

 .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
 drivers/hid/hid-cp2112.c                      |  50 ++++++++
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

--
2.25.1

---
Danny Kaehn (4):
      dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
      HID: usbhid: Share USB device firmware node with child HID device
      HID: cp2112: Fwnode Support
      HID: cp2112: Configure I2C Bus Speed from Firmware

 .../devicetree/bindings/i2c/silabs,cp2112.yaml     | 105 +++++++++++++++++++++
 drivers/hid/hid-cp2112.c                           |  43 +++++++++
 drivers/hid/usbhid/hid-core.c                      |   2 +
 3 files changed, 150 insertions(+)
---
base-commit: 4f54308c970692e66a2a354ac2bde32f228cedeb
change-id: 20240605-cp2112-dt-7cdc95448e8a

Best regards,
-- 
Danny Kaehn <danny.kaehn@plexus.com>


