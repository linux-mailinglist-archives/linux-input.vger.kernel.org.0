Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48DAB6C7674
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 05:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjCXEHA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 00:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbjCXEG6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 00:06:58 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0672941F
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 21:06:54 -0700 (PDT)
Received: from [192.168.0.22] (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 43B08A269;
        Thu, 23 Mar 2023 21:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1679630813; bh=okq5euas2keGuNEACep/66eNHhrSETABpW5LLR/V6UM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e3GHl+l3anRV54XLHuZKsFjIaUlwV0me9g9KNQyPzC7yqUsAl6Lt5DC36CSNxmjvw
         e0W84z04AGwwE6Iro+PE35OdMWc4EXr/z3KuokOUfKz55NVQ5Fm1mJLjQZq3qJ9ErH
         jMGCvsjZiPQGr95D4cbIbdBKfNNiU1JyBWEP5qGWcQzv7KxaDj4c/P1BE7qqr0CWlL
         wb5qP01yLFD0bZWAm4XPKsPArVLoXbB8+UNYxBGpSSmc9UbA9I5LvzlT7mnIjpFRWp
         /sdo/SGAoCdZteAiq5NlV1pNLCz/izR3+F6hoAPVSltwLL2QIbw1yxntbxYWIVOhp8
         IanPULNnC9b7Q==
Message-ID: <11cb5200-6f78-90c5-12e0-f6a747712913@endrift.com>
Date:   Thu, 23 Mar 2023 21:06:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] Input: xpad - fix support for some third-party
 controllers
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20230225012147.276489-1-vi@endrift.com>
 <20230225012147.276489-2-vi@endrift.com> <ZBz9OnKq1/UWddk9@google.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <ZBz9OnKq1/UWddk9@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 3/23/23 18:30, Dmitry Torokhov wrote:
> On Fri, Feb 24, 2023 at 05:21:46PM -0800, Vicki Pfau wrote:
>> Some third-party controllers, such as the HORPIAD FPS for Nintendo Switch and
>> Gamesir-G3w, require a specific packet that the first-party XInput driver sends
>> before it will start sending reports. It's not currently known what this packet
>> does, but since the first-party driver always sends it's unlikely that this
>> could cause issues with existing controllers.
>>
>> Co-authored-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>> ---
>>  drivers/input/joystick/xpad.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index 403b57e8176b..04af2213407f 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -265,6 +265,7 @@ static const struct xpad_device {
>>  	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
>>  	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>>  	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
>> +	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>>  	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
>>  	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
>>  	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
>> @@ -2020,6 +2021,27 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
>>  		goto err_free_in_urb;
>>  	}
>>  
>> +	if (xpad->xtype == XTYPE_XBOX360) {
>> +		/* Some third-party controllers Xbox 360-style controllers
>> +		 * require this message to finish initialization */
>> +		uint8_t dummy[20];
>> +		int ret;
>> +
>> +		usb_control_msg_recv(udev, 0,
>> +				     /* bRequest */ 0x01,
>> +				     /* bmRequestType */
>> +				     USB_TYPE_VENDOR | USB_DIR_IN |
>> +				     USB_RECIP_INTERFACE,
>> +				     /* wValue */ 0x100,
>> +				     /* wIndex */ 0x00,
>> +				     dummy, sizeof(dummy),
>> +				     25,
>> +				     GFP_KERNEL);
>> +		if (ret)
>> +			dev_warn(&xpad->dev->dev,
>> +				 "unable to receive magic message: %d\n", ret);
> 
> You are not setting "ret", how was this tested?

Presumably with a stack frame that had that space unwittingly initialized to zero. Good catch, thanks. I've resubmitted with this fixed in v2.

> 
>> +	}
>> +
>>  	ep_irq_in = ep_irq_out = NULL;
>>  
>>  	for (i = 0; i < 2; i++) {
>> -- 
>> 2.39.2
>>
> 
