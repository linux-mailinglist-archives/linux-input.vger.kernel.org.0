Return-Path: <linux-input+bounces-16049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C0C5418C
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 20:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311CD3B6618
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D717B34D4CC;
	Wed, 12 Nov 2025 19:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giLLwiwQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0C34C81F;
	Wed, 12 Nov 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974861; cv=none; b=KSecHYMP4zs20CTcuFJazmH5cGsyh1wHgFLcXPFJ47+pTYMMWUq3ViZXtF/cRiPCyPOnVm3GlUDR3FhSGwdSWYHP7HLrtVEBXLErdaEzq2XTXIJbtDQgwxvc5EukJTp69PW95E7cx3lbYsZecQskRjzHTIO7syDf9rstLJdnTw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974861; c=relaxed/simple;
	bh=P9OMcQN/khqAU9W4gnZ7o+uUi+NqJ0F/lRsTpAFrxVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=THxWuBjI8rJy1ObjC41qHN1qofcwEi4vQWma2NJS9d3q/QRtvz1fH+/uX6Gy8lXOOYdJ3SqVAn+SoNBJWU0KZQ1EGCp7U6SVoL4nlQhlcetVGuPSmSwPIzhNM5/ObkmzAAyNIAM6+y9JAIY55hKWHUs3p6JKAXt67fBTJX5GXbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giLLwiwQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762974859; x=1794510859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P9OMcQN/khqAU9W4gnZ7o+uUi+NqJ0F/lRsTpAFrxVE=;
  b=giLLwiwQs8Z/3qmXyTQz7rODUe2muXqaVOwqWzvOuVxh3YekK7ZkNk7T
   yOvRZQkBPRAJOLcXkKyJ0/ww2gACCw/kqgj7Eu+LHoo4UHsV66vCnNFXh
   OqcYClOSEmXzKmiE7x5zBiCnw7uvVRRHeLot6rI4J+MDsCfcJvCya0NyB
   vI0o5OLMQk1LzxofJh5w55EGT58USvIW0VtwPyjaBjs2ldqUzhI6wVsMd
   aF8HX6iTF3cY4tWawH6ozRUbxcGCBQTc1qOm4O4RNof9POe1Y8rjvZTdS
   GJioLQX+3ekxwABWTpz5isOlclDHll3na0QY5WaL+GGVus22WW7cu7tNL
   Q==;
X-CSE-ConnectionGUID: OfCRr+FbRLqqSbeCDhdZNg==
X-CSE-MsgGUID: S4ddny29TXaP3jCudu0y0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65086884"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="65086884"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:14:16 -0800
X-CSE-ConnectionGUID: B9QqSSWlQaKZM3XWY3w+KQ==
X-CSE-MsgGUID: M5yQZEOkRS6e68aNCPv7yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="219951620"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2025 11:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9D88295; Wed, 12 Nov 2025 20:14:14 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 0/5] Input: gpio_decoder - update driver to use modern APIs
Date: Wed, 12 Nov 2025 20:13:16 +0100
Message-ID: <20251112191412.2088105-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update gpio_decoder driver to use modern in-kernel APIs.

Andy Shevchenko (5):
  Input: gpio_decoder - make use of device properties
  Input: gpio_decoder - unify messages with help of dev_err_probe()
  Input: gpio_decoder - replace custom loop by
    gpiod_get_array_value_cansleep()
  Input: gpio_decoder - make use of the macros from bits.h
  Input: gpio_decoder - don't use "proxy" headers

 drivers/input/misc/gpio_decoder.c | 72 ++++++++++++++-----------------
 1 file changed, 33 insertions(+), 39 deletions(-)

-- 
2.50.1


