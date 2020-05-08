Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EF31CA343
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgEHF7I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:08 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:45906 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgEHF7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:07 -0400
IronPort-SDR: kd2aHmj3S5MtHjs5/Y3KvnLZ3qZnvdYSKtn8Sipzo6oY0Q2B3k8tPkhOX6XtVIZO/GKZvDahP8
 BeCFAiRC4TtI7YkeJrbLmcVi+gRnmWSjrmGlEPO1bIq8RvTpipyPJBpkBEdmiu6rbE5O5YDP5d
 imz4L2K8V6aoD9ko5RVcxEML7RCKDheY8NdTKiQrmsPxL7vbSOJrJacfNba4ugoCfwWyx+B2FF
 8yflF2KMDQriBPWyjNxIzVwvpD//i/rxcsoCHFgiR+h31ppHxsmrStb6fxp8ZGPMRsRZR+IZqG
 vxI=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48710641"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:06 -0800
IronPort-SDR: n7cFua7QuikEzDD4KAs4w9QXmKbbTSm0kImUI6TqaYGu54Wx/g73pXxFjrKfjUU05Fj9Nkg93J
 s6CIQwZy+ukF5mmnmmOXIjfGEh5wcfMqDXY9v+YXnsPqWT7jInihLmGrWjCZEBNHe5+cPXp6zM
 YjQ7lJ/FxbVqRqtoz20/Ah2n0M5PppgONTfH3FBOzKscXy837AbCpc5ag9+nV6M20u2zOkmhdt
 XcxT+qSoRoShU+vIusp0MguBJluS4H4IrS6+zKoHjqNSiy1XgWZuRvd5xphpvx3FEyCh7MPpTV
 dzY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
Date:   Thu, 7 May 2020 22:56:33 -0700
Message-ID: <20200508055656.96389-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The path of enabling the IRQ in the probe function is not safe in level
triggered operation, if it was already powered up and there is a message
waiting on the device (eg finger down) because the object table has not yet
been read. This forces the ISR into a hard loop.

Delay enabling the interrupt until it is first needed, by set flag
IRQ_NOAUTOEN.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
CC: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 7c9a738e633a..ab4eceac8fe7 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3822,6 +3822,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
+	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, mxt_interrupt, IRQF_ONESHOT,
 					  client->name, data);
@@ -3831,17 +3832,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
+		enable_irq(data->irq);
+
 		error = mxt_probe_regulators(data);
 		if (error)
 			return error;
+
+		disable_irq(data->irq);
 	} else if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
-	disable_irq(data->irq);
-
 	error = mxt_initialize(data);
 	if (error)
 		return error;
-- 
2.17.1

