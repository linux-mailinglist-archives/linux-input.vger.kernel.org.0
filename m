Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6A8418A12
	for <lists+linux-input@lfdr.de>; Sun, 26 Sep 2021 17:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhIZP5u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Sep 2021 11:57:50 -0400
Received: from smtpq4.tb.ukmail.iss.as9143.net ([212.54.57.99]:52528 "EHLO
        smtpq4.tb.ukmail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231913AbhIZP5u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Sep 2021 11:57:50 -0400
X-Greylist: delayed 1032 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 Sep 2021 11:57:49 EDT
Received: from [212.54.57.97] (helo=smtpq2.tb.ukmail.iss.as9143.net)
        by smtpq4.tb.ukmail.iss.as9143.net with esmtp (Exim 4.86_2)
        (envelope-from <gareth.randall@virgin.net>)
        id 1mUWF3-0000Nz-KT
        for linux-input@vger.kernel.org; Sun, 26 Sep 2021 17:39:01 +0200
Received: from [212.54.57.106] (helo=csmtp2.tb.ukmail.iss.as9143.net)
        by smtpq2.tb.ukmail.iss.as9143.net with esmtp (Exim 4.86_2)
        (envelope-from <gareth.randall@virgin.net>)
        id 1mUWF2-00019j-5m
        for linux-input@vger.kernel.org; Sun, 26 Sep 2021 17:39:00 +0200
Received: from Gareths-MacBook-Air.local ([94.175.123.86])
        by cmsmtp with ESMTPA
        id UWF1m90CFVzDmUWF2m1frI; Sun, 26 Sep 2021 17:39:00 +0200
X-Originating-IP: [94.175.123.86]
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=FqxmQ0nq c=1 sm=1 tr=0 ts=61509414 cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=7QKq2e-ADPsA:10 a=f6pUZMUfAAAA:8 a=kEQ3OyWAOIF62NgwlTYA:9
 a=QEXdDO2ut3YA:10 a=eZImKStj3dtCS-zw9-0K:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1632670740;
        bh=cC8EwKWmF/dwsid5scoueIMMONnFBzPYtoxnTDKjNrU=;
        h=From:Subject:To:Date;
        b=DTJtiatt/y8e3/VE/tY7xfu/GBlO4V92lFqw6uc7sVZ41k1TKMCox7aWuKksOK9f5
         Or3AQLhJFF1/xUorLORr1GP9WGB27czdueRGozZSJLPQxSjm0dvnZf3R+tvPW9eBDh
         aoyM/oRKwVC6OZ67tNNYhUYQvpF9M/4Kc9rXvahOk4Yxf3OiJn4/Z2rSzDBNe4PKln
         zs90GUlBdvgIPiPG/6x/OGWJFtrJ14dyum7WTSt7bLDL+UoqWoVaUSfIx/IbdJFvqb
         NRVc1Dy2N1JzsQMprRyLEaSXI3HZO6WgIvB7Wx9SpQpDcjRf4iWocXfL8D0Z6f6lub
         q+8TyweudFfTg==
From:   Gareth Randall <gareth.randall@virgin.net>
Subject: [PATCH] Add support for touch screens using the General Touch ST6001S
 controller.
To:     linux-input@vger.kernel.org
Message-ID: <173fac72-0e7d-05f9-ff6e-5fc846ad1840@virgin.net>
Date:   Sun, 26 Sep 2021 16:38:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCtTrBbkZTQ9O+d4cEfxjso1UkYumjTGVh36tjZaIvGKIObJ2CtNUm+wv8ahdvDuJwVsVQLOXpQnglGua8ag59epLF7UaEKbYu65KXBLBKDMwNyoLqiU
 HqNvXZGzlAS5GOeKd/YsWRa5r+yRt5pltbtildn13VYANike9nnYIgAApi3tzv+/dUAk3hAKSsNyi9cLKiWXqd2kOoF9YAFueuKrne9+te1b8TaYI2nNqTIV
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for touch screens using the General Touch ST6001S 
controller, as found in the GPEG model AOD22WZ-ST monitor. This 
controller can output the ELO 10-byte protocol, but requires different 
initialisation.

Signed-off-by: Gareth Randall <gareth@garethrandall.com>

----------------

I would like some advice from the contributors of this list:

Where my patch contains the following lines, I have set them to match a 
22 inch screen (GPEG model AOD22WZ-ST) that I have been working on, 
based on me moving my finger and watching the position of the mouse 
pointer in X-windows. Are the maintainers satisfied with this or should 
there also be an option to specify them as kernel parameters?

+       // Values taken from a GPEG model AOD22WZ-ST monitor
+       input_set_abs_params(dev, ABS_X, 1365, 5828, 0, 0);
+       // max and min inverted because screen axis is inverted
+       input_set_abs_params(dev, ABS_Y, 5013, 2260, 0, 0);

Note also that the /bin/inputattach command must be extended to support 
using the newly added elo->id value (id=4). I can post my changes to 
this to assist those reviewing this patch but have not here as I'm 
trying to stick to the patch email format.

Thank you for your consideration.

----------------

diff --git a/drivers/input/touchscreen/elo.c 
b/drivers/input/touchscreen/elo.c
index 96173232e53f..8c15e0eea6b4 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -44,6 +44,8 @@ MODULE_LICENSE("GPL");
  #define ELO10_ACK_PACKET	'A'
  #define ELI10_ID_PACKET		'I'

+#define ELO_GT_INIT_PACKET	"\001XfE\r"
+
  /*
   * Per-touchscreen data.
   */
@@ -201,6 +203,7 @@ static irqreturn_t elo_interrupt(struct serio *serio,

  	switch (elo->id) {
  	case 0:
+	case 4:
  		elo_process_data_10(elo, data);
  		break;

@@ -255,6 +258,54 @@ static int elo_command_10(struct elo *elo, unsigned 
char *packet)
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
+		return -1;
+
+	__set_bit(INPUT_PROP_DIRECT, dev->propbit);
+
+	// Values taken from a GPEG model AOD22WZ-ST monitor
+	input_set_abs_params(dev, ABS_X, 1365, 5828, 0, 0);
+	// max and min inverted because screen axis is inverted
+	input_set_abs_params(dev, ABS_Y, 5013, 2260, 0, 0);
+
+	dev_info(&elo->serio->dev,
+		 "GeneralTouch ST6001S touchscreen");
+
+	return 0;
+}
+
  static int elo_setup_10(struct elo *elo)
  {
  	static const char *elo_types[] = { "Accu", "Dura", "Intelli", 
"Carroll" };
@@ -361,6 +412,13 @@ static int elo_connect(struct serio *serio, struct 
serio_driver *drv)
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

