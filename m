Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0881A2A28CA
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 12:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgKBLMH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 06:12:07 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44833 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgKBLMH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 06:12:07 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kZXkp-0004pm-Bf; Mon, 02 Nov 2020 11:12:03 +0000
From:   Colin King <colin.king@canonical.com>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] SFH: remove redundant initialization of pointer cl_data
Date:   Mon,  2 Nov 2020 11:12:03 +0000
Message-Id: <20201102111203.693741-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer cl_data is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3d1ccac5d99a..7eaf519737c0 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -133,7 +133,7 @@ static void amd_sfh_work_buffer(struct work_struct *work)
 
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 {
-	struct amdtp_cl_data *cl_data = privdata->cl_data;
+	struct amdtp_cl_data *cl_data;
 	struct amd_mp2_sensor_info info;
 	struct device *dev;
 	u32 feature_report_size;
-- 
2.27.0

