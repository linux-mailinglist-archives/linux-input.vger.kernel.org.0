Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E3B77F815
	for <lists+linux-input@lfdr.de>; Thu, 17 Aug 2023 15:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351546AbjHQNvn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Aug 2023 09:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237519AbjHQNvT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Aug 2023 09:51:19 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCA8210D
        for <linux-input@vger.kernel.org>; Thu, 17 Aug 2023 06:51:18 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRRFs0d9dzkWtc;
        Thu, 17 Aug 2023 21:49:53 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 21:51:15 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <srinivas.pandruvada@linux.intel.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <yuehaibing@huawei.com>
CC:     <linux-input@vger.kernel.org>
Subject: [PATCH -next] HID: intel-ish-hid: Remove unused declarations
Date:   Thu, 17 Aug 2023 21:50:53 +0800
Message-ID: <20230817135053.51964-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

Commit 3703f53b99e4 ("HID: intel_ish-hid: ISH Transport layer")
declared ishtp_remove_all_clients()/ishtp_can_client_connect()
but never implemented them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.h    | 1 -
 drivers/hid/intel-ish-hid/ishtp/client.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.h b/drivers/hid/intel-ish-hid/ishtp/bus.h
index 5bb85c932e4c..53645ac89ee8 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.h
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.h
@@ -46,7 +46,6 @@ struct ishtp_cl_device {
 };
 
 int	ishtp_bus_new_client(struct ishtp_device *dev);
-void	ishtp_remove_all_clients(struct ishtp_device *dev);
 int	ishtp_cl_device_bind(struct ishtp_cl *cl);
 void	ishtp_cl_bus_rx_event(struct ishtp_cl_device *device);
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/client.h b/drivers/hid/intel-ish-hid/ishtp/client.h
index fc62dd1495da..d9d398fadcf7 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.h
+++ b/drivers/hid/intel-ish-hid/ishtp/client.h
@@ -109,7 +109,6 @@ struct ishtp_cl {
 };
 
 /* Client connection managenment internal functions */
-int ishtp_can_client_connect(struct ishtp_device *ishtp_dev, guid_t *uuid);
 int ishtp_fw_cl_by_id(struct ishtp_device *dev, uint8_t client_id);
 void ishtp_cl_send_msg(struct ishtp_device *dev, struct ishtp_cl *cl);
 void recv_ishtp_cl_msg(struct ishtp_device *dev,
-- 
2.34.1

