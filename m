Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A4B318F9B
	for <lists+linux-input@lfdr.de>; Thu, 11 Feb 2021 17:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhBKQLX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Feb 2021 11:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49250 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231592AbhBKQJS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Feb 2021 11:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613059672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FSQr72LZ05DIkNBGv3hQaCiYWKhBk6do/Sa48640NrU=;
        b=OKZZVrDuvEyGGoXOsCcfmcMtQtoJ0134R1TmqoEhpzHz/bDlX9/tAjlF3lyzLprEPAzXHJ
        CmV6LkcRPGLMgQSUnVkpcgnRcZqNQsK2dKB6WmkBsR40TISoyXM04e5JAONpkhDSnEXzIl
        0frhHSpbMUL/03mwbw/JYd83A0xtR+U=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-HjdL-To2Pea0W8yTqhfxNg-1; Thu, 11 Feb 2021 11:07:50 -0500
X-MC-Unique: HjdL-To2Pea0W8yTqhfxNg-1
Received: by mail-pl1-f199.google.com with SMTP id z9so4241102plg.19
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 08:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FSQr72LZ05DIkNBGv3hQaCiYWKhBk6do/Sa48640NrU=;
        b=q6tkadmEhJ22GEW0fz3h6QiqdjPrakAz75uEE4TpFAw6U9+F7lgx4xm94a9JHUTT8X
         t9v2YWABKow2noUtGwwYEXYFFWU3gmf2Doeiw62o4VF2NkHpZHohfiTeUVPDFPUg9aJ+
         iDQKCs12213jb/Od+7q+n1Mq6BQwhyYFihy47iUAA/JnMFtk+6BseSxoH2h6KLVCd2Br
         4nLSqG09X7vZcp2MsjjpATeCqX/W2+heNSPCBbaUKoxT3eksX+d/6TGR4xjPGTBLa/a+
         M6wTVcy/7/rUEI53KyKZHhfRefGQ50+7Td8ZRiwp2rIdIBI6bPZGlxARibcS/69VZ+wh
         TBxw==
X-Gm-Message-State: AOAM533Sj4tymXM0OclKziePUh1Uty/30VUk7hpYthtyzAvdh8y6CFYK
        hxYCb/265HQCXWWVZk9B4KXyJ+FTgvYMUocN5GY/gB9NamhHwKd0Zz0WXnNyRa+3j6UVVkPCqvi
        R5Pqqayz55C2d6OlJ3D6jLO73QDYhUl4dN/en9cA=
X-Received: by 2002:a17:90b:705:: with SMTP id s5mr4574636pjz.234.1613059669305;
        Thu, 11 Feb 2021 08:07:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZy3vWq0rHodMKdr38el0vJFTO+L2ZsB7/0CAKC8wCAPM+vSG81C6Fn7F9J2zTwO+SL7AVYUPjFgVvE5a5TFo=
X-Received: by 2002:a17:90b:705:: with SMTP id s5mr4574612pjz.234.1613059669007;
 Thu, 11 Feb 2021 08:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20210207214908.79573-1-roderick@gaikai.com>
In-Reply-To: <20210207214908.79573-1-roderick@gaikai.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 11 Feb 2021 17:07:38 +0100
Message-ID: <CAO-hwJJ1JtY=o=n72X4m9Lcy=UNkFgukE5kfTEMWke+BvBuyeA@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] HID: new driver for PS5 'DualSense' controller
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        =?UTF-8?Q?Samuel_=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?Q?Florian_M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Feb 7, 2021 at 10:49 PM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Hi,
>
> This is an updated version with a few small changes suggested by
> by Barnab=C3=A1s and Benjamin. It is mostly a few additional checks and
> a few checkpath related changes.
>
> Changes since v5:
> - Fixed a couple of checkpath warnings.
> - Renamed firmware_/hardware_version show functions.
> - Used DEVICE_ATTR_RO for firmware/hardware_version show functions.
> - Changed player_ids array to static const.
> - Added error check for power_supply_powers.
> - Ensured devm_kasprintf return value is checked.

Thanks a lot for the quick resubmission (and for Barnab=C3=A1s final review=
).

I double checked that Baranab=C3=A1s' comments were addressed and added the
rev-b to the series.

The series is now pushed to for-5.12/playstation.

Cheers,
Benjamin

>
> Thanks,
>
> Roderick Colenbrander
> Sony Interactive Entertainment, LLC
>
> Roderick Colenbrander (13):
>   HID: playstation: initial DualSense USB support.
>   HID: playstation: use DualSense MAC address as unique identifier.
>   HID: playstation: add DualSense battery support.
>   HID: playstation: add DualSense touchpad support.
>   HID: playstation: add DualSense accelerometer and gyroscope support.
>   HID: playstation: track devices in list.
>   HID: playstation: add DualSense Bluetooth support.
>   HID: playstation: add DualSense classic rumble support.
>   HID: playstation: add DualSense lightbar support
>   HID: playstation: add microphone mute support for DualSense.
>   HID: playstation: add DualSense player LEDs support.
>   HID: playstation: DualSense set LEDs to default player id.
>   HID: playstation: report DualSense hardware and firmware version.
>
>  MAINTAINERS                   |    6 +
>  drivers/hid/Kconfig           |   21 +
>  drivers/hid/Makefile          |    1 +
>  drivers/hid/hid-ids.h         |    1 +
>  drivers/hid/hid-playstation.c | 1504 +++++++++++++++++++++++++++++++++
>  5 files changed, 1533 insertions(+)
>  create mode 100644 drivers/hid/hid-playstation.c
>
> --
> 2.26.2
>

