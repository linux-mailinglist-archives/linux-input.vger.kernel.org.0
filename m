Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE1D108AF3
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 10:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbfKYJdX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 04:33:23 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52383 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727192AbfKYJdX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 04:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574674403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7G+KIPC5ZSXPGPUEtN6Ugx/07ICrSHBG5p0rtNCjvWk=;
        b=NwZoL82PWoeEqIA/NS+H8jRJgSVT+y7mXUSUBTNmm5/gpY9GxjHh2mM+i/TSfErRkkN69v
        T/emVNh5F53cg4awsNzh0ZmjMQyKT2g/rx8A9wNXDb4nckte9ztJTH+PP1rtLiDQBkZe6d
        s6GwCL0VcM6PmwgMkr3xSmIdxvo3H48=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-VXATazbPNtOBUg_sQLPlbQ-1; Mon, 25 Nov 2019 04:33:22 -0500
Received: by mail-qk1-f200.google.com with SMTP id c4so9204082qkl.6
        for <linux-input@vger.kernel.org>; Mon, 25 Nov 2019 01:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0aCw5BrybA+WtP+tnX9x0Ga8lkeDoT+3V/QTfor6M4=;
        b=cn/wnKfz66iClnQoxKbVYF2/7Qg58+BycvWdE3byjlFomOV9TYqbGuemdt2Ty+wpU2
         AlzHMb97miUGlsjX73DL6SIGBjqwi0liJENnn+/kerVoCWj/OBFMHUTn1hx47Fwas7PS
         omANHdNpBGzGkBy3isEqkyE1Hpdh5iiwWuvfQGbjxPnJOZFfMVXOkaUIBpBPJ1c8fonT
         mT/lADt26b2w1BN/iZhbduyoCEbzcmbfLf9quqD0Nri1VcoTSh7+4I83aTjcQcRKVNgI
         yjxVfrBjhdsHQokrsdFjNnKbtWYXpAF0XjoAaE/gxrg5qprwrrrbP8C6ynXJZYacnscY
         JtQw==
X-Gm-Message-State: APjAAAVhog8CJ5BKkyAFN+lUu9Fo2WnzYpvuP0AoU15RccpJnknecndB
        3fvRArv/tWinBVd88w27yMJavzlpXhEedpoo2j16k9E+UVrOck4jq7UKjX8zUYEtJHbBKu0P0qw
        LGP3tzZtEviNgreDUHTutFR1e+JBlsd7Y7tqo58s=
X-Received: by 2002:ac8:1c03:: with SMTP id a3mr10600818qtk.31.1574674400446;
        Mon, 25 Nov 2019 01:33:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUOruSGQlLplRmMyOJ2E9gm3K4Pzh+01YJRHV+U5OLgHx+9YfYDw+n8uVg7XGj3nTCDlK0QduJBbto4yVczCg=
X-Received: by 2002:ac8:1c03:: with SMTP id a3mr10600802qtk.31.1574674400189;
 Mon, 25 Nov 2019 01:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20191122202559.GA71021@dtor-ws>
In-Reply-To: <20191122202559.GA71021@dtor-ws>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 25 Nov 2019 10:33:08 +0100
Message-ID: <CAO-hwJJ0Rxv6wJjRSEGyhQxKRW-iNSiO+8v-YgOa+cL4ZPSWRw@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-input: clear unmapped usages
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
X-MC-Unique: VXATazbPNtOBUg_sQLPlbQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Fri, Nov 22, 2019 at 9:26 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> We should not be leaving half-mapped usages with potentially invalid
> keycodes, as that may confuse hidinput_find_key() when the key is
> located by index, which may end up feeding way too large keycode into
> the VT keyboard handler and cause OOB write there:
>
> BUG: KASAN: global-out-of-bounds in clear_bit include/asm-generic/bitops-=
instrumented.h:56 [inline]
> BUG: KASAN: global-out-of-bounds in kbd_keycode drivers/tty/vt/keyboard.c=
:1411 [inline]
> BUG: KASAN: global-out-of-bounds in kbd_event+0xe6b/0x3790 drivers/tty/vt=
/keyboard.c:1495
> Write of size 8 at addr ffffffff89a1b2d8 by task syz-executor108/1722
> ...
>  kbd_keycode drivers/tty/vt/keyboard.c:1411 [inline]
>  kbd_event+0xe6b/0x3790 drivers/tty/vt/keyboard.c:1495
>  input_to_handler+0x3b6/0x4c0 drivers/input/input.c:118
>  input_pass_values.part.0+0x2e3/0x720 drivers/input/input.c:145
>  input_pass_values drivers/input/input.c:949 [inline]
>  input_set_keycode+0x290/0x320 drivers/input/input.c:954
>  evdev_handle_set_keycode_v2+0xc4/0x120 drivers/input/evdev.c:882
>  evdev_do_ioctl drivers/input/evdev.c:1150 [inline]
>
> In this case we were dealing with a fuzzed HID device that declared over
> 12K buttons:
>
> https://syzkaller.appspot.com/bug?extid=3D19340dff067c2d3835c0
>
> Reported-by: syzbot+19340dff067c2d3835c0@syzkaller.appspotmail.com
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> I'll be putting a guard into drivers/tty/vt/keyboard.c as well.
> Please consider for stable.
>
>  drivers/hid/hid-input.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 63855f275a38..3957d1c4d967 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -1215,9 +1215,11 @@ static void hidinput_configure_usage(struct hid_in=
put *hidinput, struct hid_fiel
>                 set_bit(MSC_SCAN, input->mscbit);
>         }
>
> -ignore:
>         return;
>
> +ignore:
> +       usage->type =3D 0;
> +       usage->code =3D 0;

Unfortunately, this breaks the buttons on the MS precision Touchpads.
The hid-tools test suite found that for me :)

The problem is:
hid-multitouch.c|mt_touch_input_mapping() lines 840-857
 -> we assign the button mapping correctly, but there is a catch for
the first button:
hid-multitouch.c|mt_process_mt_event() lines 1123-1126
 -> we check for the usage type and code to know which button we have

We are entering the ignore case because:
hid-input.c|hidinput_configure_usage() lines 582-589
 -> hid-multitouch.c|mt_touch_input_mapping() lines 840-857
   -> return 1
 -> goto mapped
hid-input.c|hidinput_configure_usage() lines 1134-1137
 -> hid-multitouch.c|mt_input_mapped() lines 1360-1363
  -> return -1 (we are in the mt collection)
 -> goto ignore

We would need to change the input_mapped() function to either ignore
or exit hidinput_configure_usage() based on the return value, or we
would need to store the original usages in hid-multitouch.

Actually, to fix this without breaking current drivers, we should just
change the `goto ignore` into a `return` after checking the value of
.input_mapped()

Cheers,
Benjamin

>  }
>
>  static void hidinput_handle_scroll(struct hid_usage *usage,
> --
> 2.24.0.432.g9d3f5f5b63-goog
>
>
> --
> Dmitry
>

