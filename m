Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD22133192
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 15:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfFCN4H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 09:56:07 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34542 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfFCN4H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 09:56:07 -0400
Received: by mail-qt1-f195.google.com with SMTP id m29so4178840qtu.1
        for <linux-input@vger.kernel.org>; Mon, 03 Jun 2019 06:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wn1uNmv3vvFv+zJtpYXE95Rt0JSWOUlf6tE7j92Kf54=;
        b=NsBWonqoF/JsgHNBDnRa/2iP9sGYWtEV9FF6KswGhvIJuUaA+Vzi1WfESnsdqMFnVj
         5Ka6II9ixWFoPoOkGESGfbEzasg0l4Oi+x63YqFCZ9Hc5sUpE9IxoM5VKuqw482gyO+o
         x4m+mmoMjSK9sKGGdSpJwoZKHL2fUDUz3yFW6tGGWXQN6DzHmEvdRUGvB5qVi5cYyueQ
         3tQ9jBUgInHgytZ+bbiAkopyyvzxS1sGbI9+vICr5R/kXnAyyrTPHFv1tJ5PjMhYxEEJ
         vSYCBYa2iWPucPPYMgj53aVK7d6GDEnqUR+4S2rFB1nnNUaDAEBrVi954faQcRQBViDo
         kSWQ==
X-Gm-Message-State: APjAAAXZyKlkVI+M7LUml2wCau8gXCeThIt8jvH6Q+iH8q9qqxqPQGGz
        yLSn2KpD0C0WGcVj9OpLLdnTkHlwOf6vwaRD4rJJhA==
X-Google-Smtp-Source: APXvYqza8Lsq7PQmFx/3Zks4wKoVfumcwfhQr3+EfEfmsKiGXwN0D4pM+2yvo1usEcyGNfjuknthVTRDvKaonTKWyUc=
X-Received: by 2002:a0c:baa7:: with SMTP id x39mr2966231qvf.100.1559570166745;
 Mon, 03 Jun 2019 06:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
 <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm> <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com>
 <8a17e6e2-b468-28fd-5b40-0c258ca7efa9@intel.com> <4689a737-6c40-b4ae-cc38-5df60318adce@redhat.com>
 <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com> <nycvar.YFH.7.76.1906010014150.1962@cbobk.fhfr.pm>
 <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com> <5471f010-cb42-c548-37e2-2b9c9eba1184@redhat.com>
In-Reply-To: <5471f010-cb42-c548-37e2-2b9c9eba1184@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Jun 2019 15:55:53 +0200
Message-ID: <CAO-hwJKRRpsShw6B-YLmsEnjQ+iYtz+VmZK+VSRcDmiBwnS+oA@mail.gmail.com>
Subject: Re: hid-related 5.2-rc1 boot hang
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 3, 2019 at 11:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Again,
>
> On 03-06-19 11:11, Hans de Goede wrote:
> <snip>
>
> >> not sure about the rest of logitech issues yet) next week.
> >
> > The main problem seems to be the request_module patches. Although I also

Can't we use request_module_nowait() instead, and set a reasonable
timeout that we detect only once to check if userspace is compatible:

In pseudo-code:
if (!request_module_checked) {
  request_module_nowait(name);
  use_request_module = wait_event_timeout(wq,
        first_module_loaded, 10 seconds in jiffies);
  request_module_checked = true;
} else if (use_request_module) {
  request_module(name);
}


> > have 2 reports of problems with hid-logitech-dj driving the 0xc52f product-id,
> > so we may need to drop that product-id from hid-logitech-dj, I'm working on
> > that one...
>
> Besides the modprobe hanging issue, the only other issues all
> (2 reporters) seem to be with 0xc52f receivers. We have a bug
> open for this:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=203619
>
> And I've asked the reporter of the second bug to add his logs
> to that bug.

We should likely just remove c52f from the list of supported devices.
C52f receivers seem to have a different firmware as they are meant to
work with different devices than C534. So I guess it is safer to not
handle those right now and get the code in when it is ready.

Cheers,
Benjamin
