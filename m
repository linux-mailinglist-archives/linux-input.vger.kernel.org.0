Return-Path: <linux-input+bounces-9463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616DA18981
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 02:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8060169A58
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 01:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFBAF9FE;
	Wed, 22 Jan 2025 01:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW1U0ig9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837C54670
	for <linux-input@vger.kernel.org>; Wed, 22 Jan 2025 01:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509279; cv=none; b=qJV63ycdSVkOgYIkbFxKLRdI8WLogI1xvpCNdMYwApAnRrlGcenOUjcgbuorg0JpCdXH4msjsvZsH/aZdncq8NZweMbHJeHcXF4aaOMVJ+khDxSjePpNv+jh8ZYZl7PK4iaJgDOAkFcPJGAjxo0Vnk6TCBxH/bs8xv0P04oZ57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509279; c=relaxed/simple;
	bh=LYAVDFlL0CBAx2Qu2BN3ob10ArbaOJkq5Juqvm2bbm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wdcvqxr8qWND/ec+I/50kh7vk01NrLQrkJPZm2bpfvc9O6z4Xoa+fGkE9isbIl3MEAvvT2P6ONUaUMQo/THyVxm2eF3KUD1xVgQPDUNnlQa0PsWYvF1WlsST+NFX1FZCKHnPQCQHr7qnrBOjjoXH4ZOuho+EirPtUKpbkj8PYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BW1U0ig9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737509277; x=1769045277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LYAVDFlL0CBAx2Qu2BN3ob10ArbaOJkq5Juqvm2bbm8=;
  b=BW1U0ig9FfF47kwQn6qdNcLp+IZsJ6h6lqoDmwJAghr2hipEP71oBtzA
   8hgfEI8RXQJE+TuLoGo7fsoSRyHb7OBBY+JL9XXIJr2Rkb+RhEROMuElf
   CznEgMyjWmSYk+a08rLmx+nmuue/cw0cTRYXdHjV5IOd8KlYdD0nwfElS
   OL/vGRV1S9VQ+Fvo8T8rJ0C9YxRPzlxQH5B+YPc8hZXgwnOIDigAst6jq
   N/4rUlyMWwQFI5Vx8hc/xWmYolda7+rtuK/cMrOMLT1T4vFQebi+QPm8l
   bXg02/YGBNSJT+mojF8DjhyitqeiZWFYDGD/sD5laSi7eNoVtP8F+7CCe
   Q==;
X-CSE-ConnectionGUID: RafuR46jSnmmrpVu2f9hiQ==
X-CSE-MsgGUID: LrjIDXuxTuiRwqk1VXQh9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37648130"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="37648130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:27:56 -0800
X-CSE-ConnectionGUID: nNEOuTh1TYWWFRrvIyUfEQ==
X-CSE-MsgGUID: BTh4eX7PR5+idhdL4wG30w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111964590"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2025 17:27:55 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	changling.he@intel.com,
	even.xu@intel.com
Subject: [PATCH 0/2] HID: intel-ish-hid: Fix and improve fw clock synchronization
Date: Wed, 22 Jan 2025 09:28:59 +0800
Message-ID: <20250122012901.743123-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses two issues related to clock synchronization in the
intel-ish-hid driver. The first patch corrects the length of the MNG_SYNC_FW_CLOCK
message, ensuring that the entire ipc_time_update_msg is sent to the firmware.
The second patch ensures that a clock sync message is sent immediately after a
firmware reset, avoiding a 20-second delay.

Zhang Lixu (2):
  HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
  HID: intel-ish-hid: Send clock sync message immediately after reset

 drivers/hid/intel-ish-hid/ipc/ipc.c         | 15 +++++++++------
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  2 ++
 2 files changed, 11 insertions(+), 6 deletions(-)


base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
-- 
2.43.0


