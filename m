Return-Path: <linux-input+bounces-16407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E44C9600F
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 08:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F85E4E1350
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 07:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF8B2BDC29;
	Mon,  1 Dec 2025 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlKGqMrG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4F52BDC13;
	Mon,  1 Dec 2025 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764574201; cv=none; b=mfgjJ7xzap1jznF1Y+TuFzfBttCwlhxtw7U4CezDU9YPbfi88+PQP5K7EUGE8bjb6TFww8KqqwYJysrpk5rgMD2ZPl9s6P3KD8YV7WkYqgerGpCwObl8J/rk/QuSpN2NT8pN7BRxbWj+Ztv804hSsLxXquSaDwOXqweUi4zi7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764574201; c=relaxed/simple;
	bh=XMq4U2zmFtZFyL7fqQMtvkcrXgf9AcCApF43J7NyaNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZDFixivQRKTlA/rxd3W3ZlHx29UbOfr9CTyNtLV5Mb/2sPdJmNuawvsQHKM8o3f5A4JUgRv3XAX3m/jDEGUZeLe7TYC3X4juH59pZbje8mkdDlMHucTr+DdwfM0n7A9JU+IR4LVTx7kzbbbPSqr2LKjwJMeumU5OpIWdHpXTzTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlKGqMrG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764574199; x=1796110199;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XMq4U2zmFtZFyL7fqQMtvkcrXgf9AcCApF43J7NyaNU=;
  b=XlKGqMrGnQ3c6FLjDx1GG3KFK7DOdasNdk4zIagx9eO44sR6xyg7vIhY
   /qv7kMtdmMBifh4G2+9iTupLVdOaM2yUnaM94pJfySOstWmdt8508AyfN
   ii6IxL/M3TJ6VE9Ya3TACnO0zpgA9/mlDWEhs9YrE0neUE1lXERfniYCj
   gvSHG0dEbzgNdXtyavIqW2P8hw9KxzDk3RtzyqP1CHCUmWQCLSmmqBrMc
   w2CXyMGR+JEkl3gQS8dcnIjJaJ4v42/uKJkRz2bWUzZEG86v9O0B/ldbg
   YJKpPjjGMGtsLjBo9+3AGuFyd4yTh5czFny+ZPyM7EPo12Hj+eL7I9Tvb
   g==;
X-CSE-ConnectionGUID: TSvxWbEjRCGMZ1N0F+5bww==
X-CSE-MsgGUID: oEXpEyjtSF2cl3J+0mcxGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69097613"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="69097613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 23:29:59 -0800
X-CSE-ConnectionGUID: aZfIUnViRAWyOD5Q+vrMpw==
X-CSE-MsgGUID: x3PXuBcdTYadxmZ/eOyKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193886426"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2025 23:29:58 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 0/4] Add output report support for QuickI2C driver
Date: Mon,  1 Dec 2025 15:30:43 +0800
Message-Id: <20251201073047.3313824-1-even.xu@intel.com>
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


