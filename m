Return-Path: <linux-input+bounces-2860-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB49F89C855
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 17:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BCA71F24CB2
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 15:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3A5140E5C;
	Mon,  8 Apr 2024 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FALI/ZoK"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEEE1CD21;
	Mon,  8 Apr 2024 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590358; cv=none; b=P3LtdnW+HiKLwyy9EK3kss82un5c/+kvfDoQXu+MNJTeE/eHT8rkb+hXpDE4Skld0x+jfpn9JS0cTudg5xYRZvFRXqY+7w8kuuJZrOSY85WY7FUAzVH/xzF4SAMmSgV8wPy0oxm94nT7sX0cENpBO83u/jiYFgr5pKqTkoyGA/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590358; c=relaxed/simple;
	bh=9Onb7SpSSXz/DSaTRYqETVrjUvaMxyS6VNi7FdiIpt0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sZ/4a5l3i2C+Ow2sPvhju/3Y2O12x6C5ZJBOyaKC+WsgvotWqMxtLmJo7osb61LIfVyh1s9z/GOIFzc5FNp56gYvMN0suVbgx0n3F5WEo7bEGMo6K81Lg0DixcxFCMEGIO63cKfgKiQMd24SKiaToOVoSzVgXEp6lDvFux6AjBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FALI/ZoK; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4385j8Od014221;
	Mon, 8 Apr 2024 10:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=w
	uhU3jyk69q+EFOCh/CvUNEU93sJaqDrjk2nglUf9VA=; b=FALI/ZoKNYyaQ7C5F
	QCBfoZ1T2ZuCdDPE04rqr5FtrdXha/zeeIMaN6xg05GQDzfBtuvOuXdC6j4ooRHb
	LYemED8krtZd9nctApFie4vU5Di+ltaqmA+kqovpG4wv+rV1wpIPu5xlyVIpzBPP
	GGDrrTO3OIBSDot424k2XYjdtaKx+1x+xcUS5oBj3UaXyvudeMNXu1WzApL1Omfu
	4zVWu05wF64QEa8HOHkEai3dBpMvmz9BsYHVZI8VgJLtM9+0VC/a4/egKhOXWBjW
	JgzuLeqLqJFKG1MBek7pcoq+STpFOAtyAsAIgCNFaY9paK1S+lV6FS4BciaMm/n0
	htZBg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xb2tjhy7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 10:32:25 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Apr 2024
 16:32:24 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Mon, 8 Apr 2024 16:32:24 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8ADDC820242;
	Mon,  8 Apr 2024 15:32:22 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH RESEND v10 0/5] Add support for CS40L50
Date: Mon, 8 Apr 2024 15:32:09 +0000
Message-ID: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QqyhRVdhxbCeod9IKiRoqgbwSGVkZ-hY
X-Proofpoint-GUID: QqyhRVdhxbCeod9IKiRoqgbwSGVkZ-hY
X-Proofpoint-Spam-Reason: safe

Changes in v10:
- Minor refactoring and logical improvements all around
- Renamed and added supplies

Changes in v9:
- Fixed empty struct by utilizing cs_dsp's post_run callback
- Style fixes in MFD driver

Changes in v8:
- set_sysclk() -> set_bclk_ratio()
- Added ID table to codec driver
- Style improvements
- Fixed ordering of new write sequence operations

Changes in v7:
- Fixed sparse warning
- Moved write sequences to private data structure
- Logical and style improvements in write sequence interface

Changes in v6:
- Updated write sequencer interface to be control-name based
- Fixed a race condition and non-handling of repeats in playback callback
- Stylistic and logical improvements all around

Changes in v5:
- Added a codec sub-device to support I2S streaming
- Moved write sequencer code from cirrus_haptics to cs_dsp
- Reverted cirrus_haptics library; future Cirrus input
  drivers will export and utilize cs40l50_vibra functions
- Added more comments
- Many small stylistic and logical improvements

Changes in v4:
- Moved from Input to MFD
- Moved common Cirrus haptic functions to a library
- Incorporated runtime PM framework
- Many style improvements

Changes in v3:
- YAML formatting corrections
- Fixed typo in MAINTAINERS
- Used generic node name "haptic-driver"
- Fixed probe error code paths
- Switched to "sizeof(*)"
- Removed tree reference in MAINTAINERS

Changes in v2:
- Fixed checkpatch warnings

James Ogletree (5):
  firmware: cs_dsp: Add write sequence interface
  dt-bindings: input: cirrus,cs40l50: Add initial DT binding
  mfd: cs40l50: Add support for CS40L50 core driver
  Input: cs40l50 - Add support for the CS40L50 haptic driver
  ASoC: cs40l50: Support I2S streaming to CS40L50

 .../bindings/input/cirrus,cs40l50.yaml        |  68 +++
 MAINTAINERS                                   |  12 +
 drivers/firmware/cirrus/cs_dsp.c              | 278 +++++++++
 drivers/input/misc/Kconfig                    |  10 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/cs40l50-vibra.c            | 577 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  30 +
 drivers/mfd/Makefile                          |   4 +
 drivers/mfd/cs40l50-core.c                    | 570 +++++++++++++++++
 drivers/mfd/cs40l50-i2c.c                     |  68 +++
 drivers/mfd/cs40l50-spi.c                     |  68 +++
 include/linux/firmware/cirrus/cs_dsp.h        |  27 +
 include/linux/mfd/cs40l50.h                   | 137 +++++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/cs40l50-codec.c              | 308 ++++++++++
 16 files changed, 2171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
 create mode 100644 drivers/input/misc/cs40l50-vibra.c
 create mode 100644 drivers/mfd/cs40l50-core.c
 create mode 100644 drivers/mfd/cs40l50-i2c.c
 create mode 100644 drivers/mfd/cs40l50-spi.c
 create mode 100644 include/linux/mfd/cs40l50.h
 create mode 100644 sound/soc/codecs/cs40l50-codec.c

-- 
2.25.1


