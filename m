Return-Path: <linux-input+bounces-4103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05DD8FC756
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 11:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F994286012
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 09:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BE018FC87;
	Wed,  5 Jun 2024 09:12:09 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com [115.124.28.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF13018C34B;
	Wed,  5 Jun 2024 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578729; cv=none; b=W4OXtvQj2p8w91OBQDlbMDnQu7/5EWsbwZJ/p7LH/iUMEvxbh+Ei5VYSTF5mckIVosmvltk4GCOs2TTWqKF7DLPD1cb+XJWBlxWbDv4JEIMu7tcBebjvgPqUTzHldTL4U3tnsyf9IQrWNcUGQTNKv/FJvAYHOGjTrcsV08DO3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578729; c=relaxed/simple;
	bh=JrKBIvMcsszkIlGiuHQMlVO4ONlUiZlTc0/i6RNrmS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaV+ulbaBRtTHCzIYHUwA/An9sAflRzwnLDmxizSvm/mEvKC6US7iPEg6t2QVsO5ZYmT4IIwZlrFmSru44StIYNmm4U1gv4RPQuHL4BitYhjwoHlsuZXGpnGm5riWzR9hZZNyTvWL1hg4lmB0/oa+kf/6nndiNZj5rHdh1dM7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07484445|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0110128-0.000106329-0.988881;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037088118;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XwdqTSw_1717578708;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XwdqTSw_1717578708)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 17:11:58 +0800
From: wangshuaijie@awinic.com
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jeff@labundy.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: wangshuaijie@awinic.com,
	liweilei@awinic.com,
	kangjiajun@awinic.com
Subject: [PATCH V2 0/5] Add support for Awinic SAR sensor.
Date: Wed,  5 Jun 2024 09:11:38 +0000
Message-ID: <20240605091143.163789-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: shuaijie wang <wangshuaijie@awinic.com>

Add drivers that support Awinic SAR (Specific Absorption Rate)
sensors to the Linux kernel.

The AW9610X series and AW963XX series are high-sensitivity
capacitive proximity detection sensors.

This device detects human proximity and assists electronic devices
in reducing SAR to pass SAR related certifications.

The device reduces RF power and reduces harm when detecting human proximity.
Increase power and improve signal quality when the human body is far away.

This patch implements device initialization, registration,
I/O operation handling and interrupt handling, and passed basic testing.

shuaijie wang (5):
  dt-bindings: input: Add YAML to Awinic sar sensor.
  Add universal interface for the aw_sar driver.
  Add aw9610x series related interfaces to the aw_sar driver.
  Add aw963xx series related interfaces to the aw_sar driver.
  Add support for Awinic sar sensor.

 .../bindings/input/awinic,aw_sar.yaml         |  125 +
 drivers/input/misc/Kconfig                    |    9 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/aw_sar/Makefile            |    2 +
 drivers/input/misc/aw_sar/aw9610x/aw9610x.c   |  884 +++++++
 drivers/input/misc/aw_sar/aw9610x/aw9610x.h   |  327 +++
 drivers/input/misc/aw_sar/aw963xx/aw963xx.c   |  974 ++++++++
 drivers/input/misc/aw_sar/aw963xx/aw963xx.h   |  753 ++++++
 drivers/input/misc/aw_sar/aw_sar.c            | 2036 +++++++++++++++++
 drivers/input/misc/aw_sar/aw_sar.h            |   15 +
 .../misc/aw_sar/comm/aw_sar_chip_interface.h  |   27 +
 .../misc/aw_sar/comm/aw_sar_comm_interface.c  |  639 ++++++
 .../misc/aw_sar/comm/aw_sar_comm_interface.h  |  172 ++
 drivers/input/misc/aw_sar/comm/aw_sar_type.h  |  396 ++++
 14 files changed, 6360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
 create mode 100644 drivers/input/misc/aw_sar/Makefile
 create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.c
 create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.h
 create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.c
 create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.h
 create mode 100644 drivers/input/misc/aw_sar/aw_sar.c
 create mode 100644 drivers/input/misc/aw_sar/aw_sar.h
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_chip_interface.h
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.c
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface.h
 create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_type.h


base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58
-- 
2.45.1


