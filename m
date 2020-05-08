Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076AA1CA371
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgEHF6P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:15 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:2693 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgEHF6P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:15 -0400
IronPort-SDR: c5XqVTYIEr0Hx+G+CaJGDiIrT97u5RTAk5UCdHoU9B7wg2mhANCrObuxknKmQZsKsCdcUpCyFR
 hj1RUFWUFA85oCh8eNDoSc7mGbarhPO/0h5eeq0cC4TGEk8pFRDjexXAQI4QgM3sgWRDZjjU8I
 9RIKFx0RPPvRJcLx10eDaEKEac7xS7OcdpWy2qXQqf0ZGyiFGol68AgsDVKJWiOyU/hYLUmLzc
 NAr+25HfmAhsBY8dFGYimSefZiUFi9yhGeI1MhH6zhdgjrawWb3m5hhyYncdnjEd24nw/8D0Ru
 CYo=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589082"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:14 -0800
IronPort-SDR: 5ORKCTmWLj2/EqgAui3Z/gTV3bgAgvOj0mi1Fnxl3TnyR0TUpGHgY9gfTaUWssHR7wz31H5gX/
 k2hFioXzmPP0fgKDmxmdTNEDaEM1+VAZjV3X74YmFAs+ApGWFIf2jLATfZb+PbliDQSKY49rIp
 Qh+FdVElyj0Yy9jKnYvTqDAd7Y/itfp7JKacwGlvFYTOAzEWAXDKJ1A+Qo9DVSu83WnvyslfE+
 RAzimT+gfiufynbMVbDV0F8MwVabwkcmvEpfHa9I19HHzt2jurz21BTKJYJAP3U3IrcahCH4GH
 7Jk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 19/56] Input: atmel_mxt_ts: rename mxt_update_fw_store to update_fw_store
Date:   Thu, 7 May 2020 22:56:19 -0700
Message-ID: <20200508055656.96389-20-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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

