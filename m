Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE48B638782
	for <lists+linux-input@lfdr.de>; Fri, 25 Nov 2022 11:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiKYK1z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Nov 2022 05:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiKYK1y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Nov 2022 05:27:54 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60091F5A9
        for <linux-input@vger.kernel.org>; Fri, 25 Nov 2022 02:27:51 -0800 (PST)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJWJM3LqmzmW7n;
        Fri, 25 Nov 2022 18:27:15 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemi500024.china.huawei.com
 (7.221.188.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 18:27:48 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <basavaraj.natikar@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <benjamin.tissoires@redhat.com>, <sandeep.singh@amd.com>,
        <jikos@kernel.org>
CC:     <liwei391@huawei.com>, <linux-input@vger.kernel.org>,
        <zengheng4@huawei.com>
Subject: [PATCH] HID: amd_sfh: Add check for dma_alloc_coherent()
Date:   Fri, 25 Nov 2022 18:25:36 +0800
Message-ID: <20221125102536.3092713-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since the dma_alloc_coherent() may return NULL,
the pointer returned needs to be checked to avoid
null-poineter dereference.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 8275bba63611..ab125f79408f 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -237,6 +237,10 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		in_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
 								  &cl_data->sensor_dma_addr[i],
 								  GFP_KERNEL);
+		if (!in_data->sensor_virt_addr[i]) {
+			rc = -ENOMEM;
+			goto cleanup;
+		}
 		cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		cl_data->sensor_requested_cnt[i] = 0;
 		cl_data->cur_hid_dev = i;
-- 
2.25.1

