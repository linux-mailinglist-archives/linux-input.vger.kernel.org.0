Return-Path: <linux-input+bounces-15534-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D947BE6182
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 04:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9CB44E118E
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B3F201004;
	Fri, 17 Oct 2025 02:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrQo3eGC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E002C13B280
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 02:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667568; cv=none; b=HavdYBdVgogLIuA9D9MxRlxTZNBwsReVvSrauUkGinL4r3zsvx4noB0XfUQ97hAJcXxBPqw0IdWOQki39me1PeEF99iiUNhl9DaJTpxWKbWW9tvYWJRZ/MPUY+R0ljIGQx8qxQRlChecTGOoELTDDtQ9Qd39jzwKFzBB1ZrEQpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667568; c=relaxed/simple;
	bh=rUwldAxC25FAPU9mUQplsuiCnitDE55rQf5LXhu1qA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYuLHo+0Bz81binCJsE1YTNRwcUiGjoC8i7mUG8mi8Wzmz7xcSaqUxt1iF8iVGgm5ENJNI9NCL0yJumtSQd4bzH36wLPhEZfoLWAkBdnOltuGg5oQ95euJPjPxMG8gbWia3u187F/IN+Vkm1mRgEgv696D4AIIUIIWycf6klINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrQo3eGC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667567; x=1792203567;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rUwldAxC25FAPU9mUQplsuiCnitDE55rQf5LXhu1qA4=;
  b=JrQo3eGCy8BXS/PdpHtqL4lP7qsWm9f2fq8Fygaz+BeTbKxMROKXhs0E
   Xtc9LXuwGCYM5mvJDcI4EPTRneDfPppWp7xuCIUfBSJ7kcaFRV2qzi2R6
   5DZqot3Me61aQGDxoJco8BXNtsdUevNqIrQfPBHE/IDoQDA/6KQRDmgp5
   KVMeGwRZ2hPt72GVMKurGazdLt5nA7noWedna9CnSGuaQuDc+rFIIbY9q
   kw+o7JvmBkG3mJ+Dv9bDf7hEk/jh4+6fSiQnrvrd0AiCX+NG/pRyGIIHn
   eyWtnZentlWuzIBKaO4oB5ZLG/3FTmF/D/pxU9KyUTGPuWAFN656NvPJC
   w==;
X-CSE-ConnectionGUID: fFkn1YEaQIWRt1axdOLbmg==
X-CSE-MsgGUID: 44UOHTvWQ2qJ3hq5QZCNCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66738698"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66738698"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:19:27 -0700
X-CSE-ConnectionGUID: /pXtzuAWRj+dbRRPoFz9Cg==
X-CSE-MsgGUID: jVBESj+WRwSU6o+V3P26SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213586347"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 19:19:25 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH v2 0/6] HID: intel-ish-hid: Various power management improvements for hibernation
Date: Fri, 17 Oct 2025 10:22:12 +0800
Message-ID: <20251017022218.1292451-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Separating hibernate callbacks in dev_pm_ops for clearer power state transitions
- Using IPC RESET in ish_wakeup() to ensure reliable device wakeup
- Scheduling firmware reset work on RESET_NOTIFY/ACK for robust recovery
- Resetting client state on resume from D3 to maintain consistency
- Enhancing resume logic in ishtp-hid-client for better stability

These patches enhance reliability, improve power management flow. All changes
have been validated on TwinLake (ISH 5.4), ArrowLake (ISH 5.6), and PantherLake
(ISH 5.8) platforms.

v2:
  - Rebased on top of [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking
  - Changes in [PATCH v2 5/6] HID: intel-ish-hid: Use IPC RESET instead of void message in ish_wakeup()
    * Set the HW ready timeout to 10 seconds, matching the original timeout
      value used in ish_wakeup(), to prevent timeout issues on devices like
      the Lenovo ThinkPad X1 Titanium Gen 1 that require approximately 4
      seconds to become ready after wakeup.
    * Added RECVD_HW_READY_TIMEOUT macro for better code maintainability.

Zhang Lixu (6):
  HID: intel-ish-hid: Add ishtp_get_connection_state() interface
  HID: intel-ishtp-hid: Clear suspended flag only after connected on
    resume
  HID: intel-ish-ipc: Reset clients state on resume from D3
  HID: intel-ish-hid: ipc: Always schedule FW reset work on
    RESET_NOTIFY/ACK
  HID: intel-ish-hid: Use IPC RESET instead of void message in
    ish_wakeup()
  HID: intel-ish-hid: ipc: Separate hibernate callbacks in dev_pm_ops

 drivers/hid/intel-ish-hid/ipc/ipc.c          | 78 +++++++++-----------
 drivers/hid/intel-ish-hid/ipc/pci-ish.c      | 29 +++++++-
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 11 ++-
 drivers/hid/intel-ish-hid/ishtp/client.c     |  6 ++
 include/linux/intel-ish-client-if.h          |  1 +
 5 files changed, 76 insertions(+), 49 deletions(-)

-- 
2.43.0


