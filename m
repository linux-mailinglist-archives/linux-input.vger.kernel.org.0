Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5E72511B
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbfEUNul (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:50:41 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46518 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbfEUNul (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:50:41 -0400
Received: by mail-qt1-f194.google.com with SMTP id z19so20453267qtz.13
        for <linux-input@vger.kernel.org>; Tue, 21 May 2019 06:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9BcI8SrwWpWpzDX2RDw6Fe1SStdMkivlk8QeS9IOKEI=;
        b=SSVJiLxCFPTaYC2V89EeMLu7UEGECnbEOwQ3nZFncH/wA+7ZbE09PSYGlvq2VbmLYZ
         R7//BjLxwlZU/Jo/3khH49xsUwYrBMU5+92AeCmgauHiffgQOrMcW55MOC2yAaiimWKM
         sZlLsteSsdFhJ+8cAF13nbe7sJ9j1UMNKdoAddTTNdXnWgYXnJAyLWiy+9R0MltPydxB
         y9QRHlamClrPG5jtUlVBoVusjAz5/Aa6pPPTjQ+8yOqk5dX9xNK+bS8g5rGJltzyLRjs
         ajSeDPEPeTeUXtRtgCgnkddvCDH4wJSZE7HooLhQcTgiQxf7e82KbSRZBZ/JDGFccqzd
         ZQpw==
X-Gm-Message-State: APjAAAVB9/OsXfoOR9Ble2KKbVysyOwdgO8MET2nkcVDhhu2PtU2D2at
        cIWhGK6txJFv6Apyv9cVXlSEY2M+ptNUbPVddzGGSg==
X-Google-Smtp-Source: APXvYqywGZxccJZ3mHo+OGbyjqCmh5/Qb5FHQVhlFJYuoIXjaC79ddwZ5U88+QsSvUntl6f54n4RZ3GZ1uJeo6/MGPs=
X-Received: by 2002:ac8:7656:: with SMTP id i22mr48085135qtr.260.1558446640196;
 Tue, 21 May 2019 06:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190521133831.4436-1-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521133831.4436-1-benjamin.tissoires@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 21 May 2019 15:50:27 +0200
Message-ID: <CAO-hwJJfRXEdwMq9KLXDMs37CnHXnVhUzD5sbd5uzoeVdKQdvw@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: handle faulty Elo touch device
To:     Jiri Kosina <jikos@kernel.org>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 21, 2019 at 3:38 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Since kernel v5.0, one single win8 touchscreen device failed.
> And it turns out this is because it reports 2 InRange usage per touch.
>
> It's a first, and I *really* wonder how this was allowed by Microsoft in
> the first place. But IIRC, Breno told me this happened *after* a firmware
> upgrade...
>
> Anyway, better be safe for those crappy devices, and make sure we have
> a full slot before jumping to the next.
> This won't prevent all crappy devices to fail here, but at least we will
> have a safeguard as long as the contact ID and the X and Y coordinates
> are placed in the report after the grabage.

Grmbl, I forgot:
Fixes: 01eaac7e5713 ("HID: multitouch: remove one copy of values")
CC: stable@vger.kernel.org # v5.0+

Cheers,
Benjamin

>
> Reported-and-tested-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---
>  drivers/hid/hid-multitouch.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index ef635964cfe1..a344a3cf5398 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -642,6 +642,13 @@ static void mt_store_field(struct hid_device *hdev,
>         if (*target != DEFAULT_TRUE &&
>             *target != DEFAULT_FALSE &&
>             *target != DEFAULT_ZERO) {
> +               if (usage->contactid == DEFAULT_ZERO ||
> +                   usage->x == DEFAULT_ZERO ||
> +                   usage->y == DEFAULT_ZERO) {
> +                       hid_dbg(hdev,
> +                               "ignoring duplicate usage on incomplete");
> +                       return;
> +               }
>                 usage = mt_allocate_usage(hdev, application);
>                 if (!usage)
>                         return;
> --
> 2.19.2
>
