Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2438268CEA
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 16:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgINOId (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 10:08:33 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45566 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725979AbgINOIY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 10:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600092502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k0dgbRo+RDvZ3UA4+CQF8a3dBnr9tvYgpawTPvfNleQ=;
        b=GsXPKXrCIto3rDM7DDioGAg2E7jYXPPlPfAOiWbx/Ohab6FQu7TkrPvgMtsdBVU0UGIEfE
        apyouhMDGzl2HoMMxWJxtIMeGhC6aTQUPwlKLmAh3/w50HHjQshL4u3cZssN4wLXxtWGSE
        lZkbt95JH7ledWprZgQWK4m+namn8Oc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-HBmmfDHEMrSHfyWoBxqcjw-1; Mon, 14 Sep 2020 10:08:11 -0400
X-MC-Unique: HBmmfDHEMrSHfyWoBxqcjw-1
Received: by mail-wm1-f71.google.com with SMTP id y18so45707wma.4
        for <linux-input@vger.kernel.org>; Mon, 14 Sep 2020 07:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k0dgbRo+RDvZ3UA4+CQF8a3dBnr9tvYgpawTPvfNleQ=;
        b=QPZZ6c+Fw0jWc/Mltl9TMeD59gAgS7b9TXPGn86xzi8/CHbbWStABER87uIirt6VlC
         osi4/XrCDFX6MT9oDz/DaVwJIAIArS2Gfo17uizScqkuu2kQMNfdV31lyIDIHebL8LWI
         iwmoqz6fPV1jiKXbphGp5v+5+P5+8lf9C+5M4hYVHY0kQjaGeAtbKWZdf+cG+ecEzy3N
         rT67+h2zVcT2XKO7yiyvQz6SgMa9VEBuO2xtRUyB2/+5rIG/kLf2fiWHUzggrIpE1F1F
         bcesjV3a8wvN0nMaNKchqnIfWCZQPADB4GFTLlf6fN3CoFnNC8af35g2dL1Nc2guhlI6
         RkOw==
X-Gm-Message-State: AOAM5305TWlJKOdo3qLHsGr1MCIj2WE00iFYiA16QdhpKH9Rd68BG05J
        UyBa6VUfz3XAoAaau3nQzoIyN9cLAqbOIJKNCgeZH4mb5ofwpd10zrti/f4zM8RqLOrHLGLyYY5
        6nxLQYt7WyjNOauOL3iIcCzk=
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr16116162wme.144.1600092490360;
        Mon, 14 Sep 2020 07:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ27kSa58tJiiyuMmAIiHYwij6veZwR4h++7Q0qwgfWPIXQ2wHhOeRx22P6H/r1LA7F616zw==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr16116137wme.144.1600092490142;
        Mon, 14 Sep 2020 07:08:10 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id i6sm22688978wra.1.2020.09.14.07.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 07:08:09 -0700 (PDT)
Subject: Re: [PATCH 0/1] Input: soc_button_array - Work around DSDTs which
 modify the irqflags
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20200906122016.4628-1-hdegoede@redhat.com>
 <20200914061246.GO1665100@dtor-ws>
 <61dfb476-2d55-116c-21d6-bf5972929cd3@redhat.com>
 <CAHp75VemDbswE9+yXMut1vbYvWwcTAd+b_Ry05_0QWbfnCSv9g@mail.gmail.com>
 <897df830-4806-0118-6a27-0025268da1f5@redhat.com>
Message-ID: <ead6b6f3-5fb7-d986-1bba-4f4a9350a369@redhat.com>
Date:   Mon, 14 Sep 2020 16:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <897df830-4806-0118-6a27-0025268da1f5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 9/14/20 3:52 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/14/20 10:00 AM, Andy Shevchenko wrote:
>> On Mon, Sep 14, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 9/14/20 8:12 AM, Dmitry Torokhov wrote:
>>>> On Sun, Sep 06, 2020 at 02:20:15PM +0200, Hans de Goede wrote:
>>
>> ...
>>
>>>>> The soc_button_array code really is x86 specific glue code to translate
>>>>> various incarnations of gpio-keys in ACPI tables to gpio_keys_platform_data.
>>>>> As such I wonder if it would not be better to move this driver to
>>>>> drivers/platform/x86?
>>
>> AFAIU the above is a justification why PDx86 suits better to host it.
> 
> Correct.
> 
>>>>> I seem to be doing most if not all of the recent work on soc_button_array,
>>>>> and soon I will be a co-maintainer of drivers/platform/x86. So having it
>>>>> there and adding me in MAINTAINERS as maintaining it seems to be best?
>>>>>
>>>>> If you want I can do a patch moving soc_button_array to drivers/platform/x86
>>>>> and then add the other 3 patches on top and then we can merge all of this
>>>>> through drivers/platform/x86?
>>>>
>>>> Sorry, misread this first time through, so already merged the 3 patches,
>>>> but I to not mind at all moving the driver to platform tree. If you send
>>>> me such a patch I will apply it.
>>>
>>> Ok.
>>>
>>> Andy are you ok with moving the driver to the pdx86 tree too?
>>
>> Taking into consideration the above, if I read it correctly, I agree.
>> Feel free to add my Ack.
> 
> Ok, since Dmitry's tree currently has some changes to soc_button_array.c,
> the plan is to merge the patch through Dmitry's tree.
> 
> I will prepare a patch with your Acked-by and submit it.

So to make sure that there won't be any merge issues,
I was comparing bases for
{drivers/input/misc,drivers/platform/x86}/{Makefile,Kconfig}
looking at the versions in:
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/for-next (which atm is just 5.9-rc1)

And the latter has a couple of commits to
drivers/platform/x86/Kconfig which the input tree is missing;
and these commits touch part of the file which moving the driver
over will also be touching.

Dmitry, it seems that your for next-tree is based on 5.7 + 2
large merges and as such does not have all the commits from
5.9-rc1 ?

Anyways this is not urgent, given the conflict I think it
might be best if I send out the patch after 5.10-rc1, using
5.10-rc1 as a base for it.

Regards,

Hans

