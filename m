Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C07FDD4382
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 16:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfJKO4H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 10:56:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30513 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726332AbfJKO4H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 10:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570805766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FiDA3QBts5KfCGtUBop3Hw/Oo24dQFtETwEmLErKTH4=;
        b=Pl8q2o3qveJcTsJ0RvZMIbGokZY279JMhv1feelP4WsDpwvFjksxVArNfP/j2i4YOLlSID
        myRJ85sOpF8uBhY5WTdls46+BBfgWVf8yooOR0kaAE+Gx91JaE+edxjfXYPO21eK+MwkwS
        QWfZcMgciNqjOQEhxJe78t36IHuBE9A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-PTAmE11wMHyiFFAP4elKRA-1; Fri, 11 Oct 2019 10:56:03 -0400
Received: by mail-qk1-f197.google.com with SMTP id k67so9211652qkc.3
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 07:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JATZHH1NgtP8u5fFJewNDLUv2TCv4ss7bPRKEHICbr0=;
        b=MIZ3YRTb1LTe+nmqlvf0W5b6XYieJVsNekB8omT1qJUq68yiaIM9Ns5bXHDuXn1aDU
         l6Lc62vepTSXEBsXfzxTlHGD4HbKC5phG4FObRFjcNfo2NhjvTLH4MkqWLYlRUL3YDVr
         kEBytkPCk0+Mqn7ktrJMz06qxLDFcEqlzG5pfJLZ7wz9y76SNZvvaNipkgbhJWqluHrv
         izk9MpNZN4jH9hUX2I7+gbK8PNGGRua+dfXIKKqP3fseHH15kdPoMFSiN6ZbVQ2zWrzw
         worG/cEbcszFxaY7PtwyqfAfEJNwHFwWLyem2rcfBjuowZZHjTZpotQqMDT6j6nMO678
         /hzg==
X-Gm-Message-State: APjAAAWFf7IZEZkIKrEG43ommPh3JzxcuGmnERStGWVm0sWT86JLmF/D
        4ZWwZjNjwUeNTp4VI8TFMrYM4ZA6wRGaPdRk4gGCzGw+WAUNbTrTGMxQojNFg0NyHgolq0u/Zhs
        tg9OFvwBVLyIUf6MHRZ4gnJsqh4/JRuOXMvkZzlQ=
X-Received: by 2002:ae9:f306:: with SMTP id p6mr16089653qkg.169.1570805763038;
        Fri, 11 Oct 2019 07:56:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhRxyO1bcuIfWi9+9ILjcQeYiWIMiW4HueiZFd7MJiAIFazyIv6uqj4C9dxgo9WNAj6xf5SxYEm9R5x2IqA4c=
X-Received: by 2002:ae9:f306:: with SMTP id p6mr16089632qkg.169.1570805762825;
 Fri, 11 Oct 2019 07:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191007051240.4410-1-andrew.smirnov@gmail.com> <20191007051240.4410-4-andrew.smirnov@gmail.com>
In-Reply-To: <20191007051240.4410-4-andrew.smirnov@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 16:55:51 +0200
Message-ID: <CAO-hwJJ8tp4Rqte-umv9e=S5evR5oJTErsNR0Wk-z8wcbtR0wg@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: logitech-hidpp: add G920 device validation quirk
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Sam Bazely <sambazley@fastmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
X-MC-Unique: PTAmE11wMHyiFFAP4elKRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 7, 2019 at 7:13 AM Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>
> G920 device only advertises REPORT_ID_HIDPP_LONG and
> REPORT_ID_HIDPP_VERY_LONG in its HID report descriptor, so querying
> for REPORT_ID_HIDPP_SHORT with optional=3Dfalse will always fail and
> prevent G920 to be recognized as a valid HID++ device.
>
> Modify hidpp_validate_device() to check only REPORT_ID_HIDPP_LONG with
> optional=3Dfalse on G920 to fix this.
>
> Fixes: fe3ee1ec007b ("HID: logitech-hidpp: allow non HID++ devices to be =
handled by this module")
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D204191
> Reported-by: Sam Bazely <sambazley@fastmail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Sam Bazely <sambazley@fastmail.com>
> Cc: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> Cc: Austin Palmer <austinp@valvesoftware.com>
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: stable@vger.kernel.org
> ---
>  drivers/hid/hid-logitech-hidpp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index cadf36d6c6f3..f415bf398e17 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3511,6 +3511,12 @@ static bool hidpp_validate_report(struct hid_devic=
e *hdev, int id,
>
>  static bool hidpp_validate_device(struct hid_device *hdev)
>  {
> +       struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> +
> +       if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920)
> +               return hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
> +                                            HIDPP_REPORT_SHORT_LENGTH, f=
alse);
> +

with https://patchwork.kernel.org/patch/11184749/ we also have a need
for such a trick for BLE mice.

I wonder if we should not have a more common way of validating the devices

This can probably be handled later, as your patch fixes the current devices=
.

Cheers,
Benjamin

>         return hidpp_validate_report(hdev, REPORT_ID_HIDPP_SHORT,
>                                      HIDPP_REPORT_SHORT_LENGTH, false) &&
>                hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
> --
> 2.21.0
>

