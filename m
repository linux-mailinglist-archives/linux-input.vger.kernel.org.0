Return-Path: <linux-input+bounces-4134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A148FD031
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 15:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48C5B1F21ABB
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85446D26D;
	Wed,  5 Jun 2024 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R8HpmYLi"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C33BA37;
	Wed,  5 Jun 2024 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717595617; cv=none; b=kR8oWYO7YxmCPWUUOdiLU9JVRAm2/M6ubadjU9BmrfI5yDqKM20/Idwh/uJ+mFvyQ0JfHkbMCBwxJQTwc8VrWeXXpIn+UNW3tGm1VhWu1jEGhGspmPlujGw/QXplYOtFVMI8KG4QB4BZVoYLdR+AxiMYQj7M4GHeK41u+rRK9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717595617; c=relaxed/simple;
	bh=mTVSKRj9jqNJGtpu5Tb3yJlUHKgt8aqtByEtY4tvKUE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gEKjGfqMvFEjogPfWwutwpq+04Ig5fH5iXn3vHZOWNqKAAtvZlyuGmAodXjj2JoV2Bh8gZOLaPgsYaeA1+mnMAU/7Gwkcrfw3ovHtrFaXNyEEmFZZoXeNBA3oP3kCeMMh2e9NENZxHgymW8zykT3+Ef00U6mDGZ1+JazcbzJDao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R8HpmYLi; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4555KehG005669;
	Wed, 5 Jun 2024 08:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Vh/ivWdjHcd9S89/
	7xC+GgZmQAOJQR432XBG5cCL/Kk=; b=R8HpmYLikZ0VOYolz3ssHf5lP5epdWq3
	4NY2pM92CnNUUuc5U2kNkdDyz5ptL7DtXQOSNDd1hB4uQ06FNhuYd5n2YViTyfoh
	3JpCILYyeIxikyfVlpjJZ74sZlKzPpLxZY7vV7QFFJJ7g9bC3l6ufaLFZU1wTmRB
	3AfBN9qlJRmt5JZDW6tz2Y7ipLx9+IyOt13L7p7Yr3Doq1cmHlDXGUSUcCXoM4Ew
	o+L9n/g7IG4h66fMcRphSuSJ5h5y05vNv7d1OEMjSzmsPCRz0YzNbchcY5HIPCwb
	knw1osw2C8iFYVTo8QVNBVmCyyjmcTYZDamPjagNNX/RWYvV6IN9wA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hm0m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 08:53:17 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 14:52:59 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 5 Jun 2024 14:52:59 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DA7B8820249;
	Wed,  5 Jun 2024 13:52:57 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v11 0/5] Add support for CS40L50
Date: Wed, 5 Jun 2024 13:52:44 +0000
Message-ID: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QmtCg3RpPAwb7LFFWzKPChRszE8hwl3W
X-Proofpoint-ORIG-GUID: QmtCg3RpPAwb7LFFWzKPChRszE8hwl3W
X-Proofpoint-Spam-Reason: safe

Changes in v11:
- Constified function parameters in ASOC driver
- Removed unneeded pm_runtime.h include
- Initializing with number of max FF effects = 1
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


