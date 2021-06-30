Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF9B3B7DDC
	for <lists+linux-input@lfdr.de>; Wed, 30 Jun 2021 09:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhF3HMP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Jun 2021 03:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57202 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232816AbhF3HML (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Jun 2021 03:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625036981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q18aGERUrb8MXoJ7uF/M0uiRsJPxf2agVURvlb+VBVE=;
        b=ervHHmumT2IArFzymCk4+4pN3RLq8IZfYm8sL3dg7+6do2k4YoH+T0ERl4bpuYrove2UQa
        NdeZ/VWmmbBPzJGl/WQeWMhj+UmEzIQPmQSgOTtTa69RBDy+/2ruVYZ9BNle7uMLdWw05V
        EMn7NwWP/u+nJWX1VzP5/d6XFGrYEvM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-gsUVIeqQPEalldHELSCw7A-1; Wed, 30 Jun 2021 03:09:39 -0400
X-MC-Unique: gsUVIeqQPEalldHELSCw7A-1
Received: by mail-pg1-f198.google.com with SMTP id p2-20020a63e6420000b02902271082c631so1070324pgj.5
        for <linux-input@vger.kernel.org>; Wed, 30 Jun 2021 00:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q18aGERUrb8MXoJ7uF/M0uiRsJPxf2agVURvlb+VBVE=;
        b=tUjCKFF0guESBENWmgif/KhTGCN0yU/lyw9WJgBtheBvWFqZ8xNC79LGvMa7attTaz
         6oCRO3uVTsMpotB/IYOsgi5CtcmSeKNO+NTZVc5apfTkQKISfmtGQZLzer8SqQeSiMOt
         K39WS8uf74Ho3LoXV6MOZQJdBRzbwOYRqWDmu/AduXpBeJwH3GM05WJceeIgHhMx12MI
         EXIxtcA6/iCyKGGRzOWPSbxtHHbz3Y9Scb+d9l53nTYg5/V3Ye/aR/0KMvNY6Nfg5sHb
         DE/wfTbJPkPuqyj7rS56jGwhJ5fy+3hDcuqwXSKAPK0MScxYoY+CMtjrbr3FCoy0FX57
         LaPw==
X-Gm-Message-State: AOAM5309zvu6Jaz57MDU5qap2bWr6hEYl23n18bKE0aoVv2OOfFO50MS
        9PmE9iz1wy1I9AIOPbtd1zsy+Du0f5ndD3hLRdXX2ZLW1zVkgPSSlEsgdJzfdBYa/TjlE0VfnAf
        nWkzV44dEz2ANQq1w8p5KTMy1ZRRwyu5oJeY68lM=
X-Received: by 2002:a17:90a:5889:: with SMTP id j9mr38116481pji.234.1625036978314;
        Wed, 30 Jun 2021 00:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyfRTZ234ZIqRtqXaVxOazEOugzigkHX+SuWQnUapE6hJKzL6PWnsWKH0UoiAtg14WGWpsaRbMv84hFVc2rYc=
X-Received: by 2002:a17:90a:5889:: with SMTP id j9mr38116460pji.234.1625036978035;
 Wed, 30 Jun 2021 00:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <YNtlrrKZVQY4byVa@google.com>
In-Reply-To: <YNtlrrKZVQY4byVa@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 30 Jun 2021 09:09:27 +0200
Message-ID: <CAO-hwJJ-VyKBohETJabxmgjZ8RtmZHWWOBr2kZNC=feOxHgTtQ@mail.gmail.com>
Subject: Re: [PATCH] HID: input: do not report stylus battery state as "full"
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Kenneth Albanowski <kenalba@google.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, Jun 29, 2021 at 8:26 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> The power supply states of discharging, charging, full, etc, represent
> state of charging, not the capacity level of the battery (for which
> we have a separate property). Current HID usage tables to not allow
> for expressing charging state of the batteries found in generic
> styli, so we should simply assume that the battery is discharging
> even if current capacity is at 100% when battery strength reporting
> is done via HID interface. In fact, we were doing just that before
> commit 581c4484769e.

This commit is 4 year old already, so I'd like to have the opinion of
Bastien on the matter for the upower side (or at least notify him).

>
> This change helps UIs to not mis-represent fully charged batteries in
> styli as being charging/topping-off.
>
> Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
> Reported-by: Kenneth Albanowski <kenalba@google.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/hid-input.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index e982d8173c9c..e85a1a34ff39 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -417,8 +417,6 @@ static int hidinput_get_battery_property(struct power_supply *psy,
>
>                 if (dev->battery_status == HID_BATTERY_UNKNOWN)
>                         val->intval = POWER_SUPPLY_STATUS_UNKNOWN;

What's the point of keeping the HID_BATTERY_UNKNOWN code path? AFAICT,
before 581c4484769e, we were just returning
POWER_SUPPLY_STATUS_DISCHARGING. If we don't need to check for the
capacity, I think we could also drop the hunk just before where we do
the query of the capacity.

Cheers,
Benjamin


> -               else if (dev->battery_capacity == 100)
> -                       val->intval = POWER_SUPPLY_STATUS_FULL;
>                 else
>                         val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
>                 break;
> --
> 2.32.0.93.g670b81a890-goog
>
> --
> Dmitry
>

