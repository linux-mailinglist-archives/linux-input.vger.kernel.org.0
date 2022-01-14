Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C8748F06F
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 20:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbiANTZO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 14:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiANTZO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 14:25:14 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8C5C061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 11:25:14 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so11172093oti.11
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oi38lNbF2nCViHYOk3ZTIpO9qvlEErwQJAzcfemw1uo=;
        b=j+NXxFC+a5tmI+S+u8A/WWv9YGt9fS/U2yQDmTjMDqshvap+8Y9IIwTqPMbVdTttW0
         XHv6RmZcqWi98cuyRWxGrsTaZvydtCXjj9g0ZwztxBcMzwnAIxRwclgCczlDReIr8CZq
         oc4/zqCHmhcb5iJ31KiauDT3Jm9CIBZnhhAbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oi38lNbF2nCViHYOk3ZTIpO9qvlEErwQJAzcfemw1uo=;
        b=DfuMxq+RDyOufl10B1hVYwGDx2bCLeDRaJS0xHhgQw3KVIo5tpxumQGJhhhcmcKUHt
         Hp2TXh8fQgEJYPKJ4nX9tNhMq9/SmvCOtJFQXXnryf8TQmjBPDdfmFTFPEKH8qzWLCqg
         4sLzHWujJHFK8RheE0SJko07rU9vJ4qTl0gOEqvQO3eQgRW83t/x0P1+S5/Eajv+sl5i
         4QwXdTm7nYNyRzpBPIzf8XGjHNXoRkCIEf5KmnkLUwhJUI6ytcM1BAs44JIaY/4BBkOn
         QEzQiF0dHhOs74+Kup5U2wTLt7TIHUJzY3qmSa/gZMK4DTie0NX9ST2cQXT1lg8Qxfsz
         /7WQ==
X-Gm-Message-State: AOAM5314l/pPGqgmB7ci5qrNGvt+Bh6gpMAImfAebcKfZR3cEU/QL8nN
        eC01piJ0YtQA16ETVp279t10149uXaiAMd/SlCp3Ew==
X-Google-Smtp-Source: ABdhPJxmzGznCHPz5Ktyt+OWUw/Pygrg4y+fUDgM2f+GRqnM9vz++Zjyencyk8k6Fw+S6E7benyRMBCKUlGdLhbcTS4=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr7938721ota.126.1642188313396;
 Fri, 14 Jan 2022 11:25:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 13:25:12 -0600
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2201140935460.28059@cbobk.fhfr.pm>
References: <20220107091357.28960-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <nycvar.YFH.7.76.2201140935460.28059@cbobk.fhfr.pm>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 14 Jan 2022 13:25:12 -0600
Message-ID: <CAE-0n53M723sZ7H-f0SF=AoTrwznmTRhKPapgHe5H7Mw6bPb7Q@mail.gmail.com>
Subject: Re: [PATCH v2] HID: google: modify HID device groups of eel
To:     Jiri Kosina <jikos@kernel.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        Wei-Ning Huang <wnhuang@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "Sean O'Brien" <seobrien@chromium.org>, phoenixshen@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Jiri Kosina (2022-01-14 00:38:23)
> On Fri, 7 Jan 2022, Zhengqiao Xia wrote:
>
> > If HID_GROUP of eel is set to HID_GROUP_GENERIC, Whiskers Tablet
> > Mode Switch of eel hammer will not be detected by system. when it
> > is set to HID_GROUP_VIVALDI, system will detect Whiskers Tablet
> > Mode Switch successfully.
> >
> > Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> > ---
> >  drivers/hid/hid-google-hammer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> > index 0403beb3104b..e5acd15f4a55 100644
> > --- a/drivers/hid/hid-google-hammer.c
> > +++ b/drivers/hid/hid-google-hammer.c
> > @@ -585,7 +585,7 @@ static void hammer_remove(struct hid_device *hdev)
> >  static const struct hid_device_id hammer_devices[] = {
> >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> >                    USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
> > -     { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> > +     { HID_DEVICE(BUS_USB, HID_GROUP_VIVALDI,
> >                    USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_EEL) },
> >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>
> Color me confused, but anything with HID_GROUP_VIVALDI should be matched
> by hid-vivaldi driver, so what is this about?
>

My understanding is that 'vivaldi' is mostly a keyboard layout and
'hammer' is a detachable keyboard. We want to prevent the hid-vivaldi
driver from probing this particular device because the hid-vivaldi
driver doesn't know about detachable keyboards. Hammer devices also
support 360 degree wraparound so we know that the keyboard has been put
behind the screen or that it's being used to stand up the device on a
table.

Given all that, I'm still confused. If we make the hid-google-hammer
driver probe this device and the keyboard layout is vivaldi then we'd
want the part of the vivaldi driver that exposes the
function_row_physmap through sysfs. Otherwise userspace won't know how
to handle the function row properly. I think we need the device to stack
two drivers here. Does that happen with HID?
