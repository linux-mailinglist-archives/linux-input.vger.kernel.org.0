Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5726415A3BF
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbgBLIr1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:47:27 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:5150 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgBLIr1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:47:27 -0500
IronPort-SDR: 8HuOmCnVODYZngdiFM3tV8yvZSgz3DtseKyY7cs+Ecesj+OCPftV7maS9fRcNPP3ZkNcn6d5Qd
 rjQz3Ozl6he4uWFM53LqOXf6m2LeRXyFoVhiUngUq9OtiK182dJJm3akR3SzXGpquKb5w7S1QQ
 BOvekaZpIh/8z2pt9XfhjeSeii0Z1B7S7Nb/yzIJ5C9NAiomyyZgKSZyOLOGQmay9ISp5gUkBt
 TJmMqrrP19KWAOlZ0gYp/93aYxFK3a1E/aer3JujNn+1vOdjIBKK0vBj06dEdISQQS+ndN0XWq
 6TM=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45686305"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:47:26 -0800
IronPort-SDR: RhUTOma+4x1Y+3/MS0AApkZYWSDhbSoj41gT83w2tkQKPX1YRoYD/UMxHAhcP/cbWgvXxKJrsb
 nB5pMzY64IJ/7HenxJm4rfHWUtdEqWoMj4HzmXihLyfwV7tSSF9WYAsiBmmZ2uPqh1EIoTh9Jb
 dBdtZsxEML2E4jNOgU4wjOA3gAvNcmAvbrRsgwuvTtxNnqQCL5iugDrzFG1a4Uv3LdX/KDRjqS
 5noIOvWHK8eN4E7DtsybvJZQTN/a35B30dzrRPCoJChXNolaX5SyDM0W2mYKp+Rc4+yT6yfMPF
 qX8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 41/48] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Wed, 12 Feb 2020 00:42:11 -0800
Message-ID: <20200212084218.32344-42-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

Currently Driver probe continues with a warning message when it fails to
get the proper multitouch object configurations like TouchScreen resolution.
But Driver probe should fail in case of above scneario because it will not behave
as expected without the proper touchscreen configurations.

This commit modifies mxt_initialize_input_device() to return error when it fails
to get the proper touch screen configurations.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 3654f4b399d9..e15f977e0af6 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2759,15 +2759,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	case MXT_TOUCH_MULTI_T9:
 		num_mt_slots = data->T9_reportid_max - data->T9_reportid_min + 1;
 		error = mxt_read_t9_resolution(data);
-		if (error)
-			dev_warn(dev, "Failed to initialize T9 resolution\n");
+		if (error) {
+			dev_err(dev, "Failed to initialize T9 resolution\n");
+			return error;
+		}
 		break;
 
 	case MXT_TOUCH_MULTITOUCHSCREEN_T100:
 		num_mt_slots = data->num_touchids;
 		error = mxt_read_t100_config(data);
-		if (error)
-			dev_warn(dev, "Failed to read T100 config\n");
+		if (error) {
+			dev_err(dev, "Failed to read T100 config\n");
+			return error;
+		}
 		break;
 
 	default:
-- 
2.17.1

