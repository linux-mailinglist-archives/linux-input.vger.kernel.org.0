Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F44B504F00
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 12:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiDRKti (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 06:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiDRKti (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 06:49:38 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D275165A6
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 03:46:57 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id x3so8508868wmj.5
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=goU5cndu8gc2YD3bv+JnihCzWLfciKqF88oEaNOXLEc=;
        b=lINyyMlUiWDgnUg2nLscsHGwUayihjdwEePXRgvYIgHywUSJF0BQYdAdw1sfNHT6zm
         eTg4v2H39IDDXg5Qt9ca3yCirs+2jtNd7Npz+VP6YzCJM4mQVaGkhkhuj5IRav5uLg87
         WsMoLMXpBQdUe3MsRV8Gszo0mu57Osxacf5G0+Vsy0kFNyG3ea8GQqJEj0W/sAJZWJXX
         k9hQjw5B3nTFeVLdlQDSZRb+D6MWOCC8RUZm+8gZFetTPc6/t1QQRO+xcUbqnqmgB6ne
         jsSWrViCgS1IOr/eWar1Ar7oiC0C1f9dneuYxhRKr5r3ykRfCGng2pPhxAf5sK50Bjft
         E6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=goU5cndu8gc2YD3bv+JnihCzWLfciKqF88oEaNOXLEc=;
        b=bjmXm0P8O5k9m1TAGWroCeyZOSVyoLI+4igUP/q+8FcNlmYdfwV6NL4ZsGiS4vZ5Ua
         TGJMpJ/iMO7FEndFr08lqqlW9d55XIbrBnyMsUYWHUbfq5gAW2jRTbwZJYO6G/fCL2g6
         tWMTmRU0Jvvq33kjFJBuQCS+Y3/J4M1CyocIydHmQ+Vcowt5u+sjX2Ow2D/XePid7waa
         zspLYhS1WYcT85jRoHLdh8oSUdq8ghNraLyXVD4ErcYg8UThdHL2SZk+wXs9BbloPYG8
         n8MBZo8fzGk+jnSn1Tj48JijnJhPtrgmvzZsKX+Rfu0oOSa5meVlJfQ5WXTXb9dQgSxJ
         /rZQ==
X-Gm-Message-State: AOAM5334HVfFWhafCE3V7MWPbeMgw925xMPdA3ygfv+sWZuFjqiYwTyn
        yqcDKRad3g+qYJy05CDQ+ME=
X-Google-Smtp-Source: ABdhPJwoZOAFc4IMRrKzUkZCZPLlzPpNaTDgQoPS8DHQdsR3YatWI+ettopd6luGCo7e7Rj8zVzSiw==
X-Received: by 2002:a05:600c:4ed4:b0:392:90a5:b7e6 with SMTP id g20-20020a05600c4ed400b0039290a5b7e6mr7653903wmq.33.1650278815506;
        Mon, 18 Apr 2022 03:46:55 -0700 (PDT)
Received: from ?IPV6:2001:9e8:2205:7500:31a3:8b23:14e3:7ccf? ([2001:9e8:2205:7500:31a3:8b23:14e3:7ccf])
        by smtp.googlemail.com with ESMTPSA id v5-20020a5d6785000000b0020a792848eesm8431540wru.82.2022.04.18.03.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 03:46:55 -0700 (PDT)
Message-ID: <c13466b1-80f1-63a6-1d39-2da397d1622a@gmail.com>
Date:   Mon, 18 Apr 2022 12:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] Input: xpad - add support for XBOX One Elite paddles
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Christopher Crockett <chaorace@gmail.com>,
        Fmstrat <nospam@nowsci.com>
References: <20220417161908.138625-1-rojtberg@gmail.com>
 <Yl0DPYdzSK5C+hEF@kroah.com>
From:   Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <Yl0DPYdzSK5C+hEF@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



Am 18.04.22 um 08:20 schrieb Greg KH:
> On Sun, Apr 17, 2022 at 06:19:08PM +0200, Pavel Rojtberg wrote:
>> From: Christopher Crockett <chaorace@gmail.com>
>>
>> An effort has been made to support every official model and firmware
>> version I could track down info on. The following controllers _should_
>> have working paddles with this PR:
>> - Xbox Elite (**untested**)
>> - Xbox Elite Series 2 on early firmwares (**untested**)
>> - Xbox Elite Series 2 on v4 firmwares (Tested v4.8.1908.0)
>> - Xbox Elite Series 2 on v5 pre-BLE firmwares (**untested**)
>> - Xbox Elite Series 2 on v5 post-BLE firmwares (Tested v5.13.3143.0)
>>
>> This patch also introduces correct handling for the Elite 1 controller
>> and properly suppresses paddle inputs when using a custom profile slot.
>>
>> Starting in v5.11, certain inputs for the Elite 2 were moved to an extra
>> packet that is not enabled by default.
> 
> why does 5.11 matter here?

This refers to the gamepad firmware, not to Linux :)

> 
>>
>> We must first manually enable this extra packet in order to correctly
>> process paddle input data with these later firmwares.
>>
>> For further details see: https://github.com/paroj/xpad/pull/195
> 
> don't like to random web sites, summarize in here properly.

The summary here should be complete. Do you have any specific questions?

The link leads to all the details i.e. the 52 entry discussion of how to read the current
firmware version etc.

> 
>>
>> Signed-off-by: Fmstrat <nospam@nowsci.com>
> 
> I doubt that is a correct email address and valid name :(

Unfortunately this is all I get at github. The only alternative would be no attribution at all.
 
>> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
>> ---
>>  drivers/input/joystick/xpad.c | 239 ++++++++++++++++++++++++++++++++++++++++++---------------
>>  1 file changed, 176 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index 53126d9..0746813 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -80,6 +80,7 @@
>>  #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
>>  #define MAP_STICKS_TO_NULL		(1 << 2)
>>  #define MAP_SELECT_BUTTON		(1 << 3)
>> +#define MAP_PADDLES				(1 << 4)
>>  #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
>>  				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
>>  
>> @@ -89,6 +90,12 @@
>>  #define XTYPE_XBOXONE     3
>>  #define XTYPE_UNKNOWN     4
>>  
>> +#define PKT_XB              0
>> +#define PKT_XBE1            1
>> +#define PKT_XBE2_FW_OLD     2
>> +#define PKT_XBE2_FW_5_EARLY 3
>> +#define PKT_XBE2_FW_5_11    4
>> +
>>  static bool dpad_to_buttons;
>>  module_param(dpad_to_buttons, bool, S_IRUGO);
>>  MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
>> @@ -111,6 +118,7 @@ static const struct xpad_device {
>>  	char *name;
>>  	u8 mapping;
>>  	u8 xtype;
>> +	u8 pktType;
> 
> Please use proper Linux kernel naming schemes.

that would be pkt_type, right?

> 
>>  } xpad_device[] = {
>>  	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>>  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>> @@ -128,7 +136,8 @@ static const struct xpad_device {
>>  	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
>>  	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
>>  	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
>> -	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
>> +	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
>> +	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
>>  	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
>>  	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
>>  	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
>> @@ -390,6 +399,13 @@ static const signed short xpad_abs_triggers[] = {
>>  	-1
>>  };
>>  
>> +/* used when the controller has extra paddle buttons */
>> +static const signed short xpad_btn_paddles[] = {
>> +	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, /* paddle upper right, lower right */
>> +	BTN_TRIGGER_HAPPY7, BTN_TRIGGER_HAPPY8, /* paddle upper left, lower left */
>> +	-1						/* terminating entry */
> 
> 0 should be the terminator, right?

while 0 would probably do, the other arrays in this file also use -1.

> 
>> +};
>> +
>>  /*
>>   * Xbox 360 has a vendor-specific class, so we cannot match it with only
>>   * USB_INTERFACE_INFO (also specifically refused by USB subsystem), so we
>> @@ -492,6 +508,15 @@ static const u8 xboxone_s_init[] = {
>>  	0x05, 0x20, 0x00, 0x0f, 0x06
>>  };
>>  
>> +/*
>> + * This packet is required to get additional input data
>> + * from Xbox One Elite Series 2 (0x045e:0x0b00) pads.
>> + * We mostly do this right now to get paddle data
>> + */
>> +static const u8 extra_input_packet_init[] = {
>> +	0x4d, 0x10, 0x01, 0x02, 0x07, 0x00
>> +};
>> +
>>  /*
>>   * This packet is required for the Titanfall 2 Xbox One pads
>>   * (0x0e6f:0x0165) to finish initialization and for Hori pads
>> @@ -552,6 +577,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
>>  	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
>>  	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
>>  	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
>> +	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
>>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
>>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
>>  	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
>> @@ -608,6 +634,7 @@ struct usb_xpad {
>>  
>>  	int mapping;			/* map d-pad to buttons or to axes */
>>  	int xtype;			/* type of xbox device */
>> +	int pktType;          /* type of the extended packet */
> 
> Again, name needs to be fixed and why no tabs like the rest of the lines
> in this structure?

Do I read correctly, that your comments merely aiming at style mean that
you are ok with the code in general?

I can fix the style issues myself, but for code changes I would need to
reflect to Christopher, as I do not own the controller.

Greetings, Pavel

> 
> thanks,
> 
> greg k-h
