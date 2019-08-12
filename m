Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7098A34C
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfHLQ1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:27:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12657 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfHLQ1y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:27:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 097DF3083362;
        Mon, 12 Aug 2019 16:27:54 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EF4FB5C1B5;
        Mon, 12 Aug 2019 16:27:51 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 2/2] HID: wacom: do not call hid_set_drvdata(hdev, NULL)
Date:   Mon, 12 Aug 2019 18:27:40 +0200
Message-Id: <20190812162740.15898-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20190812162740.15898-1-benjamin.tissoires@redhat.com>
References: <20190812162740.15898-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 12 Aug 2019 16:27:54 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a common pattern in the HID drivers to reset the drvdata.
However, this is actually already handled by driver core, so there
is no need to do it manually.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/wacom_sys.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 53bddb50aeba..69ccfdd51a6f 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2718,14 +2718,12 @@ static int wacom_probe(struct hid_device *hdev,
 	wacom_wac->features = *((struct wacom_features *)id->driver_data);
 	features = &wacom_wac->features;
 
-	if (features->check_for_hid_type && features->hid_type != hdev->type) {
-		error = -ENODEV;
-		goto fail;
-	}
+	if (features->check_for_hid_type && features->hid_type != hdev->type)
+		return -ENODEV;
 
 	error = kfifo_alloc(&wacom_wac->pen_fifo, WACOM_PKGLEN_MAX, GFP_KERNEL);
 	if (error)
-		goto fail;
+		return error;
 
 	wacom_wac->hid_data.inputmode = -1;
 	wacom_wac->mode_report = -1;
@@ -2743,12 +2741,12 @@ static int wacom_probe(struct hid_device *hdev,
 	error = hid_parse(hdev);
 	if (error) {
 		hid_err(hdev, "parse failed\n");
-		goto fail;
+		return error;
 	}
 
 	error = wacom_parse_and_register(wacom, false);
 	if (error)
-		goto fail;
+		return error;
 
 	if (hdev->bus == BUS_BLUETOOTH) {
 		error = device_create_file(&hdev->dev, &dev_attr_speed);
@@ -2759,10 +2757,6 @@ static int wacom_probe(struct hid_device *hdev,
 	}
 
 	return 0;
-
-fail:
-	hid_set_drvdata(hdev, NULL);
-	return error;
 }
 
 static void wacom_remove(struct hid_device *hdev)
@@ -2791,8 +2785,6 @@ static void wacom_remove(struct hid_device *hdev)
 		wacom_release_resources(wacom);
 
 	kfifo_free(&wacom_wac->pen_fifo);
-
-	hid_set_drvdata(hdev, NULL);
 }
 
 #ifdef CONFIG_PM
-- 
2.19.2

