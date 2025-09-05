Return-Path: <linux-input+bounces-14500-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D887B44B77
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 04:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A6117B90D4
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 02:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1BD1EB5D6;
	Fri,  5 Sep 2025 02:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxTsujxg"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6326B8834;
	Fri,  5 Sep 2025 02:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757038072; cv=none; b=cl6hbyM3lbQv1QbQ9GKRMgVo4b1g08uS/hLPVNkJvhTYqYcbV6IM4wc8At+LQWlqLAzXsxcvEJHKoDsEZqqGxHuifmfCxvV2U6KaPea2IWaLNWQwtKYEQ31LYKzJ3GzXEnU2eS9+uBMjsXNHO3Aq6ANCWLL2mgR0juorPiAfyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757038072; c=relaxed/simple;
	bh=/zvtIlpgQtPkqQmnC6uj3t/Jy0kNxEIug9z/OBpIhxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=llhdze2UUCrN419KsijNAannXwpZfbTegvIkuX6ljyVWjyjn1bZgWCS7xt8s/vuHNZ3mBL2+cxauBy5/uXP//NXMc71y4SLQdBFIVoZL8KcsdkzQo0Sv5DwzLOOe6mJ7xVfwcKw53UIuSCghuLIDJCTGGLk4hN9XuiH3zS1ie20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxTsujxg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757038071; x=1788574071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/zvtIlpgQtPkqQmnC6uj3t/Jy0kNxEIug9z/OBpIhxM=;
  b=dxTsujxgoUNk9ASE9HMFFtBJPi/KYTTmJ5dg9acTMDU2pSRohgzfKG6Y
   250jHzaC9aTmHQb3nUDuk+GCGYBCQ2J3iWc5JI7WM4ql1rakGWeVEL8an
   vvTCS6OTMWMykCEV++YnlsgJknm7p3UZaHLb7h7DPL0DKM8xfGdnCIjjR
   avlCCldjWozPGERHZVRi7fUm28ZDKt+NFBD0DTFSX04Fn0ecJsW6FSsHL
   KzX6J8ktaZeH8psbH9a94RFjfHZgAS0bZQHrBYO1jq4BE7NLLnijArC1j
   zYuN+mqtnPqLF7eziCzmUwz7km57pKo6F27kebTbZJgONs29J/mLHXnxC
   w==;
X-CSE-ConnectionGUID: VDBZl0xXRPqmuXTf/2diiw==
X-CSE-MsgGUID: 45pSU2slQXCjacI/0hEChw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59089117"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="59089117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 19:07:51 -0700
X-CSE-ConnectionGUID: ZvuZx5OcS+2LKB6T+bUvKg==
X-CSE-MsgGUID: 9aW1prvHSFOzuaglSOzEBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="172858811"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2025 19:07:48 -0700
From: Even Xu <even.xu@intel.com>
To: xinpeng.sun@intel.com
Cc: bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	Even Xu <even.xu@intel.com>
Subject: Re: [PATCH v2 2/2] hid: intel-thc-hid: intel-quickspi: Add WCL Device IDs
Date: Fri,  5 Sep 2025 10:07:43 +0800
Message-Id: <20250905020743.1381699-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250828021000.3299377-2-xinpeng.sun@intel.com>
References: <20250828021000.3299377-2-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

