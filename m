Return-Path: <linux-input+bounces-1714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344084C164
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 01:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7B61F2461A
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 00:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3F4EC2;
	Wed,  7 Feb 2024 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T3Q2RRa3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306B944C;
	Wed,  7 Feb 2024 00:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266199; cv=none; b=j3TBt2dQUqwju6wiKKBdBxIWnC9BEh5gxbiki0Pds31exmWLAkuPSr7n8Vd3+jPqG/Fso2wq5OtBwKumlSQ07xDlQpSh0ivzD31PfVtQBBQ3fLbf89ADvAe097UbKU4OXF/G1loCYWmFsIObVZwRyr3bGJ68AhrSHv8ikp3vhQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266199; c=relaxed/simple;
	bh=E/KXvKs17RMszKKy8h68JhIY0W35oIaAzf8OItcXVMw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aAjQJ8HXuSfQ75CP8+8aylbFAM09rGW2ixpaiMpwfy7EnTacIRwRkTIXAFrTnt8FV8hkfEq8LD6qmBp3SKRl+Zxpgmr643IA6EJTw6G37oJWLEgknnQ9ezmbuvORwbFOnUIY92YsLAdG3cLCXXh7ts0q+qq1+OKOydfTQxEeFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T3Q2RRa3; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416Ng0Ru017380;
	Tue, 6 Feb 2024 18:36:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=n
	rb6jZGI34DDqdie3BbjCzdZ1JZvBSYVfJIXZOy3cIU=; b=T3Q2RRa3ECJOFRmdF
	KkwoVjkFg4AnTCiAjvwpWSH158mbaq2qyMQWMfXqOA2JvbsAMcvah4mZj6R69jUi
	BpZZSMBcKv+O13TjFYYVpLGSrw1AtY/8NBCoPkIxetCRtejgTJiZ+E8XrTleeZ4x
	RZd3+rMPFIMz8pMMalK60NL/52zTVWpcKud6jcAam7iin6xZNYgZjFoiW0qBw/ow
	f6O2gVh4xaOHQYzF3DPgwONjFl+Ac0K7zZov2j73s9ooaOah2kRJh12pzD9AkQ26
	uKWxcdp2mMTdrIFRtxqJ59SpGYkZrjgkN5NR//AqVZZxZvo39P7Y4D7M0YQkieJi
	nK2lg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w1jsnm8xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 18:36:30 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 00:36:28 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 7 Feb 2024 00:36:28 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E2352820246;
	Wed,  7 Feb 2024 00:36:26 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v6 0/5] Add support for CS40L50
Date: Wed, 7 Feb 2024 00:36:07 +0000
Message-ID: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: C0D4-tTfa3EQLkH7k5wwTz0xVMcazUlk
X-Proofpoint-ORIG-GUID: C0D4-tTfa3EQLkH7k5wwTz0xVMcazUlk
X-Proofpoint-Spam-Reason: safe

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
 drivers/firmware/cirrus/cs_dsp.c              | 263 ++++++++
 drivers/input/misc/Kconfig                    |  10 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/cs40l50-vibra.c            | 571 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  30 +
 drivers/mfd/Makefile                          |   3 +
 drivers/mfd/cs40l50-core.c                    | 537 ++++++++++++++++
 drivers/mfd/cs40l50-i2c.c                     |  69 +++
 drivers/mfd/cs40l50-spi.c                     |  69 +++
 include/linux/firmware/cirrus/cs_dsp.h        |  29 +
 include/linux/mfd/cs40l50.h                   | 134 ++++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/cs40l50-codec.c              | 311 ++++++++++
 16 files changed, 2122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
 create mode 100644 drivers/input/misc/cs40l50-vibra.c
 create mode 100644 drivers/mfd/cs40l50-core.c
 create mode 100644 drivers/mfd/cs40l50-i2c.c
 create mode 100644 drivers/mfd/cs40l50-spi.c
 create mode 100644 include/linux/mfd/cs40l50.h
 create mode 100644 sound/soc/codecs/cs40l50-codec.c

-- 
2.25.1


