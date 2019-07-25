Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 758E1750D6
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 16:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfGYOT4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 10:19:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:19579 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbfGYOT4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 10:19:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 07:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; 
   d="scan'208";a="170260059"
Received: from bahr-mobl4.ger.corp.intel.com (HELO delly.ger.corp.intel.com) ([10.249.35.73])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2019 07:19:54 -0700
From:   Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc:     Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        linux-input@vger.kernel.org, yuehaibing@huawei.com,
        hdegoede@redhat.com, benjamin.tissoires@redhat.com
Subject: [PATCH v3] HID: logitech-dj: Fix mouse detection
Date:   Thu, 25 Jul 2019 17:19:49 +0300
Message-Id: <20190725141949.9737-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now logi_dj_recv_query_paired_devices() will return a positive value
while success, but logi_dj_probe expect zero in case of success, so
set it to 0 before return.

Fixes this error :

   logitech-djreceiver: probe of 0003:046D:C534.0006 failed with error 7

Also prevents the pluging of the mouse dongle in/out to hang the
system.

v2: Drop useless retval = 0 (YueHaibing)

v3: Add explanation (YueHaibing)

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: linux-input@vger.kernel.org
Cc: yuehaibing@huawei.com
Cc: hdegoede@redhat.com
Cc: benjamin.tissoires@redhat.com
Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
Reviewed-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hid/hid-logitech-dj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 6196217a7d93..8cdf37309ada 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1736,6 +1736,7 @@ static int logi_dj_probe(struct hid_device *hdev,
 				__func__, retval);
 			goto logi_dj_recv_query_paired_devices_failed;
 		}
+		retval = 0;
 	}
 
 	return retval;
-- 
2.22.0

