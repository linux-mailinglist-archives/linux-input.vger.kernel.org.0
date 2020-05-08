Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6B31CA326
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgEHF6N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:13 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:2686 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbgEHF6I (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:08 -0400
IronPort-SDR: SHi+DY//0g+rfhPMbYviJCg6GCX9IXkEoKyG9V97MTnOae+Faq4R6ef5WfHtuiD+J65pNRmxXP
 XHem2Vd4lXwHM89nF8XIq8crska4ZtoZSe2V3NnFehFpZtgFk8MOP2zQqg97HRtEYAGCHiET5i
 ghtdGRGC23NPVlsnvXM5lKukyjV9cK6n6DGjIxVrWRfReXg74c/SIsjGlSTW2tGknlrQpntzXu
 cvQ3NMId+MlFMCfufv4oaqQr34Y5ybhLbwZR/UX74DqXG+2PwuzW6yxoa81Fw0zL0McJh15TIv
 THA=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589076"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:06 -0800
IronPort-SDR: O3oGVhCAJWCST6rYedjqaU7hRNEMHGFbZGrKrueSnFTg/nU/DW6e+cGs+k8ec3TjLJ43NWkpS1
 u33M5gmqlL5cxzrOUqprt/35lwFCnOLBGLmGWuAK9yJmsFkMvYiYKNU6g0bRqrVtTYy+qoyp5z
 Y0ET+TPOM+orWHxH+3c7U3foaPouiMaWCsEkJ1Tb3ePbG18cfbxkpaoja9FoJlSwNzfyTpg01Q
 d7jz4GwplT5fI2N+Pb/HWdZwsdPUuHkm87KOaVrC1+ct+sO/jgQ6rM1LgLeDWAkgbyi0zwqhVv
 U3s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 17/56] Input: atmel_mxt_ts: Rename mxt_fw_version_show to fw_version_show
Date:   Thu, 7 May 2020 22:56:17 -0700
Message-ID: <20200508055656.96389-18-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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

