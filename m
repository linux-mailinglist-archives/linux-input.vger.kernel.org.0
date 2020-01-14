Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754D5139EDE
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 02:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgANBYX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 20:24:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26155 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729305AbgANBYX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 20:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578965061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fHEMm2SsTYZoIki8jbB8+WC5Q2vGKFdNsQ1V1gkRMy8=;
        b=OI4sHU7dzmfbaOWQeTbdLBNwueBXqdgY3LpzNSax2J0KCab+CHTAIA35/WFBLtDW3xS0Ie
        JIz1beCjplmQKvPRLX9lCE25viQEzgB45PFXmTrzxQtYtikX0qhuRX3ijZQATgqmVyd2qn
        dy1DDAVTIHbKbYKfTSMQviZwiCfGMP8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-NEPe6AVONV-PneJrJdRR0w-1; Mon, 13 Jan 2020 20:24:20 -0500
X-MC-Unique: NEPe6AVONV-PneJrJdRR0w-1
Received: by mail-qv1-f70.google.com with SMTP id u11so7625959qvo.8
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 17:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fHEMm2SsTYZoIki8jbB8+WC5Q2vGKFdNsQ1V1gkRMy8=;
        b=UeYTmvLjXCUsMB+VHHYRLlp//KfGgRFkwDBfr/U1cgbfXsGzMxDuwCUUiOMaGPM9Pq
         H3EpaVZeH3bv/Cc5ghaefjBwdZzJpe2X80+pU2EcWKkycvB6bkdT9OtMxK3pECo36sX9
         tCxKcm7fGJgkznTF+UyhaN/kSHg7+TnLZwcbZh8K93T847Bi/PItPygI+wxmovIqmgy9
         5lFND3PBUFpQaIxDTINq/bcMFdbSqrk1ww+YAnk7aZbMJq/H4J93QMMJVE3QOnkn0Smh
         F85OGVEJPfjjn5Trwvmi/3Cjo5++UQXnhd9bSHOt/ouduGs4/N5BRDM592kqfRW9pXFz
         VUVA==
X-Gm-Message-State: APjAAAUfk1zyb52CkrzPrf6HKjyFllHHg8Axh+Ltrwo/E2eA29nZi9r9
        HoInDds6HAW+J92ID8m+hE5K5OeyWakycIT3t0WI0cdcFsK611HgVfHRPlxDWDIjQyMSGUqh7xh
        KufLM2bx+b6H9PWF+SL6Wg96tIEJOeTLuGjqBGtI=
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr18867683qvo.46.1578965059692;
        Mon, 13 Jan 2020 17:24:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8rp2tVJG8FFSrMqEEhMSegO/Ch9+dAU7aqOjlvhAWdChQ9jSPgjRB76ehlY2C/JNhnmNpbdLe0UeQ6dG9z0g=
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr18867665qvo.46.1578965059435;
 Mon, 13 Jan 2020 17:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20200113192300.2482096-1-lains@archlinux.org>
In-Reply-To: <20200113192300.2482096-1-lains@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 14 Jan 2020 11:24:08 +1000
Message-ID: <CAO-hwJKkMv7T0e11XoYKh9GtsnNCfOztFsoU7JXgmxCvfROeZw@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: add debug msg when exporting a HID++
 report descriptors
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Filipe,

On Tue, Jan 14, 2020 at 5:23 AM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> When exporting all other types of report descriptors we print a debug
> message. Not doing so for HID++ descriptors makes unaware users think
> that no HID++ descriptor was exported.

Unless I am mistaken, those dbg_hid() calls are not displayed by
default on any distribution. So I am not sure what is the benefit to
add this one here when we are already not showing the rest to the
users by default. There is a tiny improvement to have some code
symmetry, but here, honestly, it doesn't feel that required.

Cheers,
Benjamin

>
> Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.=
c
> index cc7fc71d8b05..8f17a29b5a94 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1368,6 +1368,8 @@ static int logi_dj_ll_parse(struct hid_device *hid)
>         }
>
>         if (djdev->reports_supported & HIDPP) {
> +               dbg_hid("%s: sending a HID++ descriptor, reports_supporte=
d: %llx\n",
> +                       __func__, djdev->reports_supported);
>                 rdcat(rdesc, &rsize, hidpp_descriptor,
>                       sizeof(hidpp_descriptor));
>         }
> --
> 2.24.1
>

