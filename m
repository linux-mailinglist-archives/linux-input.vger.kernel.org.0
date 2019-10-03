Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B29CA04F
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 16:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbfJCO3T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 10:29:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59582 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfJCO3S (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 10:29:18 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 27F937FDEC
        for <linux-input@vger.kernel.org>; Thu,  3 Oct 2019 14:29:18 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id n14so1786772edt.3
        for <linux-input@vger.kernel.org>; Thu, 03 Oct 2019 07:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zdy8j3H8PEhJX3SfrrF1ZAnw8e5kJTJy/4yzLXOlT3s=;
        b=ByMI2SR9P5ZFLpv75UVmWX21RAHxtPzG29Xo7AmF5nY+W3SWW66GGYDNf9p78kpz5p
         V9PiX2DnoUbd1q4QvUFRSkOziHY87ctrELSINS+wUTfI1VddQ1yU8gb9gaDVXEPvY5fC
         uEzNLn6WWxALG8g/yg09R/nvk2+A+xMhUC/IRclelNAVEm2h7NyB/j3Vq6gck8RCcJUW
         oZjYLzT5771v10DBoGIXTTsyzcHtd2Ir9YoHqcenEHWTK/7mPanB2hKRg4xg3GgV0CUH
         8WVd5xhWrDlj9Thoz0BKpIJ56sMuF/MFYGr1BZwmCiunxvnlICp7T8dasFrePPl4m9c9
         8OUw==
X-Gm-Message-State: APjAAAW0gpLdtn4AA9MfWgebOQh7U3Rh/z+yEwjSLWP+gDIIOi2GOM3s
        3ckZo1umuYA0fNmeAlOwtoh8RoV6m2yGVvboLZLpFWqamAVhSYFjaV2qs0CW9hxhltibKeqb262
        HlezBUZ/Xgjul7LbivAJZT2Y=
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr9577737edx.230.1570112956470;
        Thu, 03 Oct 2019 07:29:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlgn/RGlZ+L3gm5nBNIGl7TUX6vYsqRQcPzPE+GqgWbqs0IIOSkX6lyyRlO8wC9nb8Bu9u1Q==
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr9577726edx.230.1570112956292;
        Thu, 03 Oct 2019 07:29:16 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id e52sm500492eda.36.2019.10.03.07.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 07:29:15 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] HID: Add driver for Logitech gaming keyboards
 (G15, G15 v2)
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <20190828124130.26752-1-hdegoede@redhat.com>
 <20190828124130.26752-2-hdegoede@redhat.com>
 <nycvar.YFH.7.76.1910031540530.13160@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <378599dd-cd9b-98b3-0c8e-b6e7d6a01a06@redhat.com>
Date:   Thu, 3 Oct 2019 16:29:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.1910031540530.13160@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 03-10-2019 15:41, Jiri Kosina wrote:
> On Wed, 28 Aug 2019, Hans de Goede wrote:
> 
>> Add a driver to stop the extra "G" keys from sending F1 - F12 instead
>> making them send KEY_GKEY# and also make the non-functional M1 - M3 and MR
>> keys and the non-functional buttons below the LCD panel properly generated
>> key events.
>>
>> Note the connect_mask and gkeys_settings_output_report variables may seem
>> unnecessary since they are always set to the same value, these are there in
>> preparation of adding support for the G, M and LCD keys on the G510 kbd.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - s/KEY_LCD_MENU/KEY_KBD_LCD_MENU/
>> ---
>>   MAINTAINERS              |   7 ++
>>   drivers/hid/Makefile     |   1 +
>>   drivers/hid/hid-ids.h    |   2 +
>>   drivers/hid/hid-lg-g15.c | 256 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 266 insertions(+)
>>   create mode 100644 drivers/hid/hid-lg-g15.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6480cf7c8bb3..8dfad599d367 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9474,6 +9474,13 @@ S:	Maintained
>>   F:	Documentation/admin-guide/ldm.rst
>>   F:	block/partitions/ldm.*
>>   
>> +LOGITECH HID GAMING KEYBOARDS
>> +M:	Hans de Goede <hdegoede@redhat.com>
>> +L:	linux-input@vger.kernel.org
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>> +S:	Maintained
>> +F:	drivers/hid/hid-lg-g15.c
>> +
>>   LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
>>   M:	Sathya Prakash <sathya.prakash@broadcom.com>
>>   M:	Chaitra P B <chaitra.basappa@broadcom.com>
>> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
>> index cc5d827c9164..666f4358207e 100644
>> --- a/drivers/hid/Makefile
>> +++ b/drivers/hid/Makefile
>> @@ -63,6 +63,7 @@ obj-$(CONFIG_HID_KYE)		+= hid-kye.o
>>   obj-$(CONFIG_HID_LCPOWER)	+= hid-lcpower.o
>>   obj-$(CONFIG_HID_LENOVO)	+= hid-lenovo.o
>>   obj-$(CONFIG_HID_LOGITECH)	+= hid-logitech.o
>> +obj-$(CONFIG_HID_LOGITECH)	+= hid-lg-g15.o
> 
> Hi Hans,
> 
> I've finished reviewing this pile, and would like to queue it for 5.5, but

Great, thank you for reviewing this!

> have one remaining question -- what is the reason you decided to factor
> this out as a separate driver, instead of putting it under the
> hid-logitech umbrella?

I put this in a separate driver, because it is a substantial chunk of code
and the gaming keyboard stuff shares nothing what so ever with the other
Logitech bits.

Regards,

Hans
