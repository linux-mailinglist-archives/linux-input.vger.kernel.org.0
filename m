Return-Path: <linux-input+bounces-9637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A7CA243C1
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 21:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36059188AAEE
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 20:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59F91F3D4A;
	Fri, 31 Jan 2025 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n1m0IEqc"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26E1F238E;
	Fri, 31 Jan 2025 20:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354907; cv=none; b=AmfLgPpzsRSDgJ/BZZeQB1MrZ4Qag6QFRd1/3tDqOb+Pdwu05ZpBADPTFVcId8UOqDtCc//WwdYAV9mLz//kQWUlAULuSt9mM7wl+xulS3aVyKF/qUVGM2O5FtYbMFTaHZIhSQc15dsU4OJMT/HQ27ynjnoAr/IHXwTo5n/tbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354907; c=relaxed/simple;
	bh=hTXjfUYY5jkGWVr3mwx6N3NFTy2eiwGjxT5HEGQnA0I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iubfmshvvFwN03TCK9T1WBlt8XRtgI76Aiq6mKJ+H/txp4MxWrGSa7447ENbv1Zf5K50SigslUi4mGsTnfR9Nhv28WFS0xP1IIQA4K7301Th1s8MCBUqtEndiLhsSEmDlLCMWw8cRSIqkP1lKK+sVpVVa4ch7HgnBCJBCaMe7ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n1m0IEqc; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDHdad013031;
	Fri, 31 Jan 2025 14:21:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZHHnYJ0H+qOjkw25
	Mfu1e2Mk+Cj3/9kmu6Acd5OIRLc=; b=n1m0IEqceOeup1+RXBBMO3Tp5DjhSJbC
	6lj8mg8uZm2tggiLcNpTKE9DkV5YfilLbiTs7Ow82Yc9Fm4ksX9SaoQfOJfbY5kZ
	HMDfMMlNx/Y7EBkWYmjN7ALzlUdFRTK1hc1B8uOtCspNeFm3n3/xsdnNJe/Y1kjY
	qSuVitqflyybHxtcWvME6IL9ARrB+qsRo9YlojdONTQLyi0+WNfiKBYYss6iRL8M
	Lj/O+oZICFG7oMm4xEvKzwf8LcClel4s7g3UoRnM5d+uKibpT/gzTtow8iJFZa/H
	1dayoXJP0a3PsIt27th5BXy2Q7MSVI0AYcwseZGpaswkD3EjU4xGLw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44gf8n168d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 14:21:06 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Jan
 2025 20:21:05 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 31 Jan 2025 20:21:05 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D664482026C;
	Fri, 31 Jan 2025 20:21:00 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Ben Bright <ben.bright@cirrus.com>, <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Lee Jones <lee@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>, Jack Yu
	<jack.yu@realtek.com>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Weidong Wang
	<wangweidong.a@awinic.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,
        Prasad Kumpatla
	<quic_pkumpatl@quicinc.com>,
        Paul Handrigan <paulha@opensource.cirrus.com>,
        Masahiro Yamada <masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
        "Karel
 Balej" <balejk@matfyz.cz>, Heiko Stuebner <heiko@sntech.de>,
        Jeff LaBundy
	<jeff@labundy.com>
CC: <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        Fred Treven
	<ftreven@opensource.cirrus.com>
Subject: [PATCH 0/7] Initial Support for CS40L26
Date: Fri, 31 Jan 2025 14:20:56 -0600
Message-ID: <20250131202057.1786324-1-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HUzqT7mBuyL30WS1jJMSP0uapPcn3gke
X-Authority-Analysis: v=2.4 cv=YOxlyQGx c=1 sm=1 tr=0 ts=679d30b2 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=VdSt8ZQiCzkA:10 a=78G1mFUK9uwQN7RrU40A:9
X-Proofpoint-ORIG-GUID: HUzqT7mBuyL30WS1jJMSP0uapPcn3gke
X-Proofpoint-Spam-Reason: safe

Introduce driver for Cirrus Logic Device CS40L26:
A boosted haptics driver with integrated DSP and
waveform memory with advanced closed loop algorithms
and LRA protection.

The core CS40L26 driver is in MFD and touches the
Input Force Feedback subsystem for haptics and
the ASoC subsystem for audio to haptics streaming.

This patchset includes changes to the CS DSP firmware
driver which fixes two bugs and introduces support for
multiple coefficient files.

Fred Treven (7):
  firmware: cs_dsp: Fix error checking in wseq_write()
  firmware: cs_dsp: Check for valid num_regs in
    cs_dsp_wseq_multi_write()
  firmware: cs_dsp: Add ability to load multiple coefficient files
  dt-bindings: mfd: cirrus,cs40l26: Support for CS40L26
  mfd: cs40l26: Add support for CS40L26 core driver
  ASoC: cs40l26: Support I2S streaming to CS40L26
  Input: cs40l26 - Add support for CS40L26 haptic driver

 .../bindings/mfd/cirrus,cs40l26.yaml          |   81 +
 MAINTAINERS                                   |    4 +-
 drivers/firmware/cirrus/cs_dsp.c              |   70 +-
 drivers/input/misc/Kconfig                    |   10 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/cs40l26-vibra.c            |  669 ++++++++
 drivers/mfd/Kconfig                           |   29 +
 drivers/mfd/Makefile                          |    4 +
 drivers/mfd/cs40l26-core.c                    | 1412 +++++++++++++++++
 drivers/mfd/cs40l26-i2c.c                     |   63 +
 drivers/mfd/cs40l26-spi.c                     |   63 +
 include/linux/firmware/cirrus/cs_dsp.h        |   14 +
 include/linux/mfd/cs40l26.h                   |  341 ++++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/cs40l26-codec.c              |  523 ++++++
 16 files changed, 3281 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
 create mode 100644 drivers/input/misc/cs40l26-vibra.c
 create mode 100644 drivers/mfd/cs40l26-core.c
 create mode 100644 drivers/mfd/cs40l26-i2c.c
 create mode 100644 drivers/mfd/cs40l26-spi.c
 create mode 100644 include/linux/mfd/cs40l26.h
 create mode 100644 sound/soc/codecs/cs40l26-codec.c

-- 
2.34.1


