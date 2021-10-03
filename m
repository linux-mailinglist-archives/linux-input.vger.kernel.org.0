Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F416420428
	for <lists+linux-input@lfdr.de>; Sun,  3 Oct 2021 23:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhJCV4L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Oct 2021 17:56:11 -0400
Received: from smtpq1.tb.ukmail.iss.as9143.net ([212.54.57.96]:60844 "EHLO
        smtpq1.tb.ukmail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231583AbhJCV4L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 3 Oct 2021 17:56:11 -0400
Received: from [212.54.57.110] (helo=csmtp6.tb.ukmail.iss.as9143.net)
        by smtpq1.tb.ukmail.iss.as9143.net with esmtp (Exim 4.86_2)
        (envelope-from <gareth.randall@virgin.net>)
        id 1mX9R8-0003R0-8X
        for linux-input@vger.kernel.org; Sun, 03 Oct 2021 23:54:22 +0200
Received: from Gareths-MacBook-Air.local ([94.175.123.86])
        by cmsmtp with ESMTPA
        id X9R8mAQvgRdC9X9R8moClu; Sun, 03 Oct 2021 23:54:22 +0200
X-Originating-IP: [94.175.123.86]
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=Kp8uZUaN c=1 sm=1 tr=0 ts=615a268e cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=8gfv0ekSlNoA:10 a=f6pUZMUfAAAA:8 a=AQyDKTjgcIxoYc0FscwA:9
 a=QEXdDO2ut3YA:10 a=eZImKStj3dtCS-zw9-0K:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1633298062;
        bh=0hXhVKqtDgwXg8tz6rLAba6SdbyuvqmGa6REw481mzA=;
        h=To:From:Subject:Date;
        b=kNJ8CtS7MswJLfUSkAoHER2FvB1rl9RaHOun1sx+j0fubfTo8hvUPeJQbCiUBdEK7
         wP5/Shfj+Fc1RC3Ax6BHtzNKIjwdRIQP1eMLRWLSDQggDGxo/Z7A0BygWM7NBnMtnW
         8Sks0zHiPcTI2bpK3MguyEuQ86Wt+vRyFcy1WbvxbwVw4BtY4LYoi+Da50W+mkZ4Vq
         nM8OBJvTWk/C1LWubdNk28HqxdquBvi9K0y66v93iu4TBGXeqECMTQNiA7uuBLh6sD
         w5qpUy8mad55S4UcDzj5OTwizCpLp54qev9pyeDgsTKTKvMOEUk4FHa3AnijwJdZxE
         2/g5K/+cboVOw==
To:     linux-input@vger.kernel.org
From:   Gareth Randall <gareth.randall@virgin.net>
Subject: [PATCH RESEND 1/1] Add support for touch screens using the General
 Touch ST6001S controller.
Message-ID: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
Date:   Sun, 3 Oct 2021 22:54:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMW9v47gqOTburMQ+zCocAdArSZkkiI3p0cYrGWuZe/wW+E4xUVdXDvHZcfbUmqgXOYmqbQNaKEtKPbBC7cQo7mgdwI+h7za/UmlN5pHUJ5ubMcUC+0U
 cO/gGbdwi/tO2fbaN01WJh6NH8ySWSosW3/xLnE2ytzVVgMWhuu0y4cNC1vtr9FpTGqzQDJq81BXRUbPOPZ54PPvmgZYPZkrW45IcI/Sn7TgdTN1jRWjIkKA
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for touch screens using the General Touch ST6001S
controller, as found in the GPEG model AOD22WZ-ST monitor.
This controller can output the ELO 10-byte protocol,
but requires different initialisation.

Signed-off-by: Gareth Randall <gareth@garethrandall.com>
---
  drivers/input/touchscreen/elo.c | 58 +++++++++++++++++++++++++++++++++
  1 file changed, 58 insertions(+)

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
-- 
2.27.0
