Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BAC7BBDB3
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 19:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbjJFRZt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 13:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbjJFRZr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 13:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94502D8
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696613103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mLVUyshwnPobqcpQLpDXI/mKyIxKrhmdCJN7MIIJQGo=;
        b=RlUC82N7TzNi0j1TDjBfwmTbUul5Wf8XsbU6KXO6W5STX1+dOWhsyCgoB2i8bAWOoIfhZL
        EW/HezMljlGFdVskYQFcUwGikWD6bT0Y6yDITVPEywTAXgioNFwfxeFrmRcuZL3UzZzYbf
        Soi+ViZnpOd0riM/r7uJhOTDgNByBCA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-T0WBLwwqNeyheNEFwiEqSA-1; Fri, 06 Oct 2023 13:25:02 -0400
X-MC-Unique: T0WBLwwqNeyheNEFwiEqSA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bcb13d8ddso205967766b.0
        for <linux-input@vger.kernel.org>; Fri, 06 Oct 2023 10:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696613101; x=1697217901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLVUyshwnPobqcpQLpDXI/mKyIxKrhmdCJN7MIIJQGo=;
        b=gN9xDsUKOEAjOd3PYuVEECGkBWpbbjlDMsB2a0CU1AMTzXPkIH9tYv1Vyzr8bCHNSQ
         h6njdHLR7PBYhwnfOscp3Udf9S0arZOaWv8+FM1Nh3/abszUFepam0OpPqEkRhjV3D0T
         +gqVb7z8z8YXafxN2EqUzg+ktAt6Ff8n/MYEs8phi7P3k1Jl2Jqg5LujiamzKO4CQPI4
         byZoch5zQE9ZKgUaxpvAXwGlEYy2m7tVpw9zP5DcvTSZUQOTwL12av8I+8uzOq+xrgcj
         1mmyqR+1uKTcrpCAqy+LhnGeFr8SlRQzL5EdpIzRjOsQc0iTBmpUVS0bBVrCg2oEkbIq
         M67Q==
X-Gm-Message-State: AOJu0YweX/KoEqgXGQHLeps2W8hIEV8Q0HpM7T269rrM01HvC00TrXdq
        2MZjn7r4TJpxvO3xC4gb194f7W0Py2TmV7qvb8+yAPQdurDYtuEkRHNBjwvEuqdjm5P0wjAoxhY
        d18si3JFaa1y6OV1ZvTa05t4=
X-Received: by 2002:a17:906:1d:b0:9b2:be12:d9bd with SMTP id 29-20020a170906001d00b009b2be12d9bdmr6538913eja.77.1696613101179;
        Fri, 06 Oct 2023 10:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRNa55c2g9/ctollg94wEkfJry5YMJf4KRXKiNitRB43l1A3bH/tSlCrT9ezKyQWEe8NE5Jw==
X-Received: by 2002:a17:906:1d:b0:9b2:be12:d9bd with SMTP id 29-20020a170906001d00b009b2be12d9bdmr6538902eja.77.1696613100838;
        Fri, 06 Oct 2023 10:25:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j24-20020a170906051800b00993470682e5sm3156694eja.32.2023.10.06.10.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 10:25:00 -0700 (PDT)
Message-ID: <c5d79ddb-43ff-2a3d-8577-92fbd52ccb44@redhat.com>
Date:   Fri, 6 Oct 2023 19:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] HID: logitech-hidpp: Avoid hidpp_connect_event()
 running while probe() restarts IO
Content-Language: en-US, nl
To:     Benjamin Tissoires <bentiss@kernel.org>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org
References: <20231006081858.17677-1-hdegoede@redhat.com>
 <20231006081858.17677-2-hdegoede@redhat.com>
 <iqchunho27bqb6dp24ptfx32gdwbq6f6v654ftfme4kel3hoa6@5t2x4kcms2wk>
 <686e8973-613b-2fb3-efd6-26f3dd21ed9d@redhat.com>
 <zjiang3fdy4o7r3daupwpnx6zesmeeerldpx5fno2adzialpre@cdp7tq4araww>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <zjiang3fdy4o7r3daupwpnx6zesmeeerldpx5fno2adzialpre@cdp7tq4araww>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        GUARANTEED_100_PERCENT,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/6/23 18:28, Benjamin Tissoires wrote:
> On Oct 06 2023, Hans de Goede wrote:

<snip>

>>>> @@ -4207,36 +4208,39 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>>>>  		return;
>>>>  	}
>>>>  
>>>> +	/* Avoid probe() restarting IO */
>>>> +	mutex_lock(&hidpp->io_mutex);
>>>
>>> I'd put a `__must_hold(&hidpp->io_mutex);` here, not changing any return
>>> path and forcing any caller to `hidpp_connect_event()` (which will
>>> eventually only be the work struct) to take the lock.
>>>
>>> This should simplify the patch by a lot and also ensure someone doesn't
>>> forget the `goto out_unlock`.
>>
>> Ok, I can add the __must_hold() here and make 
>> delayed_Work_cb take the lock, but that would make it
>> impossible to implement patch 2/2 in a clean manner and
>> I do like patch 2/2 since it makes it clear that
>> hidpp_connect_event must only run from the workqueue
>> but I guess we could just add a comment for that
>> instead.
> 
> In 2/2, just rename this function to __do_hidpp_connect_event(), and
> have hidpp_connect_event() being the worker, which takes the lock, and
> calls __do_hidpp_connect_event().

Ok, will do for v2.

<snip>

>>>> @@ -4519,6 +4526,9 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>>  	flush_work(&hidpp->work);
>>>>  
>>>>  	if (will_restart) {
>>>> +		/* Avoid hidpp_connect_event() running while restarting */
>>>> +		mutex_lock(&hidpp->io_mutex);
>>>> +
>>>>  		/* Reset the HID node state */
>>>>  		hid_device_io_stop(hdev);
>>>
>>> That's the part that makes me raise an eyebrow. Because we lock, then
>>> release the semaphore to get it back later. Can this induce a dead lock?
>>>
>>> Can't we solve that same scenario without a mutex, but forcing either
>>> the workqueue to not run or to be finished at this point?
>>
>> I'm not sure what you are worried about after the mutex_lock
>> the line above we are 100% guaranteed that hidpp_connect_event()
>> is not running and since it is not running it will also not
>> be holding any other locks, so it can not cause any problems.
> 
> Agree, but my point is that you are not entirely solving the issue:
> if now, between hid_device_io_stop() and hid_hw_close() we receive a
> connect notification from the device, hid_input_report() will return
> -EBUSY, and we will lose it (it will not be stacked in the workqueue).
> 
> I was thinking at adding a flush_work(&hidpp->work) here, instead of
> the mutex solution, but yours ensures that any connect event already
> started will be handled properly, which is a plus.
> 
> Still if between the mutex lock here we receive a connect event from the
> device, we still get -EBUSY at the hid-core layer, and so we will lose
> it. Maybe that's OK because we might re-ask for the device later (I
> don't remember exactly the code), but my point is that because we add a
> mutex doesn't mean we will solve all multi-thread problems. So finding a
> non-mutex solution sometimes is better :)
> 
> And the fact that we need to think through every preemption case often
> means that there is something wrong *elsewhere*.

Right, I did consider seeing if we can get rid of the restart
altogether, as the whole restarting thing is actually the problem
here. AFAICT this is only really necessary in the WTP path since
there where we need to know resolution before instantiating the
input device.

But atm this is also done for all unifying devices, which seems
unnecessary.

Buy we still need the restart anyways for the WTP case,
so we need to make it work reliable anyways.

Now that I understand your concern about the missed connect
packet, which I agree is a real concern I think I know how to
fix this. I'll prepare a new version of this series tomorrow.

Hmm, thinking more about this, if we normally just create
the input device right away even for unifying devices and
we already always delay the creation for WTP even during
the restart:

                if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
                        connect_mask &= ~HID_CONNECT_HIDINPUT;

Then I wonder why do we even bother to do the restart
thing for unifying devices. Do you know what this is based on ?

I guess this might have to do with ensuring the configure
commands are send before creating the input + hidraw
devices, but if the connect event comes later on then
the configuration is already done later on after
the input device has already been created ?

So maybe we should indeed just remove the whole restart
thing entirely and also always rely on hidpp_connect_event
to send the configuration commands, because currently
those are send twice if the device is already connnected
at probe() time.

Regards,

Hans




