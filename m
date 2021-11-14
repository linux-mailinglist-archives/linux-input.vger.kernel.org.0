Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F2344FBBD
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 22:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbhKNVRh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 16:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236318AbhKNVRf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 16:17:35 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826C5C061746
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 13:14:40 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id m6so30645457oim.2
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 13:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RKt0uTjd/jjJNgivc3agt0/wUthTa4NidF1pDS/JPzQ=;
        b=Ct/QbSnNmf3XdNkCpgZNzHqFrtMGT87PnCvmsSXjm/KDl6fQhHdrCuOJCg17nLgtUc
         1piNGiDccKHc24vEaulxBZufRaffpAeox0OIH3ewE7t3wztH0svF/LhLbfIwYEnxRM4J
         Z2r6jQM3cNiWlbuhcfPPL0J7imUkT1H2oq7UJVFEv+zn3cXgMmWY+ERCxpx1W8q9KFf7
         sH+i5GkkhlFlvLw5cXXtUEacYCkdkiG3+5XsVaAcfh5sZeyDCzmZxmo5Fc6IspXKseXx
         eUxJmpd5qczHzflDuB8YcgKoTTrz3+hVDkDdOwXmzQs0nNMkeQRIF+dOJgW4uOwISK2v
         PRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RKt0uTjd/jjJNgivc3agt0/wUthTa4NidF1pDS/JPzQ=;
        b=NmxBcJoHsWZlxUrHAHR4NQsX8HLu2hAoDzeZ8AOACdZ05tZsZgqaVUd1lHHQ1b9UUa
         ciwxATudDM706PCIdS0gjfmwYtpjLzKkag/knxItr7fShsTDrE2gwNS+3ZxBIA6qBT3/
         bM3MaOy00u8gWNFOA86rB6hKDWZ8MDd23/z0rRsIuKv5e+jHH37UieK15z30wh6nruT4
         RMkyBmLMs9gVNEDZ2ot/yEwH3TThgCCwy02hKTCWlyYqhtlQe6TBHZKwAvF51xCrwxRW
         Rvag5lFuX8/waVVEVkv/sHgw3k6X+gdE2wqgST7goZWIQmwH2OpuRaRQFIyG+xPWV6c4
         DdlA==
X-Gm-Message-State: AOAM532EmSvV8JO4F4gbK6LYUCqrh3HLCXQtjQzNZnDfB5BAOKPh9Wny
        TMRAAIPrxBdOR9aA/4WnnYU=
X-Google-Smtp-Source: ABdhPJwvEH/U1m3TbolOFI9LM0HC+RjZ00iCErANCYKFKVgyufEwoLINhuGEBYZNtxek2tHHZcE29w==
X-Received: by 2002:a05:6808:2396:: with SMTP id bp22mr26200775oib.78.1636924479628;
        Sun, 14 Nov 2021 13:14:39 -0800 (PST)
Received: from [192.168.35.124] ([69.149.214.238])
        by smtp.gmail.com with ESMTPSA id s14sm478525otu.41.2021.11.14.13.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 13:14:39 -0800 (PST)
Message-ID: <74100aa9-d2aa-6bdd-46be-0d4ffb6496c8@gmail.com>
Date:   Sun, 14 Nov 2021 15:14:38 -0600
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
 <20211114213731.2573be3a@rechenknecht2k11>
From:   Cameron Gutman <aicommander@gmail.com>
In-Reply-To: <20211114213731.2573be3a@rechenknecht2k11>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/14/21 14:37, Benjamin Valentin wrote:
> On Sun, 14 Nov 2021 20:51:22 +0100
> Benjamin Valentin <benpicco@googlemail.com> wrote:
> 
>> The problem is that the gamepad then gets assigned the type
>> XTYPE_UNKNOWN which excludes it from all run-time code path switches.
> 
> Ah sorry for the noise. xpad_probe() already takes care of detecting
> the gamepad type for the XTYPE_UNKNOWN case.
> And this works for my Xbox 360 pad - not sure what's wrong with jstest,
> but that is unrelated.

Ah okay good, that's what I was expecting.

> 
> To avoid that confusion, how about
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 4c914f75a902..155ee644295d 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
>  @@ -1783,14 +1785,19 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
>  
>  	if (xpad->xtype == XTYPE_UNKNOWN) {
>  		if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC) {
> -			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129)
> +			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129) {
>  				xpad->xtype = XTYPE_XBOX360W;
> -			else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208)
> +				xpad->name = "Generic Xbox 360 wireless pad";
> +			} else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208) {
>  				xpad->xtype = XTYPE_XBOXONE;
> -			else
> +				xpad->name = "Generic Xbox One pad";
> +			} else {
>  				xpad->xtype = XTYPE_XBOX360;
> +				xpad->name = "Generic Xbox 360 pad";
> +			}
>  		} else {
>  			xpad->xtype = XTYPE_XBOX;
> +			xpad->name = "Generic Xbox classic pad";
>  		}
>  
>  		if (dpad_to_buttons)
> 
> 

I like this idea. There's a small risk of causing userspace breakages for
games matching "Generic X-Box pad" by name, but we already run that risk
each time we update xpad_devices[] anyway. You might even consider dropping
"Generic" from the name and just call them "Xbox One gamepad" or similar.

Can you also replace "Generic X-Box pad" with NULL in xpad_devices[]? I
don't think it would ever be used anymore after this change.


Regards,
Cameron
