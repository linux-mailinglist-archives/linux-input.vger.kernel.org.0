Return-Path: <linux-input+bounces-6316-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF7970AF1
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 03:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C763C281DD1
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 01:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C2CA945;
	Mon,  9 Sep 2024 01:14:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846AB67F;
	Mon,  9 Sep 2024 01:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844466; cv=none; b=at6Vg9QG9JNK/OdlALL6A7oc6bk9sQ0jwR+A/X71coSwl7ILHN+aOJVqPXCk6AyaWnsMMC+n7+2WaX5F77aOPp00eHwRWqROE7z+eRavUEFgVzHeoOkykXQu5BmqtGtHKx3NFJeHWfyziRaaDKnOWdrBtnEAS+lHNlN1cAS9f3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844466; c=relaxed/simple;
	bh=Q0xBHys0QgDqAYhHqRXdhWYx9wVlAVaYECwYoVudiBM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhBEAhibZ2uqGb3GizLkaudW1m4KdZUOstP7NYSBOlIixnnUZdNpSmm9cz0GV9n7utmwa6iG/VdwIIBZozjZWu+Nwp1ak8gCspBjkOGnX3TubiD5ymwYfvzlQuLbCV3ERsSiBQufWVOgca+7ScNE98Rr8X2/TlQlMP/nZ4q40Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X283y0YQGz2Dbxm;
	Mon,  9 Sep 2024 09:13:50 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 509C71400DC;
	Mon,  9 Sep 2024 09:14:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:15 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 02/15] HID: cp2112: Use devm_hid_hw_start_and_open in cp2112_probe()
Date: Mon, 9 Sep 2024 09:23:00 +0800
Message-ID: <20240909012313.500341-3-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909012313.500341-1-lizetao1@huawei.com>
References: <20240909012313.500341-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Currently, the cp2112 module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the err_hid_close and err_hid_stop
lables.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Adjust commit information
v1:
https://lore.kernel.org/all/20240904123607.3407364-3-lizetao1@huawei.com/

 drivers/hid/hid-cp2112.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 20a0d1315d90..6d65c65f1b83 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1215,22 +1215,14 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
-	if (ret) {
-		hid_err(hdev, "hw start failed\n");
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
 		return ret;
-	}
-
-	ret = hid_hw_open(hdev);
-	if (ret) {
-		hid_err(hdev, "hw open failed\n");
-		goto err_hid_stop;
-	}
 
 	ret = hid_hw_power(hdev, PM_HINT_FULLON);
 	if (ret < 0) {
 		hid_err(hdev, "power management error: %d\n", ret);
-		goto err_hid_close;
+		return ret;
 	}
 
 	ret = cp2112_hid_get(hdev, CP2112_GET_VERSION_INFO, buf, sizeof(buf),
@@ -1334,10 +1326,6 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	i2c_del_adapter(&dev->adap);
 err_power_normal:
 	hid_hw_power(hdev, PM_HINT_NORMAL);
-err_hid_close:
-	hid_hw_close(hdev);
-err_hid_stop:
-	hid_hw_stop(hdev);
 	return ret;
 }
 
@@ -1354,14 +1342,6 @@ static void cp2112_remove(struct hid_device *hdev)
 	}
 
 	gpiochip_remove(&dev->gc);
-	/* i2c_del_adapter has finished removing all i2c devices from our
-	 * adapter. Well behaved devices should no longer call our cp2112_xfer
-	 * and should have waited for any pending calls to finish. It has also
-	 * waited for device_unregister(&adap->dev) to complete. Therefore we
-	 * can safely free our struct cp2112_device.
-	 */
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static int cp2112_raw_event(struct hid_device *hdev, struct hid_report *report,
-- 
2.34.1


