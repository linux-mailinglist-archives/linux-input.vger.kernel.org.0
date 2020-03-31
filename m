Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D0419940C
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbgCaKwH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:07 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730703AbgCaKwF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:05 -0400
IronPort-SDR: RnH/U8uSMH1rgYuVzUe9cmBIKCTakYEzXqu/ASHilqRanshH4/HvlsAsVgbynpdwjvmVD2IKMi
 vHwP/UCL8QCT9zeNR+W9fx/yM2GNIeKKEr3E64hGnvsgQ+HMNbLrcRlV96NeKmx00iLUbk4ac1
 PWzPIBoeYarpHoMAnAmb9dlMYWMCYDX+ENAMMUDbxGvsodbW8uKw6kpLrv4XbKX91thdEJJycN
 oSw8/1dBZM66Rq27AmldKAqEnrRKAUNRGqu/sH5rl6qWMOFSEwN89g3fTMQ9AgtzZs4mehfQwk
 nQ0=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330761"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:04 -0800
IronPort-SDR: FtYqO1U+45+jymj+6IQFZTHycjlrEMETJCxbrCZJqlRkl4tOn2wY7FXHayHI3zv+uMwh+HgqDW
 hQGtv2W78fgfMJgMbu0wBxnJ4dTw54V1YmQiMEZX2hwkkmmpxNXWabL5zsNHOWMnsQQALb/zSa
 lhjXigU/InRK0Qiko+tJJPferT4AdONuV8mVMMGjmztbCEUSQddDy6ARilwnVZxuCT1Bc4Cl46
 Mlrbpmo92vgN+SlX98aLOB1pb7wlVojRoWcVRoemndnn1rd07dlaKuspQb8yaMhLlJMOspLnM6
 mQ4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 18/55] Input: atmel_mxt_ts: Rename mxt_hw_version_show to hw_version_show
Date:   Tue, 31 Mar 2020 03:50:14 -0700
Message-ID: <20200331105051.58896-19-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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

