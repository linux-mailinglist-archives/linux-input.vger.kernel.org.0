Return-Path: <linux-input+bounces-16493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A21CAF34A
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 08:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BCC30275ED
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 07:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4943B28D830;
	Tue,  9 Dec 2025 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae3oZ+K+"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C32263F5E;
	Tue,  9 Dec 2025 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266680; cv=none; b=LNkSnsPXnkpISvjVzzpWbVd0upOSfCDSkHGvnSheqNeqc7nxa0PMTdQkHAib+uvONPzhbFopXzSyiLvqpTZYatKMvBbWtg3P8Ez88Kz7kwMJCTUFB01d3ucns+X37E1JJhrwRP8LfVLUug842pSQ3G8u5l5RvSdKuE/KUWieLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266680; c=relaxed/simple;
	bh=sdStPZ6/DPOkY67HeW26ARN1K4kD0KkE2KxPtOUKmq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qpe6MstojXO+iNnjXGLGEigqZgTGJbBrktWwFE98XbBGh0qdy3Bugfc4erFXCx3ZwnEP3iWTvYERZOxTJLOoYBsfRwM7/nFxYinvL2WjN5vHeszaoz1j1YEWgQ6kISTHg0HJmODQbjiCPAlgrQFV8UfY3hZqzJmPT6qw+E4HBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae3oZ+K+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765266679; x=1796802679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sdStPZ6/DPOkY67HeW26ARN1K4kD0KkE2KxPtOUKmq4=;
  b=Ae3oZ+K+JYXShvr+QT7EX/BuBsE/27CWnAury2gVbZbMkvc+Isyu/h7o
   IBw3qeIeD+Z+SzVkFtTD+o+72CZHx5sVPdQyqBaZNBzGdARrqJaJJO90d
   b5XO8cl+2fcxP2my9VYXSBoJ7WU+sFZxz6JQC1KYNz8+0kKcBPXHSWZBW
   sdy+FEhY+U41zM5K+MYrnTzZknxVw3yxoKUSDqLXueqXXphnaaulBxj/f
   bwrU6PY9QpF7JF6P7XGaHlOwi2pUHZw2232c2XkhRvNg+v6P7QUufuaa5
   TIxkFa1ra4QxLWPgIKIEt1uGWwxVfOsGV9WJbOZ7a2GDrMeUtqcS0XUsW
   g==;
X-CSE-ConnectionGUID: rBNLvax0QGGZSJWi63RIsg==
X-CSE-MsgGUID: xxoFR0FuRSOv2AYy3F/+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66942702"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="66942702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:51:14 -0800
X-CSE-ConnectionGUID: EFrz9OG+RoGdvFaaQJZ3RA==
X-CSE-MsgGUID: D0nmR7xESV6dVwqyEG/AKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200599841"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 23:51:12 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v2 0/4] Add output report support for QuickI2C driver
Date: Tue,  9 Dec 2025 15:52:11 +0800
Message-Id: <20251209075215.1535371-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch serial adds support for HID output reports in the Quicki2c
driver by implementing the output_report callback in the HID low-level
driver interface.

This change introduces:
- Refine QuickI2C driver to use size_t for all length-related variables
- Enhance the quicki2c_init_write_buf() function by adding support for
  writing to the output register based on the content being written
- Add quicki2c_hid_output_report() and quicki2c_output_report() function
  that processe the HID output reports request

This enables proper communication with HID devices that require output
report functionality, such as setting device configuration or updating
device firmware.

Change log:
v2:
 - Fix a return error code check bug in [patch 4/4]

Even Xu (4):
  HID: Intel-thc-hid: Intel-quicki2c: Use size_t for all length
    variables
  HID: Intel-thc-hid: Intel-quicki2c: Use put_unaligned_le16 for __le16
    writes
  HID: Intel-thc-hid: Intel-quicki2c: Support writing output report
    format
  HID: Intel-thc-hid: Intel-quicki2c: Add output report support

 .../intel-quicki2c/quicki2c-dev.h             |  2 +-
 .../intel-quicki2c/quicki2c-hid.c             |  8 ++
 .../intel-quicki2c/quicki2c-protocol.c        | 95 +++++++++++--------
 .../intel-quicki2c/quicki2c-protocol.h        |  5 +-
 4 files changed, 68 insertions(+), 42 deletions(-)

-- 
2.40.1


