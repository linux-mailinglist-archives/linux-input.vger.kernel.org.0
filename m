Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C40AB19940A
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730395AbgCaKwE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:04 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730696AbgCaKwB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:01 -0400
IronPort-SDR: 9z3AyLc73bt9oVc/NuP4QoPyEUw6uPyvBdHVqS2CQOnWH1ZSCyx6uc5hD14RhkUWqf5bmW1prh
 dAxFGze0avHuZD5qpeXviz0lIYAAeI2pd5mgcJ8MeJ/4vX5F3+ERTLRRLAzVHipY3B5Q2d5WqI
 p7hZ4wVBeAebWi3n2O0Ux4EnHCKN/5JhpRPkCvVQcFcs1vBkjWZty5IoMjCBZy9rHKGpxgJA83
 oFlqm1R8fz6ueN1f3Aalk2b2XXoReZbs6e9FLrp8Px0yZGyv+ZvXuEJeuHFYu92F1ATqJmWVRl
 C2g=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330756"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:00 -0800
IronPort-SDR: VZh7RCFlJRupuTh3XUIrYSk24SOcgprxwoMSX9/EcVM7B9SkkIsQ370x5lRsWy8xdEY11YE7R9
 wvdLmWtfJreew1GdK/7h/aeAbjM0Xbl6LOkHf6jO6S44/2qHxILkoHVN6IyNLDfaWliyWUe9VA
 a0EtdHCn2HsGedJrgX/bDhgAGXjpOfYw5As+zjS8vYoInqmDufZ/vN6+03P795nqXBd9LMh1dl
 vSavSgSrb6FQsRQwewUnnMCMtr1IZX8obpymviWwo01Okqxd9s7EAi5DBFTLOQ+wkEoRU0ogvi
 Elo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 17/55] Input: atmel_mxt_ts: Rename mxt_fw_version_show to fw_version_show
Date:   Tue, 31 Mar 2020 03:50:13 -0700
Message-ID: <20200331105051.58896-18-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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

