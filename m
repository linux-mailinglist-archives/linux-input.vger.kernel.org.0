Return-Path: <linux-input+bounces-483-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C27804444
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 02:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 783151C20A7C
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 01:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FF61871;
	Tue,  5 Dec 2023 01:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7yp1tte"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF89B4
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 17:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701741043; x=1733277043;
  h=from:to:cc:subject:date:message-id;
  bh=/3ANWDUmdNYCAX00Be2BGoMVOtvEjXmpYyAcjhF6HQs=;
  b=P7yp1ttesVWNZ8XFhda23Z3r9qtXBlzYGT8k9P3gzFbVty3SqoYXFmDY
   MlIZpGyDg2/uA+70QmB4M+vpS41U/l6807Vgh0eRoWl5ap2WENsY8rnh2
   Lgzi80Z+F/HsWYrQ1gU7R7ABY/kYD0RUXIs39CA+35J7FdmSgkgLr/X3V
   Ww/TSaZEXzZveqvR2ORrwhTcdxs0oPGhnEJUZbcw38cmIE9NE6Hq+KO1c
   qUF04YYVT1y3J+f+Fss8J9w6ssSxxKDeb0sjwsnlIZLzh6Yj0Fvw3xwz5
   jVCzodjRNJwa1I5ETRoPwB5M7kl8SDBiG57jilKypYhTGpvXDQWCRmW9A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12538496"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="12538496"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 17:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747041417"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="747041417"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 17:50:40 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	srinivas.pandruvada@linux.intel.com,
	bleung@chromium.org,
	tzungbi@kernel.org,
	groeck@chromium.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Even Xu <even.xu@intel.com>
Subject: [PATCH 0/4] Simplify ISHTP client interface
Date: Tue,  5 Dec 2023 09:50:29 +0800
Message-Id: <1701741033-26222-1-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

There are three ISHTP clients, they have same ISHTP interface to
connect, reset and disconnect. Also there are multiple steps for
connect, reset and disconnect.

Simplify multiple steps by creating two helper functions. This will
simplify code flow and also avoid code duplication. Also this removes
memory allocation calls during reset, by using these helper functions.

No functional changes are expected with this series.

Even Xu (4):
  HID: Intel-ish-hid: Ishtp: Add helper functions for client connection
  HID: intel-ish-hid: ishtp-hid-client: use helper functions for
    connection
  HID: intel-ish-hid: ishtp-fw-loader: use helper functions for
    connection
  platform: chrome: cros_ec_ishtp: use helper functions for connection

 drivers/hid/intel-ish-hid/ishtp-fw-loader.c  |  60 ++-------
 drivers/hid/intel-ish-hid/ishtp-hid-client.c |  63 ++-------
 drivers/hid/intel-ish-hid/ishtp/client.c     | 185 +++++++++++++++++++++++++--
 drivers/platform/chrome/cros_ec_ishtp.c      |  74 +++--------
 include/linux/intel-ish-client-if.h          |   3 +
 5 files changed, 217 insertions(+), 168 deletions(-)

-- 
2.7.4


