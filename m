Return-Path: <linux-input+bounces-3948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B48D3736
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 15:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B06401C2196A
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 13:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB32DDC9;
	Wed, 29 May 2024 13:11:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com [115.124.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B8BDDA3;
	Wed, 29 May 2024 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988312; cv=none; b=qidxgBeq8IlXiZlMHGW0WehmtStUsbAHMgq59zmnQ2BGsG2pB716GTu2tOU/Mz9oADLjpEtl3nQBfz5Q208WJoty/Bd0zxpGLuEJPMjDiQLlNp9lqa6wToxXm8XyGXVP1HndXrI5SvCBztAiscLweY86K/sbjuPsD13AuN1nvO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988312; c=relaxed/simple;
	bh=SZ2UsCR0BIw/CVBpqgPhckSL2iOs5cG6bpO/ZDrURco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/zsDbHHKwfS9SrlY8DWLPJEzEXFLghlYdBajk9dKs9Hk4KGXB17o81XzuyAaHbI5YkEWiUfqjQeS+d0xDo1n7XiN9T70xRmWmFxMT3Cbe8+RqrOlXDYOsxHMaUh45BqygQU2nB6slr88vZnIB0yuIQpcls9zd64Rmhz4w5yVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07483431|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0290941-4.95304e-05-0.970856;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033070021165;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XqPptyM_1716987970;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XqPptyM_1716987970)
          by smtp.aliyun-inc.com;
          Wed, 29 May 2024 21:06:24 +0800
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
Subject: [PATCH V1 0/5] Add support for Awinic SAR sensor.
Date: Wed, 29 May 2024 13:06:03 +0000
Message-ID: <20240529130608.783624-1-wangshuaijie@awinic.com>
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

 .../bindings/input/awinic,aw_sar.yaml         |  110 +
 drivers/input/misc/Kconfig                    |    9 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/aw_sar/Makefile            |    2 +
 drivers/input/misc/aw_sar/aw9610x/aw9610x.c   |  884 +++++++
 drivers/input/misc/aw_sar/aw9610x/aw9610x.h   |  324 +++
 drivers/input/misc/aw_sar/aw963xx/aw963xx.c   |  986 ++++++++
 drivers/input/misc/aw_sar/aw963xx/aw963xx.h   |  749 ++++++
 drivers/input/misc/aw_sar/aw_sar.c            | 2039 +++++++++++++++++
 drivers/input/misc/aw_sar/aw_sar.h            |   15 +
 .../misc/aw_sar/comm/aw_sar_chip_interface.h  |   27 +
 .../misc/aw_sar/comm/aw_sar_comm_interface.c  |  656 ++++++
 .../misc/aw_sar/comm/aw_sar_comm_interface.h  |  172 ++
 drivers/input/misc/aw_sar/comm/aw_sar_type.h  |  396 ++++
 14 files changed, 6370 insertions(+)
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


base-commit: e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc
-- 
2.45.1


