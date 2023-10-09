Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7ED7BE3C6
	for <lists+linux-input@lfdr.de>; Mon,  9 Oct 2023 17:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbjJIPBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Oct 2023 11:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjJIPBt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Oct 2023 11:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DEFAC
        for <linux-input@vger.kernel.org>; Mon,  9 Oct 2023 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696863666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1NUWee3JA6Xhm3vChOriWzb2kgfR/vXjd89ioBGbTcY=;
        b=C1K2KZu0bzg/vClOBfeSt+uTUn8jjWuNZbw/XDYvSNQ7VCc0eTk7p8N/sxeG8Vymb0FtfE
        cgX0hl1ib1CKk5/m0rVXqKqbns49Oe3YNbuYhsILrv8T/D01E3ig+md9Su7F2HU8CeFdQe
        8Mw+aYOqPAmOCG5ZIt9oEjqIfkuR0Mk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-JNqFUaanOBmmXwksw5o0mQ-1; Mon, 09 Oct 2023 11:00:59 -0400
X-MC-Unique: JNqFUaanOBmmXwksw5o0mQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae7663e604so357385766b.3
        for <linux-input@vger.kernel.org>; Mon, 09 Oct 2023 08:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696863658; x=1697468458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NUWee3JA6Xhm3vChOriWzb2kgfR/vXjd89ioBGbTcY=;
        b=YfaXp1bTw90RBtvbr2Hj3FXv8RfgeMkrFmw2XAor6aziyMDIW6SxK8am2waiCWqERZ
         kjvLLF4L7upIXocZnxzqqvw1pc5xtsvK0tbRofTsLq3htZAO03PVSCk2QR6Jv2ucKvbs
         B95CXOmAluIH9WKWBgx38i7M8j33BA3FNfAX3GcsFSk9joYkYapT1YHWjYLm5Rwnfvgr
         mGWbqDnaZqj0lNpf0rmz9wtO8U8zhPWAWfJMmo79PDV7JL+KjLwtm39yVW31gvygtWKc
         yeupxNcVcheimmM4kYgd5L8py9W+8d1ssGR3EljyhszF16n828UChrkSIeP8/AcgaN3I
         1bkA==
X-Gm-Message-State: AOJu0YzirSlmJIzOAhHIakNt3UY/b9FMcvvy2FF9jBxTwOhU0kwr27gJ
        kAWN2Hi3HpklM8VeG+apJ6RCu2EL5lnjbc0zmxK08+XOPgmvP/3jdRAY8WqC4WFch/H/PIDQ2+5
        MEVmgaNNZj6xSGOcfz0EwZhE=
X-Received: by 2002:a17:906:54:b0:9a1:cdf1:ba6 with SMTP id 20-20020a170906005400b009a1cdf10ba6mr11798533ejg.12.1696863658694;
        Mon, 09 Oct 2023 08:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLGCsuvvBxEgol6zKod2nOOKAKB9vrAJMo3gurViEHp0ank9lQSzJ9JzvCK2u+Y4KLDpeiTw==
X-Received: by 2002:a17:906:54:b0:9a1:cdf1:ba6 with SMTP id 20-20020a170906005400b009a1cdf10ba6mr11798509ejg.12.1696863658258;
        Mon, 09 Oct 2023 08:00:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ci24-20020a170906c35800b009a2235ed496sm6964305ejb.141.2023.10.09.08.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:00:57 -0700 (PDT)
Message-ID: <f28d42de-e2f3-bb2e-ed69-b7f21bcf06f9@redhat.com>
Date:   Mon, 9 Oct 2023 17:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/14] HID: logitech-hidpp: Avoid hidpp_connect_event()
 running while probe() restarts IO
Content-Language: en-US, nl
To:     Benjamin Tissoires <bentiss@kernel.org>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20231008095458.8926-1-hdegoede@redhat.com>
 <98bc1918-653e-b298-392c-c525d069ea31@redhat.com>
 <up2e4vgb24rb25cwnkhhrswusous2wyo376has23k2dakfdmgk@eb76ysbnz3yu>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <up2e4vgb24rb25cwnkhhrswusous2wyo376has23k2dakfdmgk@eb76ysbnz3yu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 10/9/23 10:13, Benjamin Tissoires wrote:
> 
> Hi Hans,
> 
> On Oct 08 2023, Hans de Goede wrote:
>> Hi,
>>
>> On 10/8/23 11:54, Hans de Goede wrote:
>>> Hi Benjamin,
>>>
>>> Here is a v2 of my series to fix issues with hidpp_connect_event() running
>>> while restarting IO, which now also fixes the issues you mentioned with
>>> potentially missing connect events.
> 
> Great, thanks a lot for this hard work.

You're welcome.

>>> This series is best explained by a brief sketch of how probe()
>>> looks at the end of the series (1):
> 
> TBH, I couldn't parse the following yesterday evening, but after looking
> at all patches one by one I can now get it :)

I'm glad you get it now :)

> 
>>>
>>> Prep work:
>>>
>>> 1. All code depending on a device being in connected state is moved to
>>>    the hidpp_connect_event() workqueue item
>>>
>>> 2. hidpp_connect_event() now checks the connected state itself by
>>>    checking that hidpp_root_get_protocol_version() succeeds, instead
>>>    of relying on possibly stale (racy) data in struct hidpp_device
>>>
>>> With this in place the new probe() sequence looks like this:
>>>
>>> 1. enable_connect_event flag starts at 0, this filters out / ignores any
>>>    connect-events in hidpp_raw_hidpp_event() avoiding
>>>    hidpp_connect_event() getting queued before the IO restart
>>>
>>> 2. IO is started with connect-mask = 0
>>>    this avoids hid-input and hidraw connecting while probe() is setting
>>>    hdev->name and hdev->uniq
>>>
>>> 3. Name and serialnr are retrieved and stored in hdev
>>>
>>> 4. IO is fully restarted (including hw_open + io_start, not just hw_start)
>>>    with the actual connect-mask.
>>>
>>> 5. enable_connect_event atomic_t is set to 1 to enable processing of
>>>    connect events.
>>>
>>> 6. hidpp_connect_event() is queued + flushed to query the connected state
>>>    and do the connect work if the device is connected.
>>>
>>> 7. probe() now ends with:
>>>
>>>         /*
>>>          * This relies on logi_dj_ll_close() being a no-op so that
>>>          * DJ connection events will still be received.
>>>          */
>>>         hid_hw_close(hdev);
>>>
>>>    Since on restarting IO it now is fully restarted so the hid_hw_open()
>>>    there needs to be balanced. 
>>>
>>> This series now obviously is no longer 6.6 material, instead I hope we
>>> can get this rework (and IMHO nice cleanup) into 6.7 .
> 
> Yeah, not 6.6 anymore, but should be doable for 6.7.
> 
>>>
>>> Regards,
>>>
>>> Hans
>>
>> I forgot to add info on the list of devices I tested this on:
>>
>> Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
>> Logitech M720 Triathlon (bluetooth, HID++ 4.5)
>> Logitech K400 Pro (unifying, HID++ 4.1)
>> Logitech K270 (eQUAD nano Lite, HID++ 2.0)
>> Logitech M185 (eQUAD nano Lite, HID++ 4.5)
>> Logitech Keyboard LX501 (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
>> Logitech 27Mhz mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)
> 
> We should probably add this list to the commit messages.
> I'll need to test also myself on some problematic devices that have a
> special case (WTP, USB wired, BLE).

So you want to add this to all 14 commit messages ?

> Anyway, I'll have to test everything, but this looks like it's in a
> better shape than previously.
> 
> However, the thing I am afraid is that commit 498ba2069035 ("HID:
> logitech-hidpp: Don't restart communication if not necessary") was
> fixing devices that did not like the hid_hw_stop/start. I can't find the
> bug numbers however... So with your series, we might breaking those
> once again.
> 
> How about we do the following (in pseudo code):
> probe():
>   hidpp_connect_and_start(connect_mask = 0)
>   // retrieve name and serial
>   hid_connect(connect_mask) // with connect_mask ensuring we don't
>                             // create inputs if HIDPP_QUIRK_DELAYED_INIT
>                             // is set, instead of stop/start
>   hid_hw_close(hdev); // to balance hidpp_connect_and_start()
> 
> I think the above should even remove the need for the
> enable_connect_event atomic_t given that now we are not restarting the
> devices at all.

Interesting yes that looks good, any idea why this was not done
in commit 91cf9a98ae41 ("HID: logitech-hidpp: make .probe usbhid capable")
right away ?

Let me rework the series to use that tomorrow. This will probably also
allow dropping a bunch of the patches.

Regards,

Hans




> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>> 1) For reviewing you may also want to apply the entire series and look
>>> at the end result to help you understand why various intermediate steps
>>> are taken.
>>>
>>>
>>> Hans de Goede (14):
>>>   HID: logitech-hidpp: Revert "Don't restart communication if not
>>>     necessary"
>>>   HID: logitech-hidpp: Move hidpp_overwrite_name() to before connect
>>>     check
>>>   HID: logitech-hidpp: Add hidpp_non_unifying_init() helper
>>>   HID: logitech-hidpp: Remove connected check for non-unifying devices
>>>   HID: logitech-hidpp: Move get_wireless_feature_index() check to
>>>     hidpp_connect_event()
>>>   HID: logitech-hidpp: Remove wtp_get_config() call from probe()
>>>   HID: logitech-hidpp: Remove connected check for g920_get_config() call
>>>   HID: logitech-hidpp: Add a hidpp_connect_and_start() helper
>>>   HID: logitech-hidpp: Move the connected check to after restarting IO
>>>   HID: logitech-hidpp: Move g920_get_config() to just before
>>>     hidpp_ff_init()
>>>   HID: logitech-hidpp: Remove unused connected param from *_connect()
>>>   HID: logitech-hidpp: Fix connect event race
>>>   HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe()
>>>     restarts IO
>>>   HID: logitech-hidpp: Drop delayed_work_cb()
>>>
>>>  drivers/hid/hid-logitech-hidpp.c | 211 +++++++++++++------------------
>>>  1 file changed, 91 insertions(+), 120 deletions(-)
>>>
> 
> I like when the total number of deletions is higher than the additions
> :)
> 
> Cheers,
> Benjamin
> 
>>
> 

