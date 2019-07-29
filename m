Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4731878FD8
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 17:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387528AbfG2Pum (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 11:50:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52914 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387496AbfG2Pum (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 11:50:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C6157308FC23;
        Mon, 29 Jul 2019 15:50:41 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-113.ams2.redhat.com [10.36.116.113])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3617160BE5;
        Mon, 29 Jul 2019 15:50:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        YueHaibing <yuehaibing@huawei.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH 5.3 regression fix] HID: logitech-dj: Really fix return value of logi_dj_recv_query_hidpp_devices
Date:   Mon, 29 Jul 2019 17:50:36 +0200
Message-Id: <20190729155036.4094-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 29 Jul 2019 15:50:42 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit dbcbabf7da92 ("HID: logitech-dj: fix return value of
logi_dj_recv_query_hidpp_devices") made logi_dj_recv_query_hidpp_devices
return the return value of hid_hw_raw_request instead of unconditionally
returning 0.

But hid_hw_raw_request returns the report-size on a successful request
(and a negative error-code on failure) where as the callers of
logi_dj_recv_query_hidpp_devices expect a 0 return on success.

This commit fixes things so that either the negative error gets returned
or 0 on success, fixing HID++ receivers such as the Logitech nano receivers
no longer working.

Cc: YueHaibing <yuehaibing@huawei.com>
Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reported-by: Rafael J. Wysocki <rjw@rjwysocki.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-dj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 6196217a7d93..b7c3edf21235 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1125,7 +1125,7 @@ static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
 				    HID_REQ_SET_REPORT);
 
 	kfree(hidpp_report);
-	return retval;
+	return (retval < 0) ? retval : 0;
 }
 
 static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
-- 
2.21.0

