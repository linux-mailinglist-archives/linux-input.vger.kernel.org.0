Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4152EE8273
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfJ2HXh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:23:37 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:7825 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733270AbfJ2HWn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:22:43 -0400
IronPort-SDR: a9UXXKolNigrRbPZKijMcgRvc7KjwdDYgRK60jVXaqDg3nJ43hVL0RWfXfZyshIqVG8ELxyPIF
 RXrB19nlH2YuW8IcKNFbwVsel6zZGNrObNOJeGZSO5LAA0d++rBFTT3MAk4pPSBCgTdK6AkZSi
 OhzLbuZikQyVLsoLQL0xweokrfF3qbYq5gaELM+N4H8LJM+3gPSVCbYYzO6TNgvLpp2Rrb6x77
 spDWq1+Ivb4oPhqjZwWGTXM2z7UT8aFYtF+ZXJvmlzQITlq0VX7mhc+lkvLlRQdyRBF6qUs9fy
 wUc=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="44509449"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:22:42 -0800
IronPort-SDR: eIigi58hODyTmNYYYSbzm5ZY8hN1lCTewWSRNKOC3DF9+8Omx+MqYxF0+ZRaKyEZaBFgijXcrs
 1e8Pf4wXHKY87JlzH39fAMO8XhEYGLlebVE3vpqOS9YRiKhFdPb+bo+a8EHxVz+mL+htmYRvvr
 nNyxjq4336DXYnSSJ16rlad/Gnf9vm3TaG9tXh/CDSkhUMifl1JkQ82USvj173lv8M5B2tP3kp
 sQvPBS4GxrZpxWxiZZhioQQf3ZNh41eHSk+ez9es+cMx9/fwl30zTDhK6hUJjpI5kXCCh/amnp
 cas=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 41/48] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Tue, 29 Oct 2019 16:20:03 +0900
Message-ID: <20191029072010.8492-42-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
index d05ead2e605b..e02097193229 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2762,15 +2762,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
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

