Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B955152161
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 21:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgBDUFv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 15:05:51 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38462 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgBDUFv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 15:05:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id w1so19993610ljh.5;
        Tue, 04 Feb 2020 12:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=m/jcrOVUV+dLc6FKgGEA36BjyTt7sevHDyHvWf+kjIw=;
        b=h241L0dUUsNqvDuwjsZHlPK8xb6nEsGUHyQfCqlcJR0R1dx13Q+InmvZETICv36gOi
         hOz3JJr0sB5liyhe6pcskSF9FQWnaQY4XclJW0c9DcLqt7J7A6mw8k+QyqeCNplyA7ay
         ngfbwBxMlIB7zaUula5+Pcw/Dgn+NACfrsnVBgieYPxicgOFiCeifmHhvLTR2eXqa5Hi
         fsCdKGgI0Wx09Dqn0fgMwl2nGWpDVJnR7aUKuW4an7dQNxVLY1DzsyjGio5wu7vLP4m3
         upw26kqXsYV2E0+2v4rPef+6ozCJ0uuUHN3UBqS1o7vpKSczE83f9j+KmAfV/h2k+u5G
         iSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=m/jcrOVUV+dLc6FKgGEA36BjyTt7sevHDyHvWf+kjIw=;
        b=DuP1u+GIcQXRCTNdZOckssk98hT983UaabKaLFdZ6hP4M0pnPb8yxVfWL7ACn3pxBF
         rQEu0qma7R3nnEAkh6MJqD+/rAeeucY8T+MzLgfvPgGymPsfU19ofvCm5FkQh2OPqsN1
         CIE+FKIsDNH3YcTJtGYqQrhQ7cecHVR5OtPFA3TqXz8gdJTZayX79qxiOvBlqwJOJ+f3
         febdpJaxN0edKGmwrMEgQ6K+IUYn/KueERKPwJzOsk1TxRo7WYQs6WyldKnDlDyGkeHX
         6wB4dNono8Qbia7sgDWLfe19WkeDkjdO3Z9uu4LE3DvF5JpDLvXI8XaCPiZpyO2NfFmP
         ol4g==
X-Gm-Message-State: APjAAAU4+mRGlUxA8BObeLIdwbWUKCTlidoJ51TalUpViMwunhoZDgQH
        k8+YG/KjV+AtyaqB/sN/s5l6Y10/Ikn+lg==
X-Google-Smtp-Source: APXvYqwqyMdB9pPv/yIlC0ORZBF2/k2z3Cy3Js0TzVllnh2mB5bra4WIkVtGVgXPHqmwdsfNBLoUIw==
X-Received: by 2002:a2e:2e11:: with SMTP id u17mr17933080lju.117.1580846748034;
        Tue, 04 Feb 2020 12:05:48 -0800 (PST)
Received: from ?IPv6:2001:2003:f41e:c300:224:1dff:fe12:e61a? ([2001:2003:f41e:c300:224:1dff:fe12:e61a])
        by smtp.gmail.com with ESMTPSA id b17sm12016382ljd.5.2020.02.04.12.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 12:05:47 -0800 (PST)
Subject: Re: [PATCH v5] USB: HID: random timeout failures tackle try.
To:     Greg KH <gregkh@linuxfoundation.org>, Lauri Jakku <lja@iki.fi>
Cc:     oneukum@suse.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org
References: <20200204175238.3817-1-lja@iki.fi>
 <20200204181542.GB1115743@kroah.com>
From:   Lauri Jakku <ljakku77@gmail.com>
Message-ID: <a857f819-a258-9f48-988d-ccf30785117e@gmail.com>
Date:   Tue, 4 Feb 2020 22:05:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204181542.GB1115743@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Inline comments.

On 4.2.2020 20.15, Greg KH wrote:
> On Tue, Feb 04, 2020 at 07:52:39PM +0200, Lauri Jakku wrote:
>> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
>> index 5adf489428aa..2e0bfe70f7c5 100644
>> --- a/drivers/usb/core/message.c
>> +++ b/drivers/usb/core/message.c
> Ok, changelog issues aside:
>
>
>> @@ -20,6 +20,7 @@
>>  #include <linux/usb/hcd.h>	/* for usbcore internals */
>>  #include <linux/usb/of.h>
>>  #include <asm/byteorder.h>
>> +#include <linux/errno.h>
>>  
>>  #include "usb.h"
>>  
>> @@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>>  		    __u16 size, int timeout)
>>  {
>>  	struct usb_ctrlrequest *dr;
>> -	int ret;
>> +	int ret = -ETIMEDOUT;
> No need to initialize this.
>
>> +
>> +	/* retry_cnt * 20ms, max retry time set to 400ms */
>> +	int retry_cnt = 20;
> Why?  You just now changed how all drivers will deal with timeouts.  And
> you didn't change any drivers :(
>
>
>>  
>>  	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
>>  	if (!dr)
>> @@ -149,11 +153,52 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>>  	dr->wIndex = cpu_to_le16(index);
>>  	dr->wLength = cpu_to_le16(size);
>>  
>> -	ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
>> +	do {
>> +		ret = usb_internal_control_msg(dev,
>> +					pipe,
>> +					dr,
>> +					data,
>> +					size,
>> +					timeout);
>> +
>> +		/*
>> +		 * Linger a bit, prior to the next control message
>> +		 * or if return value is timeout, but do try few
>> +		 * times (max 400ms) before quitting. Adapt timeout
>> +		 * to be smaller when we have timeout'd first time.
>> +		 */
>> +		if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
>> +			msleep(200);
>> +		else if (ret == -ETIMEDOUT) {
>> +			static int timeout_happened = 0;
> Woah, what about this function being called multiple times from
> different devices all at the same time?


I did not tought of that, yes, it will break alot of things like that, it can't be

like that.


Could the flag be in some platform-data? hmm platformdata

would be the right place, or do you have suggestions. I have tought

about the move from core -> hid ..would that be better, then in hid

module put the flag so that it is per device.


> Are you _SURE_ you want this to be static?
>
> Hint, no way, not at all, this doesn't do at all what you think it does.
> We support more than one USB device in the system at a time :)
>
>> +
>> +			if ( ! timeout_happened ) {
>> +				timeout_happened = 1;
>> +
>> +				/* 
>> +				 * If timeout is given, divide it
>> +				 * by 100, if not, put 10ms timeout.
>> +				 * 
> Always run scripts/checkpatch.pl on your patches so you do not get
> grumpy maintainers telling you to run scripts/checkpatch.pl on your
> patches.
>
Uh, forgot.. just starting to learn from general developer, to

kernel developer. I'll try to remember that.

>> +				 * Then safeguard: if timeout is under
>> +				 * 10ms, make timeout to be 10ms.
>> +				 */
>> +
>> +				if (timeout > 0)
>> +					timeout /= 100;
>> +				else
>> +					timeout = 10;
>> +
>> +				if (timeout < 10)
>> +					timeout = 10;
> What is with this "backing off"?  Why?
>
> Again, you just broke how all USB drivers treat the timeout value here,
> what happens for devices that do NOT want this retried?

Hmm, maybe the quirk method could be used to ena/disa the retry.

>
> We do not want to retry in the USB core, _UNLESS_ the caller asks us to
> do so.  Otherwise we will break things.

Yeah, i'm turning to like the idea to have the retry moved to hid module and

have quirk define to disable/enable it.


Starting really like the idea, I'm yet no kernel guru, learning while doing now.


I really should buy a book about linux kernel.

>
> I understand this works for your one device, but realize we need to
> support all devices in existance, at the same time :)


Good comments, thanks for review.


This is what i do (soonish, tomorrow perhaps):


1. move patchcode from core -> hid module

2. add variable & quirck to _disable_ retry code done to HID module

  (variable per platformdata, would used by hid module, no need to

   mess with core)


Now is already so late that, if i start coding, i got in the zone and 6h is

like breeze.


> thanks,
>
> greg k-h
