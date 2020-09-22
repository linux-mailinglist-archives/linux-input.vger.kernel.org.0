Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67FD2741B5
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 14:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgIVMBm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 08:01:42 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14211 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726543AbgIVMBl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 08:01:41 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B35FCAF25208706C1759;
        Tue, 22 Sep 2020 20:01:39 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 20:01:33 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@huawei.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Subject: [PATCH] HID: core: fix some doc warnings in hid-core.c
Date:   Tue, 22 Sep 2020 20:00:12 +0800
Message-ID: <1600776012-7663-1-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix following warnings caused by mismatch bewteen function parameters
and comments.
drivers/hid/hid-core.c:931: warning: Function parameter or member 'hid' not described in 'hid_parse_report'
drivers/hid/hid-core.c:931: warning: Excess function parameter 'device' description in 'hid_parse_report'
drivers/hid/hid-core.c:961: warning: Function parameter or member 'hid' not described in 'hid_validate_values'
drivers/hid/hid-core.c:961: warning: Excess function parameter 'device' description in 'hid_validate_values'
drivers/hid/hid-core.c:1452: warning: Function parameter or member 'report' not described in 'hid_match_report'
drivers/hid/hid-core.c:1452: warning: Excess function parameter 'report_type' description in 'hid_match_report'
drivers/hid/hid-core.c:2132: warning: Function parameter or member 'drv' not described in 'new_id_store'
drivers/hid/hid-core.c:2132: warning: Excess function parameter 'driver' description in 'new_id_store'

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 drivers/hid/hid-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index d2ecc9c..727d042 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -920,7 +920,7 @@ static int hid_scan_report(struct hid_device *hid)
 /**
  * hid_parse_report - parse device report
  *
- * @device: hid device
+ * @hid: hid device
  * @start: report start
  * @size: report size
  *
@@ -945,7 +945,7 @@ static const char * const hid_report_names[] = {
 /**
  * hid_validate_values - validate existing device report's value indexes
  *
- * @device: hid device
+ * @hid: hid device
  * @type: which report type to examine
  * @id: which report ID to examine (0 for first)
  * @field_index: which report field to examine
@@ -1444,7 +1444,7 @@ static int search(__s32 *array, __s32 value, unsigned n)
  * hid_match_report - check if driver's raw_event should be called
  *
  * @hid: hid device
- * @report_type: type to match against
+ * @report: hid report to match against
  *
  * compare hid->driver->report_table->report_type to report->type
  */
@@ -2120,7 +2120,7 @@ struct hid_dynid {
 
 /**
  * store_new_id - add a new HID device ID to this driver and re-probe devices
- * @driver: target device driver
+ * @drv: target device driver
  * @buf: buffer for scanning device ID data
  * @count: input size
  *
-- 
2.8.1

