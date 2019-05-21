Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4CA325035
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbfEUN16 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33610 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728249AbfEUN16 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:58 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C3E86356E5;
        Tue, 21 May 2019 13:27:57 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B9FED6109F;
        Tue, 21 May 2019 13:27:51 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 07/10] Input: elan_i2c - handle physical middle button
Date:   Tue, 21 May 2019 15:27:09 +0200
Message-Id: <20190521132712.2818-8-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 21 May 2019 13:27:57 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some models have a middle button, we should export it as well.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

new in v2

Is it really worth having a separate property, or should we just expose a
middle button whatsoever?
---
 drivers/input/mouse/elan_i2c_core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 53cac610ba33..7ff044c6cd11 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -99,6 +99,7 @@ struct elan_tp_data {
 	u8			max_baseline;
 	bool			baseline_ready;
 	u8			clickpad;
+	bool			middle_button;
 };
 
 static int elan_get_fwinfo(u16 ic_type, u16 *validpage_count,
@@ -420,6 +421,9 @@ static int elan_query_device_parameters(struct elan_tp_data *data)
 	if (device_property_read_bool(&client->dev, "elan,clickpad"))
 		data->clickpad = 1;
 
+	if (device_property_read_bool(&client->dev, "elan,middle-button"))
+		data->middle_button = true;
+
 	return 0;
 }
 
@@ -958,8 +962,9 @@ static void elan_report_absolute(struct elan_tp_data *data, u8 *packet)
 			finger_data += ETP_FINGER_DATA_LEN;
 	}
 
-	input_report_key(input, BTN_LEFT, tp_info & 0x01);
-	input_report_key(input, BTN_RIGHT, tp_info & 0x02);
+	input_report_key(input, BTN_LEFT,   tp_info & BIT(0));
+	input_report_key(input, BTN_MIDDLE, tp_info & BIT(2));
+	input_report_key(input, BTN_RIGHT,  tp_info & BIT(1));
 	input_report_abs(input, ABS_DISTANCE, hover_event != 0);
 	input_mt_report_pointer_emulation(input, true);
 	input_sync(input);
@@ -1091,10 +1096,13 @@ static int elan_setup_input_device(struct elan_tp_data *data)
 
 	__set_bit(EV_ABS, input->evbit);
 	__set_bit(INPUT_PROP_POINTER, input->propbit);
-	if (data->clickpad)
+	if (data->clickpad) {
 		__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
-	else
+	} else {
 		__set_bit(BTN_RIGHT, input->keybit);
+		if (data->middle_button)
+			__set_bit(BTN_MIDDLE, input->keybit);
+	}
 	__set_bit(BTN_LEFT, input->keybit);
 
 	/* Set up ST parameters */
-- 
2.21.0

