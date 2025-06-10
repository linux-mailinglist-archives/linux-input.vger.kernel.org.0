Return-Path: <linux-input+bounces-12747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F3AD2BA6
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 03:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 432B83AF961
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 01:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E621A5BBC;
	Tue, 10 Jun 2025 01:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Blr9jlD7"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC31991A9
	for <linux-input@vger.kernel.org>; Tue, 10 Jun 2025 01:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520777; cv=none; b=vB7obP/wZLwTJOPzIRFphtfUh6j9UbiUcIXUs4+6/bmKXdFH4w9iRMnaONLuJGd3cKYFu9UXmUMIsoWQ2FjP6MuZ+5/i/Mf/QdSztCtEdeqQXWApbl8jSQnVlCpInp93MFNLFcr+Xb/FaWHihde2XJES3mTf031nY0pmvm2jWJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520777; c=relaxed/simple;
	bh=gSHy9MGkp2DAz8QAXCje58vbHHb8MMuT5IHJvmklF/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uy6iOibspSCgdMsGz1/V3EhsTj7QTQ6wROPmbFKFPY/o9tux32LqyyQBG8FDVk0wixLCUw73qAe+yXZpiE5sASZW+fgLCHhnfb+BJ6C8XqfxZbHqQiYX/r4S1+5vl3g0ZPqBjbEd1ERc1IK/wblTuzuRdrbwI/yvBeS0H4kPc7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Blr9jlD7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749520775; x=1781056775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gSHy9MGkp2DAz8QAXCje58vbHHb8MMuT5IHJvmklF/E=;
  b=Blr9jlD7roCEUa4JMIZ49wUIqNE4Hsxoq4xPwatx2EQ0fC8fSOetEoWi
   8pXed0ypymd8YYuR/zgdMBYQyKOiqFX7egNpF2nJtNaIdgYx2T2+dgHLi
   2091vN2KUJKsMxWETrkBPho/6QZooRtwxbVBEvPMGhtaV4MI6n83ZoE+H
   bbx9kKo7Mo8IZ2D4jjM0ESpabus4L0RwfCBzkO7hrHAh8Zsl3rfpQIgQQ
   msVLo4dj8sh4ucWH00J5SIEfHU+KuAeRB3TmkYlI/TvB6T6Vcb8tUFL4b
   h27YIIvJcrM5cD3ex/PdmlaE99LBzH/JSfFAgqhrccHILXDab+dber0AT
   A==;
X-CSE-ConnectionGUID: Rxay5tKRRh2a67UMQ/rGiA==
X-CSE-MsgGUID: IK0T/DmNQaq4F8EFmYJoug==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51757954"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51757954"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:59:35 -0700
X-CSE-ConnectionGUID: T8rnB4JXQ36Phw7NPIzWXw==
X-CSE-MsgGUID: 777mk+CqRTyRUsJ8v1hpIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="146568461"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jun 2025 18:59:33 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	even.xu@intel.com,
	zhifeng.wang@intel.com,
	selina.wang@intel.com
Subject: [PATCH 0/2] Enhance ISH Device Table and Add Wildcat Lake Support
Date: Tue, 10 Jun 2025 10:01:30 +0800
Message-ID: <20250610020132.1544110-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to improve the Intel ISH (Integrated Sensor Hub) driver
by enhancing code readability and expanding device support. The first patch
replaces the usage of PCI_VDEVICE() with the PCI_DEVICE_DATA() macro in the
ISH PCI device table, which simplifies the code and improves maintainability.
The second patch adds support for the Wildcat Lake platform by including its
PCI device ID in the ISH driver.

Zhang Lixu (2):
  hid: intel-ish-hid: Use PCI_DEVICE_DATA() macro for ISH device table
  HID: intel-ish-hid: ipc: Add Wildcat Lake PCI device ID

 drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.43.0


