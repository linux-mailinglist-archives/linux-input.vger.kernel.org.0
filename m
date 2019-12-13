Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A3B11E362
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 13:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfLMMLi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 07:11:38 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35265 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbfLMMLi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 07:11:38 -0500
Received: by mail-pj1-f65.google.com with SMTP id w23so1134660pjd.2
        for <linux-input@vger.kernel.org>; Fri, 13 Dec 2019 04:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9r3y5b2vXMIRb8oNblHHWyiR/x9JBMIKMp7Nl/AMSRg=;
        b=ftJJ7cj5skjnr4OfwFizJQnyDilL8KDJLUSdnajj31APdfbww2kYdJaC5q7N2wedfa
         HkoO/nl7SIDvINoANdm2hSw3WnaoPBko5o3vkkgaNBaA9koBKRUPSUQ0ueMwMuAnRSNc
         g/GE0hCDxB+nXjFmP/aZSP0oYJ22nLzaChBYHTio+9S8oof8F4cYfcYLDNxYFwk+Dyj3
         NSLGahEYWM7sQbGlFL59techMRpz00kQeHMO4rGpIuWTMVa7dzjE7fzVhBMsUWa7B23o
         T9D+Wh8sI54DIfEDt7YgD9M5hrEMA/0x4gzlacknbtyZEDeJYyB66MZyeSq2UYTGXfHf
         QJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9r3y5b2vXMIRb8oNblHHWyiR/x9JBMIKMp7Nl/AMSRg=;
        b=XWgkWs7lCefwYT0HWgnu4PqobhT6vsJopz8zopUfm4OtQIA0ySja2jpji6ROPXjniN
         6dnAjjcaH8D9Qgw0byElJo5vYBXxzVv7zm1aN9Po/BVOoZ8jS7v3M+aC5GD2GLqly1Tt
         +sz6y58cXs0D5ztWoGBBnfAVgFUJEclk6r6mEJuKK4BnXPESgtKe4IZs8eYAbmJZKtIu
         2U2u+57FrsfezLE1wEAhspHx47J9SIOY3NtRxxVR70MxBTsNV8hLzPNlyeqQeHMx2CjH
         fUskNi3+fg+TJ+OIq3svs4W59CMjcP/bnSVLIwZ2GBXZn8G+tGCuXChFTMMNR+XtUmlc
         CTXw==
X-Gm-Message-State: APjAAAUuKlWBmKhM1GO0eFPJjqEnfeN96MI62nzspgqOB+9bDDxU73Gl
        0UzooFGyPEFfC3JJfcMnWIvO5fBnfPB7S7zFTZ0JIQ==
X-Google-Smtp-Source: APXvYqzkX7D2D12zjMDASh4roJ/9SPGGMP8O/ZGu02LjcJLBvXA42frjpmL1JwEN3xx2P2+PjH8NqE+WnQngBKa56Yc=
X-Received: by 2002:a17:90b:150:: with SMTP id em16mr15813824pjb.123.1576239097699;
 Fri, 13 Dec 2019 04:11:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576170740.git.andreyknvl@google.com>
In-Reply-To: <cover.1576170740.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 13 Dec 2019 13:11:26 +0100
Message-ID: <CAAeHK+xkvQ3Jxot15pw1_EHZgZ2i539pLSxgXujDLWO0x0DrRw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] kcov: collect coverage from usbhid interrupts
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 12, 2019 at 6:15 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patchset extends kcov to allow collecting coverage from interrupts
> and then uses the new functionality to collect coverage from usbhid code.
>
> What I'm not sure yet about this change is if we actually want to
> selectively annotate some parts of the USB stack that are executed in
> interrupt context, or maybe we can do this with some common approach.
>
> For example patch #2 in this patchset annotates all functions that are
> passed as completion callbacks to usb_fill_*() in drivers/hid/usbhid.
> Maybe instead we could redefine usb_fill_*() in a way that would handle
> all such cases without manual annotations.

Although looking at this again today, it seems much more logical to
add kcov annotations around the complete() callback in
__usb_hcd_giveback_urb(). Don't know why I didn't think of that. Will
do in the next version.


>
> Any suggestions are welcome.
>
> This has allowed to find at least one new HID bug [1], which was recently
> fixed by Alan [2].
>
> [1] https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
> [2] https://patchwork.kernel.org/patch/11283319/
>
> This patchset has been pushed to the public Linux kernel Gerrit instance:
>
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2225
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>
> Andrey Konovalov (2):
>   kcov: collect coverage from interrupts
>   HID: usbhid: kcov: add annotations for coverage collection
>
>  Documentation/dev-tools/kcov.rst   |  16 +--
>  drivers/hid/usbhid/hid-core.c      |  25 +++-
>  drivers/hid/usbhid/usbkbd.c        |  15 ++-
>  drivers/hid/usbhid/usbmouse.c      |   7 +-
>  drivers/usb/gadget/udc/dummy_hcd.c |   1 +
>  include/linux/sched.h              |   3 +
>  kernel/kcov.c                      | 196 +++++++++++++++++++----------
>  lib/Kconfig.debug                  |   9 ++
>  8 files changed, 192 insertions(+), 80 deletions(-)
>
> --
> 2.24.1.735.g03f4e72817-goog
>
