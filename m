Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBCD2FA35A
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 15:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393165AbhAROnA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 09:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46843 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393005AbhAROm4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 09:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610980887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uEqfmUs2U7YlcQztfzJZToke7xdfCbfYWSoDMToy3VI=;
        b=WAWEkqyLYMxTXNu3clX9fCIKMTuDV7wHvAavfiAqML7QZhO78Do7nW/qp3CCCmjVwnJgZH
        pxGYB/ocIjQl4m7amNZpt10ahgg/xamA7iIEU+ud3YlJIKF5Df2Vz7ijD9iRuTzjrPzk5t
        h/6K2T71tUupIlOCOm3LkMEoAt18zjc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-iFPdgR57PdimIkPtncYqmA-1; Mon, 18 Jan 2021 09:41:24 -0500
X-MC-Unique: iFPdgR57PdimIkPtncYqmA-1
Received: by mail-pg1-f197.google.com with SMTP id l22so13348170pgc.15
        for <linux-input@vger.kernel.org>; Mon, 18 Jan 2021 06:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uEqfmUs2U7YlcQztfzJZToke7xdfCbfYWSoDMToy3VI=;
        b=G9DjLbs0TRtqqkhObUJijA62wDpxp8zeLSapZ1pEuG6Qg/Hzdt4m8Yi1zTPgvDOi0w
         aTgUu+JJ75mO/iQukTGbBaPosBIVW7kZX799OvD3JZbGS4mhLaNm1kPAALJj565M6DxO
         g/Z+rSe3SfeBNe7mpiEozmmghq42z9lY5a9RrdCQWt+Dv9dFzm9zZSYyOkhlRWAPsLDB
         b3EI5bP/aubnNrgE8UAwnjSVTEchk+ACIV+/1HYczoADMb8y5TL1F1g0fUnBRUvqXNPf
         IwPmaFhiYHzb8z33au4lMjC0WDXb5m8dWShJ5mcRMuRqI2NosgGZf6PnPx2D0XMBaJOK
         hSCA==
X-Gm-Message-State: AOAM530MyseTh15F1jq5K83QcmNaBhUspsp1S4X3va9i8OQ9vC2cLrVV
        VE3nZrKb9yzwRKx77h2GWx6O4ZRtpn6swer9VpPgANWSEghjekfkbg4/D37dg3P7wZb2fbE1X9d
        hH0C1hEgDqKlrAMPIGgIS7FxmGXdhRXKxOvwV1rs=
X-Received: by 2002:a63:fb54:: with SMTP id w20mr25836180pgj.419.1610980883649;
        Mon, 18 Jan 2021 06:41:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyCCW/HTfkwwAokVUmKSOBLcFIO5ocMaaHWbwHvZEJHyyyVlpSZz63R8NF3aGloEqenwFRZ9f1OBYzxqxoWR8=
X-Received: by 2002:a63:fb54:: with SMTP id w20mr25836165pgj.419.1610980883431;
 Mon, 18 Jan 2021 06:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20210118134523.178605-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210118134523.178605-1-kai.heng.feng@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 18 Jan 2021 15:41:12 +0100
Message-ID: <CAO-hwJ+29t8D1RkEh23=k_x4vOWwo3HvR_3GAA9M2pPNMaGLNQ@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Apply MT_QUIRK_CONFIDENCE quirk for
 multi-input devices
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Jan 18, 2021 at 2:45 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Palm ejection stops working on some Elan and Synaptics touchpad after
> commit 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for
> some devices").
>
> The commit changes the mt_class from MT_CLS_WIN_8 to
> MT_CLS_WIN_8_FORCE_MULTI_INPUT, so MT_QUIRK_CONFIDENCE isn't applied
> anymore.
>
> So also apply the quirk since MT_CLS_WIN_8_FORCE_MULTI_INPUT is
> essentially MT_CLS_WIN_8.
>
> Fixes: 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for some devices")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thanks for the patch.

IIt seems I was too lazy to write a regression test for it, and this
strikes back.
Can you also work on a regression test for this at
https://gitlab.freedesktop.org/libevdev/hid-tools ?

Cheers,
Benjamin




> ---
>  drivers/hid/hid-multitouch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 0743ef51d3b2..8429ebe7097e 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -758,7 +758,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>                         MT_STORE_FIELD(inrange_state);
>                         return 1;
>                 case HID_DG_CONFIDENCE:
> -                       if (cls->name == MT_CLS_WIN_8 &&
> +                       if ((cls->name == MT_CLS_WIN_8 ||
> +                            cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT) &&
>                                 (field->application == HID_DG_TOUCHPAD ||
>                                  field->application == HID_DG_TOUCHSCREEN))
>                                 app->quirks |= MT_QUIRK_CONFIDENCE;
> --
> 2.29.2
>

