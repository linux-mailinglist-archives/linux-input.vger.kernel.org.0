Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F314235727F
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 18:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347911AbhDGQ5G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 12:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55625 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347813AbhDGQ5G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 12:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617814615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=84pa1HvUTGdh6/hpUONI0z4OQ3atAIhX+iUH4vkqrWs=;
        b=PxxULJiv6DqusNIcY/feTGuK72k6aOEF+wlkPgcSIcrH9PRvM8CHV0nd/S7Osj6FncW+IO
        mN0xgefpBO8dmJULGEppx6PRLqVuYo011NGY+W96A0oxmB5SKH1j0+IN9zAATnhnfM1Mm3
        E+pSEZO/2rp7roWZ3Sk6XFRzbpAvGBU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-X2q17c0jOuKSpjQdOdNL6A-1; Wed, 07 Apr 2021 12:56:54 -0400
X-MC-Unique: X2q17c0jOuKSpjQdOdNL6A-1
Received: by mail-pj1-f69.google.com with SMTP id cu3so3880902pjb.3
        for <linux-input@vger.kernel.org>; Wed, 07 Apr 2021 09:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84pa1HvUTGdh6/hpUONI0z4OQ3atAIhX+iUH4vkqrWs=;
        b=AKbWhUPJ0SKzHMeHvlXs6pnlBmTo1fW7CGQ++0PF/QnWln3VG5qKOj0zk35fDnxB6H
         g4fFquq8xoHDCtHNt732C0MEfdu/MKgkGbvKNaXdFgAPmj1EZxYETF2b4XEH0du85oA3
         ijoHg9LMoaqbquIdASVFWXQ8HJc3wm5/cmrd0S7cHVX6eJ4TPhvNEQVzbE9KpWQx/Wo+
         5rf5MoIkjaOQD4LwqrXB7JQZ59Q1p89z46+pnY/PPWxCwgX8TdgOXNUI4/TubZFNflyF
         dhl2QaEk5uPY1a0sIhh+0nRL7FwnewlHJEf5NTC+mO9kRgamidCY6toKdrY5cQAAfonG
         wXYQ==
X-Gm-Message-State: AOAM531XJEPKfWtKLi2ahYWxNc48Z6/9pcNjAAxZGYPKfgC9H7peyW/9
        pM0S5LfrjWLbTQMpko4xuZpUZbQW+p0FZNevKe1zA/9CbsZ1De16wYR+ff728TYzG4YhQ7QvOJ3
        rAx3RYRM5g9Exaet0iymCi0fJ4odvr7tWPW1HQTQ=
X-Received: by 2002:a65:6881:: with SMTP id e1mr4248958pgt.147.1617814613436;
        Wed, 07 Apr 2021 09:56:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx98k9H/YT9dpeZJC8wWkahRBQ2regNea2V8x7a8NKVUZWNGQLYWWHNVbHaypJVRA8LM26YNJhsCcE7MVs8wM=
X-Received: by 2002:a65:6881:: with SMTP id e1mr4248931pgt.147.1617814613117;
 Wed, 07 Apr 2021 09:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143458.508959-1-lee.jones@linaro.org> <20210326143458.508959-8-lee.jones@linaro.org>
In-Reply-To: <20210326143458.508959-8-lee.jones@linaro.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 7 Apr 2021 18:56:42 +0200
Message-ID: <CAO-hwJLD9bUJAx6E4HF9VGu20Ddyo=ZyZ=DdSWj__Gp9rG486w@mail.gmail.com>
Subject: Re: [PATCH 06/25] HID: usbhid: Repair a formatting issue in a struct description
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, message to <vojtech@ucw.cz>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 26, 2021 at 3:35 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/hid/usbhid/usbkbd.c:66: warning: bad line:                 should be on
>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: message to <vojtech@ucw.cz>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/hid/usbhid/usbkbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
> index d5b7a696a68c5..d0c640be8a885 100644
> --- a/drivers/hid/usbhid/usbkbd.c
> +++ b/drivers/hid/usbhid/usbkbd.c
> @@ -63,7 +63,7 @@ static const unsigned char usb_kbd_keycode[256] = {
>   *             new key is pressed or a key that was pressed is released.
>   * @led:       URB for sending LEDs (e.g. numlock, ...)
>   * @newleds:   data that will be sent with the @led URB representing which LEDs
> -               should be on
> + *             should be on

nitpick: checkpatch complains about spaces before tabs here.

I amended locally and will push the fixed version.

Cheers,
Benjamin

>   * @name:      Name of the keyboard. @dev's name field points to this buffer
>   * @phys:      Physical path of the keyboard. @dev's phys field points to this
>   *             buffer
> --
> 2.27.0
>

