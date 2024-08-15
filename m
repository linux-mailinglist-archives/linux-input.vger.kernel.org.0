Return-Path: <linux-input+bounces-5579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0F9527D3
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 04:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF32E1C213C5
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 02:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27798F6D;
	Thu, 15 Aug 2024 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FF1zM3Zm"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF03A6FC3
	for <linux-input@vger.kernel.org>; Thu, 15 Aug 2024 02:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723687806; cv=none; b=YYdz6WF5n5F3fZtgc3yphVTc75H9enoqNCWONbuJybN8fLtcpiI2B36AJ/5DYitoLsF+luobMk2FfooBgSjWtdixhZXdawgEO7rhiOzkxbkWPXbVRoJXUGWKDuF0jRmnX8StQh7u+l5UmS5YfTqx3LQs2aCfC8VDBoADZL8HVc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723687806; c=relaxed/simple;
	bh=OOdA34mqv/Q2RIin9N/xEonMf9ouYPi0tktowlLmReU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dKhkZVtEnLfP7/qURE/drbb4VYLrDCPlhq25+A5lwUUOYz/rsbiyPGNZHyN9RQvYaGE1MImW1ZdMMMQOfqx6qP1v/aMlZGB6x3ldEJN/XFQCFQxAfvw6duFd3rYgFQPgeCvY1jRepfpw2IUuj2fXnL5P2F+cyDGzAwPlkkaVQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FF1zM3Zm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723687805; x=1755223805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OOdA34mqv/Q2RIin9N/xEonMf9ouYPi0tktowlLmReU=;
  b=FF1zM3ZmnX48reACeAjbDJAMVDEaDgLRFbu6hexfFsW2wHzI47A1C+os
   vQLgwv3PSssBWR/vog3FIs6scUq4f0XMLYjrYn3fsGdeuUV8DNUiYhgM/
   /4sln/io/MHGFXiGS7A54bCebJT0Ro/UXOFGJtd7T8ECi+nnvK7pxu/VH
   A53elmeA3yFVowuaALi4VZFtCXY9+SEELBgWAJIxEtKgK28aDxtnLWIY/
   HjqkRkRSxA66paJId9kPm85tj8+TMYfaZfNqsTdG/Lt7iLKazhCrTNPHf
   ozae2VAuO9o/Lpz+lnHvRoY05+vFwzE/Q0WrGBFY/QUbwGeRvUKIl2N6W
   w==;
X-CSE-ConnectionGUID: +0Ceqi7aSiOubR9XgnID8Q==
X-CSE-MsgGUID: jh6XjPnBSHGDiFgz8h7RUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21796088"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21796088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:10:05 -0700
X-CSE-ConnectionGUID: WuSJIeV3TZi3kWa0Hwh2Sg==
X-CSE-MsgGUID: r5es+xYIR/e0O3A/3881Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63635333"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa005.fm.intel.com with ESMTP; 14 Aug 2024 19:10:02 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com,
	even.xu@intel.com,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH v2 0/3] hid: intel-ish-hid: Add support for vendor customized firmware loading
Date: Thu, 15 Aug 2024 10:09:58 +0800
Message-Id: <20240815021001.936277-1-lixu.zhang@intel.com>
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

v2:
  - Address the review comments from ilpo.jarvinen@linux.intel.com
    Fix the typo and capitalization, remove unnecessary inline.

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


