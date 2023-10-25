Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EC27D713C
	for <lists+linux-input@lfdr.de>; Wed, 25 Oct 2023 17:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344148AbjJYPvO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Oct 2023 11:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343780AbjJYPvN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Oct 2023 11:51:13 -0400
Received: from csmtpq1-prd-nl1-vmo.edge.unified.services (csmtpq1-prd-nl1-vmo.edge.unified.services [84.116.50.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE74132
        for <linux-input@vger.kernel.org>; Wed, 25 Oct 2023 08:51:09 -0700 (PDT)
Received: from csmtp6-prd-nl1-vmo.nl1.unified.services ([100.107.82.136] helo=csmtp6-prd-nl1-vmo.edge.unified.services)
        by csmtpq1-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <gareth.randall@virgin.net>)
        id 1qvg9y-00AUOT-FS
        for linux-input@vger.kernel.org; Wed, 25 Oct 2023 17:51:06 +0200
Received: from [192.168.0.10] ([94.175.123.86])
        by csmtp6-prd-nl1-vmo.edge.unified.services with ESMTPA
        id vg9xqdWmOQDxRvg9yqajph; Wed, 25 Oct 2023 17:51:06 +0200
X-SourceIP: 94.175.123.86
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=MPKm2uVl c=1 sm=1 tr=0 ts=6539396a cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=f6pUZMUfAAAA:8 a=ebxQGvp79oVuaUAvqBkA:9
 a=QEXdDO2ut3YA:10 a=d852eiLty5LaP4K1k4iV:22 a=eZImKStj3dtCS-zw9-0K:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1698249066;
        bh=QwhJX5wPM3BKbhoVtSycZ9IQ1as6HhunIFqpAxtEoIU=;
        h=Date:From:Subject:To:Cc;
        b=IWXxhhp1w5Rc6kiBOFyzkoSFdj7QzMECB0r6/kjYz0bvW01HpH3kynq0zmzopXCIq
         TQ0tjwVGQlq25zh3IRFWYHC9qUHuBBap7qYCCTfNJxAYk0XbIV/p9NSTGmOLGhXl7A
         LjBZ3wGFde8PlFejFT1NlF+MpSrOSQHNavevMveQz5rlzB+Bqxf2/RHWebcRJLHfzC
         mE+rTfZlb7nI6dUcQDHTy+b4lQTSgorSijnD2KUF+u/jFRHKAi//gUCCIW5aqAimYz
         rZEittAjT3xT65PXVCW7h8pXryPR24VZZrUSrC7mQQ/FyfjLFXymVoqSvwqJ2WpyMs
         tQQGU7qr/fa1Q==
Message-ID: <4c792c2e-9de3-4faa-9948-47ddae77640e@virgin.net>
Date:   Wed, 25 Oct 2023 16:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From:   Gareth Randall <gareth.randall@virgin.net>
Subject: [PATCH] Add support for touch screens using the General Touch ST6001S
 controller.
To:     Benjamin Tissoires <bentiss@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE6m2Zh0XOgpzDX2TPPGFt/x2fCJ/9V1DkRUC1Zpy1bQYZ8tfEyRpFbwLrd+QIq+Wb7dTWKnD0+wBQKQM+Rh1Pi11yKiKt8m2l8Gk4rNZ7X9APMKJMPd
 Ejz4IOI9WCWvODtFlhIA29vpQErqcpuP9eGfkyzK5WohdK3g2/1+ROn/zonnI+IPCRMUruUkL1QyfbgTzroGgjJrz5co9922839CWWf/E4O4ll9zkJ1OLMFA
 0OMsUSCEiiT/cq3uRvvoorzRixaHyB2ppN6dsbrVXtQ=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for touch screens using the General Touch ST6001S controller,
as found in the GPEG model AOD22WZ-ST monitor. This controller can output
the ELO 10-byte protocol, but requires different initialisation.

Signed-off-by: Gareth Randall <gareth@garethrandall.com>
---
  drivers/input/touchscreen/elo.c | 81 ++++++++++++++++++++++++++++++++-
  1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
index 96173232e53f..b233869ffa2a 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -26,6 +26,27 @@ MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
  MODULE_DESCRIPTION(DRIVER_DESC);
  MODULE_LICENSE("GPL");

+static uint gt_abs_x_min;
+module_param(gt_abs_x_min, uint, 0444);
+MODULE_PARM_DESC(gt_abs_x_min, "abs_x min value in General Touch mode (default: 0)");
+
+static uint gt_abs_x_max = 4095;
+module_param(gt_abs_x_max, uint, 0444);
+MODULE_PARM_DESC(gt_abs_x_max, "abs_x max value in General Touch mode (default: 4095)");
+
+static uint gt_abs_y_min;
+module_param(gt_abs_y_min, uint, 0444);
+MODULE_PARM_DESC(gt_abs_y_min, "abs_y min value in General Touch mode (default: 0)");
+
+static uint gt_abs_y_max = 4095;
+module_param(gt_abs_y_max, uint, 0444);
+MODULE_PARM_DESC(gt_abs_y_max, "abs_y max value in General Touch mode (default: 4095)");
+
+static bool gt_mode_override;
+module_param(gt_mode_override, bool, 0444);
+MODULE_PARM_DESC(gt_mode_override, "force the use of General Touch mode (default: false)");
+
+
  /*
   * Definitions & global arrays.
   */
@@ -44,6 +65,8 @@ MODULE_LICENSE("GPL");
  #define ELO10_ACK_PACKET	'A'
  #define ELI10_ID_PACKET		'I'

+#define ELO_GT_INIT_PACKET	"\001XfE\r"
+
  /*
   * Per-touchscreen data.
   */
@@ -201,6 +224,7 @@ static irqreturn_t elo_interrupt(struct serio *serio,

  	switch (elo->id) {
  	case 0:
+	case 4:
  		elo_process_data_10(elo, data);
  		break;

@@ -255,6 +279,50 @@ static int elo_command_10(struct elo *elo, unsigned char *packet)
  	return rc;
  }

+/*
+ * Initialise the General Touch ST6001S controller.
+ */
+static int elo_command_10_gt(struct elo *elo)
+{
+	int rc = -1;
+	int i;
+	unsigned char *packet = ELO_GT_INIT_PACKET;
+
+	mutex_lock(&elo->cmd_mutex);
+
+	serio_pause_rx(elo->serio);
+	init_completion(&elo->cmd_done);
+	serio_continue_rx(elo->serio);
+
+	for (i = 0; i < (int)strlen(packet); i++) {
+		if (serio_write(elo->serio, packet[i]))
+			goto out;
+	}
+
+	wait_for_completion_timeout(&elo->cmd_done, HZ);
+	rc = 0;
+
+ out:
+	mutex_unlock(&elo->cmd_mutex);
+	return rc;
+}
+
+static int elo_setup_10_gt(struct elo *elo)
+{
+	struct input_dev *dev = elo->dev;
+
+	if (elo_command_10_gt(elo))
+		return -EIO;
+
+	input_set_abs_params(dev, ABS_X, gt_abs_x_min, gt_abs_x_max, 0, 0);
+	input_set_abs_params(dev, ABS_Y, gt_abs_y_min, gt_abs_y_max, 0, 0);
+
+	dev_info(&elo->serio->dev,
+		 "GeneralTouch ST6001S touchscreen");
+
+	return 0;
+}
+
  static int elo_setup_10(struct elo *elo)
  {
  	static const char *elo_types[] = { "Accu", "Dura", "Intelli", "Carroll" };
@@ -273,7 +341,7 @@ static int elo_setup_10(struct elo *elo)

  	dev_info(&elo->serio->dev,
  		 "%sTouch touchscreen, fw: %02x.%02x, features: 0x%02x, controller: 0x%02x\n",
-		 elo_types[(packet[1] -'0') & 0x03],
+		 elo_types[(packet[1] - '0') & 0x03],
  		 packet[5], packet[4], packet[3], packet[7]);

  	return 0;
@@ -332,12 +400,16 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)

  	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
  	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
+	__set_bit(INPUT_PROP_DIRECT, input_dev->propbit);

  	serio_set_drvdata(serio, elo);
  	err = serio_open(serio, drv);
  	if (err)
  		goto fail2;

+	if (gt_mode_override)
+		elo->id = 4;
+
  	switch (elo->id) {

  	case 0: /* 10-byte protocol */
@@ -361,6 +433,13 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)
  		input_set_abs_params(input_dev, ABS_X, 0, 255, 0, 0);
  		input_set_abs_params(input_dev, ABS_Y, 0, 255, 0, 0);
  		break;
+
+	case 4: /* 10-byte protocol with General Touch initialisation */
+		if (elo_setup_10_gt(elo)) {
+			err = -EIO;
+			goto fail3;
+		}
+		break;
  	}

  	err = input_register_device(elo->dev);
-- 
2.27.0
