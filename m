Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C42978DCBA
	for <lists+linux-input@lfdr.de>; Wed, 30 Aug 2023 20:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240724AbjH3Sqc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Aug 2023 14:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242559AbjH3JBV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Aug 2023 05:01:21 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FC6CC9
        for <linux-input@vger.kernel.org>; Wed, 30 Aug 2023 02:01:17 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RbJ972CFyzLp9s;
        Wed, 30 Aug 2023 16:58:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 30 Aug
 2023 17:01:15 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-input@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] HID: hid-mf: Use list_for_each_entry() helper
Date:   Wed, 30 Aug 2023 17:01:08 +0800
Message-ID: <20230830090108.528257-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert list_for_each() to list_for_each_entry() so that the report_ptr
list_head pointer and list_entry() call are no longer needed, which
can reduce a few lines of code. No functional changed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/hid/hid-mf.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hid/hid-mf.c b/drivers/hid/hid-mf.c
index 92d7ecd41a78..2d9a500cf364 100644
--- a/drivers/hid/hid-mf.c
+++ b/drivers/hid/hid-mf.c
@@ -61,7 +61,6 @@ static int mf_init(struct hid_device *hid)
 	struct list_head *report_list =
 			&hid->report_enum[HID_OUTPUT_REPORT].report_list;
 
-	struct list_head *report_ptr;
 	struct hid_report *report;
 
 	struct list_head *input_ptr = &hid->inputs;
@@ -72,9 +71,7 @@ static int mf_init(struct hid_device *hid)
 	int error;
 
 	/* Setup each of the four inputs */
-	list_for_each(report_ptr, report_list) {
-		report = list_entry(report_ptr, struct hid_report, list);
-
+	list_for_each_entry(report, report_list, list) {
 		if (report->maxfield < 1 || report->field[0]->report_count < 2) {
 			hid_err(hid, "Invalid report, this should never happen!\n");
 			return -ENODEV;
-- 
2.34.1

