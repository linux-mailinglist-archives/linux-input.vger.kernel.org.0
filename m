Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC14504CCF
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 08:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiDRGsk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 02:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbiDRGsj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 02:48:39 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFAECFE
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 23:46:01 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id m14so17542644wrb.6
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 23:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version;
        bh=323XbrI5UbGI+RH/TcNtMa27QKaH9DdyomlE/fxIO3A=;
        b=ZEg/fumZdHDHi4eOnKz1q5IITAcWIUuRPR/327ix+R+QrvWMo/dQEAQI2aP8+f1OaD
         qLX7fBE2mmIYDK2TKdp1y94+oJ9JhPNryElhEcX0YSuM0biDny10Zz+UhWz07Ste7Ain
         MhtRjyaSS/+S6iv8Rn3JdD5KSzIc9hDew7RIArWNWcujvWGGYz4GENp2OGXWjhHsentR
         saDG7/ra1hrOKazdTRZUzNEydohX5SDSIlpqIpOPxze5qYL7KJHDPa1VwGEwaR8uX2Ez
         L16ayaInQeTi5+mH+3LiCEk0p1IW5gcO9EJq5R0/3THmnBShVX1yPMYZWSIZLMmSbOiL
         KSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version;
        bh=323XbrI5UbGI+RH/TcNtMa27QKaH9DdyomlE/fxIO3A=;
        b=VYc78VFV07N3KA3rr2E77EYPxKqxKA5ejzWZc2lNNFNdqaloDfl4e/hgihcLRhASbf
         qQG1xJSghI0fOrToW1dYJj/I0Dg1HIY6437YhYSM/+DbZnGu3RnjH0rC8+wDH941eDxP
         EHNPSszCXJmJIh9kr9LgXUwzOmxuyAariMCJT7iFp70TJ+UJsZMVHmR0qZiQmCnQTUWy
         pVonOXrvrGUh7Zud1uZ1bR2Y0U/oRIlqMiVINa4WQVeD2y34hrwsvYxAIMd3BIryuDMT
         ASCciwvTCMBnA+1QrcXqmMr30OTHDHAHoTgjRoKlZOr1adExKWs6U0OFm7/IuYe0kwKm
         n/IQ==
X-Gm-Message-State: AOAM533OAeHvNSH4vyUXnn3YE/JH1nZlq/tZaPHBnXOJwEnoJvlOMVna
        9puRryZGAs5dORZt8Wag4Tc=
X-Google-Smtp-Source: ABdhPJyhOYpoEJCLR08PU0CAd8nIcP8kzB8w2zbIvaAcPmGGeHyfuXbkM3BrljlJB1aYO9NgqoOPoQ==
X-Received: by 2002:a05:6000:221:b0:20a:7925:f52 with SMTP id l1-20020a056000022100b0020a79250f52mr6997738wrz.514.1650264360012;
        Sun, 17 Apr 2022 23:46:00 -0700 (PDT)
Received: from pop-os ([2a02:168:5bfa:1:691:b74e:fc7:af88])
        by smtp.gmail.com with ESMTPSA id c8-20020a056000184800b0020a8c9b56d7sm4220171wri.113.2022.04.17.23.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 23:45:59 -0700 (PDT)
Date:   Mon, 18 Apr 2022 08:45:53 +0200
From:   Santosh De Massari <s.demassari@gmail.com>
Subject: Re: [PATCH 3/3] Input: xpad - Poweroff XBOX360W on mode button long
 press
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Pavel Rojtberg <rojtberg@gmail.com>, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Message-Id: <H4WIAR.ANYJZLRXMNAS1@gmail.com>
In-Reply-To: <Yl0Cp2H6CRIsFsKT@kroah.com>
References: <20220417161526.138019-1-rojtberg@gmail.com>
        <20220417161526.138019-4-rojtberg@gmail.com> <Yl0Cp2H6CRIsFsKT@kroah.com>
X-Mailer: geary/3.38.2
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Mon, Apr 18, 2022 at 08:18, Greg KH <gregkh@linuxfoundation.org> 
wrote:
> On Sun, Apr 17, 2022 at 06:15:26PM +0200, Pavel Rojtberg wrote:
>>  From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> Wait, who wrote this, "lawl" or you?

I wrote this. Santosh De Massari. But I never submitted it to LKML
because e-mail sounded too hard and the LKML too scary. Apologies
in advance for any misconfigured mail client etc. on my side.

If Pavel or anyone else wants to get this patch merged, they're
more than welcome to from my side.


> 
>>  Newer gamepads turn themselves off when the mode button is held 
>> down.
>>  For XBOX360W gamepads we must do this this in the driver.
>> 
>>  Signed-off-by: lawl <github@dumbinter.net>
> 
> We need a real name here please.

You can use Santosh De Massari <s.demassari@gmail.com>

> 
>>  Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
>>  ---
>>   drivers/input/joystick/xpad.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>> 
>>  diff --git a/drivers/input/joystick/xpad.c 
>> b/drivers/input/joystick/xpad.c
>>  index 7640cbb..a9894a6 100644
>>  --- a/drivers/input/joystick/xpad.c
>>  +++ b/drivers/input/joystick/xpad.c
>>  @@ -620,11 +620,13 @@ struct usb_xpad {
>>   	int pad_nr;			/* the order x360 pads were attached */
>>   	const char *name;		/* name of the device */
>>   	struct work_struct work;	/* init/remove device from callback */
>>  +	time64_t mode_btn_down_ts;
>>   };
>> 
>>   static int xpad_init_input(struct usb_xpad *xpad);
>>   static void xpad_deinit_input(struct usb_xpad *xpad);
>>   static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 
>> seq_num);
>>  +static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
>> 
>>   /*
>>    *	xpad_process_packet
>>  @@ -776,6 +778,23 @@ static void xpad360_process_packet(struct 
>> usb_xpad *xpad, struct input_dev *dev,
>>   	}
>> 
>>   	input_sync(dev);
>>  +
>>  +	/* XBOX360W controllers can't be turned off without driver 
>> assistance */
>>  +	if (xpad->xtype == XTYPE_XBOX360W) {
>>  +		if (xpad->mode_btn_down_ts > 0
>>  +		&& xpad->pad_present
>>  +		&& (ktime_get_seconds() - xpad->mode_btn_down_ts) >= 5) {
> 
> Did you run this through checkpatch?  Please indent properly and put 
> the
> "&&" on the end of the lines.
> 
> And what does "5" mean here?

Assuming Pavel will take care of this, but since I'm replying anyways. 
Seconds.
Chosen arbitrarily.

> 
>>  +			xpad360w_poweroff_controller(xpad);
>>  +			xpad->mode_btn_down_ts = 0;
>>  +			return;
>>  +		}
>>  +
>>  +		/* mode button down/up */
>>  +		if (data[3] & 0x04)
> 
> BIT(2)?
> 
> thanks,
> 
> greg k-h


