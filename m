Return-Path: <linux-input+bounces-1858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F9851B79
	for <lists+linux-input@lfdr.de>; Mon, 12 Feb 2024 18:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF2E91F2565E
	for <lists+linux-input@lfdr.de>; Mon, 12 Feb 2024 17:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6AC3F9CB;
	Mon, 12 Feb 2024 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mME2VuDB"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAD3EA7B;
	Mon, 12 Feb 2024 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707759100; cv=none; b=D7BYvboS9CyKYedD2EPvIQURlL14hwDdbKXqSxflvJ/h0POUQdfyNlqrYRJuUv0fnmU7LL2LQVvmaUOJ9yRStTn68ESO0Cf+MW/cIe63MS65jgyih3p6CT6oJDNqL1W60tqa+2TjFWEmvl47meKsbJgrLKzB7FWKGhpJqPzLgVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707759100; c=relaxed/simple;
	bh=mK31yRTxup64WSxJD8dsvPJdAc7rD+RgAShdC5fAsbw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bUJ6nGdrgrHCPwE2o6fwfxk9bvCfRPPw4OUqkg54qaEMsUI2qX4oGsFbMcf+1XeTBIzIZPzNi/0SOge3F3GhGMnUDhZ3Xc0u3loM8RoX1z6gYT28w/MAXCBWinmxevVUa/+yPinbnANfu8CcTbLK3irMSSPhfA7plfGeF83eGR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mME2VuDB; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CHUCVE001221;
	Mon, 12 Feb 2024 11:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=4
	vvGckA5Yki91rPQ2RmiMlPYqiKpqyWB62mVLTfHrGc=; b=mME2VuDBI3SbkwS5+
	aJvt7vS+vsgDEQM+SrxGrCrEvpWCW6GXA7K3hLi9Vbf/Ms2Wu60dePg9YQFu9Qps
	baAIQrFRTeLtiwUDHtRNLtAP3NcSZI+Ux8JWe8eSKHtv06biokJd0OzFpGW3CWKH
	FQxLBsrMbSjM+LY/fHfkTe2lizJKRYB9lv06m8bs7pys0Y6CE0C9rf9REpcG/jwt
	twtO8O4b1h9M2+HWmoOh5R790QjCmzqIvIkG3h5jPY1jaSHScqNp8ElsbltQqIhM
	YvCg8a+zB1L16u9qsBWfkplGUgis0oBAmYcnRpj8wy3RlyEIAYAFaVtAKtFBx66C
	p67oQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w66ep25rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 11:31:20 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 17:31:18 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 12 Feb 2024 17:31:18 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0B9D4820243;
	Mon, 12 Feb 2024 17:31:16 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v7 0/5] Add support for CS40L50
Date: Mon, 12 Feb 2024 17:31:06 +0000
Message-ID: <20240212173111.771107-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aCs3FWX-ErcDJhkIeTXFdkn1jxmj21CM
X-Proofpoint-GUID: aCs3FWX-ErcDJhkIeTXFdkn1jxmj21CM
X-Proofpoint-Spam-Reason: safe

Changes in v7:
- Fixed sparse warning
- Moved write sequences to private data structure
- Logical and style improvements in write sequence interface

Changes in v6:
- Updated write sequencer interface to be control-name based
- Fix 1. a race condition and 2. non-handling of repeats in playback callback
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
 drivers/firmware/cirrus/cs_dsp.c              | 265 ++++++++
 drivers/input/misc/Kconfig                    |  10 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/cs40l50-vibra.c            | 575 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  30 +
 drivers/mfd/Makefile                          |   4 +
 drivers/mfd/cs40l50-core.c                    | 531 ++++++++++++++++
 drivers/mfd/cs40l50-i2c.c                     |  69 +++
 drivers/mfd/cs40l50-spi.c                     |  69 +++
 include/linux/firmware/cirrus/cs_dsp.h        |  28 +
 include/linux/mfd/cs40l50.h                   | 142 +++++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/cs40l50-codec.c              | 311 ++++++++++
 16 files changed, 2130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
 create mode 100644 drivers/input/misc/cs40l50-vibra.c
 create mode 100644 drivers/mfd/cs40l50-core.c
 create mode 100644 drivers/mfd/cs40l50-i2c.c
 create mode 100644 drivers/mfd/cs40l50-spi.c
 create mode 100644 include/linux/mfd/cs40l50.h
 create mode 100644 sound/soc/codecs/cs40l50-codec.c

-- 
2.25.1


