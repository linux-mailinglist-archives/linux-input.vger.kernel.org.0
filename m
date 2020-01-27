Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B640014AB35
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 21:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgA0UlO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 15:41:14 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37214 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgA0UlO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 15:41:14 -0500
Received: by mail-oi1-f195.google.com with SMTP id z64so8054508oia.4
        for <linux-input@vger.kernel.org>; Mon, 27 Jan 2020 12:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a2v6kBwdqjoNJDIY3RFNUCPA4vTtvd1ke0UKOPOnYME=;
        b=JwwE+mnYJI+xutLiUhuUTIHhqL7GbUQSD7E3in7MMNvi7d3GW36jNAo3fAMjMHrtjE
         Wkuzb0uwmihyrY5FfIWeY0uoh36xxnNJzk7hpbEzJ7hHSkp91WZcZy1+A4uAw72KLIJB
         ax83MkM2kKXG98kRBaOp3jVTZa7OlzL1CqbpDrwnHGJuXsU/smO8uFuyDYjLA7Bh0/eF
         7C1K0jJjGUkrhXAGvQhySHUPgnziQpbFXCvFcCkWUS3Wy01Kv6t68z9cx0rnMt+BUKLD
         lpcyy4lsXS0TpS+9DIk+b2t1b/CocOStfrMG6dJqD3IejxYtAMEzh0UrxUzMtIv5EwF3
         APKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a2v6kBwdqjoNJDIY3RFNUCPA4vTtvd1ke0UKOPOnYME=;
        b=G58UIOsSgK3mj39NF/k884rZfdiNUfNjQWacCuXDsTSD1U5UdIqHmONxbe7iutYhH5
         1KJ/iWrQg0CTBL6I0I8l65yanN2xv73hAdHrJ405AQmHb3fCJHpp35PLpabWO2nGMtL5
         K3cooXvAkC6fg5PqZll/lj3pg3yCHM7FnZF+ofrR3Is6Ov9BVp9U2DAwwAhbEwxhav4Z
         xgaGiGcxI0QCB27pNFkoh4S1LoamarL3xSPHPzHjJNkaGr9fnw9gjZ1zCMZnxdUmvdtN
         +L4LYUXOCa+Y3MCda86P06FpL4pFVTrf7UpEgqtoaeFKPlILwnvKUpOr00ZYvKWd1QVa
         ZI3Q==
X-Gm-Message-State: APjAAAWGAz5UMMxT+nGDk8WJvcKTy1dBg1ww+ioBGO28t2i9/1dsyJu0
        F79b9S6TdhuUbEmxvQ4X/9iHp7rv5XUvrc/8U1c=
X-Google-Smtp-Source: APXvYqxnvbcpmogfjow102EScQuA2DoX+nrI6eT0GX6cWrJFnyZCEUX1HU+NLr/X7LdBwWv+YIWcBeERsYCVObH+GW8=
X-Received: by 2002:aca:c5ca:: with SMTP id v193mr651364oif.77.1580157673589;
 Mon, 27 Jan 2020 12:41:13 -0800 (PST)
MIME-Version: 1.0
References: <CAKsRvPPjk7RZanEwO3hVa+UZ9_zq6xWakOxckBfx-a+_bEgUtA@mail.gmail.com>
In-Reply-To: <CAKsRvPPjk7RZanEwO3hVa+UZ9_zq6xWakOxckBfx-a+_bEgUtA@mail.gmail.com>
From:   js <sym.i.nem@gmail.com>
Date:   Mon, 27 Jan 2020 15:41:01 -0500
Message-ID: <CAKsRvPOfDDEN_BNPznCn2KyWLxMRtT7rC3fEwQ0TNzoRxA+UVg@mail.gmail.com>
Subject: Re: [BUG + PATCH] HID ELAN9038 probe fails with "report is too long"
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i'm bumping this bug because i haven't heard anything from the
maintainers for a week.
there's been no change in the git either.
what's going on guys? this is a tiny patch for a very simple bug.
it should be a fast review and commit to the kernel tree.

js

On Sun, Jan 19, 2020 at 1:14 PM js <sym.i.nem@gmail.com> wrote:
>
> i posted this bug to bugzilla with the attached patch.
> this email is to notify the maintainers.
> https://bugzilla.kernel.org/show_bug.cgi?id=206259
>
> thanks!
>
> js
> ----
>
> ELAN i2c digitizer on microsoft surface go fails to initialize and
> device is non-functional
>
> initialization fails on 4.19.96:
> ----
> [    5.507245] hid-generic 0018:04F3:261A.0005: report is too long
> [    5.507256] hid-generic 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
> [    5.507290] hid-generic: probe of 0018:04F3:261A.0005 failed with error -22
> [    5.556409] hid-multitouch 0018:04F3:261A.0005: report is too long
> [    5.581641] hid-multitouch 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
> [    5.618495] hid-multitouch: probe of 0018:04F3:261A.0005 failed
> with error -22
>
> initialization succeeds on 4.19.95:
> ----
> [    7.150887] hid-generic 0018:04F3:261A.0001: input,hidraw2: I2C HID
> v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00
> [    8.253077] input: ELAN9038:00 04F3:261A as
> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input20
> [    8.253219] input: ELAN9038:00 04F3:261A Pen as
> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input23
> [    8.253330] hid-multitouch 0018:04F3:261A.0001: input,hidraw0: I2C
> HID v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00
>
> problem seems to be due to this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.19.y&id=31d06cc8e7caec36bedeb4f90444920431462f61
