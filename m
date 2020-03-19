Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03E418BA1E
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgCSPCs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:02:48 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:16159 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727800AbgCSPCr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:02:47 -0400
IronPort-SDR: 8LOk2rvlUau9xVpE4UgLuH4EVmEgfWFWCabIs6xpy4XJTF0i7Jy69R1Q/3JvXwVeEN49pjWYNi
 XSeYFHaLDarli/nessTwp55C8nYaKMyATkskc0vQ8FcTb5YHJjVqT89H7O6jTfatAEoTLnlPDf
 5g6ANQUemIJUYwGnmJgz6z3Z2PWpHqj17nHmrcFb7i+cYK38/oYPhVucD7NBXJsxpR90ammF2z
 A5i03E3z9e8zIeKWzITMgUfc4dxT7s8Id/rXxNgm/+XIgX8shbcDX1SmV1XdX872aw+HQefCdZ
 fJ4=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850388"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:02:46 -0800
IronPort-SDR: 8GvjBJLQVkveyXDY6aYi3uRO5ZOmThxV3xdzi8BtfmsoQCcuN/z6EXXsB3lz62mWbuIlBnORh2
 j6RL2anoHVmwPAZmobBV1B9vVdishJrcyNIjuf6C4JdtSkK88bz2COZBfma96SwHOxUsNzDZ6V
 LWBPlFhniWt2y1b23PJ92jrVeOt9rn6PAuixscJ4ZwZR6acJC3VcPMQYQtfIF4Sb/18I5BZVT0
 BirRgOepIQZyD8GOjWcEXRilz2m6vh7zfQZkohJkD3jHQ6ffp87HKsdqztL5bGa2jvRr+7pr93
 09U=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 37/52] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Thu, 19 Mar 2020 08:00:01 -0700
Message-ID: <20200319150016.61398-38-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>

In case of attached display, the touchpanel reset is controlled
via imx gpio's from  atmel driver and the delay between
touchpanel reset and the time at which the chip becomes capable to
communicate with the host processor, has be taken care.

However in case of detachable displays, the touchpanel reset is
controlled via a deserializer gpio which is triggered just before
the atmel driver is probed.The delay between touchpanel reset and
the time at which the chip becomes capable to communicate (as
specified in datasheet) was not being accounted for. This patch
introduces that delay.

Signed-off-by: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index fd3db4f8d55d..edffdec0d2a2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4110,6 +4110,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
+	} else {
+		dev_dbg(&client->dev,
+			"atmel reset pin not found in device tree");
+		msleep(MXT_RESET_TIME);
 	}
 
 	error = mxt_initialize(data);
-- 
2.17.1

