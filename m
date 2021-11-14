Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85DB44FBB6
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 22:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236310AbhKNVIF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 16:08:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236299AbhKNVIF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 16:08:05 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80BDC061746
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 13:05:10 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso10420610otr.2
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 13:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yYHvTMYQWn2ASlcAe/PNhqQ4rJhldRaFl8Zx5nPmqCQ=;
        b=etN3uCy/kP4Bs4LubkC9zOV/UefEcguzL4O+TBEGXCx2pkrrovdn/i5y3Qa4F1nirt
         wSQJuRu3tyglputVxmBRTYLp65QgdiIDNE/l1ihBUHihYxmAFgF3oqM7v3iT/sePdCMv
         3HUjq574I9xTeJ2DqU45WAG5zHl1RFx5bVv1owJHzwwJMbh4Y0OSrmCyMiZqD92IZ+6v
         jqsuNZgheNlyS7jIQzaxT3o6QjJ/EQZY/8NC9oEJcB9Whfylie3sejuAlmldshhpg2+U
         vLwtbrUKLCPqJ82+FHuetYalHhTvENWlpFNnlw8ZUChvkpFXK+vkARCDXw+OZezyjlGL
         5K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yYHvTMYQWn2ASlcAe/PNhqQ4rJhldRaFl8Zx5nPmqCQ=;
        b=4fpv/Jx+3L+KhOb21bXegNNlMIm6JoHc1Ww/EuXPkbivLcKLesqPQWUHLKqkBo5IKu
         eUDtz6kCt/SU5DpMd7CgdLgRZx4T7vWJgwUdl4nGYVH7kZ+RfcOZ9TpvyUEMPwgg9oJk
         Sh8rdW1Jq48eXRlQLktLQ5TCncbwXh14BxX8DqmxpQXEtY4u9Fw4O/FqOnMf02zamvUw
         pT1OFihWLsTS1DB7qYwjw9qzYZSqsMk4tC4SOKUO5z9x+gt0y870iVYgRu0LQt7WYehV
         r8WSoaSheYhiRdW5LNujrs3X+fObmNq0t5hOmHgEq/oq8Dsy0+6F9K3L9rkoQ90EUGd4
         0Jug==
X-Gm-Message-State: AOAM531Jt9wNB6BFGACka27Dre5e0H6Ce7yLa4qBsh+GxJn+A9DGxPji
        D683Kq4MzfSO9950JU1ey+5Q5yFQkzHe+kLb
X-Google-Smtp-Source: ABdhPJzKZSjDvHMk/YDn2IJ5sIbtiS1JyqGyYPPdQxWjfcs6VVS5AuW2a70iERy3Lr+fh8K2g6iorA==
X-Received: by 2002:a05:6830:1301:: with SMTP id p1mr26883844otq.337.1636923910100;
        Sun, 14 Nov 2021 13:05:10 -0800 (PST)
Received: from ?IPV6:2600:1700:4830:3f7f:7aac:34da:1863:159e? ([2600:1700:4830:3f7f:7aac:34da:1863:159e])
        by smtp.gmail.com with ESMTPSA id y1sm2632146otu.58.2021.11.14.13.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 13:05:09 -0800 (PST)
Message-ID: <54fa069f-987a-371f-3ef4-51198aed219f@gmail.com>
Date:   Sun, 14 Nov 2021 15:05:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Input: xpad - add more Xbox one controller IDs
Content-Language: en-US
To:     Benjamin Valentin <benpicco@googlemail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
References: <20211113131734.46fbc9bf@rechenknecht2k11>
 <dd40fcf9-582f-d5fd-4eec-ef06a8ecdf3b@gmail.com>
 <20211114205122.575567c6@rechenknecht2k11>
From:   Cameron Gutman <aicommander@gmail.com>
In-Reply-To: <20211114205122.575567c6@rechenknecht2k11>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/14/21 13:51, Benjamin Valentin wrote:
> On Sat, 13 Nov 2021 19:34:54 -0600
> Cameron Gutman <aicommander@gmail.com> wrote:
> 
>> For 1, the way Windows does it is via the Microsoft OS descriptor [0].
>> AFAIK, the specific OS descriptor strings are "XUSB20" for Xbox 360
>> and "XGIP10" for Xbox One.
>>
>> That functionality is handled by xpad_table[] and the
>> bInterfaceProtocol detection logic in xpad_probe(). The xpad_device[]
>> entry isn't required for detection or functionality of devices,
>> unless those devices need special treatment like
>> MAP_TRIGGERS_TO_BUTTONS or something.
> 
> The problem is that the gamepad then gets assigned the type
> XTYPE_UNKNOWN which excludes it from all run-time code path switches.
> 
> E.g. if I comment out
> 
> //    { 0x045e, 0x028e, "Microsoft X-Box 360 pad", 0, XTYPE_XBOX360 },
> 
> my X-Box 360 pad will not only lose any LED or rumble support, it will
> also not report any input events with jstest because
> xpad360_process_packet() is no longer called.
> 

XTYPE_UNKNOWN is a special value that should always be overridden by
the check in xpad_probe() to be the proper XTYPE value at runtime:

	if (xpad->xtype == XTYPE_UNKNOWN) {
		if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC) {
			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129)
				xpad->xtype = XTYPE_XBOX360W;
			else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208)
				xpad->xtype = XTYPE_XBOXONE;
			else
				xpad->xtype = XTYPE_XBOX360;
		} else {
			xpad->xtype = XTYPE_XBOX;
		}

	...


Those values should definitely be correct, because they're what we
use in the xpad_table[] itself. If they don't match, xpad_probe()
won't get called at all.

Can you see what's going on in xpad_probe() when you comment out
that line for your gamepad?

> I'll try to check on how to read out the OS descriptor string, maybe
> that allows us to detect the type on init and provide a better default
> experience.

That type derivation code above already handles determining the type for
unknown gamepads (assuming it actually works). The problem is having to
maintain the xpad_table[] list with every vendor that produces an Xbox
gamepad. That's where an extension to usb_device_id and something like
a USB_MS_OS_DESCRIPTOR("XUSB20") macro would come in, if the USB core
had first-class support for Microsoft OS descriptors.

The problem is that adding that Microsoft OS descriptor query may cause
compatibility issues for other devices. Windows actually keeps track of
whether the OS descriptor query fails to avoid querying it again [0].

[0]: https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/microsoft-defined-usb-descriptors

> 
> Best,
> Benjamin
> 

Regards,
Cameron
