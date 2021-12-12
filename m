Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C415471A0D
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 13:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhLLMgJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 07:36:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49927 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229787AbhLLMgJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 07:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639312568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1HdZ3llytC9WX6eHq8hM22Xb7M78+nc2H1t226gUBMM=;
        b=Xq2pSuwJCauobeIHakiukOBklQR1NwKFflF4+rfzihjw+Wzamnhla0QAD+iqHgpvz2AWTU
        PYhOCBCvN1copyHq8NHYEyVF8qtUsEf4T7g3jVt/i/3IQAWzf7eOYX1cN845Gm3YDzpKHA
        tSnoabjU+s1rBTBsOfppiHYIw59TKH0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290--MkGOs0LOSST3_snOxWvPg-1; Sun, 12 Dec 2021 07:36:07 -0500
X-MC-Unique: -MkGOs0LOSST3_snOxWvPg-1
Received: by mail-ed1-f72.google.com with SMTP id k7-20020aa7c387000000b003e7ed87fb31so11810496edq.3
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 04:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1HdZ3llytC9WX6eHq8hM22Xb7M78+nc2H1t226gUBMM=;
        b=r5tB2iL8q96uRMPTzStFBXKyUHuxVbqPPe0E8RTuh0x8/rUAV3n+ZvQbjqtTltRdhC
         x0hZ5fk8l4wlcSoa7xMDt7K4KMfMw0lIv3/bXGeRdvWZP3mg5L/x5+PDmoli6kTlGH3r
         fcketcIyxbct+HFJn+EIrRxPSmrqLIOyXorvDMskjaIMf9w5GvprZ0vtA83+9BbLePjT
         /KkFpSJwbkvgJNGlQCKvUM0//XfsCTIocwRW5OZ+zO/ctG+CQj1y42yagfwATWloCP0J
         Jmq7wvtukp3+5XgcD/3lHkK551XmhBYgLfXfYTvJBNammSzZkcIrgv77oI4ZynNFjzwY
         WEFA==
X-Gm-Message-State: AOAM532yHrjYb21tJWhOlZZ5d6xRupvKBLHBx9fM3xek/jcykbHoDxIy
        Pj9iEG0KQj6HI+cNii2P9Bit1ryY0XgPOfOiIlPI7XRi1817zu2OXGcH2Wv6HBRVD+nyztjWB/g
        UMo5zhfOz9tLSFRDcOP+72FY=
X-Received: by 2002:a05:6402:16cd:: with SMTP id r13mr55585985edx.264.1639312566325;
        Sun, 12 Dec 2021 04:36:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPaY9n9rXNi90tqoVQxXAnFUy/zO3OOfYY9Xt4S2rvJwEa/nXcOGfrH/MwqFJeUr8A99+mkQ==
X-Received: by 2002:a05:6402:16cd:: with SMTP id r13mr55585969edx.264.1639312566117;
        Sun, 12 Dec 2021 04:36:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cq19sm4516868edb.33.2021.12.12.04.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 04:36:05 -0800 (PST)
Message-ID: <5e2253c6-0d1f-51ec-9817-0c83fff2724e@redhat.com>
Date:   Sun, 12 Dec 2021 13:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH resend 2/2] Input: silead - Add pen support
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20211122220637.11386-1-hdegoede@redhat.com>
 <20211122220637.11386-3-hdegoede@redhat.com> <YbQWDAPw/zpO0y9x@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YbQWDAPw/zpO0y9x@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 12/11/21 04:07, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Mon, Nov 22, 2021 at 11:06:37PM +0100, Hans de Goede wrote:
>> +	input_set_capability(data->pen_input, EV_KEY, BTN_TOUCH);
>> +	input_set_capability(data->pen_input, EV_KEY, BTN_TOOL_PEN);
>> +	/*
>> +	 * We never report BTN_STYLUS but userspace want to see this in order
>> +	 * for the device to be recognized as a pen / drawing-tablet.
>> +	 */
> 
> What userspace is that? I see that udev recognizes devices with either
> stylus or pen  as tablets since at least 2015.
> 
> I am really hesitant adding synthetic capabilities that do not have real
> events behind them.

You are completely right, I added this when GNOME3 / libinput would not
recognize the pen (looking at other stylus/pen drivers) but IIRC things
then still did not work and then I also added code to set the resolution.

I just tested without setting BTN_STYLUS and things still work fine,
so the comment and the line setting BTN_STYLUS can be dropped while
merging this. Let me know if you want me to do a new version with this
dropped instead.

Regards,

Hans

