Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F16C206F2D
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 10:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388625AbgFXIpe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 04:45:34 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32751 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388535AbgFXIpe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 04:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592988332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S2b8jLigyZb+R3i3+e/XAVkUga1RYeny5NHhX1UTOHk=;
        b=LRTSNdd0eGyNQc8OGql39YNHshQVGrDoxYrTygDGAJt3PplcowLCYsc72koJALu+t6pKnC
        Fa8LNJsO0S59QgyWZNdKYD4/jaoDmRvcBSzt9yPLFiLEbJ2Df+wV8sEXMcg274aRA9VkXO
        xXuJrfKr4ACjlhlvoi8cq+Y68XXmP/M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-uyd5W9AmNfiLheodxgW4yg-1; Wed, 24 Jun 2020 04:45:31 -0400
X-MC-Unique: uyd5W9AmNfiLheodxgW4yg-1
Received: by mail-qv1-f71.google.com with SMTP id r12so1200067qvk.3
        for <linux-input@vger.kernel.org>; Wed, 24 Jun 2020 01:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2b8jLigyZb+R3i3+e/XAVkUga1RYeny5NHhX1UTOHk=;
        b=bIcrVfrsP/UbsUvDC0WS1m1nj9NRDSnTDiJFjSN8X2xNJN/6Q2kTgFZqcjnUbZqPpk
         olS0aPrXgvzT49Zey621rUOwJVR53JyX+OQDjqNI+csJmBUurtGFBLN350qXsJqVR6/n
         Km6Oyw8JBPVSDUhReutVOYPvewGdsywoSF9N3liqJPNj6wQSRbh86zNX4rhSLIospgBh
         b7+j7Bk3xkuhAUAQ1DUaeB1KCI5pq3wKkvY2oVFAxeskMMoJodRcGT1mWUmXMOIXQT+U
         EEr4SQ2e2r6YFo1CQXjdw1ZW1MPgOtXmjf+BI+oYHqht87UwlvX2kF1Uy/4BPaLw5Sqh
         9S3Q==
X-Gm-Message-State: AOAM5332RiEXglCDslbaqIhmTNIjJPMGO6F9FxqIHLJAMaIdbVgAu/kB
        s7HdPUity9Y31hKe/FMGSfJ2P62ezBoq1QczyGww/4VdFO8+cambeUg6TSIv6V7maIvfEAl+v+K
        sDaS/7r30jDNsOIdgMaX9NIXlQMrs9wB4QgbF68E=
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr30211366qvb.196.1592988330633;
        Wed, 24 Jun 2020 01:45:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAHk0i+wHdD9G0k78iapc862XPazRlaJgWStCZlsc5eOWTiAArDIkkFFTWqAuPKUUS2wS+4zC0nEtxoN1lNz8=
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr30211352qvb.196.1592988330427;
 Wed, 24 Jun 2020 01:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200624072154.22486-1-mail@mariuszachmann.de> <20200624072154.22486-2-mail@mariuszachmann.de>
In-Reply-To: <20200624072154.22486-2-mail@mariuszachmann.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 24 Jun 2020 10:45:19 +0200
Message-ID: <CAO-hwJLo_v5mWaVJHcdf2aaK4yQHfKd8Xk2XTpUa61q_NsTb4g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] input: add to hid_ignore_list
To:     Marius Zachmann <mail@mariuszachmann.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <jikos@kernel.org>, linux-hwmon@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marius,

On Wed, Jun 24, 2020 at 10:16 AM Marius Zachmann <mail@mariuszachmann.de> wrote:
>
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>

I wasn't Cc-ed on the cover letter (0/3) if any, but there are a few
things to improve here (not code wise, I haven't reviewed the series,
but on the form).

Every commit needs a commit message. And here, this particular commit
just disables 2 device IDs from HID, which, without explanation seems
like you decided to remove support for 2 keyboards from the kernel. So
please add commit messages explaining *why* you are introducing a new
driver/change in the code.

Then, it would be much better to have a single commit that disables
the HID support and add the hwmon driver in one go. Leave the
synchronisation between the trees to the maintainers, and keep it
simple: you can squash your 3 commits together, so it's one semantic
action. This way, if there is a need to bisect or revert this patch,
we won't have side effects and can revert just one patch. Think also
that if someone needs that to be backported in a stable or a
distribution kernel, it would make everyone's life simpler.

That being said, if you squash the 3 patches and provide a good enough
explanation on the series, from a HID point of view, there should not
be any reasons for us to not give an Ack.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index ca8b5c261c7c..7b7bc7737c53 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -699,6 +699,8 @@ static const struct hid_device_id hid_ignore_list[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_AXENTIA, USB_DEVICE_ID_AXENTIA_FM_RADIO) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x0c10) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x1d00) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM109) },
> --
> 2.27.0
>

