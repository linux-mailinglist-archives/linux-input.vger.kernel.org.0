Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190D01CFEBD
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 21:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELTzK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 15:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgELTzJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 15:55:09 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9855BC061A0C
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 12:55:09 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id r2so13669971ilo.6
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 12:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xB6wHTqK2YXlIkZIpmhCDLStgZfFf4+wljPIomo9G7g=;
        b=KBPAojCIKrMlR/3NpSdk+HA6c2PwJc5XM+RV/f0sHiibBRVEAAGvJNrUT7LuNI504F
         u1rH24DMuwOcnGPtOkcVGW148feu4DTg5ZM0WgXX8JH3s86Q7O7/PAqjusDusRTtzt8y
         74hqBXLbnE12i3qZvJlA/bMPJ4BWe/jmJbbhMWx0jC0GMMunFjebvEYfXyJ3B1jVcxcZ
         HddBpiwBsTEj+M+iXOaDv1M6Ts5ZB/dT1RHTLCWlhK7GWJVV10rH5MiCraoulUkzH5K2
         11/xwqecNXy1K547vSNO9Qcer5XbkQglu2AB74iiDds6+xW31W0np1ezsBaHosxKGO6h
         71DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xB6wHTqK2YXlIkZIpmhCDLStgZfFf4+wljPIomo9G7g=;
        b=Et7QYbiIy+4bPUqbMhmYBXY9d8QYiLD1z1iRDtz+TaDtao4VYA8lwunLifK/m0gh2Y
         bq4PRNZ5rfiPy1gcZA/VU7y3UNNe4IJPBUXJDnOio9Z4gBC0JhiPnXuA06ulA0SU3Y9f
         LplUBcqL+mhuCmmbcZdTfWVbWaIzgFedAqHjm0sVDl8hNAH87Ob7j52LLm6r4G0FgUAS
         Oi42//x+VRuJxXhqK9S9fKVdZHa9Nh/VRFEfPIx0JurCe4TAQWg75aWke08OIBaWVSbw
         RMTJcmcK8vXORRbO2+lR8Cd09rEuytaqVjOU2w6jTbIZthyZLO1SF32kZyzff6Ri/Eh7
         sbmg==
X-Gm-Message-State: AGi0PuZG12LVoR+94ZAQ1f+d0rx/99JpoPKPIm91Gx7xerX121t//dmv
        34Ei00rzRfWXnW8dqXwLchCgUoA8OSh9N7Y7w0A=
X-Google-Smtp-Source: APiQypLA2sTL6YjpzDiOHQ8zqpEFsEMZjXGrhcBb72yQdaDc6ye43dDIXRb6Tz+kppGVoEAOUt523wPsCvcVVCaGtxo=
X-Received: by 2002:a92:485c:: with SMTP id v89mr10138035ila.122.1589313308782;
 Tue, 12 May 2020 12:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAEwx+QrfLk4SR=yn4Df3rD_Lm0Xht1hgAi4szmOTU1nkFhMwhw@mail.gmail.com>
 <20200511201118.GW89269@dtor-ws> <20200512051925.GA48688@koala>
In-Reply-To: <20200512051925.GA48688@koala>
From:   Yariv <oigevald+kernel@gmail.com>
Date:   Tue, 12 May 2020 22:54:32 +0300
Message-ID: <CAEwx+QpN7c4i4qRfaVAP6yPFoydQ+W_0DOsv-NfgwU8Zb1BVZQ@mail.gmail.com>
Subject: Re: PROBLEM: Apple external Trackpad event timestamps are jittery (regression)
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for following up!

I took Peter's advice and used 'libinput recrod' to get some logs.

I tested both a 1st gen as well as a 2nd gen Apple external trackpads.
While the 1st gen is Bluetooth-only, the 2nd gen can be connected over
both Bluetooth and USB.

The 2nd gen external trackpad had no jitter, regardless if used over
Bluetooth or USB.

Following is a snippet of a 1st gen touchpad, showing only SYN_REPORT
lines for brevity.
This was taken on a kernel with the regression:

    - [  7, 526745,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  7, 537376,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  7, 540141,   0,   0,       1] # ------------ SYN_REPORT (1)
---------- +3ms
    - [  7, 540141,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +0ms
    - [  7, 560065,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +20ms
    - [  7, 571556,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  7, 580125,   0,   0,       1] # ------------ SYN_REPORT (1)
---------- +9ms
    - [  7, 580125,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +0ms
    - [  7, 594466,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +14ms
    - [  7, 604987,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +10ms
    - [  7, 616458,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  7, 624124,   0,   0,       1] # ------------ SYN_REPORT (1)
---------- +8ms
    - [  7, 624124,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +0ms
    - [  7, 639259,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +15ms
    - [  7, 650772,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  7, 660130,   0,   0,       1] # ------------ SYN_REPORT (1)
---------- +10ms
    - [  7, 660130,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +0ms

Now a snippet of the 2nd gen trackpad, over Bluetooth, same kernel:

    - [  9, 584965,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  9, 595860,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  9, 607147,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  9, 618610,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  9, 630279,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  9, 641047,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  9, 652429,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  9, 664148,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  9, 674600,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +10ms
    - [  9, 686040,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  9, 697808,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  9, 709277,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  9, 719649,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +10ms

I'm entirely clueless with regard to the input device protocols,
however it is apparent that the 2nd gen trackpad has only SYN_REPORT
(0) in its log, while the 1st gen has both SYN_REPORT (0) and
SYN_REPORT (1).

Last is a snippet of the 1st gen, this time on a kernel with my hack -
so should behave as before the regression:

    - [  6, 243965,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  6, 254576,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  6, 257637,   0,   0,       1] # ------------ SYN_REPORT (1)
---------- +3ms
    - [  6, 265675,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +8ms
    - [  6, 277512,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  6, 288059,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  6, 297642,   0,   0,       1] # ------------ SYN_REPORT (1)
---------- +9ms
    - [  6, 299646,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +2ms
    - [  6, 310849,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  6, 322000,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  6, 333265,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +11ms
    - [  6, 337681,   0,   0,       1] # ------------ SYN_REPORT (1)
---------- +4ms
    - [  6, 344588,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +7ms
    - [  6, 356921,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +12ms
    - [  6, 366979,   0,   0,       0] # ------------ SYN_REPORT (0)
---------- +10ms

Here it seems that if we add the delta from each SYN_REPORT (1) to the
delta of the following SYN_REPORT (0) we get sane timestamps.

I also tested a USB mouse, and the timestamps were Ok.
So to summarize my limited finding, only the 1st gen Apple external
touchpad seems to be affected.

Entire logs:

https://drive.google.com/open?id=1nUNf2uOQPvFw_kE8h4mZB0c80kj3hu4F
Gen1, after regression
https://drive.google.com/open?id=1pr508bqeax1Csle2HQuLcuXwinWksdjo
Gen2, after regression
https://drive.google.com/open?id=1W0XekSNyf1i-Um-VqxDJuMmJoWAGXIG5
Gen1, before regression

Please let me know if I there is anything else I can do to help.

Best regards,
Yariv

On Tue, May 12, 2020 at 8:19 AM Peter Hutterer <peter.hutterer@who-t.net> wrote:
>
> On Mon, May 11, 2020 at 01:11:18PM -0700, Dmitry Torokhov wrote:
> > Hi,
> >
> > On Mon, May 11, 2020 at 09:18:15AM +0300, Yariv wrote:
> > > Using a vanilla installation of Ubuntu 20.04 (kernel v5.4), the
> > > timestamps of input events from my Apple "Magic Trackpad" - 1st
> > > generation, connected over Bluetooth - are jittery.
> > > This is a kernel regression. I bisected the bug.
> >
> > Do you see the same jitter when connected over USB? Can you also see if
> > there is similar jitter when you parse timestamps of SYN_RPEORT events
> > from "evtest"?
> >
> > Could you post a sample of events generated by device (via evtest)?
>
> unrelated, but I really recommend using 'libinput record' these days since
> it can be replayed (libinput replay) or analysed easier (it's YAML).
> Also, it prints delta times into the recording so you can immediately check
> those without having to parse them, e.g.:
>
>   - evdev:
>     - [  0, 375974,   2,   0,       5] # EV_REL / REL_X                     5
>     - [  0, 375974,   2,   1,      -2] # EV_REL / REL_Y                    -2
>     - [  0, 375974,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +8ms
>
> Cheers,
>    Peter
>
