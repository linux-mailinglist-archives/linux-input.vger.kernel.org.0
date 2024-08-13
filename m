Return-Path: <linux-input+bounces-5532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1394FC66
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 05:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2891C21310
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 03:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A9019470;
	Tue, 13 Aug 2024 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnSCf7/b"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9015179AE
	for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723520863; cv=none; b=TaEigfSyjB2/pibRwOtqq7TrxFP47DVkuFEVMOylblIAknNnV8qJx3/Hb7h0YRR7pmVxBMi60jbjOyz5DaYfLyaudbSbYyfzOHByR6/6MBvhGctZhsQCAOrAgydNowWryTxzoDE3xe/nLa6tibddtLyOkA+V/1mUr6Ci/uJwdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723520863; c=relaxed/simple;
	bh=thjttKpIuOp3S0lhpQ4b4mKqh10gUBhZbaEAaQjv2Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hntNYGz32eekdPGmQ5UJE2Xpw6udOT1luUFi0dqAuosBseyvwX3RfjkHccVK4uqpBpjxFUXXF1yL6adSUfCCo61PP8UExyxzKXMyH+oWTeql6Ie0oFVoU7Emmn4rhQgwzHR2toDT434tHEZRVO4kEuF36qclaOhbBhKiN8GpgRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnSCf7/b; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723520862; x=1755056862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=thjttKpIuOp3S0lhpQ4b4mKqh10gUBhZbaEAaQjv2Qs=;
  b=JnSCf7/bgh7OfPR64b+6yf3Bfah/tlCPFFAJ3hLJFmFQHKp0sQx8xVGW
   3vCdWMLKPzKsS/po0+10XPsU+cQWenYvX/xz3teQDKuCY3gYWjwVIbQu2
   RTitJiVwazz5sPeY0lO/R9pD654UWiHS5egIToKzmadMqFZEZnzCFtgov
   rSe7upvQfByDMgYsSnCuoiXu0+fpBBzQBq+DMRHlGaFXc5o9+6H3APMl6
   YNr5VkiMYs1gZX24x9XMs7N+8mi4kuUWlpwVEZ0ISeT9STIenV9nuLnvE
   zZjFjg8ciQjRhRVtjKri/9idxYCuuOT7FIsnmAudNWobNEmvSUnwJkTQS
   g==;
X-CSE-ConnectionGUID: 84VClh0NQByXQFBS8Mll8A==
X-CSE-MsgGUID: ZXOjIGRBScy7tY4V1E/QiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21819910"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21819910"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 20:47:40 -0700
X-CSE-ConnectionGUID: yNMbja47R4aEEkIObMXXGQ==
X-CSE-MsgGUID: rGbAsL7QTGikGWeO9PlP5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58396390"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2024 20:47:38 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com,
	even.xu@intel.com
Subject: [PATCH 0/3] hid: intel-ish-hid: Add support for vendor customized firmware loading
Date: Tue, 13 Aug 2024 11:47:33 +0800
Message-Id: <20240813034736.812475-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the capability to load vendor-specific customized
firmware. The loader now constructs firmware file names based on the
DMI_SYS_VENDOR, DMI_PRODUCT_NAME, and DMI_PRODUCT_SKU information in
Desktop Management Interface (DMI). The loader will attempt to load the
firmware files following a specific naming convention in sequence. If
successful, it will skip the remaining files.

Zhang Lixu (3):
  Documentation: hid: intel-ish-hid: Add vendor custom firmware loading
  HID: intel-ish-hid: Use CPU generation string in driver_data
  hid: intel-ish-hid: Add support for vendor customized firmware loading

 Documentation/hid/intel-ish-hid.rst         |  29 +++++
 drivers/hid/intel-ish-hid/ipc/pci-ish.c     |  10 +-
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |   8 +-
 drivers/hid/intel-ish-hid/ishtp/loader.c    | 121 +++++++++++++++++++-
 4 files changed, 159 insertions(+), 9 deletions(-)


base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
-- 
2.34.1


