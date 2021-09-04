Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140C5400D61
	for <lists+linux-input@lfdr.de>; Sun,  5 Sep 2021 00:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhIDWzX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 18:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhIDWzW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 18:55:22 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B1FC061575
        for <linux-input@vger.kernel.org>; Sat,  4 Sep 2021 15:54:20 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso2125921wmc.5
        for <linux-input@vger.kernel.org>; Sat, 04 Sep 2021 15:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8mC7Fg6QEEmcIj5qIag6CMVcvZphzlS7hqjHBsZy098=;
        b=H6ROye+P+EnQUissVIkYBsaVZ83V1TcbeznIQYvwCBW64A/zIE+T2pWjMezTYooP2M
         V6THBybTG8Im/5nqC79JUO1FGvsIfoWmBhTKxx8vlmGMPhWZDRHg0GAGI48C3Y0qtgTj
         PVA9+AhpXfPSeJ3BSAYWiLcCLqfcI1Kclb2kd4dRPQGAMSqKqNVSzOc2ksdZ15okKuzR
         kyKmvJpZfvRxkqxP3arYhkfDA1ivRjaRQ87MvuLO45E93J4gLeOxv141sUd9b1wapYcL
         8cHXUNPq987T4u1vNIdEx28Of/YngK387XiWWzMstssUsFXgez/su8/1nwcoesYBs3ZO
         1hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8mC7Fg6QEEmcIj5qIag6CMVcvZphzlS7hqjHBsZy098=;
        b=THbg7vkzutfTtnszGVw7OrE5VHMrUmxzFeQRkRwVB9NRuq6uNeXRMOBacs65jFrdTd
         1Uxj1L0LPk9+BEY4DRelQZfG8nu16+u4k6k8rcnNgeY7fg+fRmYcPbc/bO2YYp9ddC+Z
         tZm59pT5eETkGMqk6VakVZC1oLpRUQG1KediruRQaNjZPuLJIKock3r65pLNHYQ1yLv9
         9aLtU/YsGQ0/W3k5ATSBBG5nZmGcPWLHmAe+yrpsCyKB5djJGAj96Zl49CDybUPWNkvQ
         3k9aYzhJxnwMxMzrimY1VWyFokviS7wmx7YyBww0BFhitWzFn+jIdh0Xgc/qjJvizuzP
         tq3Q==
X-Gm-Message-State: AOAM530OiQ2Nd+RXLfV1+1j+BJZ0lYjCaitBSAlNLHazFsd7gDOsKWHM
        BRdesbhxWwY0QLPxi5rhvQpYq6V18vJPi/PS6MZaUsoySl9po98=
X-Google-Smtp-Source: ABdhPJyZoEQPAOrBVhp6dQEbD1Jt8ncDe253tO0JtDqZeZNAXWK/trfh2PoaugD4kjOCp//VwWcy3gJE4oihAD3GfA0=
X-Received: by 2002:a05:600c:3b84:: with SMTP id n4mr4829841wms.50.1630796058364;
 Sat, 04 Sep 2021 15:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210904205840.78242-1-jerome.debretagne@gmail.com> <CANRwn3S1qTcDWXrXr0WBoC4RSrB=CjrRom3=GXD8Tby=Y+W=8g@mail.gmail.com>
In-Reply-To: <CANRwn3S1qTcDWXrXr0WBoC4RSrB=CjrRom3=GXD8Tby=Y+W=8g@mail.gmail.com>
From:   =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= 
        <jerome.debretagne@gmail.com>
Date:   Sun, 5 Sep 2021 00:53:41 +0200
Message-ID: <CA+kEDGGqRcwjdSLm1dksHtqMRde+zaFTqZMjYBNCU1uBrNDXFw@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Add Dell Latitude 7275 battery quirk
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le sam. 4 sept. 2021 =C3=A0 23:25, Jason Gerecke <killertofu@gmail.com> a =
=C3=A9crit :
>
> Are you sure that the device is actually unnecessary? Looking online, I b=
elieve the 7275 uses an AES sensor which reports the status of the stylus b=
attery when one is in proximity.

Its AES sensor reports the stylus battery level when one is in
proximity indeed. However, I'm not quite sure if this is a kernel API
or a userspace issue but this digitizer device is really confusing as
an end user (within Gnome Settings for instance) :

- it exposes a 0% battery level by default after boot when no stylus
is in proximity (or simply if the user has no stylus at all)
   =3D> it shouldn't display anything at this stage in my opinion

- it exposes a fixed battery level once a stylus is in proximity
(let's say 25%) and it will keep this value until the next reboot,
whether the stylus remains in proximity or not
   =3D> ok, why not

- the above battery level is displayed linked to a device named "Wacom
HID 4804", not obvious that this is the actual battery level of a
recently-used stylus
   =3D> could it report the name of the actual stylus instead? or
something like "Dell Latitude 7275 (Wacom) stylus" at least?

- a connected Bluetooth stylus (an HP Active Pen G2 in my case) will
appear with its own line in the Power settings, somehow duplicating
the "Wacom HID 4804" one
   =3D> should find a way to merge the two lines into one

- the battery level reported by the "HP Active Pen G2" line is
erroneously stuck at 100%
   =3D> not sure yet if this stylus model can report its battery level
on its own via Bluetooth

You can forget about this patch, I'm not convinced anymore this is the
right approach to improve the situation. If you have a better
understanding of the data exposed by the kernel to userspace in these
cases, any pointers for other improvements would be appreciated (in
the kernel or in userspace).

Thanks,
J=C3=A9r=C3=B4me

> On Sat, Sep 4, 2021, 2:15 PM J=C3=A9r=C3=B4me de Bretagne <jerome.debreta=
gne@gmail.com> wrote:
>>
>> The Wacom touchscreen/digitizer in the Dell Latitude 7275
>> mistakenly reports having a battery, add a quirk to ignore it.
>>
>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com=
>
>> Tested-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>> ---
>>  drivers/hid/wacom_wac.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
>> index 81ba642adcb7..4d4503cbe308 100644
>> --- a/drivers/hid/wacom_wac.c
>> +++ b/drivers/hid/wacom_wac.c
>> @@ -3574,6 +3574,13 @@ void wacom_setup_device_quirks(struct wacom *waco=
m)
>>                 __clear_bit(MSC_SERIAL, wacom_wac->pen_input->mscbit);
>>                 __clear_bit(EV_MSC, wacom_wac->pen_input->evbit);
>>         }
>> +
>> +       /*
>> +        * The Wacom touchscreen/digitizer in the Dell Latitude 7275 mis=
takenly
>> +        * reports having a battery, let's ignore it.
>> +        */
>> +       if (wacom->hdev->product =3D=3D 0x4804)
>> +               features->quirks &=3D ~WACOM_QUIRK_BATTERY;
>>  }
>>
>>  int wacom_setup_pen_input_capabilities(struct input_dev *input_dev,
>> --
>> 2.30.2
>>
