Return-Path: <linux-input+bounces-1676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F184A19C
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 18:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570381C22B8A
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 17:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6288944C80;
	Mon,  5 Feb 2024 17:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="o5c22UZ4"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77485482C3;
	Mon,  5 Feb 2024 17:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155851; cv=none; b=aPiGlb9TBpJEKBD+FlIqQwi5cdr3KlgpEKj4ryynXGJZyqke3i/xBZ/FKgdaNXl5JJB/QpwAx3Wyzj95YXpJ/y/2LxiKZ9a9tTpzL0dcjaz69wyu1LMsasdDF149rKPBiblBZvdepUNGEcHL5WusjYZt4UfcWdj50sN8scsSEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155851; c=relaxed/simple;
	bh=imH4gYnAeMK1Yjh2ihzpdSRRMUxWWueAyn1ZFYNsAhA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nwqUcbh7U5xWGc9BUe3kupInaJtyZ41zXQnpNnDN7gZL3LBPFJZvpy0KdhlzIjREVJBP3V4KKkFCSsoMmOrCttAonAsl0I3BfOgoeh0YsTKY3ZIWJwi5W0Gceiq3htgrqkhdJb1dpAyD87yXUi+CT23lAKzv+OJlf85M4KmRaLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=o5c22UZ4; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415944Wd006615;
	Mon, 5 Feb 2024 11:10:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pps1; bh=kxg/JI3LBB7n
	lMekCqB37I8Pr+OqZyMo4i1cvdPIf8A=; b=o5c22UZ4WnYppFSHaW50QXI5XKvN
	fqxHFlfepGugSNQ6COxpkfR3KnZvMgidpSBSy4kHj8IpVWSBh5OQVDRb6MxYpxmv
	roK1MnogyS6bYm3yvin9YAdU2ieg9DAU1h8cIwuL44+OsD/BLRMduGCNWVTkCw8M
	Xmgd2XFO1MIaDg0N0qNq33DHbSqL0TMGSKnSDXSrbzR3h+DpnTyW0rT5N2Y4HG8o
	R/BszRgjVzbeG0uwa9jd5NvXvKHRxJIesQHcOSWJfJkdiNKtf1IeVj7x9FA9WOKD
	yoO+bHIq0SxaoNkr7ivLjTMh3B6z+t1vBmbNQvZt5Bh+XAroqLa6z6zmRA==
Received: from dcc-mail-mx-002.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3w2vqg1480-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 05 Feb 2024 11:10:21 -0600 (CST)
Received: from dcc-mail-mx-001.na.plexus.com (10.249.48.15) by
 Dcc-mail-mx-002.na.plexus.com (10.249.48.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 17:10:19 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 17:10:19 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andriy.shevchenko@linux.intel.com>, <bentiss@kernel.org>
CC: <jikos@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <niyas.sait@linaro.org>, <dmitry.torokhov@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <ethan.twardy@plexus.com>, Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH v10 0/3] Firmware Support for USB-HID Devices and CP2112
Date: Mon, 5 Feb 2024 11:09:18 -0600
Message-ID: <20240205170920.93499-1-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: npgnNRS1n2h7rjzNpBt4-bpymVydc1GZ
X-Proofpoint-ORIG-GUID: npgnNRS1n2h7rjzNpBt4-bpymVydc1GZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_11,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=734 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050130

This patchset allows USB-HID devices to have Firmware bindings through sharing
the USB fwnode with the HID driver, and adds such a binding and driver
implementation for the CP2112 USB to SMBus Bridge (which necessitated the
USB-HID change). This change allows a CP2112 permanently attached in hardware to
be described in DT and ACPI and interoperate with other drivers.

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


