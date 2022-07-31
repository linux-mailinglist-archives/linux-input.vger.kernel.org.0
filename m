Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4150586117
	for <lists+linux-input@lfdr.de>; Sun, 31 Jul 2022 21:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbiGaTqj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 31 Jul 2022 15:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbiGaTqi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 Jul 2022 15:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A8B90DEDB
        for <linux-input@vger.kernel.org>; Sun, 31 Jul 2022 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659296794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6MLbYaDUAgOPrA1LL7ytXJct7K/FAszFHzPpShrmMfE=;
        b=a1Td26xCN8/K/JMEvgwOsqJVyCEC0cHj+d/dldEglOaM1hC6K4ALTzCSBDHFki97fVBZSH
        H8fmfvVbjg/k6EBJNxLS6Rjp2pOjjaWxUkBsl1D9IT2dywxLP6WXZitqrBQEPRDQ+GvcAs
        5QD3Rknp72/VeNLTRbwnM42adwROY2s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-TH8GxtVIPoGDKJ78Vs2cFQ-1; Sun, 31 Jul 2022 15:46:32 -0400
X-MC-Unique: TH8GxtVIPoGDKJ78Vs2cFQ-1
Received: by mail-ed1-f69.google.com with SMTP id z1-20020a05640235c100b0043bca7d9b3eso5837811edc.5
        for <linux-input@vger.kernel.org>; Sun, 31 Jul 2022 12:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6MLbYaDUAgOPrA1LL7ytXJct7K/FAszFHzPpShrmMfE=;
        b=eQTIpkj7lhe+pYXx4H/oMbg2ZMy8OHmI8KsJt+Wawy0iQ1ohC+6wyXvFBJYQngDc2R
         5siYTNGrrfYSGfBLYNw/6cfQ+xrvhqBvQkRxvUJIGdKBABrPkETAq+nsudJj+cCN+cCn
         dmpo2ICf91mNvIZa18Ijj23tEkeu07engSiYPyYg1vd4C9KXSWYklTgZUkZ5iPijCXVG
         DNaQgaVLBTrqjcBeJWMmANWbeh7OQ0Gcf0tkD714yseVzYZ3LLA8uSuTvXm2+QcyPB6p
         pF79HKzLYbwo2U8hiSjX6RTfXj+OJ50plieUog1/O96V+oD6YoP8LqeesT2UMd05BOfS
         wlEw==
X-Gm-Message-State: AJIora9C6ahRBKvxR8IlNnnHhmFvbHSY9o/tSJZP6zT9QNNIk1KExRh4
        pmvKvVgNuhuFhR1e4U57Dm5qPwzhxIW+WZWFBlCCxxFUoFj3BCY/urBq0+VElRK4c5DOq2RNhdL
        3S72n+jeIA/O0Co7crdn71tY=
X-Received: by 2002:a50:ee92:0:b0:43d:ffb:2258 with SMTP id f18-20020a50ee92000000b0043d0ffb2258mr12670141edr.416.1659296791509;
        Sun, 31 Jul 2022 12:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ux0T+/zbthuCXdx0Kb2RbYEjEsXQeYlfO5mbVzZdIlUX/GwCn7xKZfMefWaa40ESpstMPUMA==
X-Received: by 2002:a50:ee92:0:b0:43d:ffb:2258 with SMTP id f18-20020a50ee92000000b0043d0ffb2258mr12670133edr.416.1659296791345;
        Sun, 31 Jul 2022 12:46:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id x13-20020aa7dacd000000b0043cab10f702sm5739744eds.90.2022.07.31.12.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jul 2022 12:46:30 -0700 (PDT)
Message-ID: <69bf48da-7d1d-d701-6665-9b2fac3911b0@redhat.com>
Date:   Sun, 31 Jul 2022 21:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: fn-key issue with hid_apple and keychron keyboards
Content-Language: en-US
To:     Bastian Venthur <mail@venthur.de>,
        linux-input <linux-input@vger.kernel.org>
References: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
 <f82dd7a1-a5c6-b651-846c-29f6df9436af@redhat.com>
 <155865d7-f964-ac9a-2c02-1eabeac0e443@venthur.de>
 <897e57a9-38d8-c05f-ceed-01d486f02726@redhat.com>
 <ae3e52eb-fa43-ce5e-bf81-f014318a02ff@venthur.de>
 <0d69820a-30ee-755c-b146-49c2bbc0714f@redhat.com>
 <5815adb9-f9b4-308b-6ac8-3e7b10bd71b8@venthur.de>
 <a23380fb-579a-68ee-55f1-8bc429e09a2f@venthur.de>
 <ef0c02f1-67f1-8514-408e-239fb5edc26b@redhat.com>
 <9f282e9a-fe01-8c4f-8af6-6457b795db00@redhat.com>
 <8d018877-a4e9-c216-687e-8e026e21ed0e@venthur.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8d018877-a4e9-c216-687e-8e026e21ed0e@venthur.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 7/31/22 21:12, Bastian Venthur wrote:
> Hi Hans et al,
> 
> I've noticed that the issue has been fixed by now: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa33382c7f74a1444f90f324007da1431d7180b2
> 
> Thank you and whoever else was involved very much for your work!

You're welcome and sorry that I did not get around to fixing
this myself sooner.

Regards,

Hans



> Am 30.08.21 um 11:25 schrieb Hans de Goede:
>> On 8/30/21 11:24 AM, Hans de Goede wrote:
>>> Hi Bastian,
>>>
>>> On 8/27/21 9:39 AM, Bastian Venthur wrote:
>>>> Hi Hans et al,
>>>>
>>>>
>>>> any updates on this one?
>>>
>>> I'm afraid not, this is still on my todo list, but there are a bunch of
>>> higher priority things on there, so I'm not sure when I will get around
>>> to this.
>>
>> p.s.
>>
>> If you know C (the programming language) you could try to make the change
>> yourself, I can give you some pointers where to get started.
>>
>>  
>>
>>
>>>> On 24.06.21 09:35, Bastian Venthur wrote:
>>>>> On 23.06.21 16:16, Hans de Goede wrote:
>>>>>> Does anyone (including you, Bastian) has any opinion on making
>>>>>> fnmode=2 the default on this keyboard model ?
>>>>>
>>>>> If i understand you correctly, you're saying you cannot make the fnmode depend on the Mac- or PC-mode that the keyboard is currently running on? I mean that would be of course the best solution, but if that is not possible I'd prefer the fnmode=2 switched on by default as this is not a Mac keyboard AND this is not an Apple operating system.
>>>
>>> Right, there is no way to detect if the keyboard is in Mac- or PC-mode, so the plan would be to make fnmode=2 the default for this "Mac clone" (mac USB-ids (ab)using) keyboard.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>
> 

