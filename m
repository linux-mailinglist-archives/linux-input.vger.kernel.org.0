Return-Path: <linux-input+bounces-4509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8076910BE9
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 18:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5269EB242DC
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4967E1B3757;
	Thu, 20 Jun 2024 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y3ZMdTWS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928FE1B3743;
	Thu, 20 Jun 2024 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900292; cv=none; b=jp2keI3vO+Pj61s3wexxhH5+xxexkDhqET7jUNigshaYuUMqkm+GnQ7du75/Fzp4O2SOcBhEvI8aOeF+n7hJBGzH9B2KLG/VqAVwUhvwX+vhxmcqb/pTKhm71yDwYPaScOrnwYUNdJVP79AL/ASH4ERrKHKGBj0o7YXpgCpioQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900292; c=relaxed/simple;
	bh=l+us4B7oRsCgW3b+RtflPgR9TE13tQzAII9dHEXn2PU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q45pQ0djsLMFKpHnO2nNm7u7V3w4zkTo9BxTnGyPKBNhHqVLLItr39Wzz6KiDnLzIH+CHnM40Fra7WmSvRxOHokav/U7qwlx323+0QrIHu70oI1klDYPRBNxyof93HptFTWSjNmHZfUG3dUfPMqXbeo1mjvooJ/xEw3H5kFsW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y3ZMdTWS; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K3cdBm004563;
	Thu, 20 Jun 2024 11:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/njZOCmFYnuQqgMS
	LFIBiG84a+xw942qr8iK0lGZQxo=; b=Y3ZMdTWSeAOf+z3pfk6lVFD8Xamgcv6Q
	TL31EVRg2WiocCdgZ/Wb6PouxCn2f0SEgDCBxgDpHH1K+OjZQtEUrSD9xa1ldMN5
	YUo2en31jsKDe/aNuNTSucZ/A58LJ+yZeRLN6+lwjDQ2gDU+4BImPCZUdN3/fEWL
	Ng/ryUJsu12zfBAEaduBCVg1t9CTyjuwVd+SxBRJ8U+89hxt6RSW6tfZV1lMO3sZ
	zrByur50ifqj+iFlxWkp/tgEIJngUuecrbygLMmddWwYltDmt5/ERLjaW3WWchhW
	dXLIiVC8EZsTPYIEb7DWVGYLcpi4sqUSydirSAv55fxfu9avAzlMaw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yuj8m2270-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 11:17:52 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 17:17:50 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 20 Jun 2024 17:17:50 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 72EC7820248;
	Thu, 20 Jun 2024 16:17:48 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH RESEND v11 0/5] Add support for CS40L50
Date: Thu, 20 Jun 2024 16:17:40 +0000
Message-ID: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: U51LQKxPLDe1lMSBcCwVvlh9ohAg3Qxd
X-Proofpoint-ORIG-GUID: U51LQKxPLDe1lMSBcCwVvlh9ohAg3Qxd
X-Proofpoint-Spam-Reason: safe

Changes in v11:
- Constified function parameters in ASOC driver
- Removed an unneeded #include
- Changed number of max FF effects = 1
- Minor refactoring in Input driver
- Reworded comment in MFD driver

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
 drivers/input/misc/cs40l50-vibra.c            | 555 +++++++++++++++++
 drivers/mfd/Kconfig                           |  30 +
 drivers/mfd/Makefile                          |   4 +
 drivers/mfd/cs40l50-core.c                    | 570 ++++++++++++++++++
 drivers/mfd/cs40l50-i2c.c                     |  68 +++
 drivers/mfd/cs40l50-spi.c                     |  68 +++
 include/linux/firmware/cirrus/cs_dsp.h        |  27 +
 include/linux/mfd/cs40l50.h                   | 137 +++++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/cs40l50-codec.c              | 307 ++++++++++
 16 files changed, 2148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
 create mode 100644 drivers/input/misc/cs40l50-vibra.c
 create mode 100644 drivers/mfd/cs40l50-core.c
 create mode 100644 drivers/mfd/cs40l50-i2c.c
 create mode 100644 drivers/mfd/cs40l50-spi.c
 create mode 100644 include/linux/mfd/cs40l50.h
 create mode 100644 sound/soc/codecs/cs40l50-codec.c

-- 
2.34.1


