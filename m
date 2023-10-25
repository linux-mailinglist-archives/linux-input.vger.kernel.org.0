Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1067D73D1
	for <lists+linux-input@lfdr.de>; Wed, 25 Oct 2023 21:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjJYTDh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Oct 2023 15:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjJYTDg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Oct 2023 15:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02B1116
        for <linux-input@vger.kernel.org>; Wed, 25 Oct 2023 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698260567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KvjJDE88gyBfUzLhixHvz8KZk/cmSffIq5trCeB+riU=;
        b=eukkgxGk1b+w6QTt+WasV9YNwKgSTZ6B48XIXW7sKhHO3Dtw2q4XsnHlSvCCtiz3HlMF/a
        H4G22xZgxYGXwfKLwTIhtAN/AnVU0pw5UW72Dd0cBIWc9QcCRae+Y9uaLjcYZhQQ4LH4Oc
        w6AN3mIQKSIs7OPPYGhmYYqyX+s0OEI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-QjMqywdwOsSR6FgPPlJ4uA-1; Wed, 25 Oct 2023 15:02:42 -0400
X-MC-Unique: QjMqywdwOsSR6FgPPlJ4uA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ba247e03aeso6128766b.1
        for <linux-input@vger.kernel.org>; Wed, 25 Oct 2023 12:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260560; x=1698865360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvjJDE88gyBfUzLhixHvz8KZk/cmSffIq5trCeB+riU=;
        b=ioMKWBlhuEbli8rlD1a2Ty+8dXsNL+uiz9UQ0YdcIqTpnA+IiAOAfItDdw3QpQCvMn
         7wi3JYZVQu0FA6JN/rtwfExi97WW31uo/egCdpcRMDbBiTgbJB0ispCr2Gy8kPx5CdpA
         Oush3vwv9Q3DFUJOGUHLBJQv4OXWGTJaeQ5cmCZTwDlJf9dl2n6qV9BRhQyPcJArPdkm
         bLVH8SJRNATMmyEwTGQ5iiSGsVtFH9XRInA/Xn8UGXzNqS75/DHlEGeTT2klYAKuW031
         F9AvDKUTRvsV4L2HAxXdZWJGyvmNWJ0p1PSShY2JcvvgEeF6HwlZH1I8EMQP2vskA6Rh
         vXPg==
X-Gm-Message-State: AOJu0Yzk7y87vGYake1lhctgDBfNTWsb+/vGddQ0fu33I+3LRcjbcEAa
        LmHFJh/jtF8I5wPI18P0JbyJjla6qF9URZ4xMZXGVmkyr/ytYPvZu69crHyAA+CcMnVHQw7lUOO
        RhonZpRbuy38e6NFZrY5nBtcg5fklZpk=
X-Received: by 2002:a17:907:25c3:b0:9bf:a614:9a2e with SMTP id ae3-20020a17090725c300b009bfa6149a2emr13637918ejc.61.1698260559917;
        Wed, 25 Oct 2023 12:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEOm5KNMeKcS7Mnml1tmNr6n832uk7huj6CMYU1mYyWFZxFq65AcwnjZXdDfAAcDUDKvaFJQ==
X-Received: by 2002:a17:907:25c3:b0:9bf:a614:9a2e with SMTP id ae3-20020a17090725c300b009bfa6149a2emr13637893ejc.61.1698260559531;
        Wed, 25 Oct 2023 12:02:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906011a00b009ae587ce128sm10364996eje.216.2023.10.25.12.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 12:02:38 -0700 (PDT)
Message-ID: <eddd433b-6243-1479-7881-f33a6694783c@redhat.com>
Date:   Wed, 25 Oct 2023 21:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 01/12] HID: logitech-hidpp: Don't restart IO, instead
 defer hid_connect() only
To:     Benjamin Tissoires <bentiss@kernel.org>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20231010102029.111003-1-hdegoede@redhat.com>
 <20231010102029.111003-2-hdegoede@redhat.com>
 <ha4irm6pz34zepdfpvs3vuo6ffvalkvfp4ase3githdtn4qlrz@tgl4lwzcpdee>
 <5xlyq6eoj2twunztyi6u63hw7hezljtt6jacg3hcuwp63rd4g6@uffuqovrugk4>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5xlyq6eoj2twunztyi6u63hw7hezljtt6jacg3hcuwp63rd4g6@uffuqovrugk4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/25/23 18:43, Benjamin Tissoires wrote:
> On Oct 18 2023, Benjamin Tissoires wrote:
>> Hi Hans,
>>
>> FWIW, your series looks good, but I came accross a small nitpick here:
>>
>> On Oct 10 2023, Hans de Goede wrote:
>>> Restarting IO causes 2 problems:
>>>
>>> 1. Some devices do not like IO being restarted this was addressed in
>>>    commit 498ba2069035 ("HID: logitech-hidpp: Don't restart communication
>>>    if not necessary"), but that change has issues of its own and needs to
>>>    be reverted.
>>>
>>> 2. Restarting IO and specifically calling hid_device_io_stop() causes
>>>    received packets to be missed, which may cause connect-events to
>>>    get missed.
>>>
>>> Restarting IO was introduced in commit 91cf9a98ae41 ("HID: logitech-hidpp:
>>> make .probe usbhid capable") to allow to retrieve the device's name and
>>> serial number and store these in hdev->name and hdev->uniq before
>>> connecting any hid subdrivers (hid-input, hidraw) exporting this info
>>> to userspace.
>>>
>>> But this does not require restarting IO, this merely requires deferring
>>> calling hid_connect(). Calling hid_hw_start() with a connect-mask of
>>> 0 makes it skip calling hid_connect(), so hidpp_probe() can simply call
>>> hid_connect() later without needing to restart IO.
>>>
>>> Remove the stop + restart of IO and instead just call hid_connect() later
>>> to avoid the issues caused by restarting IO.
>>>
>>> Now that IO is no longer stopped, hid_hw_close() must be called at the end
>>> of probe() to balance the hid_hw_open() done at the beginning probe().
>>>
>>> This series has been tested on the following devices:
>>> Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
>>> Logitech M720 Triathlon (bluetooth, HID++ 4.5)
>>> Logitech M720 Triathlon (unifying, HID++ 4.5)
>>> Logitech K400 Pro (unifying, HID++ 4.1)
>>> Logitech K270 (eQUAD nano Lite, HID++ 2.0)
>>> Logitech M185 (eQUAD nano Lite, HID++ 4.5)
>>> Logitech LX501 keyboard (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
>>> Logitech M-RAZ105 mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)
>>>
>>> Fixes: 498ba2069035 ("HID: logitech-hidpp: Don't restart communication if not necessary")
>>> Suggested-by: Benjamin Tissoires <bentiss@kernel.org>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/hid/hid-logitech-hidpp.c | 22 ++++++++++++----------
>>>  1 file changed, 12 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
>>> index a209d51bd247..aa4f232c4518 100644
>>> --- a/drivers/hid/hid-logitech-hidpp.c
>>> +++ b/drivers/hid/hid-logitech-hidpp.c
>>> @@ -4460,8 +4460,10 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>  			 hdev->name);
>>>  
>>>  	/*
>>> -	 * Plain USB connections need to actually call start and open
>>> -	 * on the transport driver to allow incoming data.
>>> +	 * First call hid_hw_start(hdev, 0) to allow IO without connecting any
>>> +	 * hid subdrivers (hid-input, hidraw). This allows retrieving the dev's
>>> +	 * name and serial number and store these in hdev->name and hdev->uniq,
>>> +	 * before the hid-input and hidraw drivers expose these to userspace.
>>>  	 */
>>>  	ret = hid_hw_start(hdev, will_restart ? 0 : connect_mask);
>>>  	if (ret) {
>>> @@ -4519,19 +4521,14 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>  	flush_work(&hidpp->work);
>>>  
>>>  	if (will_restart) {
>>> -		/* Reset the HID node state */
>>> -		hid_device_io_stop(hdev);
>>> -		hid_hw_close(hdev);
>>> -		hid_hw_stop(hdev);
>>> -
>>>  		if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
>>>  			connect_mask &= ~HID_CONNECT_HIDINPUT;
>>>  
>>>  		/* Now export the actual inputs and hidraw nodes to the world */
>>> -		ret = hid_hw_start(hdev, connect_mask);
>>> +		ret = hid_connect(hdev, connect_mask);
>>
>> On plain USB devices, we get a new warning here "io already started".
>>
>> This is because hid_connect() will call hid_pidff_init() from
>> drivers/hid/usbhid/hid-pidff.c if connect_mask has the `HID_CONNECT_FF`
>> bit set.
>>
>> And hid_pidff_init() blindly calls hid_device_io_start() then
>> hid_device_io_stop().
>>
>> It's not a big issue, but still it's a new warning we have to tackly on.
>>
>> I see 3 possible solutions:
>> - teach hid_pidff_init() to only start/stop the IOs if it's not already
>>   done so
>> - if a device is actually connected through USB, call
>>   hid_device_io_stop() before hid_connect()
>> - unconditionally call hid_device_io_stop() before hid_connect()
>>
>> The latter has my current preference as we won't get biten in the future
>> if something else decides to change the io state.
>>
>> However, do you thing it'll be an issue to disable IOs there?

Not really an issue, but if we disable IOs then we may loose
incoming packets with a connect event in there.

>> And maybe we should re-enable them after?

If we disable IOs before hid_connect() (or at any point
after enabling them) then connect events may be lost
so we must re-enable IOs then and move the hidpp_connect_event()
work queuing, which polls for already connected devices to
after the re-enabling.

Also IOs need to be re-enabled for the g920_get_config()
call later during hidpp_probe().

I have just written a patch for this and submitted it upstream :)

>> If it's fine to simply disable the IOs, we can add an extra patch on top
>> of this series to fix that warning in the USB case.
>>
>> As mentioned above, I have tested with the T650, T651 that were likely to
>> be a problem, and they are working just fine :)
>>
>> So with that minor fix, we should be able to stage this series.
> 
> The merge window is coming very soon. So I'm taking this series as it is
> (I just added the few devices I made the tests), and we can work on an
> extra patch to remove that warning.

Extra patch submitted :)

Regards,

Hans



