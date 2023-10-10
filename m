Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46EAD7BF79F
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 11:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbjJJJkw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 05:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjJJJkw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 05:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823E893
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696930808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ApSTqb65Vr1ghtGs/zrrXHyEgszmbogaa6IpYaX13Dc=;
        b=PGycfh3FBVum1ZFakOns5sT+Dk/+GI/HruD40AVhYxhHp5nhCcyjY/cjne636lKdRuiXpR
        FfytoUn7jvJPvIIrP8UDpgYtva/A7hOQd+E7/UB4tubRBj07DDHIRV80b5zZE97XIbL7bQ
        z7e4RZo3bTfTAoD0j0/Ra2JdgdVnpOo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-Y8v8DZn4OaOVCT8_T_dOeQ-1; Tue, 10 Oct 2023 05:40:07 -0400
X-MC-Unique: Y8v8DZn4OaOVCT8_T_dOeQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99bcb13d8ddso186547266b.0
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 02:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930806; x=1697535606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApSTqb65Vr1ghtGs/zrrXHyEgszmbogaa6IpYaX13Dc=;
        b=PDD1ugXIPjpfreaNNjBtT5LSyBxTAf7U25YNiGeaz38EncKxNs+A99I2f5lEkJRN+Z
         tPo938/phmDSIStpOQ1gczlb+2UOjU8BVL5IAhvelliEgciw9YLxpan23Y05sANH3lnO
         zDV6KvO8W0qc+t0+DfjbNaxWM3DkbPrDWMjZTq4uG64dcjna9ukG/TbcI70V6rnxDj9p
         sG8j2zKetZIDW5WlkShRLWB2+b6XwTcisg/90Hco/Jlu8t4LcHdmQB7LBbJBM4dbwzdE
         chWWZf32eithpUyEdnJhq2KT5+7gLAErhS66YN6EyfyXh82/o9Ly2uQ3v61nInp70zYr
         +FRA==
X-Gm-Message-State: AOJu0YzIvp0PMl2l4LVBEfRejl2HXT/soIGhw2qpvmlmJLu35nixataj
        Z9tu16CgmX+9+WVZA6ejg1Q6dbWZiyOCvlsEbZ6a1XE691M91w0tfjoqKgpRndBNV95cX6mEANr
        rERYYa1kipF+744HY69mKw2M=
X-Received: by 2002:a17:906:32cb:b0:9ae:7622:eed9 with SMTP id k11-20020a17090632cb00b009ae7622eed9mr15927283ejk.50.1696930806007;
        Tue, 10 Oct 2023 02:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESneLLXUR6Zco/mHR/Pdl0J0k3hFIKJveDdZ7akpQYCYqhhuqOEYrqrDxmLY8vObN8WGdU/A==
X-Received: by 2002:a17:906:32cb:b0:9ae:7622:eed9 with SMTP id k11-20020a17090632cb00b009ae7622eed9mr15927263ejk.50.1696930805606;
        Tue, 10 Oct 2023 02:40:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cf7-20020a170906b2c700b009b296ce13a3sm8390084ejb.18.2023.10.10.02.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:40:04 -0700 (PDT)
Message-ID: <73344c94-a36a-258e-4225-061da8e8e06b@redhat.com>
Date:   Tue, 10 Oct 2023 11:40:03 +0200
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
 <f28d42de-e2f3-bb2e-ed69-b7f21bcf06f9@redhat.com>
 <hjcpffahcxfqxfzyd7as2v75wpqbta2arj7dy3d2xwg7pz7q4g@4lv2dry2gcp7>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <hjcpffahcxfqxfzyd7as2v75wpqbta2arj7dy3d2xwg7pz7q4g@4lv2dry2gcp7>
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

On 10/10/23 11:36, Benjamin Tissoires wrote:
> On Oct 09 2023, Hans de Goede wrote:

<snip>

>>> However, the thing I am afraid is that commit 498ba2069035 ("HID:
>>> logitech-hidpp: Don't restart communication if not necessary") was
>>> fixing devices that did not like the hid_hw_stop/start. I can't find the
>>> bug numbers however... So with your series, we might breaking those
>>> once again.
>>>
>>> How about we do the following (in pseudo code):
>>> probe():
>>>   hidpp_connect_and_start(connect_mask = 0)
>>>   // retrieve name and serial
>>>   hid_connect(connect_mask) // with connect_mask ensuring we don't
>>>                             // create inputs if HIDPP_QUIRK_DELAYED_INIT
>>>                             // is set, instead of stop/start
>>>   hid_hw_close(hdev); // to balance hidpp_connect_and_start()
>>>
>>> I think the above should even remove the need for the
>>> enable_connect_event atomic_t given that now we are not restarting the
>>> devices at all.
>>
>> Interesting yes that looks good, any idea why this was not done
>> in commit 91cf9a98ae41 ("HID: logitech-hidpp: make .probe usbhid capable")
>> right away ?
> 
> I tried to do a little bit of digging. Initially I thought that's
> because I was always doing that stop/start dance, and so I continued
> with that.
> 
> But looking slightly more carefully, I think I understand why:
> - calling twice hid_connect should fail, because it'll create twice the
>   sysfs nodes for the HID device itself
> - so we need to call hid_disconnect() first
> - this was done through hid_hw_stop() and given that the dj driver has
>   empty stubs for start/stop, this was semantically the same.
> 
> So using hid_hw_stop/start was a shortcut because DJ had empty stubs.
> But when I enabled direct use of hidpp from other transport layers, I
> did not realized that there was this glitch.
> 
> And then I completely forgot to clean up that because "at the end of a
> HID driver we are supposed to call hid_hw_start()".
> 
>>
>> Let me rework the series to use that tomorrow. This will probably also
>> allow dropping a bunch of the patches.
> 
> Yeah, I think we should be able to remove the sync mechanism.
> And be careful to call hid_disconnect() before
> hid_connect(connect_mask), or you'll probably have errors if not when
> plugging the device, but when unplugging it for sure.

Note that hid_hw_start() never calls hid_connect() when called with
a connect_mask of 0, so just simply calling hid_connect() later should
be fine without needing to do a hid_disconnect() before:

int hid_hw_start(struct hid_device *hdev, unsigned int connect_mask)
{
        int error;

        error = hdev->ll_driver->start(hdev);
        if (error)
                return error;

        if (connect_mask) {
                error = hid_connect(hdev, connect_mask);
                if (error) {
                        hdev->ll_driver->stop(hdev);
                        return error;
                }
        }

        return 0;
}
EXPORT_SYMBOL_GPL(hid_hw_start);

Regards,

Hans


