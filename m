Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B6438FA70
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 07:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbhEYF5Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 01:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhEYF5X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 01:57:23 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38EBC061574;
        Mon, 24 May 2021 22:55:53 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id z38so11772517ybh.5;
        Mon, 24 May 2021 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6pmVU3dpIgp8CIixqWB9X4Z4r3f+OzJWJVHDt4+uTLQ=;
        b=RbX2t3LF7cCjSPU1TFYocJR54IHyaCKEYcJfG+rSZg9dUQo4opFJn4MVxLGO8J04VC
         KvDHMxvnMZqhMUPX8xxtKiB8atlU+oP7VJMaZilXGpXzJD7v4r8UZ38+A9hsiXFd9HOJ
         JNEgEFMJDFvg3Yn8vvKqrgLL2Av0KZfvbPQSN+NKz6KmGPoA2U/QP3ixx7SJnQcgMm3E
         AgnI50QZ97oTmUJOInpAjfpa5wPLuprkVJDEskzgRvpTQXAwoIp3cqDal7IgNlJj+hLg
         ES+KibybPbToa2VtSKmFAQUB6ppCs09O5YUCxet/Dg28LrLhN6BP13im0kvf3///r995
         AUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6pmVU3dpIgp8CIixqWB9X4Z4r3f+OzJWJVHDt4+uTLQ=;
        b=dULPEAkEutyoP2n4E2l2WaKtBXmmoNWqkcGptFwSEg022hYd4DJNROJKeXGGjlVaj3
         xnJrGLOvRk/sfGK7jt/FNU6unjJjLVLT1ip2/4YnfWgDJp3fse5Am6RwO/4eAQsvaacT
         VkW58iA+BKeKcSuQksiDW2S0leytgc9xMeaevaHfpB2vXu/tMOcn6PrYCRaHsRgFGqC7
         yHAhGOAcwHlK/xXBRH/asin9JsaqIIoHsarJKv1BRej3cp/8P94CHt4LnG/isjZRprWI
         v+hM27+rc0/A82zzTU3ClvdrmAl9UnRJHvfP7gsA/N2CFZb0UlZvJhrolGKTNBaEqD8v
         4Xbg==
X-Gm-Message-State: AOAM533Y6EODVDZUxUfJCqVWLdWqM5wJOGFRcpJoIzl9I8dHO3l/5K4D
        dTqqTWU/3d7VkkbWrtqobMOC+ykSUrukWOMxDkBc8fJG
X-Google-Smtp-Source: ABdhPJzj1YxPTGxGT1aZh2Df9jczAAjWL5yvxRY1DMR9iC9tE9IqDTptyJd+LLC1Y+pTedzjQbp/y8uO8xJnL512TlY=
X-Received: by 2002:a25:4409:: with SMTP id r9mr39054034yba.401.1621922152946;
 Mon, 24 May 2021 22:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com>
 <20210521160455.GA10159@duo.ucw.cz>
In-Reply-To: <20210521160455.GA10159@duo.ucw.cz>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 24 May 2021 22:55:41 -0700
Message-ID: <CAEc3jaBdWwfbMdrdKOc9e19Mb5HD3DE4QUNu+5UseQ9WLt0THQ@mail.gmail.com>
Subject: Re: Naming of HID LED devices
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        marek.behun@nic.cz, linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Fri, May 21, 2021 at 9:04 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > Earlier this year during review of the hid-playstation driver there
> > was a discussion on the naming of LEDs exposed by HID drivers. Moving
> > forward the preference from the LED maintainers was to follow the
> > naming scheme "device:color:function" instead of the custom names used
> > so far by HID drivers.
> >
> > I would like to get some guidance on the naming direction not just for
> > hid-playstation, but Daniel's hid-nintendo driver for which he posted
> > a new revision today has the same problem.
> >
> > The original discussion was on "why not use the input device name?"
> > (e.g. input15). It was concluded that it wouldn't uniquely identify a
> > HID device among reasons.
>
> I understand that problem is that one controller is present as
> multiple input devices to userspace.
>
> [That is something you might want to fix, BTW. IIRC input protocol is
> flexible enough to do that.]

[That part is actually non-trivial to fix without an overhaul of the
Linux evdev system. Essentially evdev is a bit limiting for some
devices due to conflicts in use of axes or buttons. This is what
prompted creation of multiple input devices I believe. Though various
HID devices are now also receiving multiple input devices
automatically now based on collections or something. Benjamin and Jiri
are the experts there. Anway that's a major other conversation, people
are trying to steer away from...]

>
> I suggest you simply select one input device (call it primary,
> probably the one that contains the master joystick) and use its input
> number....

It is of course an option. Though I recall in the previous discussion,
technically the LED is registered on the HID device and not on the
input device, so it is not entirely correct. There are also cases I
believe where LEDs are directly created for the HID device itself.
Based on a quick search this includes the 'hid-led' driver. Though its
naming is probably fixed as we may not want to break user space (not
sure if anyone is relying on it). There might be other plain HID
device use cases with LEDs.

> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek

Thanks,
Roderick
