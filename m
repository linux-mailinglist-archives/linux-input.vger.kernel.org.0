Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1882DBB53
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 07:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgLPGlv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 01:41:51 -0500
Received: from mga18.intel.com ([134.134.136.126]:22854 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgLPGlu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 01:41:50 -0500
IronPort-SDR: deh6Wa95DKAa+XNMunMli5wTc+4s/jGmQU+U4+PrCm+kRcd4MB87w5paIXs4SFWIZPDzwcl7D3
 EXWZYk0B4cIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="162761779"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="162761779"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 22:41:10 -0800
IronPort-SDR: hhB1hnnK4FV2DEEyB1RoNhxP4Pc8W5/sxNsW/zhGw5vlRb1Pommu8iE710mRaDWEa5Z8JFdihX
 DldnusswZTWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="412333793"
Received: from ipsg-l-lixuzha.sh.intel.com ([10.239.153.22])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2020 22:41:07 -0800
From:   Zhang Lixu <lixu.zhang@intel.com>
To:     jikos@kernel.org, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com,
        benjamin.tissoires@redhat.com, Zhang Lixu <lixu.zhang@intel.com>
Subject: [PATCH 0/2] hid: intel-ish-hid: ipc: enable OOB support for EHL
Date:   Wed, 16 Dec 2020 14:36:38 +0800
Message-Id: <20201216063640.4086068-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The EHL (Elkhart Lake) based platforms provide a OOB (Out of band)
service, which allows wakup device when the system is in S5 (Soft-Off
state). This OOB service can be enabled/disabled from BIOS settings.

These two patches is to enable this feature for EHL platform.

We have tested these patches on both ISH platforms and EHL platforms,
it works fine.

Zhang Lixu (2):
  hid: intel-ish-hid: ipc: finish power flow for EHL OOB
  hid: intel-ish-hid: ipc: Address EHL Sx resume issues

 drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
 drivers/hid/intel-ish-hid/ipc/ipc.c     | 27 +++++++++++++
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 54 ++++++++++++++++++++++++-
 3 files changed, 81 insertions(+), 1 deletion(-)

-- 
2.25.1

