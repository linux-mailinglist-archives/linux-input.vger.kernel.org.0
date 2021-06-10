Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E944F3A2463
	for <lists+linux-input@lfdr.de>; Thu, 10 Jun 2021 08:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhFJGYC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Jun 2021 02:24:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:10599 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhFJGYB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Jun 2021 02:24:01 -0400
IronPort-SDR: clUlXSqTvISsEbkgamURpucUVAsCWIaFLqg4pCVCHZ3NMwr8ZR73ATeCIYkk8FWPtsMa4THiCY
 C7fWLBLYlSVA==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="185610244"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="185610244"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 23:21:59 -0700
IronPort-SDR: Yem9iuGyxETW9hKudxfZND+nZwC1JEejgbywJSsMPQqnGs5vGgC9rIEBxinD4oRrywIwO4FNfh
 l3AtBvm/M7bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="482702815"
Received: from shsensorbuild2.sh.intel.com ([10.239.132.180])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2021 23:21:57 -0700
From:   Even Xu <even.xu@intel.com>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, Even Xu <even.xu@intel.com>
Subject: [PATCH 0/3] enable ISH DMA on EHL platform
Date:   Thu, 10 Jun 2021 14:21:51 +0800
Message-Id: <1623306114-19208-1-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These patch set are used for enabling ISH DMA on EHL platform.

During ISH DMA enabling, some platforms (such as EHL) don't
support cache snooping, bus driver (ishtp) has to involve
a new callback, dma_no_cache_snooping(), in hardware layer (ipc)
to get hardware DMA capability.

When do cache flush, clflush_cache_range() API is used on X86
which isn't supported by all other archs (such as ARM).
Considering ISH only exists on Intel platforms, adding ISH
depending on X86 in Kconfig to avoid build warnings or errors
on other archs.

Even Xu (3):
  hid: intel-ish-hid: Set ISH driver depends on x86
  hid: intel-ish-hid: ishtp: Add dma_no_cache_snooping() callback
  hid: intel-ish-hid: ipc: Specify that EHL no cache snooping

 drivers/hid/intel-ish-hid/Kconfig           |  1 +
 drivers/hid/intel-ish-hid/ipc/ipc.c         | 26 +++++++++++++++++++++++++-
 drivers/hid/intel-ish-hid/ishtp/client.c    | 18 ++++++++++++++++++
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  1 +
 4 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.7.4

