Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5714C192A2A
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgCYNhC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:37:02 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:34650 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbgCYNgy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:54 -0400
IronPort-SDR: mgM6mspTB2LAyvtUDGLASdHEiRIr3JQvuD0AJHztcHf02pZ1S9ZX8cfmRME8NdVdm2p71/dSvZ
 bi3su1sxN+qonhD7VQOSnmLdYH+nZZa3gpwVqWfBv1nuWnCNELrutml2SxVuG1G0qQPMqPWmpw
 phOTXUidqEvu+hYtCWnmsg6gx3kMmVQGgemhZvytbwJP0wxeI/1Hwfe3aawfJxYA+XQ62UDSS9
 sryY2zQnUN9BmF1u6QmbVxMFNmdJv9qYBa1AdL8IkHkyiAGWiH8smFwLQlx8zxL85TXYohqbs4
 +yg=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47143548"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:53 -0800
IronPort-SDR: uKU0k0TN8UuNPZp9DSgb1Pcp5hCjvHtFnX0ZX8mOAffjWLqzb9g0BV4NYIyfsJfTgbTG1Yxa/q
 d9bYtUNf1UnnAwbRePM5UWHPtax7U5GMcOEYi4jLaMLms+A3vUmF9oeGtVAJvlKazyvMXXWwib
 K8LwWquF24VoiKoJW839kOEPQfwcU+1VU5m6VkX6lPWoJ7J7jxvxOR4zZQPltGLO1pSPXo/J0c
 1ijwDPkMpCwR+O72gHHEVKN7el8onVm5+IE3sNcycsgpkQdhEbIEu/UO0Ki/tVFqaB3Bj2kAxt
 CO0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 48/55] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Wed, 25 Mar 2020 06:33:27 -0700
Message-ID: <20200325133334.19346-49-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

Currently Driver probe continues with a warning message when it
fails to get the proper multitouch object configurations like
TouchScreen resolution.

But Driver probe should fail in case of above scneario because it
will not behave as expected without the proper touchscreen
configurations.

This commit modifies mxt_initialize_input_device() to return error
when it fails to get the proper touch screen configurations.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 069a532bd0b2..ed357e958f07 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2761,15 +2761,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
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

