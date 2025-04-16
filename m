Return-Path: <linux-input+bounces-11807-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C85A909D4
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 19:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFBAB17842D
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 17:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867B921578E;
	Wed, 16 Apr 2025 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="YVdlkZq5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF01D17A304;
	Wed, 16 Apr 2025 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823904; cv=none; b=hjSkLKhRDOq0brkFsYW/nZCNQ1MiPz2o3lvoz5XpiVF0iEjXOzl8fzhbcSV5WKmvltia1NxmsiyIOzw8aIX1CFedQLhj7nAArE3vH7mJ2NLoYnWyU6IEoItb0kjGTC8XxcEUTNa6AbJa0MGhRsVyhzKSNPkfcAWWJcb0f8RhwLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823904; c=relaxed/simple;
	bh=+YBuFYAR6x4FRDUwZCODxnhFFMcfji9j4F97sKMfm8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLyb62wmFWDMKJjVqunIVAflpeL/VqGx54Hu2ZDpPfDOGV7qu5Gb9wYKJ+NUghnBrJs1VL4rQ0QHG5DiHv5Z89AM3ihR2vK4eNz+5XAasspG3J67AW0p55egk70c4tskHDG2B4gBsrX0Hp8mtZfsc/u15H/kN4N/+1Ju84Ptfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=YVdlkZq5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 02EEA2FC0083;
	Wed, 16 Apr 2025 19:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1744823892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lzbjAoW7HYLXRRfm3mYcgt67Tuq6NhBWMJxWpaxLorQ=;
	b=YVdlkZq5hk9v1ggqKxTYenrHHQCez1gD44YQjtpd969EQ86CIkD65GyMZZQvhzdehMf5Uv
	sdWeLUWEmcJ8vcPnt7OnxqxuypiyHfIwv0Slvwm0XwaD61H0T7MWGfEjxV8uIKElQAtWuY
	XDdLCxJlAxC87aa+iMzL2gnN3WIShR8=
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
Subject: [PATCH v7 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
Date: Wed, 16 Apr 2025 19:11:35 +0200
Message-ID: <20250416171809.557674-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cover-letter to include this list:

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

Werner Sembach (1):
  platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices

 MAINTAINERS                                 |   6 +
 drivers/platform/x86/Kconfig                |   2 +
 drivers/platform/x86/Makefile               |   3 +
 drivers/platform/x86/tuxedo/Kconfig         |   8 +
 drivers/platform/x86/tuxedo/Makefile        |   8 +
 drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
 drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 919 ++++++++++++++++++++
 drivers/platform/x86/tuxedo/nb04/wmi_util.c |  91 ++
 drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
 10 files changed, 1171 insertions(+)
 create mode 100644 drivers/platform/x86/tuxedo/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h

-- 
2.43.0


