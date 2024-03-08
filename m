Return-Path: <linux-input+bounces-2293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D3876CFF
	for <lists+linux-input@lfdr.de>; Fri,  8 Mar 2024 23:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A271C216C7
	for <lists+linux-input@lfdr.de>; Fri,  8 Mar 2024 22:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F955FEE3;
	Fri,  8 Mar 2024 22:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="csGxP+yc"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C015FDAD;
	Fri,  8 Mar 2024 22:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709936683; cv=none; b=WWDTbFfc+r2tQd2czvYwbbtFmP5vGOLEVlyHaHPljnBvEIm5bwdGCprTbczHGeoyIOwe6+oZKpazQFxofNCLmeGjNNQbNNnzMv7AvpkrKPtlaooI0fevJYwgbJXOOau6MIDJnKIakSD7BJgc/eilHqrpwLteHm0WFsyOarJtTfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709936683; c=relaxed/simple;
	bh=D2iFALSmRvJdk6Xoi1+UBBruDkvAXQKIvW0mtCCd91o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KtP4c6AGCy3AAllHbXNOvHoqiJzbWJG8lqw80ljwkUPLzGRd46ALf7iqkv+1LNQyC5uASXO87dScA+ahuRwIfcWEHYUaoJNuV6kCimI0H5UgwS8fTh89wfR3MgaR4RipxAYBR5PmcPn+FJTlBIVVxKLqmFrEO2Rn4HlVSgmPn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=csGxP+yc; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 428FhHxG011333;
	Fri, 8 Mar 2024 16:24:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=z
	M1NzCvjmVOAPjEc0oJV6twe15JqF+oxBtSnatZvv1M=; b=csGxP+ycYN7B64JuD
	iuyAlXi01gWnHkFMXcbmryEA87idA3oDLXD9DJ5heqeMx8HZxBo4Xfo25ARAtp3g
	8FAUq1uRhj98ScPQXQUS9WmAevImSCljDVxeRbkU8Yx46C6LymAzJpZiHkXnwMgB
	S5RomTMWctQIYMtqUBXPiXbmLACV1E4HO4aDpfjX177mccDLV0xylZP737zfwb8L
	Son++S5S+5xtcTToE2OgSD4sRTup3Kxd+pf9oithJFOwiJ1u9oLRo8FWVcEAIqtI
	U2rl/axVt1Pktf3N63HybA/hQ7bEZTooJHG0gT74Xm0NKqI6O3G7cCtDru0xXEA1
	cjdbQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn93413g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 16:24:35 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 8 Mar 2024
 22:24:33 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Fri, 8 Mar 2024 22:24:33 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B652382026C;
	Fri,  8 Mar 2024 22:24:31 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v9 0/5] Add support for CS40L50
Date: Fri, 8 Mar 2024 22:24:16 +0000
Message-ID: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JtwhUHPJTVDNXF38pZBl0ybl7SjhcswW
X-Proofpoint-ORIG-GUID: JtwhUHPJTVDNXF38pZBl0ybl7SjhcswW
X-Proofpoint-Spam-Reason: safe

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
  firmware: cs_dsp: Add write sequencer interface
  dt-bindings: input: cirrus,cs40l50: Add initial DT binding
  mfd: cs40l50: Add support for CS40L50 core driver
  Input: cs40l50 - Add support for the CS40L50 haptic driver
  ASoC: cs40l50: Support I2S streaming to CS40L50

 .../bindings/input/cirrus,cs40l50.yaml        |  70 +++
 MAINTAINERS                                   |  12 +
 drivers/firmware/cirrus/cs_dsp.c              | 263 ++++++++
 drivers/input/misc/Kconfig                    |  10 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/cs40l50-vibra.c            | 578 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  30 +
 drivers/mfd/Makefile                          |   4 +
 drivers/mfd/cs40l50-core.c                    | 528 ++++++++++++++++
 drivers/mfd/cs40l50-i2c.c                     |  68 +++
 drivers/mfd/cs40l50-spi.c                     |  68 +++
 include/linux/firmware/cirrus/cs_dsp.h        |  28 +
 include/linux/mfd/cs40l50.h                   | 144 +++++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/cs40l50-codec.c              | 307 ++++++++++
 16 files changed, 2124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
 create mode 100644 drivers/input/misc/cs40l50-vibra.c
 create mode 100644 drivers/mfd/cs40l50-core.c
 create mode 100644 drivers/mfd/cs40l50-i2c.c
 create mode 100644 drivers/mfd/cs40l50-spi.c
 create mode 100644 include/linux/mfd/cs40l50.h
 create mode 100644 sound/soc/codecs/cs40l50-codec.c

-- 
2.25.1


