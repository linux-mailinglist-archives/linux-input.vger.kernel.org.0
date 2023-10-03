Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED527B7149
	for <lists+linux-input@lfdr.de>; Tue,  3 Oct 2023 20:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240871AbjJCSrk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Oct 2023 14:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240844AbjJCSrk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Oct 2023 14:47:40 -0400
X-Greylist: delayed 892 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 03 Oct 2023 11:47:30 PDT
Received: from dsmtpq3-prd-nl1-vmo.edge.unified.services (dsmtpq3-prd-nl1-vmo.edge.unified.services [84.116.6.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD3BC4
        for <linux-input@vger.kernel.org>; Tue,  3 Oct 2023 11:47:30 -0700 (PDT)
Received: from csmtpq2-prd-nl1-vmo.edge.unified.services ([84.116.50.37])
        by dsmtpq3-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <gareth.randall@virgin.net>)
        id 1qnkCC-008cBp-54
        for linux-input@vger.kernel.org; Tue, 03 Oct 2023 20:32:36 +0200
Received: from csmtp6-prd-nl1-vmo.nl1.unified.services ([100.107.82.136] helo=csmtp6-prd-nl1-vmo.edge.unified.services)
        by csmtpq2-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <gareth.randall@virgin.net>)
        id 1qnkC9-007FQZ-0H
        for linux-input@vger.kernel.org; Tue, 03 Oct 2023 20:32:33 +0200
Received: from [192.168.0.10] ([94.175.123.86])
        by csmtp6-prd-nl1-vmo.edge.unified.services with ESMTPA
        id nkC8qfWXxQDxRnkC8qYXxN; Tue, 03 Oct 2023 20:32:32 +0200
X-SourceIP: 94.175.123.86
X-Authenticated-Sender: gareth.randall@virgin.net
X-Spam: 0
X-Authority: v=2.4 cv=MPKm2uVl c=1 sm=1 tr=0 ts=651c5e40 cx=a_exe
 a=mwdPpgLduwvwBeoi1XfOCA==:117 a=mwdPpgLduwvwBeoi1XfOCA==:17
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=f6pUZMUfAAAA:8 a=DxZ7rw7fAAAA:8
 a=Hg0ReaYwHaeSdjN8S7EA:9 a=QEXdDO2ut3YA:10 a=eZImKStj3dtCS-zw9-0K:22
 a=weECkG2Uvo6lX9pn7a99:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virgin.net;
        s=meg.feb2017; t=1696357952;
        bh=QA021kYyeaRrQL9rMk0gUQEEacEyoSqhmp8Tolgva0A=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To;
        b=STP8WblPraSeaGFDj8eAm8tUoiJ5qUbOl9w2jnBBgbVVnDdgdrGcvKCFZaFiNqe9n
         OIN0w+Gp+exZETClMQiS2e2dYsKwTExiTDAap17piS6NZphgXTEdxTfHhX+pkePHwo
         ljxntYS1LXydYLWL+cQxPPSQf3MWnSzaAliGFWBQQtwTNywt+hGcGGt2Vb8drbrMag
         i9MiO65Kd5lIYAofbIaPJu65H2PkMLiPI05kl69araA//IL2LWfplMMVGeJf6cMvwi
         UHIj6EQCDucrrRMhkJkEmGiAf08DHw4D3aGlCcWrpUDWeo0RHEwJNReW0HFhyZcTHn
         VTYpg7Wz6n1Mg==
Message-ID: <83a934eb-e1ee-fd79-33ee-76413be2e6ea@virgin.net>
Date:   Tue, 3 Oct 2023 19:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
From:   Gareth Randall <gareth.randall@virgin.net>
Subject: Re: [PATCH RESEND 1/1] Add support for touch screens using the
 General Touch ST6001S controller.
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
 <YYi8FvXkV5i9baoN@google.com>
In-Reply-To: <YYi8FvXkV5i9baoN@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfA1pgAzQOCN2M7ksvGeIFJq2E7e2z904shPhOTfzTRoqCfzPrn62fb0qYCEZOQlHx4XlQw3VVCTN8aRCfB+pKlYbC+JpbE6KeuUYMpXrBqwz28FS0B4s
 GNtW+fyXGBaPnQjH3Kfc1dDUa6JOVFKKIYX7l9fdOZ4Gkb3MEYQWLbLLCQBZ3Iohy6n2P5mxCsnewk+anjZ2zCxwy7nE+2lBOaC4vkdRzCxvFL26DOKyFjXR
 cIGyGjxNiwmNRWq43oB/tQ==
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thanks very much for the feedback. Apologies for the long delay in 
getting back to you on this. Updated patch is below, and apologies for 
the email layout. I've also added comments to your points in the quoted 
message.




Add support for touch screens using the General Touch ST6001S
controller, as found in the GPEG model AOD22WZ-ST monitor.
This controller can output the ELO 10-byte protocol,
but requires different initialisation.

Signed-off-by: Gareth Randall <gareth@garethrandall.com>

diff --git a/drivers/input/touchscreen/elo.c 
b/drivers/input/touchscreen/elo.c
index 96173232e53f..53ba056173df 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -26,6 +26,27 @@ MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
  MODULE_DESCRIPTION(DRIVER_DESC);
  MODULE_LICENSE("GPL");

+static uint gt_abs_x_min = 0;
+module_param(gt_abs_x_min, uint, S_IRUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(gt_abs_x_min, "abs_x min value in General Touch mode 
(default: 0)");
+
+static uint gt_abs_x_max = 4095;
+module_param(gt_abs_x_max, uint, S_IRUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(gt_abs_x_max, "abs_x max value in General Touch mode 
(default: 4095)");
+
+static uint gt_abs_y_min = 0;
+module_param(gt_abs_y_min, uint, S_IRUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(gt_abs_y_min, "abs_y min value in General Touch mode 
(default: 0)");
+
+static uint gt_abs_y_max = 4095;
+module_param(gt_abs_y_max, uint, S_IRUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(gt_abs_y_max, "abs_y max value in General Touch mode 
(default: 4095)");
+
+static bool gt_mode_override = false;
+module_param(gt_mode_override, bool, S_IRUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(gt_mode_override, "force the use of General Touch mode 
(default: false)");
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

@@ -255,6 +279,50 @@ static int elo_command_10(struct elo *elo, unsigned 
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
  	static const char *elo_types[] = { "Accu", "Dura", "Intelli", 
"Carroll" };
@@ -332,12 +400,16 @@ static int elo_connect(struct serio *serio, struct 
serio_driver *drv)

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
@@ -361,6 +433,13 @@ static int elo_connect(struct serio *serio, struct 
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





On 08/11/2021 05:56, Dmitry Torokhov wrote:
> Hi Gareth,
> 
> On Sun, Oct 03, 2021 at 10:54:21PM +0100, Gareth Randall wrote:
>> Add support for touch screens using the General Touch ST6001S
>> controller, as found in the GPEG model AOD22WZ-ST monitor.
>> This controller can output the ELO 10-byte protocol,
>> but requires different initialisation.
>>
>> Signed-off-by: Gareth Randall <gareth@garethrandall.com>
>> ---
>>   drivers/input/touchscreen/elo.c | 58 +++++++++++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/elo.c
>> b/drivers/input/touchscreen/elo.c
>> index 96173232e53f..8c15e0eea6b4 100644
>> --- a/drivers/input/touchscreen/elo.c
>> +++ b/drivers/input/touchscreen/elo.c
>> @@ -44,6 +44,8 @@ MODULE_LICENSE("GPL");
>>   #define ELO10_ACK_PACKET	'A'
>>   #define ELI10_ID_PACKET		'I'
>>
>> +#define ELO_GT_INIT_PACKET	"\001XfE\r"
>> +
>>   /*
>>    * Per-touchscreen data.
>>    */
>> @@ -201,6 +203,7 @@ static irqreturn_t elo_interrupt(struct serio *serio,
>>
>>   	switch (elo->id) {
>>   	case 0:
>> +	case 4:
>>   		elo_process_data_10(elo, data);
>>   		break;
>>
>> @@ -255,6 +258,54 @@ static int elo_command_10(struct elo *elo, unsigned
>> char *packet)
>>   	return rc;
>>   }
>>
>> +/*
>> + * Initialise the General Touch ST6001S controller.
>> + */
>> +static int elo_command_10_gt(struct elo *elo)
>> +{
>> +	int rc = -1;
>> +	int i;
>> +	unsigned char *packet = ELO_GT_INIT_PACKET;
>> +
>> +	mutex_lock(&elo->cmd_mutex);
>> +
>> +	serio_pause_rx(elo->serio);
>> +	init_completion(&elo->cmd_done);
>> +	serio_continue_rx(elo->serio);
>> +
>> +	for (i = 0; i < (int)strlen(packet); i++) {
>> +		if (serio_write(elo->serio, packet[i]))
>> +			goto out;
>> +	}
>> +
>> +	wait_for_completion_timeout(&elo->cmd_done, HZ);
>> +	rc = 0;
>> +
>> + out:
>> +	mutex_unlock(&elo->cmd_mutex);
>> +	return rc;
>> +}
>> +
>> +static int elo_setup_10_gt(struct elo *elo)
>> +{
>> +	struct input_dev *dev = elo->dev;
>> +
>> +	if (elo_command_10_gt(elo))
>> +		return -1;
> 
> 		return -EIO;
> 
>> +
>> +	__set_bit(INPUT_PROP_DIRECT, dev->propbit);
> 
> Please make this a separate patch that would set this property for all
> variants of ELO touchscreens (i.e. move it into elo_connect()).
> 
>> +
>> +	// Values taken from a GPEG model AOD22WZ-ST monitor
>> +	input_set_abs_params(dev, ABS_X, 1365, 5828, 0, 0);
> 
> I believe the datasheet says that the touch resolution is 4096 x 4096:
> http://www.boardcon.com/download/LCD_datasheet/15inch_SAW_LCD/Serial%20Controller%20ST6001S%20SPEC.pdf

I never felt comfortable with the hard-coded values that I'd put in my 
patch, so I've changed them to your suggestion (0 and 4095) but with the 
option to override using kernel parameters. I hope this is okay.

(My understanding of input_set_abs_params is that the input device has 
to be able to reach the values, even if it can go above the max and 
below the min. When moving my finger on the screen concerned, 1365 was 
the lowest it would comfortably go and 5828 was the highest, meaning 
that it would never be able to reach 0.)


> 
> 
>> +	// max and min inverted because screen axis is inverted
>> +	input_set_abs_params(dev, ABS_Y, 5013, 2260, 0, 0);
> 
> I dont think this changes anything for reported coordinates by the
> driver.

When experimenting with the hardware the pointer would move correctly 
with "inverted" max and min, but allowing these to be overridden through 
kernel parameters will be fine.

>> +
>> +	dev_info(&elo->serio->dev,
>> +		 "GeneralTouch ST6001S touchscreen");
>> +
>> +	return 0;
>> +}
>> +
>>   static int elo_setup_10(struct elo *elo)
>>   {
>>   	static const char *elo_types[] = { "Accu", "Dura", "Intelli", "Carroll" };
>> @@ -361,6 +412,13 @@ static int elo_connect(struct serio *serio, struct
>> serio_driver *drv)
>>   		input_set_abs_params(input_dev, ABS_X, 0, 255, 0, 0);
>>   		input_set_abs_params(input_dev, ABS_Y, 0, 255, 0, 0);
>>   		break;
>> +
>> +	case 4: /* 10-byte protocol with General Touch initialisation */
>> +		if (elo_setup_10_gt(elo)) {
>> +			err = -EIO;
>> +			goto fail3;
>> +		}
>> +		break;
>>   	}
>>
>>   	err = input_register_device(elo->dev);
>> -- 
>> 2.27.0
> 
> Thanks.
> 

Thanks very much for your feedback.

Yours,

Gareth
