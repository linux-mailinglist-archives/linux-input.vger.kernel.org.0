Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5988F2A07E0
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 15:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgJ3OaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 10:30:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43735 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgJ3OaH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 10:30:07 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kYVPm-00085E-Kr; Fri, 30 Oct 2020 14:30:02 +0000
From:   Colin King <colin.king@canonical.com>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] SFH: fix error return check for -ERESTARTSYS
Date:   Fri, 30 Oct 2020 14:30:02 +0000
Message-Id: <20201030143002.535531-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for the error return code -ERESTARTSYS is dead code
and never executed because a previous check for ret < 0 is catching this
and returning -ETIMEDOUT instead.  Fix this by checking for -ERESTARTSYS
before the more generic negative error code.

Addresses-Coverity: ("Logically dead code")
Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
index a471079a3bd0..4f989483aa03 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -88,10 +88,10 @@ static int amdtp_wait_for_response(struct hid_device *hid)
 		ret = wait_event_interruptible_timeout(hid_data->hid_wait,
 						       cli_data->request_done[i],
 						       msecs_to_jiffies(AMD_SFH_RESPONSE_TIMEOUT));
-	if (ret < 0)
-		return -ETIMEDOUT;
-	else if (ret == -ERESTARTSYS)
+	if (ret == -ERESTARTSYS)
 		return -ERESTARTSYS;
+	else if (ret < 0)
+		return -ETIMEDOUT;
 	else
 		return 0;
 }
-- 
2.27.0

