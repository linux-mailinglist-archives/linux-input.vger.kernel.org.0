Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A9B1CA370
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgEHF6N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:13 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:2688 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgEHF6J (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:09 -0400
IronPort-SDR: DeqnH3IJuKu7sI14hrg9Lm/RfBpAnFRkDfl4Sk7aqL1foMhWX7X9/dtxh+kl6bh6H/wC9PWGYx
 9zIjOTKtX2VCYucIZqxVKEIPNfB5+t99bawfOzVotK8+xUHdTu1CtV245B9KOmcUYLe2xux3Kn
 LDurBA5MdmgbQvd8xdevQWPMcajdWqBJC8cwOeKBYoIsl6oCCzoaX+WQTvowgQSmA4kuDIUTpm
 pY/aXVggt6z1YfttyO2LJlHh6jEjfynMid+O2/8spOs/6gEIpMzscKG++2XFZrEmOjcPRYuM+N
 xks=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589078"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:09 -0800
IronPort-SDR: YegAmgO5vzpL8ClT9FUBfT1ny6I0q4eS97gN4Js3egQyIICYn/Pt2nWfK58Z9dpkBMa4cmo+GT
 rdikdvr9GLeyX7QcTWvQTDqInRxRPf3TX0u/mH+NqI4C40bjRbGQOQvvB6t2H2TD8SBIAhrx1A
 P/JO8IhExLCEc7xPNUbdAkmygwVL3XMnZShY/A2eEoCY0qWoN1G0a6Jjib5/hU43ldnx6c5Y2d
 q0/bn1aRKftW22QG5iPMmDv70lIYZGD2UwEY8yeGFdIkJ1WT8VjQQTP06//6DEwgtLyjdhAndv
 6ms=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 18/56] Input: atmel_mxt_ts: Rename mxt_hw_version_show to hw_version_show
Date:   Thu, 7 May 2020 22:56:18 -0700
Message-ID: <20200508055656.96389-19-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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

