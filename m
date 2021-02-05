Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09DF311170
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 20:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbhBESCg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 13:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41082 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233213AbhBEPWn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Feb 2021 10:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612544531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JptJ9DJFMdkg+AtiuS4nvdOZMMRG/RWYCKBiKWOe0Nw=;
        b=Tdl4qzOGiT657QHI4SsvoaMqDhn922uUUBiamHYSKdDK97vBInSTwUnwaT630aYHeYF8ZU
        NKTupQlsX4W+J404SLRY4EKfZsWBnb6zFSg50cep+yMJu9LvS3ExkvelNJtvZXt7WGB5VD
        0ab25V7idjJozzrRJUpTUo5l+Iifgtk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-PvJR5QgPNa-cXl31r7pVWQ-1; Fri, 05 Feb 2021 12:02:09 -0500
X-MC-Unique: PvJR5QgPNa-cXl31r7pVWQ-1
Received: by mail-pj1-f71.google.com with SMTP id ob3so4647523pjb.0
        for <linux-input@vger.kernel.org>; Fri, 05 Feb 2021 09:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JptJ9DJFMdkg+AtiuS4nvdOZMMRG/RWYCKBiKWOe0Nw=;
        b=rRkEFnNbGNo3kf1of0J6ztun6z2n59OiG7fy3OAlvKpJ9ZanNQ21Ir1QmuQ1sdY9Hq
         RA4fapkPcNSF00zK9bztGi1CyhhB9QcCYtY0I3V3DJo8u4jNv+wTYF3AlY1pIKHnCfGO
         9I6Ok9PQvnGSeLIFFtN0lYvNT4w0jX6orAuyK9B6oF9PlQ2Tqoxj1gmfU3HRoiEEuidF
         8d/Dc+2kJl0h6H4xNsxpSPsvOFPupakC9p4KCqZT2HUY3CeLqVJQExDgppleTnqGe4sT
         jcGHa//3cOq8SYREaDRmfYjeXRxJ36kb2uXCqLxks9MLcjBPtMBNgsbR2KOD2eAOSa+U
         mwFg==
X-Gm-Message-State: AOAM530xTMm1v9hzgZoaJBUp83696kQ5dnqabOWkRQJpaXCGLjE8QNAJ
        LJWEFxKZ5LZXHygqhZgA17rcCFoIIXBcNr6VxOO+Fk0LvA/+gZKBRPu5YOwjmXFb54wsNmipTh+
        HlF13dI4lqmuVjN9fSfeJk5vFSENBimxodQoGJpc=
X-Received: by 2002:a63:4d41:: with SMTP id n1mr5367749pgl.147.1612544527736;
        Fri, 05 Feb 2021 09:02:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp6cWqDGHxPDd/X1Zg73D7f7RKaWF23BTnVVjv3gqB/htOvNdgkKqZ4+oAIewYKDCLPOmVaVyicx3zHRq+y80=
X-Received: by 2002:a63:4d41:: with SMTP id n1mr5367726pgl.147.1612544527445;
 Fri, 05 Feb 2021 09:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20210128172657.24516-1-roderick@gaikai.com>
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 5 Feb 2021 18:01:56 +0100
Message-ID: <CAO-hwJLi+twcmSFkbPHHJ23CpF5P=EORsVauyhwvGt9dGoq++A@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] HID: new driver for PS5 'DualSense' controller
To:     Roderick Colenbrander <roderick@gaikai.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        =?UTF-8?Q?Samuel_=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?Q?Florian_M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Jan 28, 2021 at 6:27 PM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Hi,
>
> This is hopefully the final revision of this patch series. Patch v4 had
> a rebase issue of a part of the sensors patch for which a part had moved
> to the end of the series. This has been fixed. I have double, no triple
> checked the patches. Made sure they build using a 'rebase -x' script
> and also ran the hid-tools tests on the final driver.
>
> Thanks to everyone who provided feedback through the mailing list or priv=
ately.
> As suggested by Benjamin on the 'v4' version of this email, if you were
> involed in the review or testing of this series and would like some credi=
t,
> please provide a reviewed-by or tested-by tag.
>
> Changes since v4:
> - Fixed bad rebase of ps_sensors_create, moved it to appropriate patch.

Barnab=C3=A1s, any comments on this version?

As soon as I get your rev-by, we can apply the series, just in time for 5.1=
2.

Roderick, I do see a few checkpath errors that could be fixed, but I
won't hole the series against:
HID: playstation: add DualSense battery support. -> WARNING: Missing a
blank line after declarations
HID: playstation: report DualSense hardware and firmware version. ->
WARNING: Consider renaming function(s) 'ps_show_firmware_version' to
'firmware_version_show' (and same for ps_show_hardware_version)

Also, there is a weird sparse error:
+drivers/hid/hid-playstation.c:xxx:1:.error: static assertion failed:
"sizeof(struct dualsense_input_report) =3D=3D DS_INPUT_REPORT_USB_SIZE -
1"
+drivers/hid/hid-playstation.c:xxx:1:.error: static assertion failed:
"sizeof(struct dualsense_output_report_bt) =3D=3D
DS_OUTPUT_REPORT_BT_SIZE"

It's weird because it only fails while running sparse, when the normal
compilation is just fine, and the assert is correctly evaluated.

Anyway, the series is good from my Point of View, but I'd like to get
the reviewers some credits.

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
>  drivers/hid/hid-playstation.c | 1492 +++++++++++++++++++++++++++++++++
>  5 files changed, 1521 insertions(+)
>  create mode 100644 drivers/hid/hid-playstation.c
>
> --
> 2.26.2
>

