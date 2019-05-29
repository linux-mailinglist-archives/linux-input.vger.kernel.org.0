Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17562D5D8
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 09:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfE2HA6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 03:00:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:18369 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfE2HA6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 03:00:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 00:00:58 -0700
X-ExtLoop1: 1
Received: from hyungwoo-ubuntu.sc.intel.com ([10.3.62.78])
  by orsmga003.jf.intel.com with ESMTP; 29 May 2019 00:00:57 -0700
From:   Hyungwoo Yang <hyungwoo.yang@intel.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     jikos@kernel.org, linux-input@vger.kernel.org,
        rushikesh.s.kadam@intel.com, jettrink@chromium.org
Subject: [PATCH v2 2/2] HID: intel-ish-hid: fix wrong driver_data setting
Date:   Wed, 29 May 2019 00:00:57 -0700
Message-Id: <1559113257-19432-2-git-send-email-hyungwoo.yang@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559113257-19432-1-git-send-email-hyungwoo.yang@intel.com>
References: <1559113257-19432-1-git-send-email-hyungwoo.yang@intel.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

driver_data of ishtp client device should be owned by
corresponding ishtp client driver. Bus shouldn't set it.

Signed-off-by: Hyungwoo Yang <hyungwoo.yang@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index 5beea44..4afe2a5 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -479,7 +479,6 @@ static struct ishtp_cl_device *ishtp_bus_add_device(struct ishtp_device *dev,
 	}
 
 	ishtp_device_ready = true;
-	dev_set_drvdata(&device->dev, device);
 
 	return device;
 }
-- 
1.9.1

