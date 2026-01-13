Return-Path: <linux-input+bounces-17016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F4D1746A
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B5853017EF3
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CAB37FF74;
	Tue, 13 Jan 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6D8hmB3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFEE37FF63;
	Tue, 13 Jan 2026 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292693; cv=none; b=CgHWP2dsDHAnph8/qe7faXO0XUg72YfZJRR26Yp3tyi4fmdfeRTxd0qSMrJc+JF5HUt5ISNbbCCLxW+JfjwHABlMDQCjG6BVjX0ibxxWjVsqr7q+VVal/jreRyBMS12ahYwW8aEENh4s0OLHgelLnZSes4APkENdr0G5cg0uno0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292693; c=relaxed/simple;
	bh=8ZS/raSgmuIMUPjU1k6psrlcUO4tnr65sZFdpv9h7XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLAWJIEAOOF4IGd66Obr+0JabNTuJHhs9Iz5eZOxlX9BKBUaApfdHc5YtcE2N8uYmYaH/3lVbtgyQqx4PGwCzLvEVleyarTEzZpP/ioweBlbxzgQFISy/sS9FUYG45Sf42mFQhgc1hL7FtNmIc+EgpBNHlwpHV0RY7HqvoMtV/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6D8hmB3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292693; x=1799828693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8ZS/raSgmuIMUPjU1k6psrlcUO4tnr65sZFdpv9h7XU=;
  b=B6D8hmB35vsBrf+hC+FQVVwcHVVQEnuTLAWaBwrIAqyIYf7EqnsPFGvA
   ZwVFHYhbML6lInifTWjxIph7tb3dBU/rvv19vVxR2c0l4xL8SNsA6oUrl
   3BY5mUNhhCufmLAsERVZOhOg9Ha770uVxnwzqH2YAfvOpOBhFQsuSH9pb
   1paMLYK3hOxSMC+scLXioHn86Th5c47+UICrLZCeEynvZKLbUYEHTiiqH
   SmQyIYYWsV3aop/MkuRdsZ43avJ2UMMCtyDbIURSEwwBHjYJQD7TNMq49
   wx6GOX++mVzkpb8bHPqOI8FfLGbc/o54mw4ZWFqmi8PyP1AoG3cPdjbf7
   w==;
X-CSE-ConnectionGUID: omVnCePDQBW8+ABSbVpZbQ==
X-CSE-MsgGUID: QND7IQ+kS06N3CtMZMS4/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80939216"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80939216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:24:51 -0800
X-CSE-ConnectionGUID: KATg7DZFSC6Oe3/avwPXCw==
X-CSE-MsgGUID: flCKH0FnSAuTQ+1XexHmFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203960024"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 00:24:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6A98694; Tue, 13 Jan 2026 09:24:48 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] Input: wdt87xx_i2c - a couple of cleanups
Date: Tue, 13 Jan 2026 09:22:56 +0100
Message-ID: <20260113082445.44186-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of cleanups related to ACPI ID table and probe function.

Changelog v2:
- dropped no-op message for ENOMEM, dropped dup message for request IRQ failure

v1: 20260113073556.7380-1-andriy.shevchenko@linux.intel.com`

Andy Shevchenko (2):
  Input: wdt87xx_i2c - tidy up ACPI ID table
  Input: wdt87xx_i2c - switch to use dev_err_probe()

 drivers/input/touchscreen/wdt87xx_i2c.c | 45 +++++++++++--------------
 1 file changed, 20 insertions(+), 25 deletions(-)

-- 
2.50.1


