Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B97777F814
	for <lists+linux-input@lfdr.de>; Thu, 17 Aug 2023 15:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237519AbjHQNvo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Aug 2023 09:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351534AbjHQNvc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Aug 2023 09:51:32 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C8F210D
        for <linux-input@vger.kernel.org>; Thu, 17 Aug 2023 06:51:31 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRRCV5ZhCztRh6;
        Thu, 17 Aug 2023 21:47:50 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 21:51:28 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>
CC:     <linux-input@vger.kernel.org>, <yuehaibing@huawei.com>
Subject: [PATCH -next] HID: amd_sfh: Remove unused declarations
Date:   Thu, 17 Aug 2023 21:51:27 +0800
Message-ID: <20230817135127.36372-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor
Fusion Hub (SFH)") declared but never implemented them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index 97296f587bc7..1c91be8daedd 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -73,8 +73,6 @@ struct amdtp_hid_data {
 };
 
 /* Interface functions between HID LL driver and AMD SFH client */
-void hid_amdtp_set_feature(struct hid_device *hid, char *buf, u32 len, int report_id);
-void hid_amdtp_get_report(struct hid_device *hid, int report_id, int report_type);
 int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data);
 void amdtp_hid_remove(struct amdtp_cl_data *cli_data);
 int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type);
-- 
2.34.1

