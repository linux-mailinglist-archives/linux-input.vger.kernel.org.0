Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98BF391549
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbhEZKsQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:48:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56337 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233953AbhEZKsO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622026003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DPoXYLwEgqebGG6OHTjBith9HYt0LvEfqH7SVbl1XfU=;
        b=MduK4RY4uBqPY/A9bDJPnda4ni1sNGZhtekYpbaUv/5qY4OI6oi0O/03Lodxe6CakK1IL/
        LFWhw9+eI5zcdhxM7yzXt6UMdB3AUID5kYxIRfagQ6qsoYoCvTciotRFyfxIRJJF4/97xU
        0lZCCHV4LbpHJrCS8b0l/chbVxw8GeE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-UF4OR3vnPiicOiI8X6ao1w-1; Wed, 26 May 2021 06:46:41 -0400
X-MC-Unique: UF4OR3vnPiicOiI8X6ao1w-1
Received: by mail-ej1-f72.google.com with SMTP id sd18-20020a170906ce32b02903cedf584542so266482ejb.9
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 03:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DPoXYLwEgqebGG6OHTjBith9HYt0LvEfqH7SVbl1XfU=;
        b=KM7x3xPcmLYwU0IOnNboJ9ewGGB3kJEbAXhjsBrqdKoiO0SS9pXoXienLWevm4jP+Y
         VO2ZAk3I6It9yOqXxyVAwWZCIT3DP5Fg02AvMA1SpvvwdyWOMANs+8k62p52kAcV2S45
         8zFzJGCNkBTJEIonbdHZIDDThoOZV1F1c/JyASPFp2sp1sbEUZ3crjT57wJALn/GAAUv
         Fj1WTg4mphv0LYXkZxWiMcdRupPoL6daqZe5fYmy/ArMDUf0klcCDcMwlgdFU3yAmSqm
         cExQxG/onzZDTm/FTm7WEnG8ozF8K2Qok9L4IXvB7D2e5h5OLKIlGNlcPHd7cocKuMIn
         GvNA==
X-Gm-Message-State: AOAM5339Rv43XxthA8TP25iq3wE2JzktyJrofM2nRy9oHoRBvkiyrDfR
        8uenkg+c5BkRv96OHNnqqD3Z83YrzEQsW35P4kckOS6G4IStHfUH6Z8NSg/cHWuhIFB/imkd4Tn
        jn8SbmQO1vVsXht/vzPDUR5l5+TdkSEOKpXzSoFzPNxSDWqmPFIcuaPf2urESHkYy/yxT6rj6kf
        s=
X-Received: by 2002:a17:906:17cb:: with SMTP id u11mr33657378eje.231.1622026000229;
        Wed, 26 May 2021 03:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLv51A/IDQkQ3m9Ho5c/+KEer2DP0kwdAAlbaaAziJhWmmXoIYbehJ3uGbl+pg8umPxeCcPQ==
X-Received: by 2002:a17:906:17cb:: with SMTP id u11mr33657366eje.231.1622026000043;
        Wed, 26 May 2021 03:46:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gx23sm10507941ejb.125.2021.05.26.03.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 03:46:39 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] HID: Misc. fixes
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20210505213935.631351-1-hdegoede@redhat.com>
 <nycvar.YFH.7.76.2105261238110.28378@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <72853307-3e7a-a98e-8870-0c7d74506e65@redhat.com>
Date:   Wed, 26 May 2021 12:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2105261238110.28378@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/26/21 12:38 PM, Jiri Kosina wrote:
> On Wed, 5 May 2021, Hans de Goede wrote:
> 
>> Hi Jiri, Benjamin,
>>
>> Here is v2 of what started out as a small series to fix spurious wakeups
>> on T101HA 2-in-1s.
>>
>> This adds the discussed hid_is_usb_device() helper and uses that in:
>>
>> "HID: multitouch: Disable event reporting on suspend when our parent is
>> not a wakeup-source"
>>
>> To avoid needing to add a "depends on USB_HID" to hid-multitouch Kconfig
>> settings.
>>
>> I've checked all other hid_is_using_ll_driver(hdev, &usb_hid_driver) callers
>> and the only one which can truely benefit from the new helper is the
>> hid-asus driver, which also deals with some I2C devices on some Asus hw.
>>
>> All other drivers using hid_is_using_ll_driver(hdev, &usb_hid_driver)
>> are only for USB devices, so dropping the "depends on USB_HID" does not
>> make sense for them.
>>
>> The one other driver which may benefit from the new hid_is_usb_device()
>> helper would be the Wacom driver which seems to also support I2C devices,
>> but that contains a lot of USB specific code, so I don't think we can
>> easily drop the "depends on USB_HID" there.
>>
>> Even though this is a bit if a mixed-bag of patches, their are several
>> dependencies between them, so these should probably all go on a single
>> topic branch.
> 
> Now in for-5.13/upstream-fixes. Thanks,

Thank you, it seems that in the process of dropping the patches which
you had already merged from v1 of this series; and replacing them with v2,
you completely dropped:

[PATCH v2 5/6] HID: asus: Cleanup Asus T101HA keyboard-dock handling

(which was also in v1) at least I cannot find this in either one of:

https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/drivers/hid/hid-asus.c?h=for-next
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/drivers/hid/hid-asus.c?h=for-5.13/upstream-fixes

Regards,

Hans

