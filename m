Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE54B1CA363
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgEHGAI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:08 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38783 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgEHGAH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 02:00:07 -0400
IronPort-SDR: wsVfL+JnYvAfl2qW0+bU5+1GcnnkQwfWKg/SJc0DbqfdlC1JOJu6uvSW1oWaXGtY7CIIa+liiv
 cmOHdzSm0+Ut2sV8Mf37+1/tDrEJ+68yjoOolf46JRRq8hKWi1a3pFnYzMzCdf8ps4j03MbOry
 I9wI66iaboRu5yTILUGTmh6qyHhuFf5/iN2+D1cUjNi38WNPzJNyAHC0nu/vVEHIe5E1AcZg8t
 d8m7SY5tNtsrfJFnMS4/Rx3J+K0T1aGRJ52wsYf9DuSzXaNe7VkIJZW/6Jn+6B9vDMuC8/U1Ad
 jGk=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670162"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 22:00:05 -0800
IronPort-SDR: pN5JCXnsKNku0Kd1SHp203+hkKpRUdwysAHuZpEcV5W8OZldcta3DBfZZUTJfuWjB54KoEKlwp
 RNr6Gt0Ot2BISO3vlhvW3o3tCYTdqRjW40vd4KR3IjP7X2D3J2ZqeSgpx3xX+EyDjFBDwJZ2Gp
 UA5YJenPPW8bMtCrOzP0UvqMpRhKPYXrqTUh4nmB6up1tQouQJ2JI3zkH5AIbEN3vs4EDORmfM
 6AUI+99w3befZ5e55IpFaA2TzbzJCxOd70jZFlOgLM4GlId5bxiuO9/XQc7pue06tSXSiiSekg
 yJQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 49/56] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Thu, 7 May 2020 22:56:49 -0700
Message-ID: <20200508055656.96389-50-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index 83fa2caddeab..92701bf5291f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2748,15 +2748,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
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

