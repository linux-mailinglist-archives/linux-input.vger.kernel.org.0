Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0922C1CA353
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgEHF7m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:42 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38765 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbgEHF7l (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:41 -0400
IronPort-SDR: KdiCdzezZaBxyLhG/IRkyp8tax5lEXC0jm1F/wlimpaznFifHV8LlyENWgXNnhzjdhqTdZuGG0
 3/21U82N95o2E/Bq9DDBSw7kbDUKF+vy+/SFts5sxJ3yokTPVsHLVGPe1WjNJXfWWWaoII+Fx6
 a7f37fIsT+jHtWvnR44CC2lcwLqhdX16mANSDfb2Fs/Us+OrdJfakdyzO0UlvcI5NMfvxOu9Xr
 OyBsmq0HFJF6w/wE77SKiOzyrw0DbnAH7rQSiWQvee3jZRAYtEbEJI1s+aeeceft9jCnPU1BpJ
 vLY=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670133"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:38 -0800
IronPort-SDR: r/Rv/h0cRyyuPc29rcGtKYaaxVbI8fjHmNLO3O0xcDBznkKIV4SszxtVpm1089kNZ9o+7sjPcn
 CV/9/0w7MTJuWRNuOpjULMI0Pxy8hzps20cSoSHEOSCy3yQawoN9EwOMKD+UyN7u1TqlT5kcbP
 EFv5J+u+t0pl64ppMB5HbY8xfDbc0ZM+zudrW4UWjcvb1XXELstpdkqDbFU3UJPSF/s3018NMP
 VSphJ7hbndwrLpONmjm5HDcRu1ypKym4ky1sCtTtkqtW2U+OlnNypEknJ5R2dfRWw1C3hIEIAv
 3GM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 42/56] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Thu, 7 May 2020 22:56:42 -0700
Message-ID: <20200508055656.96389-43-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index ceb14b4a8d4d..3ffd49b383f4 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4105,6 +4105,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

