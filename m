Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C5344D7A3
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 14:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhKKN6t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 08:58:49 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:30932 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbhKKN6o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 08:58:44 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HqjmN4qfmzcbHx;
        Thu, 11 Nov 2021 21:51:00 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 21:55:51 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Thu, 11
 Nov 2021 21:55:50 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <srinivas.pandruvada@linux.intel.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <hdegoede@redhat.com>,
        <linux@weissschuh.net>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] HID: intel-ish-hid: hid-client: Fix build error
Date:   Thu, 11 Nov 2021 21:54:49 +0800
Message-ID: <20211111135449.10840-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

drivers/hid/intel-ish-hid/ishtp-hid-client.c:956:4: error: initializer element is not constant
  { hid_ishtp_guid },
    ^~~~~~~~~~~~~~

The reason is that we are using non-const expressions to initialize the
static structure, which will probably trigger a compiling error/warning
on gcc-7.5.0. Fix it by converting const variable into macro.

Fixes: 0d0cccc0fd83 ("HID: intel-ish-hid: hid-client: only load for matching devices")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index fb47d38d1e87..545ec6cf345c 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -12,9 +12,9 @@
 #include "ishtp-hid.h"
 
 /* ISH Transport protocol (ISHTP in short) GUID */
-static const guid_t hid_ishtp_guid =
-	GUID_INIT(0x33AECD58, 0xB679, 0x4E54,
-		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26);
+#define HID_ISHTP_GUID \
+	GUID_INIT(0x33AECD58, 0xB679, 0x4E54, \
+		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26)
 
 /* Rx ring buffer pool size */
 #define HID_CL_RX_RING_SIZE	32
@@ -662,7 +662,7 @@ static int hid_ishtp_cl_init(struct ishtp_cl *hid_ishtp_cl, int reset)
 	ishtp_set_tx_ring_size(hid_ishtp_cl, HID_CL_TX_RING_SIZE);
 	ishtp_set_rx_ring_size(hid_ishtp_cl, HID_CL_RX_RING_SIZE);
 
-	fw_client = ishtp_fw_cl_get_client(dev, &hid_ishtp_guid);
+	fw_client = ishtp_fw_cl_get_client(dev, &HID_ISHTP_GUID);
 	if (!fw_client) {
 		dev_err(cl_data_to_dev(client_data),
 			"ish client uuid not found\n");
@@ -945,7 +945,7 @@ static const struct dev_pm_ops hid_ishtp_pm_ops = {
 
 static struct ishtp_cl_driver	hid_ishtp_cl_driver = {
 	.name = "ish-hid",
-	.guid = &hid_ishtp_guid,
+	.guid = &HID_ISHTP_GUID,
 	.probe = hid_ishtp_cl_probe,
 	.remove = hid_ishtp_cl_remove,
 	.reset = hid_ishtp_cl_reset,
@@ -953,7 +953,7 @@ static struct ishtp_cl_driver	hid_ishtp_cl_driver = {
 };
 
 static const struct ishtp_device_id hid_ishtp_id_table[] = {
-	{ hid_ishtp_guid },
+	{ HID_ISHTP_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(ishtp, hid_ishtp_id_table);
-- 
2.17.1

