Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F7B2FCC05
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 08:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbhATHti (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jan 2021 02:49:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:35549 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728911AbhATHtR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jan 2021 02:49:17 -0500
IronPort-SDR: jlC9l65W0gAMoq1RiTzbaujQtE+zshnUHmbOeI3Aed5C/V69tKEaETioMbBBpspwWMJkoqb69/
 n9sv+Toedw1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="240600210"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="240600210"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:48:32 -0800
IronPort-SDR: N3eeg1rePNFLLAsJnzVHKgnfVbVszaQDBbzpl6XmLKR+Ow0jkLkbNSb6kDO6MUDtUTGbBP0gyb
 FtdDwtPyiA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="426810673"
Received: from host.sh.intel.com ([10.239.154.115])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2021 23:48:29 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     jikos@kernel.org, jic23@kernel.org,
        srinivas.pandruvada@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH] iio: hid-sensor-prox: Fix scale not correct issue
Date:   Wed, 20 Jan 2021 15:49:35 +0800
Message-Id: <20210120074935.26637-1-xiang.ye@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, the proxy sensor scale is zero because it just return the
exponent directly. To fix this issue, this patch use
hid_sensor_format_scale to process the scale first then return the
output.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
---
 drivers/iio/light/hid-sensor-prox.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index 4ab285a418d5..4abcfe48f1d4 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -23,6 +23,9 @@ struct prox_state {
 	struct hid_sensor_common common_attributes;
 	struct hid_sensor_hub_attribute_info prox_attr;
 	u32 human_presence;
+	int scale_pre_decml;
+	int scale_post_decml;
+	int scale_precision;
 };
 
 static const u32 prox_sensitivity_addresses[] = {
@@ -98,8 +101,9 @@ static int prox_read_raw(struct iio_dev *indio_dev,
 		ret_type = IIO_VAL_INT;
 		break;
 	case IIO_CHAN_INFO_SCALE:
-		*val = prox_state->prox_attr.units;
-		ret_type = IIO_VAL_INT;
+		*val = prox_state->scale_pre_decml;
+		*val2 = prox_state->scale_post_decml;
+		ret_type = prox_state->scale_precision;
 		break;
 	case IIO_CHAN_INFO_OFFSET:
 		*val = hid_sensor_convert_exponent(
@@ -221,6 +225,11 @@ static int prox_parse_report(struct platform_device *pdev,
 	dev_dbg(&pdev->dev, "prox %x:%x\n", st->prox_attr.index,
 			st->prox_attr.report_id);
 
+	st->scale_precision = hid_sensor_format_scale(
+				hsdev->usage,
+				&st->prox_attr,
+				&st->scale_pre_decml, &st->scale_post_decml);
+
 	return ret;
 }
 
-- 
2.17.1

