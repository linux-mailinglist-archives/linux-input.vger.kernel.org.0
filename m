Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841141929DE
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbgCYNet (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:34:49 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53145 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgCYNet (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:34:49 -0400
IronPort-SDR: E6f/GLyf5nianUPCyVNnvLuEtkGmKmgHQKH5qSw8SaoSqW9s0an6IzGz9FNUpdf7cLvxiZG2VL
 ExSoEf6yZkThLyp8HAyj8etWhHWZD7PPpIG5TzjQ72r6tj6i9fxsEX0vAQ5uZPT2mFpXJDKHIC
 qf4Hp8CNckRgldV419RVqr8WpPsbHOrDfE4EGlu27mCpkJ/JhMo81OR/KLZgiMUQwSx1/3Z0NS
 uxAygoUuYcVAe2nkv9mS8I8Xy7qNzCimAwz291hPsXXZi2l2nw1/2DMASY9bPEaXHex2URG/7b
 O3Q=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099692"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:34:48 -0800
IronPort-SDR: V6IYeIZQL5BYr4u/HcUerB8rekDZCyIqj9ltoP/Xp0Aw2y6krhzJ0coTBYHCFceHrjMmmVn63V
 vR3po8JFGBresJgaB8Get866reIDaryFuJpEIMxzTyTmSCzb74B9p5Df7pbQXSZyl2Jqd/ih4S
 J03fPAQteO6BQQ3PaY6do34Vp6b/QFiRbC2vzF1y+FouPh75JrxAQywSWR+zgs7kh6VUP5/RTf
 N0eJqV00uRcazJ12bGLCH7o8C0K4PmoWvHWNCxpF9N7PYoEuhvojp2Ao6bcvM0qxmkKpShY6zD
 D/Y=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 17/55] Input: atmel_mxt_ts: Rename mxt_fw_version_show to fw_version_show
Date:   Wed, 25 Mar 2020 06:32:56 -0700
Message-ID: <20200325133334.19346-18-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rename mxt_fw_version_show to fw_version_show to address checkpatch warning

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 0e30ff372a43..b2a37a9597f3 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3104,8 +3104,8 @@ static int mxt_configure_objects(struct mxt_data *data,
 }
 
 /* Firmware Version is returned as Major.Minor.Build */
-static ssize_t mxt_fw_version_show(struct device *dev,
-				   struct device_attribute *attr, char *buf)
+static ssize_t fw_version_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
 	struct mxt_info *info = data->info;
@@ -3403,7 +3403,7 @@ static const struct attribute_group mxt_fw_attr_group = {
 	.attrs = mxt_fw_attrs,
 };
 
-static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
+static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 
-- 
2.17.1

