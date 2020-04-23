Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835041B5920
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 12:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgDWKZZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Apr 2020 06:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726420AbgDWKZY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Apr 2020 06:25:24 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB614C035494;
        Thu, 23 Apr 2020 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587637520;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=p51RExXDzM8r8Gjav8uWWUQY9kiVhGtyvXKrvQxO//Q=;
        b=fNjqh2xtp3AN3tcm7ZpP4uBBf4gq1+Mk0A7Rqblq79jkRsPwK/PlRfhe7tR8RSYaPG
        E/zzM4HfBLvK9wOlVKn212IO78eHgGVCc/BhvX4+D2X8rFmd8615uxroBKKb8MynwbK0
        6pzc76w4fbiNBOa4SgEE6ctriEaBPqPfHSW4Ri0AaOdQrIawZspE2Z+NIwfphkqV98Aa
        ozUjTCW/e7Pvg62jYH/Zixv1We4U4kNXl+evEcfTpbkvuYsLXcMPmBhqIIsxSSr02OTY
        48wd5pf3HKWPSMAz+fNVCafxtr6ud6I+7SVFUMmU24cxpzz5fUHT+19fOWadB3AeHQnx
        KXmg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nf3AC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3NAPE8nU
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 23 Apr 2020 12:25:14 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] Input: mms114 - add extra compatible for mms345l
Date:   Thu, 23 Apr 2020 12:24:30 +0200
Message-Id: <20200423102431.2715-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

MMS345L is another first generation touch screen from Melfas,
which uses mostly the same registers as MMS152.

However, there is some garbage printed during initialization.
Apparently MMS345L does not have the MMS152_COMPAT_GROUP register
that is read+printed during initialization.

  TSP FW Rev: bootloader 0x6 / core 0x26 / config 0x26, Compat group: \x06

On earlier kernel versions the compat group was actually printed as
an ASCII control character, seems like it gets escaped now.

But we probably shouldn't print something from a random register.

Add a separate "melfas,mms345l" compatible that avoids reading
from the MMS152_COMPAT_GROUP register. This might also help in case
there is some other device-specific quirk in the future.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Adding an extra compatible just for a log message that looks weird
might be a bit exaggerated, I'm not sure. But so far I got the impression
that it's better to add separate compatibles if devices behave slightly
different (in case more differences are discovered later).

Alternatively we could also:

  - Remove the "Compat group:" from the log message
    (I'm not sure how useful it is since it's just printed but nothing
     is done with it...)

  - Just accept that we might be reading from some invalid register
    on MMS345L (It doesn't seem to affect functionality at the moment...)

I just thought we should discuss this before I upstream the patch
that adds the touchscreen to the device tree of my board.
---
 drivers/input/touchscreen/mms114.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 2ef1adaed9af..5bdf4ac1a303 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -54,6 +54,7 @@
 enum mms_type {
 	TYPE_MMS114	= 114,
 	TYPE_MMS152	= 152,
+	TYPE_MMS345L	= 345,
 };
 
 struct mms114_data {
@@ -250,6 +251,15 @@ static int mms114_get_version(struct mms114_data *data)
 	int error;
 
 	switch (data->type) {
+	case TYPE_MMS345L:
+		error = __mms114_read_reg(data, MMS152_FW_REV, 3, buf);
+		if (error)
+			return error;
+
+		dev_info(dev, "TSP FW Rev: bootloader 0x%x / core 0x%x / config 0x%x\n",
+			 buf[0], buf[1], buf[2]);
+		break;
+
 	case TYPE_MMS152:
 		error = __mms114_read_reg(data, MMS152_FW_REV, 3, buf);
 		if (error)
@@ -287,8 +297,8 @@ static int mms114_setup_regs(struct mms114_data *data)
 	if (error < 0)
 		return error;
 
-	/* MMS152 has no configuration or power on registers */
-	if (data->type == TYPE_MMS152)
+	/* Only MMS114 has configuration and power on registers */
+	if (data->type != TYPE_MMS114)
 		return 0;
 
 	error = mms114_set_active(data, true);
@@ -597,6 +607,9 @@ static const struct of_device_id mms114_dt_match[] = {
 	}, {
 		.compatible = "melfas,mms152",
 		.data = (void *)TYPE_MMS152,
+	}, {
+		.compatible = "melfas,mms345l",
+		.data = (void *)TYPE_MMS345L,
 	},
 	{ }
 };
-- 
2.26.2

