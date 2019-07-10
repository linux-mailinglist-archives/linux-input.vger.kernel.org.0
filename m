Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33FC164BD1
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2019 20:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfGJSB2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jul 2019 14:01:28 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34937 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbfGJSB2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jul 2019 14:01:28 -0400
Received: by mail-qk1-f195.google.com with SMTP id r21so2640140qke.2
        for <linux-input@vger.kernel.org>; Wed, 10 Jul 2019 11:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBmKn7FXu7Zqxa5cwiN0hifmHYhWPoBkktcP9ul0M2w=;
        b=qPWVQlNQiVg16nygC2U2IVGtm8ALipSRSvKCnCnJk86d74bTsU3nEfLR1gskxL2H9y
         LdkGkUBgB4Mh3QoTHr+dArOwmNe3NHyTntZOcDuot1Sf+1MgkyC0xBzhEV5zulfKarDK
         5obtYuTnHzDm6HuBWBlP1fMe4thrwCqnQCEDIfL/5kc7DhEK8jzVhN16xUqHN3cbgjKi
         ZPkbhAbLoi04AaZL7SwGLaDr9MEVVvOMV99oVjFjlv7NT4JWMZUA4DmWaotDxx2oyuiE
         pl7SEDsaRjCNUw5zP/TQPe0AOiidLpA/sN+5kqBNcUOYf0MHe4vE5KiqCgqz36mQj784
         gnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBmKn7FXu7Zqxa5cwiN0hifmHYhWPoBkktcP9ul0M2w=;
        b=AFjkzdJECZZSYSs772m+OYn3yczJ2MQZ7mcKS5aVegIsuSV5s94LXAotgshEAz/9Eo
         2ygLkHXQPGE49NGwvqJuhyQsUfpBzcM9zv8P3RnhfKK2ZYX3cch+8THDpSp5n8LkZH8u
         teQqj5M4Wd4n+viLpf1yq97oWi7fuoidjv+1NY/5EMm3tOYM5RVTQEDt0kTC5zZl7MA5
         M980LEZv45eP8tpRtsJBK/Lhi2YkZMx5WICssEH4JoNj04xS6etvLH6HaPAjVPVIzKrp
         E3nWnPzeDYHFkJCBFuTUpWAa7Hd+tMxzs1OexMeg+wxEgrOsY3NwZd6SoUFXO2qYC7+U
         bA/g==
X-Gm-Message-State: APjAAAWUq2IIeWvyRxpmVrI8JD2Jbq+wDhVeA3JGWViCOjqrTi8ubedI
        M1OPphkx/PWeoiZ7vb2yhuwLY+w8B/Tl0Hc/qGU=
X-Google-Smtp-Source: APXvYqyF1sjhZ5+OF5YFeujHNt5RtbTVv377KVOwQneOWYnBMgCaASO3MHtZqRK8tkf6kxNG85EyNM0XVVgpXAYqzmc=
X-Received: by 2002:ae9:ea17:: with SMTP id f23mr19248359qkg.236.1562781687629;
 Wed, 10 Jul 2019 11:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <2dc79196-8403-9c72-7495-6d27527933ad@gmail.com>
In-Reply-To: <2dc79196-8403-9c72-7495-6d27527933ad@gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Wed, 10 Jul 2019 11:01:16 -0700
Message-ID: <CAEc3jaDFmh=pSTPEBk3872-vcULc4T6TUnpctW3kQy3mXuHcZA@mail.gmail.com>
Subject: Re: Potentially different semantics of hidraw's write() between USB
 and Bluetooth transfer
To:     Fabian Henneke <fabian.henneke@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fabian,

I would like to reply just in relation to the "Bluetooth path" as I'm
not sure what the intended behaviour is for the "write" call is.

The Bluetooth path taken depends upon the userspace Bluetooth stack
you use. Various Bluetooth stacks use "uhid" though some may take hidp
as well or may even support both. I hope this helps you with your
quest. I recall at least BlueZ supports uhid and Android uses it as
well.

Thanks,
Roderick

On Tue, Jul 9, 2019 at 3:32 AM Fabian Henneke <fabian.henneke@gmail.com> wrote:
>
> Hi,
>
> when testing hidraw's hid-example.c
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/hidraw/hid-example.c)
> with a Bluetooth HID device, I noticed that the write() call always
> returns 0 on success, even though the entire buffer has been written and
> received by the device.
> Following the chain of calls triggered by the call to write(), I
> identified hidp_send_message in /net/bluetooth/hidp/core.c:98
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/bluetooth/hidp/core.c#n98)
> as the plausible origin of the return value. This function always
> returns 0 on success, regardless of the value of its parameter size.
>
> Could you confirm whether this function is really the one used to handle
> writes to Bluetooth HID devices? If so, is it intended behavior to have
> write() return the number of bytes written for USB HID devices, but not
> for Bluetooth HID devices?
