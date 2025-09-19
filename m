Return-Path: <linux-input+bounces-14877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE015B878F9
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF38167BE4
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143B31A4E70;
	Fri, 19 Sep 2025 01:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gpf/rliR"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED4139D
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243780; cv=none; b=bTbkpeEwWGp5a38hDmEp0thzOCPFzyxeH4fFN/dWbGP2iROlHF+CJrgCWuCCA3Dyabf0fkXy5fUijLfpZxjpfY9R1/aGj189SD55VuDYpexqsuV+poATarsrv87mQBT/UWRBGYFF4KyGdtR6qVbJU54mxZsAyaltBr7MVjxa/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243780; c=relaxed/simple;
	bh=vaSvymG+1ibplhCRe8y8n8gprJXBtl2c2jkDgIMM24I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gCH/s5j7Iuo1Jho50SQONornffWArpIpMuKpD+p4Zjn5oiCepF6T+/PWfh5KnSWECon0PPKB1lMzyCvhQA6ns2WxqwaVRmFjD6/KhOdNUBMQfIPYIUUvrD/QMj0bSgykvHD6jeD1S7M4wZwKgkKMwgMup4SVfSi+FY3qaBptxSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gpf/rliR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243778; x=1789779778;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vaSvymG+1ibplhCRe8y8n8gprJXBtl2c2jkDgIMM24I=;
  b=Gpf/rliRE9VdxS7UW6aZ3UEVpxSWkX4rr7NISnfKunWGUdthZaKhU8Ik
   1BGjXi9gO/qGd1/2BAp/GoCl/Sy6g1ykrCgiEN5Okt5A3ONBVg8Zxn936
   OlRkd6cgnIlDMO5qZajd40qTydUXhhfIJiHdIM1hGAIym+ttoAcfBB/9+
   f1D2NWSM13i52sxAw9vhACYa1UVeVMAWMMGbywjJpGrY9OEW/OkzOrwgF
   IAt9KANyWEMOMNiZrcaaGNu7AETw73Tjf7bGoc9AyMhDpdr7nu1vNk6CG
   fUuwnWAzoOdTYlOLSvSJa3c6D49CtcEtcf8yT2SV/caR+R933JNmqjyXL
   Q==;
X-CSE-ConnectionGUID: 7dNKjzfjRa6Aaq4aGhz+yg==
X-CSE-MsgGUID: WY31J7/LSyC0eOp/izJAmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60535406"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60535406"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:02:58 -0700
X-CSE-ConnectionGUID: Dp0Qj4ZzTp6GxEFv0ut9tQ==
X-CSE-MsgGUID: uV/pXHs9T8q3FIs/LfkyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180815143"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 18:02:57 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 0/6] HID: intel-ish-hid: Various power management improvements for hibernation
Date: Fri, 19 Sep 2025 09:05:53 +0800
Message-ID: <20250919010559.165076-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces several improvements to the power management and hibernation
handling in the intel-ish-hid driver. Key changes include:

- Separating hibernate callbacks in dev_pm_ops for clearer power state transitions
- Using IPC RESET in ish_wakeup() to ensure reliable device wakeup
- Scheduling firmware reset work on RESET_NOTIFY/ACK for robust recovery
- Resetting client state on resume from D3 to maintain consistency
- Enhancing resume logic in ishtp-hid-client for better stability

These patches enhance reliability, improve power management flow. All changes
have been validated on TwinLake (ISH 5.4), ArrowLake (ISH 5.6), and PantherLake
(ISH 5.8) platforms.

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

 drivers/hid/intel-ish-hid/ipc/ipc.c          | 73 +++++++++-----------
 drivers/hid/intel-ish-hid/ipc/pci-ish.c      | 29 ++++++--
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 11 ++-
 drivers/hid/intel-ish-hid/ishtp/client.c     |  6 ++
 include/linux/intel-ish-client-if.h          |  1 +
 5 files changed, 72 insertions(+), 48 deletions(-)


base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
-- 
2.43.0


