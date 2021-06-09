Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A078F3A1E5C
	for <lists+linux-input@lfdr.de>; Wed,  9 Jun 2021 22:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhFIU4F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Jun 2021 16:56:05 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:39731 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhFIU4E (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Jun 2021 16:56:04 -0400
Received: by mail-qk1-f174.google.com with SMTP id j184so25142406qkd.6
        for <linux-input@vger.kernel.org>; Wed, 09 Jun 2021 13:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5RQWZ6xrwqXsY7jcwm6YWVJxGs12/xoYgd5GfhJpL0=;
        b=VzBL1GLlaozwDDQ/wEYMQB7ITUvMd0wmq5svvSfKKPGAkvx+4cORXVKgy2XfY9j8oq
         IW8MjyjpCh4pP5ev730tOBo3V95vM9Tc0kIOYyagMxN3pLI/0ZrysxYX6+HECZN16nND
         iYb0uS/0B63hVDesBsf58IrozwgQzXSuYugoSCK0YyJTvSUApAJugaN0RGJoWbZ/h2E4
         MyliyrZP3icnOvAFV7u1IxIcAIzjVkvE/gkFj/E9hkOX4RtuhQkHosyDksdHZnVor+nA
         XZ/yTdPSxDIiOV+eF3XVWrulB+nBU4USoJ70k+o2t/ht4z1O0TydtTjYwAa3SvM1KZnh
         +AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5RQWZ6xrwqXsY7jcwm6YWVJxGs12/xoYgd5GfhJpL0=;
        b=EyFrgmfv0V+rWZ/n7tN1tmxgPKkceKJiLxDEJ33xUODdlJ3y5ceip8ezrFyaZ7xTJJ
         UfQ5UbRVyPGbXySrw6K/W1CTNJcyJbLkbYH35Yz/3Tc1F7Bz6LfIiXAQe1v4ZOYX5rpd
         Up8Oq0TpA4sbNozP+zGP926Xrb4+9rrr3W3skyga4/T0nuoet3/rJRM3RLXi6TKQHzip
         VmpZwysYJrOzkWW+DLPHMZQTDap1EEbQdsKKXRqwuIJPEa6a2jhm6cRaCYSAA2+nO3aj
         cqaVNLhtwsb2SCnTkiI06opOIPHM8HLvTEfEk+kCddcyk0NHzhSSiIeA3o2bsdUo+MGu
         P9gg==
X-Gm-Message-State: AOAM531To/OUurLcRhMqfX2589NPW1rKgHVW9Vqgdh3j5QOg29zyhMmm
        Qg0KwR3BoFt0+G+pdxEHxscrq0LzMbD3ENjSCY5U2fMk9ELeJFxB
X-Google-Smtp-Source: ABdhPJwtqk9lCcSgfyjM4Vh0fJgEMUQf9UzDVXiFvpnjihd6CTRbEk3nNcq716xW2lJ20StEN4Do2BKq+j4GQlCNXxM=
X-Received: by 2002:a37:7c02:: with SMTP id x2mr1519450qkc.483.1623271988732;
 Wed, 09 Jun 2021 13:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210520002249.361821-1-kenalba@google.com>
In-Reply-To: <20210520002249.361821-1-kenalba@google.com>
From:   Kenneth Albanowski <kenalba@google.com>
Date:   Wed, 9 Jun 2021 13:52:57 -0700
Message-ID: <CALvoSf4WK0bvDGP4py1U_zkg3-CdartK+=5m19C-wyfCwX5w8Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] 64-bit Digitizer Serial Numbers
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <jason.gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To follow up to myself, we've decided that general >32-bit HID field
support isn't justified at this time (and not really supported by the
spec), so this set of patches can be simplified.

At this time, I'm going to switch to a plan of treating a 64-bit
Usage(Digitizer.Transducer Serial Number) as a singular oddity that
needs to be processed, instead of adding general processing for
arbitrary length HID fields throughout the hid-input system.

As to the code, I'm going to be following up with revised patches:

Patch #1 (minor cleanup) remains unchanged.

Patch #2 (large field support) goes away

Patch #3 (power_supply S/N support) is kept, and adds some minor
changes to hid-core.c, particularly in hid_add_field() that
recognize the 64-bit Usage(Digitizer.Transducer Serial Number) and
cuts it into two fields, a 32-bit Usage(Digitizer.Transducer Serial
Number) and a new 32-bit usage for the upper half.

Kind regards,
- Kenneth Albanowski

On Wed, May 19, 2021 at 5:23 PM Kenneth Albanowski <kenalba@google.com> wrote:
>
> Still as RFC, here's a patch set to implement support for 64-bit
> Digitizer Serial Numbers, following on to the prior discussion of how
> we can support Usage(Digitizers.Transducer Serial Number) larger
> than 32 bits.
>
> My primary goal is making the serial number available via the
> power_supply node interface, and the third patch implements that: if
> CONFIG_HID_BATTERY_STRENGTH is enabled, and a hid report includes
> both Usage(Digitizers.Battery Strength) and Usage(Digitizers.
> Transducer Serial Number) then the generated power_supply node
> includes a SERIAL_NUMBER of "DG-ABCDEF..." of the last seen digitizer.
>
> For this patch set, I have not implemented any changes to MSC_SERIAL*,
> however everything should be available for a future implementation. This
> patch set does not change any events emitted by evdev.
>
> After some conversation with Dmitry, I am leaning towards serial number
> integration with the hid-multitouch protocol being the better long term
> solution for evdev, as that fits better with combined touch and stylus
> operation, as well as providing a clear means to providing multiple
> serial numbers for simultaneous styluses.
>
> This set includes general modifications to hid-core to decode and
> represent HID fields larger than 32-bits as multiple consecutive 32-bit
> words, allowing arbitrarily long fields (or at least as many as can fit
> into HID_MAX_BUFFER_SIZE) to be passed upstream and (potentially)
> processed by hid-input and other subsystems.
>
> (After trying a 64-bit implementation, I decided staying with 32-bit
> words kept the rest of the hid-core cleaner, and it was worth
> supporting arbitrary length fields instead of only upgrading
> from 32 -> 64.)
>
> Kenneth Albanowski (3):
>   [hid] Minor cleanup
>   [hid] Enable processing of fields larger than 32 bits.
>   [hid] Emit digitizer serial number through power_supply
>
>  Documentation/hid/hiddev.rst |   6 +-
>  drivers/hid/hid-core.c       |  99 +++++++++++++++++++++-----------
>  drivers/hid/hid-debug.c      |  27 ++++++---
>  drivers/hid/hid-input.c      | 108 +++++++++++++++++++++++++++++++++--
>  include/linux/hid-debug.h    |   4 +-
>  include/linux/hid.h          |  10 +++-
>  6 files changed, 199 insertions(+), 55 deletions(-)
>
> --
> 2.31.0
>
