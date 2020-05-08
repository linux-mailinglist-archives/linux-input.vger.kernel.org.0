Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130311CA335
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgEHF6m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:42 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38715 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgEHF6l (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:41 -0400
IronPort-SDR: FWtHp10LBnQCDANlUKI5xXwAc2GTFgvG9C4nE3Uf8l6xv0VIMJnLoQki7ReflZ3PDPMZr07gBm
 gGnqqGv0KBRWg/NIv44OaC5vbqovaD6RCotqYakxo1im0jFjpSqe3n19jBGLfbAFEZ9vDHoFXY
 aKbt7ubAdilkt68LZExJ4rXNa8UXK7ZucxskvtRCrPjQiNCwSPr7FdwOfA+i+2qOTJxwv7AjSP
 maGLti7URXihI/Kj7fiP7mtqcUkSo87Q7KifRcr17L4pQNoP4/VzqUj2o/xsHqhI17o12dW53u
 6dk=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670096"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:39 -0800
IronPort-SDR: //l/3gpV2FKvIKRAfN8xgnI7tYEUoXVwcEdWDhLDhV4jLQdSud6gQVZJp+rvkrWUgRSIYJDUMJ
 dObz1kx5sc5I2V1gXwyszv00zyAhHQmYhwW7mD+kX4UfjyunoXxIKgRHpQxs7ZfTJrr0xYK5u6
 J7LZsn18L06oBfxfRxstea3Y86OCu4HmsG3PzCzd5iav9BC8umibs6J749hrxvIAapGg9kpWrS
 +3BvsGcWZjmf0wMTELUhTwD7py1QHrogSmdgOTXledElNkls1leK/POGmIOoV66o233aavQkku
 fP8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 26/56] Input: atmel_mxt_ts - rename mxt_object_show to object_show
Date:   Thu, 7 May 2020 22:56:26 -0700
Message-ID: <20200508055656.96389-27-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rename mxt_object_show() to object_show(), so that object attr
can also use DEVICE_ATTR_[RO|WO] to align with other attrs.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 780850343089..c3dd6c486c12 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3171,8 +3171,8 @@ static ssize_t mxt_show_instance(char *buf, int count,
 	return count;
 }
 
-static ssize_t mxt_object_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static ssize_t object_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
 	struct mxt_object *object;
@@ -3484,7 +3484,7 @@ static const struct attribute_group mxt_fw_attr_group = {
 
 static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR_RO(hw_version);
-static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
+static DEVICE_ATTR_RO(object);
 static DEVICE_ATTR_WO(update_cfg);
 static DEVICE_ATTR_RO(config_crc);
 
-- 
2.17.1

