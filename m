Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC491929E0
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgCYNez (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:34:55 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53145 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgCYNex (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:34:53 -0400
IronPort-SDR: DpIG5Gr/O6NHwOw1zfbUESv7+24PMzogrPa0Qxl44wZnFndKWiX/ngi+rPyEERZYi7B0JaEs3S
 Sl5xPmEsNvf/l4evhrujaCGuZc+kYDPmM38UmqNifItCZNtRhIpFBHg5+t4wWiARUoFw0L47+V
 lLgL3JE+9+DI9xBSt6kz0iprNd1yBp6UmrLnYDh8vpp1P1ycObD0D5POmSLzhhuDulpSEzzuzi
 VHHRQuuCcIWa+/we8QNT9onZ27Lfo7xVmBI47pzz8pNUTNba2zI+sxtnljB8eIiS+Rk6adH42Z
 kYw=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099693"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:34:52 -0800
IronPort-SDR: PxBTxbyOwJzTul9131HVMOGdH69HbU0IPV7mPOGQk///y8RwjRc5v9Df9A7dDqfAYAmkUKPpLp
 ntlaOqpNXa2aw1Mbify3hCdvhPdR5to0cVobfzU1/ElFLa7OJ1tOKJzqDyCEpY2kIeHMwkG6HC
 5To+MhjNWI5yKvCL7piIZDZ0cmoCfv6fEt5ddIOBskVaTf6/3vurEFV5ifmGy8xAZZI7ErHh2G
 7OYxTcpqCprGr8Y5xs+jl68cHHLo5roTL9ZUO6DqcAeyMlzcAqkmk4lha8McoQSyy3jYvK+CMg
 qFA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 18/55] Input: atmel_mxt_ts: Rename mxt_hw_version_show to hw_version_show
Date:   Wed, 25 Mar 2020 06:32:57 -0700
Message-ID: <20200325133334.19346-19-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rename mxt_hw_version_show to hw_version_show to address checkpatch warning

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index b2a37a9597f3..cec823de4096 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3114,8 +3114,8 @@ static ssize_t fw_version_show(struct device *dev,
 }
 
 /* Hardware Version is returned as FamilyID.VariantID */
-static ssize_t mxt_hw_version_show(struct device *dev,
-				   struct device_attribute *attr, char *buf)
+static ssize_t hw_version_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
 	struct mxt_info *info = data->info;
@@ -3404,7 +3404,7 @@ static const struct attribute_group mxt_fw_attr_group = {
 };
 
 static DEVICE_ATTR_RO(fw_version);
-static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
+static DEVICE_ATTR_RO(hw_version);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 
 static struct attribute *mxt_attrs[] = {
-- 
2.17.1

