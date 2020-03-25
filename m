Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3E31929E2
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgCYNe6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:34:58 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53145 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgCYNe5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:34:57 -0400
IronPort-SDR: ro3kBhvIdIbxK3tlMVLFAp9BV/ar5UjRZD1ChQzI2s9r+qWvXSliiyx9ucmMnO/no/WVaNBidg
 buVPrJDKtZrYIX4Pa0hNnVPd0rFL423llMmDRip38gVKbN6atbC1Eoane8aW4icdDOftTN8+1x
 wz/5znyenZfb/g0VLg9Wo6tnBQm5YwhrSiZhkybDS5ldTnWVyFPcmCwEstXbBDzfAgD6ZB2pnq
 0jjBO7kVe6tD4IhJ7PgK0NbOw3oneEBAHHqst8ry9D8qHSPi/4ufGvndNJctuk7/3xbGqSXGva
 QsU=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099695"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:34:56 -0800
IronPort-SDR: XrjtwLy5nBpo4nU6I/7z9rRSjiGDjOnqx/WM33akTaHa1MIJYnVOTJYL/Twek4jFXjl7ax4FgD
 5Sn14Ggq2/zV0GpRZVlyPkUoCLcEkHRXb3QuCXlqrejuV+gRU9Ehr3Rog4oDOWjLFA3De8qvh1
 5WRzGVmCbzgcdCMbtGgFT3KQ2USMIcC0fm/hxqtmphoTqlP0m8IyRkgtrFDQsXyI5gcdGr8FFt
 RcoyJGbvU2GlEkxwXiBY2LzAMlSwHW6B0sB7WDl4//dDyRGOjDR5jUz18R79+0p+0W7kVV1fie
 T3s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 19/55] Input: atmel_mxt_ts: rename mxt_update_fw_store to update_fw_store
Date:   Wed, 25 Mar 2020 06:32:58 -0700
Message-ID: <20200325133334.19346-20-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rename mxt_update_fw_store to update_fw_store, to address checkpatch
warning.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index cec823de4096..720574417219 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3366,9 +3366,9 @@ static int mxt_update_file_name(struct device *dev, char **file_name,
 	return 0;
 }
 
-static ssize_t mxt_update_fw_store(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t update_fw_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
 	int error;
@@ -3392,7 +3392,7 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(update_fw, 0200, NULL, mxt_update_fw_store);
+static DEVICE_ATTR_WO(update_fw);
 
 static struct attribute *mxt_fw_attrs[] = {
 	&dev_attr_update_fw.attr,
-- 
2.17.1

