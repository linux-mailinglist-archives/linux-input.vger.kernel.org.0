Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0703A6BC9BF
	for <lists+linux-input@lfdr.de>; Thu, 16 Mar 2023 09:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjCPIuL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Mar 2023 04:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbjCPIuF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Mar 2023 04:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A08EB7A
        for <linux-input@vger.kernel.org>; Thu, 16 Mar 2023 01:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678956558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZQF+VfJcpEoBY5ux7q01aOkEisslQ62cgsWrGcOCzeA=;
        b=VXvnNK1jpjQeDelS1YpZmskqtrXp8axVH3muxIKXrVePAq9XqLYekbsVieVeTzUVISl29V
        8n8/aM0BjmZVi1CYc4nIHDVUTLALRNY8FFLf3bKAQBbseT7DtY0UgGqAPwagEjCr6AHDeF
        3U9qd9khn3ufqPywWkyNUq/LgeJHomw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-2BwuYuA6MvKASLT5FkTcgA-1; Thu, 16 Mar 2023 04:49:16 -0400
X-MC-Unique: 2BwuYuA6MvKASLT5FkTcgA-1
Received: by mail-ed1-f72.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso2029068edb.4
        for <linux-input@vger.kernel.org>; Thu, 16 Mar 2023 01:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678956554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQF+VfJcpEoBY5ux7q01aOkEisslQ62cgsWrGcOCzeA=;
        b=EY8onnskC1l5IOFVC9WgPDEiDg65guUKLRqdmHWZ+n+TxedcNZ5FZqy0E1ZjHDhXfn
         euMVS5/wThFmaLET93Cawi9WCteGH9iRLXfWjGiVA++O6jxhKyXs2M+hdXXCNy3JUtvS
         xBd+EJVU9nIUitnwpB6TjrCQZOqK1pZhZSObi2OoP0bKiDFniPi5TXYFJ3ni7XV6mbee
         nPKwg+XISahJBxBQ9SxaVaum5oqpTTa/fWzQIWRn0eGFtxNC3UWNiCFuq7vA8/J7efOZ
         yxQHxzGOeSCEG2UFemkCRpapLZoaYyPHJjxVoJcUSbSrc6iCGioVJGm6j8VMTIpyYOI2
         +S0w==
X-Gm-Message-State: AO0yUKXr45ZW25Ai1uBap4wmowYoxuEp++4FZFh4bBDAIVx6fy1mYPue
        nGkR5ty/fpvDS4J9hcJ6gy8L2yeEk8iEtxqjOzHL/MgteKEigvC1rWSjxoAEAJlyp/6RgTiLJ5N
        ta90m+ywS7P3cz2DEMi+naLU=
X-Received: by 2002:a17:907:31ca:b0:92f:e643:e822 with SMTP id xf10-20020a17090731ca00b0092fe643e822mr3072610ejb.37.1678956554160;
        Thu, 16 Mar 2023 01:49:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set986UHmIZ1pfjcoD9S5jCEussbdGvwlVTM/9q1utc4TpF0kSx1gaCcutBDOKagtBqq8vpo49g==
X-Received: by 2002:a17:907:31ca:b0:92f:e643:e822 with SMTP id xf10-20020a17090731ca00b0092fe643e822mr3072589ejb.37.1678956553903;
        Thu, 16 Mar 2023 01:49:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t21-20020a1709066bd500b0092bd1a7f5fdsm3539340ejs.57.2023.03.16.01.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 01:49:13 -0700 (PDT)
Message-ID: <31b1d4a5-3a98-ae3a-b089-f2464fc890f4@redhat.com>
Date:   Thu, 16 Mar 2023 09:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Input: i8042 - Add quirk for Fujitsu Lifebook A574/H
Content-Language: en-US, nl
To:     Jonathan Denose <jdenose@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Denose <jdenose@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Takashi Iwai <tiwai@suse.de>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org
References: <20230303152623.45859-1-jdenose@google.com>
 <e8f5e2aa-d7fa-88ff-6306-4c1ee8feeade@redhat.com>
 <CALNJtpWsvZEdGJFA30cv0cSq43Djm7q+trDQVxx5aRDzg7u3Gw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CALNJtpWsvZEdGJFA30cv0cSq43Djm7q+trDQVxx5aRDzg7u3Gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/15/23 22:39, Jonathan Denose wrote:
> Hello Hans,
> 
> Thank you very much for your review.
> 
> For my knowledge, what is the timeline for patches in the input
> mailing list getting applied to a maintainer branch after review?

It depends on when Dmitry has time to go through the patch queue. Not a really helpful answer I know, sorry.

Regards,

Hans


> On Mon, Mar 6, 2023 at 5:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 3/3/23 16:26, Jonathan Denose wrote:
>>> Fujitsu Lifebook A574/H requires the nomux option to properly
>>> probe the touchpad, especially when waking from sleep.
>>>
>>> Signed-off-by: Jonathan Denose <jdenose@google.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Regards,
>>
>> Hans
>>
>>
>>> ---
>>>
>>>  drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
>>> index efc61736099b..fe7ffe30997c 100644
>>> --- a/drivers/input/serio/i8042-acpipnpio.h
>>> +++ b/drivers/input/serio/i8042-acpipnpio.h
>>> @@ -610,6 +610,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>>>               },
>>>               .driver_data = (void *)(SERIO_QUIRK_NOMUX)
>>>       },
>>> +     {
>>> +             /* Fujitsu Lifebook A574/H */
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "FMVA0501PZ"),
>>> +             },
>>> +             .driver_data = (void *)(SERIO_QUIRK_NOMUX)
>>> +     },
>>>       {
>>>               /* Gigabyte M912 */
>>>               .matches = {
>>
> 

