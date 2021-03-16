Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330C233DE8D
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 21:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhCPUX4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Mar 2021 16:23:56 -0400
Received: from mga09.intel.com ([134.134.136.24]:41153 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhCPUXh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Mar 2021 16:23:37 -0400
IronPort-SDR: i5AAaFA0RWdl+wKvGOhkmDMquNiKIpttkZVYVFIdPCVJYln/q6jaKU+AQZYL2kSEVNTNvYyTrz
 gpBr+FYpuJDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="189423901"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="189423901"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 13:23:37 -0700
IronPort-SDR: Bw4U02Y9efql+FE/hwt1tt9FMTXpu5xeUT2uKNMT5JhzSBcITxt7FpBcxjqqCbEMS5tR15bUEt
 aNPUCe1BM2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="433136802"
Received: from spandruv-desk.jf.intel.com ([10.54.75.21])
  by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2021 13:23:36 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        srinivas.pandruvada@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v2] HID: intel_ish-hid: HBM: Use connected standby state bit during suspend/resume
Date:   Tue, 16 Mar 2021 13:23:34 -0700
Message-Id: <20210316202334.655760-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ye Xiang <xiang.ye@intel.com>

The individual sensor drivers implemented in the ISH firmware needs
capability to take special actions when there is a change in the system
standby state. The ISH core firmware passes this notification to
individual sensor drivers in response to the OS request via connected
standby bit in the SYSTEM_STATE_STATUS command.

This change sets CONNECTED_STANDBY_STATE_BIT bit to 1 during suspend
callback and clears during resume callback.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
[srinivas.pandruvada@linux.intel.com: changelog rewrite]
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2:
	changed changelog to be more clear
	Changed the name in the signed-off to match "From"

 drivers/hid/intel-ish-hid/ishtp/hbm.c | 6 +++---
 drivers/hid/intel-ish-hid/ishtp/hbm.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/hbm.c b/drivers/hid/intel-ish-hid/ishtp/hbm.c
index 30a91d068306..dbfae60f2621 100644
--- a/drivers/hid/intel-ish-hid/ishtp/hbm.c
+++ b/drivers/hid/intel-ish-hid/ishtp/hbm.c
@@ -914,7 +914,7 @@ static inline void fix_cl_hdr(struct ishtp_msg_hdr *hdr, size_t length,
 /*** Suspend and resume notification ***/
 
 static uint32_t current_state;
-static uint32_t supported_states = 0 | SUSPEND_STATE_BIT;
+static uint32_t supported_states = SUSPEND_STATE_BIT | CONNECTED_STANDBY_STATE_BIT;
 
 /**
  * ishtp_send_suspend() - Send suspend message to FW
@@ -933,7 +933,7 @@ void ishtp_send_suspend(struct ishtp_device *dev)
 	memset(&state_status_msg, 0, len);
 	state_status_msg.hdr.cmd = SYSTEM_STATE_STATUS;
 	state_status_msg.supported_states = supported_states;
-	current_state |= SUSPEND_STATE_BIT;
+	current_state |= (SUSPEND_STATE_BIT | CONNECTED_STANDBY_STATE_BIT);
 	dev->print_log(dev, "%s() sends SUSPEND notification\n", __func__);
 	state_status_msg.states_status = current_state;
 
@@ -959,7 +959,7 @@ void ishtp_send_resume(struct ishtp_device *dev)
 	memset(&state_status_msg, 0, len);
 	state_status_msg.hdr.cmd = SYSTEM_STATE_STATUS;
 	state_status_msg.supported_states = supported_states;
-	current_state &= ~SUSPEND_STATE_BIT;
+	current_state &= ~(CONNECTED_STANDBY_STATE_BIT | SUSPEND_STATE_BIT);
 	dev->print_log(dev, "%s() sends RESUME notification\n", __func__);
 	state_status_msg.states_status = current_state;
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/hbm.h b/drivers/hid/intel-ish-hid/ishtp/hbm.h
index 7c445b203f2a..08f3f3ceb18c 100644
--- a/drivers/hid/intel-ish-hid/ishtp/hbm.h
+++ b/drivers/hid/intel-ish-hid/ishtp/hbm.h
@@ -235,6 +235,7 @@ struct dma_xfer_hbm {
 #define SYSTEM_STATE_QUERY_SUBSCRIBERS		0x3
 #define SYSTEM_STATE_STATE_CHANGE_REQ		0x4
 /*indicates suspend and resume states*/
+#define CONNECTED_STANDBY_STATE_BIT		(1<<0)
 #define SUSPEND_STATE_BIT			(1<<1)
 
 struct ish_system_states_header {
-- 
2.25.4

