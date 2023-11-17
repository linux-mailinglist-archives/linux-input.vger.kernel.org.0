Return-Path: <linux-input+bounces-121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5D7EF7F1
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 20:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DEF1281075
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 19:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F6F3C475;
	Fri, 17 Nov 2023 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FezmO0n5"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E3ED5D
	for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 11:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700250129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENWuiFf5lpx/iyG+8LZv+KmBRe3js/M2tBE65UYcg7c=;
	b=FezmO0n5GryJ3lsZ+F7HAO/JbCCidDgLzfUseB81H5Mp2Acyta7sVa/r6izYXqbCRqQX2W
	nSsHWRUHE2SK+/CYoyWdlNyQav6slDzHvGHhPYlUTyRvLEEVSpDNYo2sIsAwQcyrmkq5xs
	Ct3/LlQ6cmX0VTEbMvjMhQAMddQHf9c=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-I8xPPS3rMSmhvareLujCJg-1; Fri, 17 Nov 2023 14:42:08 -0500
X-MC-Unique: I8xPPS3rMSmhvareLujCJg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5079a3362afso2301173e87.3
        for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 11:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700250124; x=1700854924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENWuiFf5lpx/iyG+8LZv+KmBRe3js/M2tBE65UYcg7c=;
        b=ZkgmmtYB8ICMgmlxJnseangKAlCPfxL74xq3xx2TPG0Q2nIHSX9jeuABFhNnH6zfCs
         Gd052UDW/3ena2sIv0A0d9WGnMslu+/Xe8hhucGIjjhc/T6nOWdCgVNrmy0Hr8+i8LRY
         TuSELutVYjEJ6/y4Bo/jl8l2bqMdgXbPq//TJRPV/ouQNQNpGP3IWGvSK1Z59mcRdNYw
         rFL1zVYj0NxpTtAxb5l4mZRhBsvgkqszq1/02xP74/v+z6C4C5NGD7MTi0cMmJk7QvmJ
         775Y6UKYT7nw/BbqRyH1borjmN4i86UIfzeqypFSkNOVDFGsrMQ9VsU1oyVlTSFUr39H
         3lvg==
X-Gm-Message-State: AOJu0YytuupAAALC83+m2/upyZGVoA4db92nO3dz/wjXRbAvcORCCOhW
	nDnEWrtSX98Zme5ISzRjwKJ94vg3UNtPUMtJnkOnWj3AzElYPEkDRlr8/bBS8XVjh+/wQUOvW6g
	adh53dYlX1YPOKhnITsxk4D1wLP/5AJc=
X-Received: by 2002:ac2:5df1:0:b0:509:45ed:1083 with SMTP id z17-20020ac25df1000000b0050945ed1083mr420398lfq.40.1700250123905;
        Fri, 17 Nov 2023 11:42:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIBvKbigLjY2UCsXtpSBbjqtN23ZqtRpx5OnwR1lSYCJKIrI986J5wvAAAJozfewa+7gambA==
X-Received: by 2002:ac2:5df1:0:b0:509:45ed:1083 with SMTP id z17-20020ac25df1000000b0050945ed1083mr420380lfq.40.1700250123534;
        Fri, 17 Nov 2023 11:42:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7c152000000b0053635409213sm1012889edp.34.2023.11.17.11.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 11:42:02 -0800 (PST)
Message-ID: <52c2e5f0-1640-4b06-ba37-20579e6f51f8@redhat.com>
Date: Fri, 17 Nov 2023 20:42:02 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after
 reading the report-descriptor
Content-Language: en-US, nl
To: Doug Anderson <dianders@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, Julian Sax
 <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>,
 Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
 Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>,
 Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
References: <20231104111743.14668-1-hdegoede@redhat.com>
 <20231104111743.14668-5-hdegoede@redhat.com>
 <CAD=FV=VPR-oVtrh+vA2x3NPqr7Cn4yP0XJC_JLr0D7p9d2Z2kw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAD=FV=VPR-oVtrh+vA2x3NPqr7Cn4yP0XJC_JLr0D7p9d2Z2kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/6/23 19:53, Doug Anderson wrote:
> Hi,
> 
> On Sat, Nov 4, 2023 at 4:17 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> @@ -746,8 +752,6 @@ static int i2c_hid_parse(struct hid_device *hid)
>>
>>         do {
>>                 ret = i2c_hid_start_hwreset(ihid);
>> -               if (ret == 0)
>> -                       ret = i2c_hid_finish_hwreset(ihid);
> 
> The mutex contract (talked about in a previous patch) is a little more
> confusing now. ;-) Feels like it needs a comment somewhere in here so
> the reader of the code understands that the reset_mutex might or might
> not be locked here.
> 
> ...or would it make more sense for the caller to just handle the mutex
> to make it more obvious. The "I2C_HID_QUIRK_RESET_ON_RESUME" code
> would need to grab the mutex too, but that really doesn't seem
> terrible. In fact, I suspect it cleans up your error handling and
> makes everything cleaner?

I agree that moving the mutex to the callers would be better,
I've just completed this change for v2 of the series.

>>                 if (ret)
>>                         msleep(1000);
>>         } while (tries-- > 0 && ret);
>> @@ -763,9 +767,8 @@ static int i2c_hid_parse(struct hid_device *hid)
>>                 i2c_hid_dbg(ihid, "Using a HID report descriptor override\n");
>>         } else {
>>                 rdesc = kzalloc(rsize, GFP_KERNEL);
>> -
>>                 if (!rdesc) {
>> -                       dbg_hid("couldn't allocate rdesc memory\n");
>> +                       i2c_hid_abort_hwreset(ihid);
>>                         return -ENOMEM;
>>                 }
>>
>> @@ -776,10 +779,21 @@ static int i2c_hid_parse(struct hid_device *hid)
>>                                             rdesc, rsize);
>>                 if (ret) {
>>                         hid_err(hid, "reading report descriptor failed\n");
>> +                       i2c_hid_abort_hwreset(ihid);>>                         goto out;
>>                 }
>>         }
>>
>> +       /*
>> +        * Windows directly reads the report-descriptor after sending reset
>> +        * and then waits for resets completion afterwards. Some touchpads
>> +        * actually wait for the report-descriptor to be read before signalling
>> +        * reset completion.
>> +        */
>> +       ret = i2c_hid_finish_hwreset(ihid);
>> +       if (ret)
>> +               goto out;
> 
> Given your new understanding, I wonder if you should start reading the
> report descriptor even if "use_override" is set? You'd throw away what
> you read but maybe it would be important to make the touchscreen
> properly de-assert reset? I guess this is the subject of the next
> patch...

Right, for the devices where use_override gets set
the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET is also always set, so
i2c-hid-core basically does not expect reset-complete to be signalled
via IRQ on these devices.

Since these devices are all kinda weird I have chosen to just preserve
the old behavior (1) there to avoid regressions

1) just doing a msleep(100) instead of waiting for the IRQ

> Also: I guess there's the assumption that the touchscreens needing the
> other caller of the reset functions (I2C_HID_QUIRK_RESET_ON_RESUME)
> never need to read the report like this?

That is correct, only a few devices need to read the report like this
for the reset complete IRQ to happen and since I2C_HID_QUIRK_RESET_ON_RESUME
is only set on a few devices and we know it works there already the
assumption indeed is that on those devices the reading of the report
after reset is not necessary.

Regards,

Hans


