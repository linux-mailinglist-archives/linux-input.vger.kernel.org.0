Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242AF44D7A6
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 14:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhKKN7K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 08:59:10 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:30933 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbhKKN7J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 08:59:09 -0500
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hqjmw4W3kzcb05;
        Thu, 11 Nov 2021 21:51:28 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 21:56:19 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Thu, 11
 Nov 2021 21:56:18 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <srinivas.pandruvada@linux.intel.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <hdegoede@redhat.com>,
        <linux@weissschuh.net>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] HID: intel-ish-hid: fw-loader: Fix build error
Date:   Thu, 11 Nov 2021 21:56:07 +0800
Message-ID: <20211111135607.38716-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

drivers/hid/intel-ish-hid/ishtp-fw-loader.c:1067:4: error: initializer element is not constant
  { loader_ishtp_guid },
    ^~~~~~~~~~~~~~~~~

The reason is that we are using non-const expressions to initialize the
static structure, which will probably trigger a compiling error/warning
on gcc-7.5.0. Fix it by converting const variable into macro.

Fixes: 44e2a58cb880 ("HID: intel-ish-hid: fw-loader: only load for matching devices")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 945a9d0b68cd..98657b3bfd3f 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -76,9 +76,9 @@ enum ish_loader_commands {
 #define LOADER_XFER_MODE_ISHTP			BIT(1)
 
 /* ISH Transport Loader client unique GUID */
-static const guid_t loader_ishtp_guid =
-	GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7,
-		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc);
+#define LOADER_ISHTP_GUID \
+	GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7, \
+		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc)
 
 #define FILENAME_SIZE				256
 
@@ -880,7 +880,7 @@ static int loader_init(struct ishtp_cl *loader_ishtp_cl, int reset)
 
 	fw_client =
 		ishtp_fw_cl_get_client(ishtp_get_ishtp_device(loader_ishtp_cl),
-				       &loader_ishtp_guid);
+				       &LOADER_ISHTP_GUID);
 	if (!fw_client) {
 		dev_err(cl_data_to_dev(client_data),
 			"ISH client uuid not found\n");
@@ -1057,14 +1057,14 @@ static int loader_ishtp_cl_reset(struct ishtp_cl_device *cl_device)
 
 static struct ishtp_cl_driver	loader_ishtp_cl_driver = {
 	.name = "ish-loader",
-	.guid = &loader_ishtp_guid,
+	.guid = &LOADER_ISHTP_GUID,
 	.probe = loader_ishtp_cl_probe,
 	.remove = loader_ishtp_cl_remove,
 	.reset = loader_ishtp_cl_reset,
 };
 
 static const struct ishtp_device_id loader_ishtp_id_table[] = {
-	{ loader_ishtp_guid },
+	{ LOADER_ISHTP_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(ishtp, loader_ishtp_id_table);
-- 
2.17.1

