Return-Path: <linux-input+bounces-14499-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23DB44B65
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 03:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A0DB1C26F6D
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 01:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A492163B2;
	Fri,  5 Sep 2025 01:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce1lqXvI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E4C20A5DD;
	Fri,  5 Sep 2025 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757037488; cv=none; b=HJN/pfU9a15w5c34yBPE+TS9cKd4f+kXiI5g4yjxuXBDqjCDalu2WVjGVAvlvTs1oyy6FiNcR45LyI0IVuwglGTvnXnqOq6Xk305xdiIPiyDLAHcT7JNqi7olGJ98CAdHsp/nqXpGLGeSEUIWe8cYA4bt1JSxo/w3SqWXmbgi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757037488; c=relaxed/simple;
	bh=/zvtIlpgQtPkqQmnC6uj3t/Jy0kNxEIug9z/OBpIhxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j9A25bvR9qwNmFK7gzNCdWJeV/gwKPvM51PDbKHWDdTYWWsGpB2hWLW46e9PwAjhvn+ovBhG1axH27CtLxGdWO2KmZ9MQN1wnPrIH8dyzN+hPRZoCuQJTTdCXZHQn4tdaLHwhfY1i8UJxnknqlevNizhDbCHXTcwkhzNhHMehi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce1lqXvI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757037487; x=1788573487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/zvtIlpgQtPkqQmnC6uj3t/Jy0kNxEIug9z/OBpIhxM=;
  b=Ce1lqXvIV3jn7bCgD1zMcQWuNmP5P5B/frMLGmLVlbRo0icjQRPqltCa
   ggNUheNPZyQldUfMh7f3RRhnlbZ+6MweBFL/7/+mC+sTObxrwWFWgDu7A
   phMqzWsPtBhwBFoqcqxmwkhTzCqw5L3G5cYQst6YoeT9rCh56J7K7o5Vn
   7Gvdqgl7/bB7h1+NB5FKkCg3fz9Cb1FnueghKfi7HIa1KvVIw7BqW2G8r
   GAyinrieGJBVMQm3CgUbUvcyJ+IL3wMtfpDvQa2x4PSu7+3tknjDJvN52
   7Uyt8/alwxyFozhagL9bi70RpJmaEmiKJ4tjYCLWemlmhLsFY0UDBp5Pn
   w==;
X-CSE-ConnectionGUID: QOGpRvL1RVO1e/FEId2rnA==
X-CSE-MsgGUID: tfWT417qRdOSiQaNWAH8kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70487598"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="70487598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 18:58:06 -0700
X-CSE-ConnectionGUID: BdjBt+biSDqJn/xmQ6qGcQ==
X-CSE-MsgGUID: sG4NBOQXTxCoj8cENS/dCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="171935728"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2025 18:58:04 -0700
From: Even Xu <even.xu@intel.com>
To: xinpeng.sun@intel.com
Cc: bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	Even Xu <even.xu@intel.com>
Subject: Re: [PATCH v2 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device IDs
Date: Fri,  5 Sep 2025 09:58:06 +0800
Message-Id: <20250905015806.1372972-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250828021000.3299377-1-xinpeng.sun@intel.com>
References: <20250828021000.3299377-1-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

