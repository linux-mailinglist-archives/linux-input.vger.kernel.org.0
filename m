Return-Path: <linux-input+bounces-16405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFD1C95BF6
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 07:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93BA93A216A
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 06:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E5922D7A5;
	Mon,  1 Dec 2025 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJ9FRSHL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36125229B2A;
	Mon,  1 Dec 2025 06:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764569071; cv=none; b=nAsu5Nx6QOL09m0pGKqe0dvLo3JUeJdTF0xQVuK/Pn+X0gtRG2ahABKeyhuxsZPXSRMaCebUnH0rZwfo/Tj8/S1cgJPGzGf9OTD05TDMDey8x4DOfzsUYO/IFW6rbA4nrzLjFi9+XwIqfow+QxV57LeoE1Lm41sVXuiq1VNpvnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764569071; c=relaxed/simple;
	bh=Q71NyAmrMDn1srrL3vtdkqffH+1Q5bejYuEPVZXbgek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtuOzExvK4zfl2R4CrrxDyP7Nm+Eyv8W3GZVw2IuQolUBZRitxKHLt0eUHH/CNsDhGbG3/tv7nUUdlQurgX6OeRWyLyw/qGQWEoeTKlkMc8A4/YKjjzcR1Bv3dpLahHGdcz+ZZgiQ5dt265AWxVuz/5bWt8ujfCi1/4FzcmdbcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJ9FRSHL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764569069; x=1796105069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q71NyAmrMDn1srrL3vtdkqffH+1Q5bejYuEPVZXbgek=;
  b=LJ9FRSHLwsQTdqz3sSYLJtoqX9lON0qHx4gTt8uaMl4hCY81WwS/uasq
   TiOomDQfs3jYLxyweu+0mvCAPDqChqeD+AYEgYhGfyRaSGrMpTVA8ANb6
   BP+qWh7NLpuwSp1J7ZL2v1ovl9/8ePWj/tAzORhjo4Oor3SHtbrEibTN9
   EbVqSngnmIKbb4HB2tKoXMx17MPSxBwUfqF9n9Yjm7NBcRHEDG1UAWwhG
   51elTcYiBloO+3HFX8laXtkZYGHbIHAob+3jd9U36mza/+UGcgms6UekY
   /YhR9UhqMJXL7OHubyLNB6TNL3TJonUmb25+M9XYX0hza9iBfn/4BsxNn
   g==;
X-CSE-ConnectionGUID: 7a5V7un3QZOoiMk4qEdwtw==
X-CSE-MsgGUID: mYA0rZZdS/OCrBKi9AvluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77185621"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77185621"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:04:28 -0800
X-CSE-ConnectionGUID: +0p6yQVeR2mmCwi34ZsvsA==
X-CSE-MsgGUID: 5Q3iia+sQg+OcD6kwOFGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="224684984"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:04:28 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ti_am335x_tsc: fix off-by-one error in wire_order validation
Date: Mon,  1 Dec 2025 14:02:34 +0800
Message-ID: <20251201060234.152502-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114062817.852698-1-junjie.cao@intel.com>
References: <20251114062817.852698-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

Just a gentle ping on this patch~

Best regards,
Junjie

