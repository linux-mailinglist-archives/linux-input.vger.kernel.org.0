Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E93A6DD7BE
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 12:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjDKKTh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 06:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjDKKTh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 06:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0413A9B
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681208328;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AzyG/YBO9nJAFsVcyZbVdRwU/eo/ex2vVhDY5uNoCJg=;
        b=H+h8gzH9ZTFJUwtUFad4QR+ld/sQfRiSkSOu8mSLx07trPuH4EJCtw811CBTco5YnKGYY2
        PfRYUkCxgQi1M5LIOklvFBj2mmlVXy7BuV6orztvITmKhirEOqW6Z7faw/F1B5rmhQnykt
        l1mJHuiwYGgpRL4ul30fylNJs7aEAGE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-9z9OzVqIN8idq3P7l7oyuw-1; Tue, 11 Apr 2023 06:18:47 -0400
X-MC-Unique: 9z9OzVqIN8idq3P7l7oyuw-1
Received: by mail-ej1-f72.google.com with SMTP id vo2-20020a170907a80200b00949175b0b70so4355312ejc.9
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 03:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681208326; x=1683800326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzyG/YBO9nJAFsVcyZbVdRwU/eo/ex2vVhDY5uNoCJg=;
        b=vvMAxRxX0u528UBFN6Fve8bx2YAzC8HRiE9ehI8u0wCfz0N03Z8mDsCy8RKerDTfWQ
         bykPGiAoDbk/KY/TD2uoizri/wPJoAy3LpCaXu+2VFRi874lNWZnLA9vQHxtKIx1Au+1
         CY5CRY9ws6jR9lwXzQjMIAoDzzWyHjFCh0BhQvtPd9YtHvADla3UM7zdahp7YLNBbiNP
         PMeCInUvd6qIm5IrzeMeTLAIB6mby2wY1qa2YcPVERqHvusTSUC1icntllUVxTAt3cEe
         FOgF0QHBNqur/18E9uaS94Yx4poq9NhrmShN7AQwf4nUOKwD+bNHzIR/SAomVrjkqBRl
         QuRQ==
X-Gm-Message-State: AAQBX9dhMk5xWNeCkeH2fndc0TyyBm+U/L6ltYq4IhngwqKR85AHlD9f
        lB14rtxOL7mlOy5AnKcnJSsXS6ROWEwdniQJI5ouagmaWhFVKeiT4vLY/ORzgNFlodkdqLlrcZy
        vceh2gDMGsA2gLnOHUrt7uiU=
X-Received: by 2002:a17:906:68d3:b0:94a:8ada:d109 with SMTP id y19-20020a17090668d300b0094a8adad109mr5587186ejr.77.1681208326373;
        Tue, 11 Apr 2023 03:18:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zca+nHJH3ee3Vl9q8qFldF1/vWdDLf94TLpqj0qW9GvxTL/A98x0J9vPlVwAhDonjVJaKsfA==
X-Received: by 2002:a17:906:68d3:b0:94a:8ada:d109 with SMTP id y19-20020a17090668d300b0094a8adad109mr5587167ejr.77.1681208326010;
        Tue, 11 Apr 2023 03:18:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b0094a86ccb634sm1981644ejc.210.2023.04.11.03.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 03:18:45 -0700 (PDT)
Message-ID: <c3e08839-b621-3e57-0d6b-f4cd14c897b9@redhat.com>
Date:   Tue, 11 Apr 2023 12:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms + remove specialized drivers
Content-Language: en-US, nl
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
References: <20230409144243.25360-1-hdegoede@redhat.com>
 <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 4/11/23 11:02, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Apr 09 2023, Hans de Goede wrote:
>> Hi All,
>>
>> This series consist of 2 parts:
>>
>> 1. Patches 1-3. Allow using i2c-hid-of on non OF platforms to allow I2C-HID
>>    devices which are not enumerated by ACPI to work on ACPI platforms
>>    (by manual i2c_client instantiation using i2c_client_id matching).
> 
> Patches 1 and 2 are looking good, but I wonder if you can not achieve the
> same result by relying on an ACPI SSDT override. I got something similar
> working on this thread[0].

Yes this could be made to work with an ACPI override. But the goal is
to make things work OOTB for end users when they install Linux and
ACPI overrides are very far from something which works OOTB.

> I understand the "post-reset-deassert-delay-ms" might be something hard
> to express with an SSDT, but we should already have all the bits in
> place, no?

Actually if an ACPI override is used then the setting of the GPIO
can be done in _PS0 and _PS3 (power on / off) methods and those
can simply include a sleep after setting the GPIO.

> Also, the problem of "post-reset-deassert-delay-ms" is that you are not
> documenting it, because the OF folks do not want this in device tree,
> and I tend to agree with them. So this basically creates a brand new
> undocumented property, which is less than ideal.

I'm merely not documenting it because there are no devicetree users yet.

Between the 2 currently supported of devices with a reset GPIO +
the I2C-HID capable touchscreen + wacom digitizer on the x86 android
Yoga Book 1 I'm trying to get to work that is 4 I2C-HID devices which
all follow the pattern of: 1. They have a reset GPIO, 2. they need
some delay after reset is deasserted.

It seems silly to keep adding more and more device-ids + match-data
with just the delays in there when it seems that many many I2C-HID
capable controllers/chips follow this pattern.

Also note that there already is a very similar "post-power-on-delay-ms"
property. I really don't see what makes specifying a delay after
enabling regulators through a property ok, but specifying the delay
after reset-deassert not ok. Allowing one but not the other is not
very consistent.

The reason why I'm not documenting the property now is because of
lack of current devicetree users. It can be documented once
the first DT users show up and getting it accepted should really not
be an issue given that "post-power-on-delay-ms" already exists.

Note if just the existence of the property is the main stumbling
block I can go the match_data route for the wacom digitizer on
the Yoga Book 1 too and add an extra i2c_device_id with match-data
setting the delay. This could then either be its own specialized
driver, or we could still go with the current patch-set
(minus the property) and add an i2c_device_id with match-data
to i2c-hid-of.c .

The only question then is how to name the i2c_device_id for the wacom
digitizer. It has a vid:pid of 056A:0169 So maybe "wacom0169" ?


>> 2. Patches 4-6. Remove the special i2c-hid-of-elan and i2c-hid-of-goodix
>>    driver, folding the functionality into the generic i2c-hid-of driver.
>>    Since 1. requires adding reset-gpio support to i2c-hid-of there was
>>    very little difference left between the generic i2c-hid-of code and
>>    the specialized drivers. So I decided to merge them into the generic
>>    driver instead of having duplicate code.
> 
> I understand the spirit, but I am not a big fan of this. The reason is
> just detailed your following statements: getting tests on those is hard.

Actually AFAIK the chromeos folks have an automated test lab where
all supported models get tested and they regularly test the latest
mainline kernels. So even without me asking for it any regressions
here should have been caught in this case since support for both
special-case i2c-hid-of drivers was added for chromeos.

And the code is almost identical, the only difference is using
the bulk-regulator API vs enabling the regulators 1 by 1, which
should not make any difference.

> So there is code duplication, yes, but OTOH this guarantees that we do
> not break those devices while working on something else.
> 
> I can always be convinced otherwise, but I still think the approach of
> the devicetree-bindings maintainers works better: if you need a new
> property that isn't available in the core of i2c-hid-of, and which is
> device specific (even if it's just a msleep for a line to be ready),
> make this a separate driver. Trying to parametrize everything with
> properties will just end up in a situation where one "meaningless"
> property will break another device, and it's going to be a pain to
> trace, because those drivers are not tested every single kernel release.

This is not trying to parametrize everything, this is trying to
parametrize something which turns out to be necessary over 4 different
chips/controller models. And I'm pretty sure that if I start looking
into ACPI tables I will find many more controllers which use a reset
GPIO + a delay after de-assert like this.

IOW something which is clearly a very common pattern.

You have been advocating to make HID code more generic allowing
device-quirks in BPF format to avoid adding drivers for every
tiny descriptor fixup.

Do you really want to go the route of a tiny driver for every
i2c-hid chip variant used with devicetree, rather then having
a single extra property ?

Note that if patches 1-3 had been in place when Douglas
started adding support for the "elan,ekth6915" and
"goodix,gt7375p" devices that the devicetree on
the chromeos devices using those would then likely
have simply used the "hid-descr-addr", "post-power-on-delay-ms"
and "post-reset-deassert-delay-ms" properties and no
separate drivers would have been necessary at all.

(We need patches 4-6 now only to keep compatibility with
 existing devicetree files which don't set these)

So I really see patches 4-6 as a way to reduce future
work reviewing specialized drivers for you and Jiri.

Yes there may still be some special cases in the future
which need a specialized driver which we have now, but
I believe that covering the common reset-GPIO pattern
will drastically reduce the need for those drivers and
thus will lower the maintainer burden.

Regards,

Hans


