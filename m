Return-Path: <linux-input+bounces-16406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A9C95E1F
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 07:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1ABE4E0635
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 06:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD7527AC57;
	Mon,  1 Dec 2025 06:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aH9xmGOm"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39791E47C5;
	Mon,  1 Dec 2025 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570975; cv=none; b=ehvJAYwZsm1eB5g5yq05y9p30wJkJb/UXHnsUfN8jvTGkmb4I3TLcGyQHXqkVoyCJaqidWsZVoqaXnNcOZOdscHPehP1BBSzOetk0DkaojaFUNI03HfTqcpIFqdAT5Fc53oLj05EnTg51RwlsMuQyP27VYaFhpo1ZUx/701DuNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570975; c=relaxed/simple;
	bh=w0/+83KKUKaxVSA7NPIXC8RXlZKWAWUWLFLHPHQ8MCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Exjxak8K29NIBziVJ6RmdTPMs1KQ+W0KHcn8J++j+vMwptLbngy2rh/nHkuDbJB5ZWLBW8DkBCJE3Fe2kyzadG7UFJiA+j68zSz0WlSGlIsgN8m0MSCocwkqKxQkFGUuLcrN2Vw5vdRLXcbWIGXBjvyCYA71yUBjcMKTdhlTGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aH9xmGOm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764570974; x=1796106974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w0/+83KKUKaxVSA7NPIXC8RXlZKWAWUWLFLHPHQ8MCU=;
  b=aH9xmGOmk5l3QrE5C4UqN+Wqa6OPrjkVuywi00/EMZ4YK+K6bDzUS7F4
   5TELy526LLLz2dX/PtDcbeZSJcF73At2WkXoge55zctXZC02OLj3NxqCd
   cyD8FF27YC75EUQw3V4R2rjrz7I+OZx2ZsYR8/9gDICiK+zNhIlZllJKa
   E69up9Kp+T0WOi9poytJ0nrtWoSQZOxzEIf9Xgu3+fgQHMyeymRHW3FyB
   XmGR6jAdI+BDJFwScl9lvqgV3oXiwHMGXWSSgk3P88OXgIbx+QdbCEV8f
   DXxjbIP0AiMPmTT1StraZ++OQoScq0QgCox6Tjv7ppfxNpSTnfSN7ykCA
   Q==;
X-CSE-ConnectionGUID: /iwpLdibSiKYDotmSrOQww==
X-CSE-MsgGUID: G0mWLKjlQHO02LZ5HiR4Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77968896"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77968896"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:36:13 -0800
X-CSE-ConnectionGUID: Nl6J9D8/SPChmFHZ+MhwIg==
X-CSE-MsgGUID: 9KNAD2f1SguYZKjSk1v8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194774350"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:36:12 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ti_am335x_tsc: clamp coordinate_readouts to DT maximum (6)
Date: Mon,  1 Dec 2025 14:36:23 +0800
Message-ID: <20251201063623.153517-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117032358.891822-1-junjie.cao@intel.com>
References: <20251117032358.891822-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

Just a gentle ping on this patch as well.

Best regards,
Junjie

