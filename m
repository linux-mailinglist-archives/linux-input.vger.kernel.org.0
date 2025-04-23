Return-Path: <linux-input+bounces-11949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D622A9932F
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 17:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EA3F7B1D7C
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C8E290BC0;
	Wed, 23 Apr 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="K64VmT7X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E529008D;
	Wed, 23 Apr 2025 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422708; cv=none; b=sxLyxw49LyPMHJHZvObkNpaUGH7XJ26Jr8CD39ALNtMNgz/d2xdmPCsghDGfLvE4DaQqFU7Kq2eZn79YG+CnVatN3FcjO5+UNH29aFomFXTOc385S4pMwH2BujBXIbEAhwlBEHmJwM9L/4FQwGrIKbvzEuTNaQqUw7lCu8u7X14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422708; c=relaxed/simple;
	bh=mohsE5Vqds5YWoBBauAQ6zbZMHHjxudeDOZFcUECQs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EOwJkf73MG2ed2ZcdoakioypfoqL4ziCGnOLY8bAe1RdolVHu7ms4QSy6IXtRkTOBtfI5O4dpCsba7logVeQl1axQU+9gotpnTt1GT+2M15741/GVo/XQXsu8s5BA9k2bSdNWaRTSPVOsDPG5lAf23LndzgmPOj5CiiGP77I4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=K64VmT7X; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 8853A2FC004A;
	Wed, 23 Apr 2025 17:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1745422695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CsrRfvsK8H5f4CKApG2FFAZq+/r8/VdgR/k9Hykvb58=;
	b=K64VmT7XZRMb9FTkx2QowrKV68X8S7Lro4gaTowt5LoivnkohCW8lgsYC8EdaDYnJ6bJZ7
	AMrKAkaqWPvVvE0Rmt8vCSSRn5nGuCZseFHekQW9GyBQ+mPD/AaS944W9uHNrGulEBRveJ
	1dqrKfwnpLeOy3E7+ldGDexWAv6kpr8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v8 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
Date: Wed, 23 Apr 2025 17:33:09 +0200
Message-ID: <20250423153804.64395-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

@Ilpos you can ignore my small question from my last e-mail. The spec file
of the firmware wants the struct to be zeroed (albeit it does also work if
not) so I implemented it like that.

v2: - Integrated Armins feedback and fixed kernel test robot warnings.
v3: - Fixed borked subject line of v2.
v4: - Remove unrequired WMI mutex.
    - Move device checking from probe to init.
    - Fix device checking working exactly reverse as it should.
    - Fix null pointer dereference because,
        hdev->driver_data != hdev->dev.driver_data.
v5: - Move everything to subfolder nb04 in preparation for the eventual
        upstreaming of other tuxedo-driver parts.
    - Integrated Ilpos coding style feedback.
    - Use dev_set/get_drvdata() based on Armins feedback.
v6: - Integrated more of Ilpo coding style feedback from a different LKML
        patch-thread (less files, local functions prefixed with a short
        string).
v7: - Integrated more of Ilpos feedback e.g.:
        - Use cleanup.h
        - replace some if cases with a pointer in driver_data
        - coding style oversights
v8: - Integrated more of Ilpos feedback
    - Typo fix spotted by Alok

Werner Sembach (1):
  platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices

 MAINTAINERS                                 |   6 +
 drivers/platform/x86/Kconfig                |   2 +
 drivers/platform/x86/Makefile               |   3 +
 drivers/platform/x86/tuxedo/Kconfig         |   8 +
 drivers/platform/x86/tuxedo/Makefile        |   8 +
 drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
 drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 916 ++++++++++++++++++++
 drivers/platform/x86/tuxedo/nb04/wmi_util.c |  91 ++
 drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
 10 files changed, 1168 insertions(+)
 create mode 100644 drivers/platform/x86/tuxedo/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h

-- 
2.43.0


