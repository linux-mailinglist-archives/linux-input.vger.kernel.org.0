Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA30271D08
	for <lists+linux-input@lfdr.de>; Mon, 21 Sep 2020 10:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgIUID6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 04:03:58 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35140 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726566AbgIUICT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 04:02:19 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 24E51D5E5C3142B64F1A;
        Mon, 21 Sep 2020 16:02:17 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:10 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] HID: intel-ish-hid: simplify the return expression of ishtp_hid_parse
Date:   Mon, 21 Sep 2020 16:24:34 +0800
Message-ID: <20200921082434.2591357-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.c b/drivers/hid/intel-ish-hid/ishtp-hid.c
index b8aae69ad15d..edf5ae942508 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid.c
@@ -22,14 +22,9 @@ static int ishtp_hid_parse(struct hid_device *hid)
 {
 	struct ishtp_hid_data *hid_data =  hid->driver_data;
 	struct ishtp_cl_data *client_data = hid_data->client_data;
-	int rv;
-
-	rv = hid_parse_report(hid, client_data->report_descr[hid_data->index],
-			      client_data->report_descr_size[hid_data->index]);
-	if (rv)
-		return	rv;
 
-	return 0;
+	return hid_parse_report(hid, client_data->report_descr[hid_data->index],
+				client_data->report_descr_size[hid_data->index]);
 }
 
 /* Empty callbacks with success return code */
-- 
2.25.1

