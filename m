Return-Path: <linux-input+bounces-17011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510CD170A0
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9365E30206BD
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 07:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA4C313554;
	Tue, 13 Jan 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ndr0bd+u"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9026E30EF82;
	Tue, 13 Jan 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289761; cv=none; b=VnYa2T4D033gDTm0psdRXYGRCgvj3fDGpu+99A3VNRDN7aG6PPohoV0Xl9why1YYmbb2eAO40bw0/H2vDFXa7L9irsr+BvxXvLJwYt3hpGgcNHBHCsXokNlRI1ry1wm1u4rGLwtgxX6GJkdEVsvYoLQ4Br89V5683JTstGYUsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289761; c=relaxed/simple;
	bh=xfuszQ8XnXTmv91M58ycgcWIy8tlmFZpmzJWPvznl3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bgz5GEEuwClAe5GDVklaLvXTfZOPF/cQmM+4g87hzQiLFaSWKjXtMsq4G7G/rzPzccdR8Tk9+perPJXsP0zZcfYWQebgqWAaDoJTHjCpQDrC95MK9AU5jlcwM4s0B2KSqFO1bC3Sc/OHlQMCgfgNYUhl8wH/5vPtR7JJoKa38Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ndr0bd+u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289761; x=1799825761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xfuszQ8XnXTmv91M58ycgcWIy8tlmFZpmzJWPvznl3Y=;
  b=Ndr0bd+u/vZ/SheUCmiTiX+XYwW7OvlUSy3tvgEMBp5wszHURlaPbkCT
   MjQV6kN85GvUsS3BBGKJniZ3yrJn3+BNrwWRk1S78nv4q0U3LeJY7hON+
   ashd7ajOoleKKaGdXDJYUWstFVZZVo4T5FtP4sadhi/Zaml3Syi0z86/T
   Lr1NVTHbNp7f2ROxg4jdbA3tmORvgZaz9+jkiZtz24PwLSqNE2ytHIbKs
   heEsQrIgUSdNOcAo4J7Vq+06QUZo1APwhNIEIJq4A4k8CY/aCWG/ioV9o
   xt2iqGaJW1W0CPhoZcp9hEjub2WfyqKBpJ+4iKfCI20g1X2ph3prKFjMz
   g==;
X-CSE-ConnectionGUID: PruIsJ4MR/mKblD+s97ucg==
X-CSE-MsgGUID: qCOq0o3CTnihcKZizTaOwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86985057"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86985057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:36:01 -0800
X-CSE-ConnectionGUID: /x1zAducQV6ym01hiQXCxQ==
X-CSE-MsgGUID: z1vizI8RQmyrogyiPCa9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235557341"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2026 23:35:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E8A2694; Tue, 13 Jan 2026 08:35:57 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [resend, PATCH v1 0/2] Input: wdt87xx_i2c - a couple of cleanups
Date: Tue, 13 Jan 2026 08:35:20 +0100
Message-ID: <20260113073556.7380-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of cleanups related to ACPI ID table and probe function.

Andy Shevchenko (2):
  Input: wdt87xx_i2c - tidy up ACPI ID table
  Input: wdt87xx_i2c - switch to use dev_err_probe()

 drivers/input/touchscreen/wdt87xx_i2c.c | 40 ++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

-- 
2.50.1


