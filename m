Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3E72F5D3E
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 10:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbhANJYr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 04:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52102 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727348AbhANJYp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 04:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610616198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OEsWq5QL48O8qaE7/imzssejhlq+Va2mSt6WB4e+5Ck=;
        b=EQMUiFhocKwxOnlOZ7DFfPxaZ0xr9wFRLEZz9Cr/vC7fWHuLqN/OXcMSg6oK/qeeKuaJkk
        EnEzkFfhyXVi9VdPYKn0b2AJLbAulT61awaTE9ozD9sbdyUI6Vc+t3H4eya/3Rvdi2e77x
        3RHi01fYbmGYx5PDCHtTJ057CcNgjeg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420--Rrh4I04N_at-D9lYyVlYw-1; Thu, 14 Jan 2021 04:23:14 -0500
X-MC-Unique: -Rrh4I04N_at-D9lYyVlYw-1
Received: by mail-pg1-f200.google.com with SMTP id l22so3359222pgc.15
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 01:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEsWq5QL48O8qaE7/imzssejhlq+Va2mSt6WB4e+5Ck=;
        b=aymHeCzFGx9B5lmbUdOhQ57zHReM3z3bkUTM4LTrFY2m5KNBPjPUsHMouy1R67Iqbm
         /OProaS29qaJzIKM+zxZ2iVz3JLuYCD53KmU4TAy6huUZ6FwXa9Qp7aUtppH9wJr1n6f
         PvOY+Cj03rVsLFug+vQg4EjflVqO1azDOACxV2Xy4RnOUN0Mp9f0wiGvYPtEPAcupOIE
         PVV4dM5yGIijlH7WyOHTyJo75oPWpjK0Woq4s5V2vqeIbxruzAkSobro7kG5lWoRbrmT
         G8foc7IAASUYQjhfeoyLQWDet3hW7Y/KqeGAYIm7CtZO07jpYELYQKj7X1WyIEkPsTY1
         UcZg==
X-Gm-Message-State: AOAM532Pn1UyrYNjgIeWASrW5hk/bMg46K1nxFOB1pKzuhicZUdNL+QF
        SBOwXWugZGbc551JaMH15RtoM4abkVeIZ9f7qpTf09OJF1HwxvsWsSaIGyf+VB8/NuExBhirFZ8
        PFdavkoQvBUXzCDt6jERkXtZad0oory0YukVgygo=
X-Received: by 2002:a17:902:8487:b029:dc:20bc:2812 with SMTP id c7-20020a1709028487b02900dc20bc2812mr6792181plo.66.1610616193580;
        Thu, 14 Jan 2021 01:23:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/LLjQIR4gNqTyKg6e2SkY5X3uI+i4g6i29bINK92pruthJqJ6A7y9+necGTTIiZ38o68Qo6k76m/eEALRacs=
X-Received: by 2002:a17:902:8487:b029:dc:20bc:2812 with SMTP id
 c7-20020a1709028487b02900dc20bc2812mr6792170plo.66.1610616193324; Thu, 14 Jan
 2021 01:23:13 -0800 (PST)
MIME-Version: 1.0
References: <X//jjawwbm8FxbQU@google.com>
In-Reply-To: <X//jjawwbm8FxbQU@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 14 Jan 2021 10:23:02 +0100
Message-ID: <CAO-hwJK5QxxX26hFiVfQr2EfnwdZSEB2paCsZBbX58iPxJvfww@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-input: avoid splitting keyboard, system and
 consumer controls
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "Sean O'Brien" <seobrien@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Jan 14, 2021 at 7:24 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> A typical USB keyboard usually splits its keys into several reports:
>
> - one for the basic alphanumeric keys, modifier keys, F<n> keys, six pack
>   keys and keypad. This report's application is normally listed as
>   GenericDesktop.Keyboard
> - a GenericDesktop.SystemControl report for the system control keys, such
>   as power and sleep
> - Consumer.ConsumerControl report for multimedia (forward, rewind,
>   play/pause, mute, etc) and other extended keys.
> - additional output, vendor specific, and feature reports
>
> Splitting each report into a separate input device is wasteful and even
> hurts userspace as it makes it harder to determine the true capabilities
> (set of available keys) of a keyboard, so let's adjust application
> matching to merge system control and consumer control reports with
> keyboard report, if one has already been processed.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/hid-input.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index f797659cb9d9..df45d8d07dc2 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -1851,6 +1851,16 @@ static struct hid_input *hidinput_match_application(struct hid_report *report)
>         list_for_each_entry(hidinput, &hid->inputs, list) {
>                 if (hidinput->application == report->application)
>                         return hidinput;
> +
> +               /*
> +                * Keep SystemControl and ConsumerControl applications together
> +                * with the main keyboard, if present.
> +                */
> +               if ((report->application == HID_GD_SYSTEM_CONTROL ||
> +                    report->application == HID_CP_CONSUMER_CONTROL) &&
> +                   hidinput->application == HID_GD_KEYBOARD) {

I am not fundamentally against the patch, but I think that if the
device exposes first a HID_CP_CONSUMER_CONTROL and then a
HID_GD_KEYBOARD we will end up with 2 different input nodes. We likely
need to "convert" HID_GD_SYSTEM_CONTROL and HID_CP_CONSUMER_CONTROL to
HID_GD_KEYBOARD when creating the hidinput.

Cheers,
Benjamin

> +                       return hidinput;
> +               }
>         }
>
>         return NULL;
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>
>
> --
> Dmitry
>

