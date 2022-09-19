Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD605BCD4E
	for <lists+linux-input@lfdr.de>; Mon, 19 Sep 2022 15:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiISNc7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Sep 2022 09:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiISNcy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Sep 2022 09:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D5B24BE6
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663594372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S3R/J9mAzmfvH9Y9E0yXACqtf5r5Llzujq7g/NYrlA8=;
        b=GPh+ke7WNHvLaqXHiOrYZn7FPNQghBfwima6aIm0+TuaQJ0GOR1TdK0ORsLO0r7n0lZc8S
        LJT0sXycWv/trdtAl6DjhlGRuq88QCC9wNdRplJBiICxbevqqeuAFYHcgM/+2m7UWTloIj
        I6F643eceKY48RZ5DwRPS7C0JjLciYQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-Mey6H53rMraQVZcMMeKRsw-1; Mon, 19 Sep 2022 09:32:47 -0400
X-MC-Unique: Mey6H53rMraQVZcMMeKRsw-1
Received: by mail-wm1-f69.google.com with SMTP id 185-20020a1c02c2000000b003b4be28d7e3so4048001wmc.0
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 06:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=S3R/J9mAzmfvH9Y9E0yXACqtf5r5Llzujq7g/NYrlA8=;
        b=y6tnreTzJu+nPMXYaLKR0lWpM5FEl85rZC0RZlbxsl8cTWqgNWs1JghNZwJLlCVYT7
         +vG3UKjj6pClItMxU2u7wzn3sTGyo/h4RvUjdiBoZEMA/XeUnx0XMEUzZY8mF8StJF7w
         m3DpaiM83ykkHk7niv7ZHsnMBQ0NU+ii5RWC+lWOkfVDNQICYufGSaLP2uxx9NyXkuGj
         bzVWCJdK5HNKorolmmbtz26meI+ORZ1Y9t9rKYjOrMgbe3XWevIAQuGbnwoO5x4myKtU
         OJGGwlQanZZq6JiggwI+BRNxeMN59hsibpMWG/eCE9YEq9RDd/zXCi5O6miCJDbSbCuX
         rrJQ==
X-Gm-Message-State: ACgBeo1leVn8N++HaJ2ML6jEbUyhKFsDkpxX9FZSytpf0umqdEIIsJsj
        FmPROExv1ahlfyyfe4Z8Qauucqx5mv/38+RPP9jZa8lNUJxaAALN0MERJnkjzwZCnvm92DlaqYu
        HiSCibUG5SW6Fkmw0qk/6BGg=
X-Received: by 2002:a7b:c8d6:0:b0:3b4:868b:afc3 with SMTP id f22-20020a7bc8d6000000b003b4868bafc3mr18599001wml.66.1663594362159;
        Mon, 19 Sep 2022 06:32:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6OcwxNBdq96pcCKiBsuz5gSLS3FYvAwyZhxQCkoPkFWU0g/YPusv2Hki3QnCjwBm0u4wEhQQ==
X-Received: by 2002:a7b:c8d6:0:b0:3b4:868b:afc3 with SMTP id f22-20020a7bc8d6000000b003b4868bafc3mr18598877wml.66.1663594359815;
        Mon, 19 Sep 2022 06:32:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:2bc:381::432? ([2a01:e0a:2bc:381::432])
        by smtp.gmail.com with ESMTPSA id x1-20020adfdd81000000b002205cbc1c74sm9753212wrl.101.2022.09.19.06.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 06:32:38 -0700 (PDT)
Message-ID: <d4b420a0-23da-6ab6-886a-7342f7e63651@redhat.com>
Date:   Mon, 19 Sep 2022 15:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RESEND PATCH 1/2] HID: Add driver for RC Simulator Controllers
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20220822060936.769855-1-marcus.folkesson@gmail.com>
 <CAO-hwJ+3Yrr--cr=r5+jvs4A=A-cmDtrKQETo=YOYDC3nXTMBg@mail.gmail.com>
 <YwTvrNuulKx0SB6H@gmail.com>
 <CAO-hwJKiq50fWwXNUGcXeWtWcUXb65ZmJMsADfrsUTac_Xj2dw@mail.gmail.com>
 <YwcbVJswrL1Doi4s@gmail.com>
 <CAO-hwJJ86oAuaFD+uX7Rwv7cASO=4mchRJ1UBTxz9gYs6M1rUg@mail.gmail.com>
 <YyLVblZkIPCvNd/2@gmail.com>
 <CAO-hwJJ5dRrgxrae-RasYXuu7C9xjw6RmPaPfmO=YU3StMaQ3A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAO-hwJJ5dRrgxrae-RasYXuu7C9xjw6RmPaPfmO=YU3StMaQ3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 9/15/22 09:35, Benjamin Tissoires wrote:
> On Thu, Sep 15, 2022 at 8:28 AM Marcus Folkesson
> <marcus.folkesson@gmail.com> wrote:
>>
>> Hi Benjamin,
>>
>> On Tue, Aug 30, 2022 at 02:45:11PM +0200, Benjamin Tissoires wrote:
>>> On Thu, Aug 25, 2022 at 8:44 AM Marcus Folkesson
>>> <marcus.folkesson@gmail.com> wrote:
>>>>
>>
>>
>> [...]
>>>>
>>>>
>>>> Is the fact that more than one button share the same
>>>> byte hard to describe in the report?
>>>
>>> No, this is actually easy to describe. You say that there is one usage
>>> of "something" which has a report size of 1 bit, and then you have
>>> another usage of "something else" with the same report size.
>>>
>>> But usually you have to add padding after to make up to 8 bits (so 6
>>> bits in that case).
>>>
>>> I was referring to the case  where you are parsing the same bit on the
>>> wire, and give a different usage based if you have received an odd or
>>> an even number of reports. In that case, we probably need to use move
>>> this bit to a const field in the original report descriptor and say
>>> that the data is now not const:
>>>
>>> - initial report (completely random example):
>>>    X (2 bytes) | Y (2 bytes) | button this_or_that (1 bit, depending of
>>> odd or even received reports) | 7 bits of padding
>>> - we can declare it as:
>>>    X (2 bytes) | Y (2 bytes) | button this (1 bit) | button that (1
>>> bit) | 6 bits of padding
>>
>> How about if there is no unused bytes?
>>
>> The XTRG2FMS has 8 10-bit channels and use every byte in the report.
>> Should I specify 8 8-bit channels instead and fix that in raw_event?
>> If so, should I only use 8bit values then?
> 
> If I am not wrong, you should be able to add another byte in the
> report descriptor, as long as your raw_event function always adds it.
> Though now that I am typing it, I am actually wondering if this will
> work. You can always try, there is a chance it'll work, but I can't
> remember if it'll result in a timeout on the USB front because it'll
> expect one more byte that will never arrive.

I am back home, and I just tested that. I had a doubt, and it is indeed
failing. You need the following change for this to be working (I need to
send it as a proper patch after assessing it hasn't side effects)

---

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 13cce286247e..f37ffe2bd488 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -275,6 +275,7 @@ static void hid_irq_in(struct urb *urb)
         int                     status;
  
         switch (urb->status) {
+       case -EOVERFLOW:        /* happens with modified report descriptors */
         case 0:                 /* success */
                 usbhid->retry_delay = 0;
                 if (!test_bit(HID_OPENED, &usbhid->iofl))
---

Cheers,
Benjamin

> 
>>
>> (Are you at the ELCE conference btw?)
> 
> I was at Plumbers this week, but got an extra day today. But yeah, I'm
> in Dublin today.
> 
> Cheers,
> Benjamin
> 
>>
>> Best regards
>> Marcus Folkesson

