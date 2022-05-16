Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55070528CD3
	for <lists+linux-input@lfdr.de>; Mon, 16 May 2022 20:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344717AbiEPSYL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 May 2022 14:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344714AbiEPSYK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 May 2022 14:24:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D8D3431935
        for <linux-input@vger.kernel.org>; Mon, 16 May 2022 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652725448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=01ExSbQaG6QIALPWml7ArAwcPbjjq1W1taEWewAln38=;
        b=aaEzOdd5DUIk4f1jzUT3TJR0xnfnqecdJ5xc2kvzsuuaYdi1j+UM0sGSNIihDwEgqgzGxD
        N2nq8nxP3zL1lMQ65BLhDE4KE6gfyYYlARFn5XyZfBDDAw/VDtiyNWMziyh4oh0ivf2Oco
        YvpqJv4pi4yJu9x9VVkPWl+zQc8WBRk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-CblQdrWoMlW6xijurboOJA-1; Mon, 16 May 2022 14:24:07 -0400
X-MC-Unique: CblQdrWoMlW6xijurboOJA-1
Received: by mail-pj1-f69.google.com with SMTP id e1-20020a17090a118100b001df53dfd969so1921457pja.2
        for <linux-input@vger.kernel.org>; Mon, 16 May 2022 11:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01ExSbQaG6QIALPWml7ArAwcPbjjq1W1taEWewAln38=;
        b=7wCrKWIZZ079cRY1TmqlekaBl31YJDxgJZ8ShUckeOQZFC0NfUT6EAertth+veoMWD
         3Adw3Zhnm/ixzKWDUtgHJ51b9u3UeztEucxzUsAGQ+f1D3KVRk3lTfGCsQFUEHTTGGxD
         czE4ZKR0CBU/BmJJuZCpcZMEhkNerNIeR3mB7Ah4TcAsGDxxdLQz/y2VMqkN/RfcD0k+
         5gr+33Lrc2yalo6xalIoE0B75/zp3WSnUs8YiesboMbrqxL1dBbRwrvwkQCQlrJlMDuk
         L0VoBj4u0nf4ggXdp3w8hXfpwXzr8s7bGl0yeEfENLORZDP3P1ki19dvT7e52g4w1Bpz
         44Aw==
X-Gm-Message-State: AOAM531AvC5lvav0biSLMHsX/SX8XHCeVSJQ36U5O3IUlGTWFkhJoTaV
        20o6KibPZ3QPdN+G880yKF+mgcGAHL8g28vSSav/qnSZx4xrzYy5jpQk1+NX0P0GZc0Ksjwx3mj
        eZlWed+qxYlPOyYmemFFprYdPlxuPY7kAMgmUqKY=
X-Received: by 2002:a63:f158:0:b0:3db:8563:e8f5 with SMTP id o24-20020a63f158000000b003db8563e8f5mr16318994pgk.191.1652725446197;
        Mon, 16 May 2022 11:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkuZl8Rv+2k4+VlvjnrLObgGSBS55aFOjT74Z6tve1EBpV7jaR2XyKyRx0wqBjn/BI45ecqmcJN3/CdiCfPlk=
X-Received: by 2002:a63:f158:0:b0:3db:8563:e8f5 with SMTP id
 o24-20020a63f158000000b003db8563e8f5mr16318978pgk.191.1652725445882; Mon, 16
 May 2022 11:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220405183953.2094007-1-pceballos@google.com>
 <nycvar.YFH.7.76.2204210947590.30217@cbobk.fhfr.pm> <CAKdAkRQ7yxFFGJg41UxptxapKiP4bmHsfw7dRNE+LPzs1PRk=A@mail.gmail.com>
 <nycvar.YFH.7.76.2205121252090.28985@cbobk.fhfr.pm> <CAO9JgFwA5ZhwOOY0cU3HpMOV69CTumQ50zEgU6SPNAF0zDbCGg@mail.gmail.com>
 <Yn2OlQAa9I++N80B@penguin>
In-Reply-To: <Yn2OlQAa9I++N80B@penguin>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 16 May 2022 20:23:54 +0200
Message-ID: <CAO-hwJ+Rs=LYseLP7Vvr00vLvm+fTCRdh8pQ-rEduj4izSyiYA@mail.gmail.com>
Subject: Re: [PATCH] HID: Driver for Google Hangouts Meet Speakermic
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pablo Ceballos <pceballos@google.com>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 13, 2022 at 12:48 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, May 12, 2022 at 03:35:00PM -0700, Pablo Ceballos wrote:
> > On Thu, May 12, 2022 at 3:53 AM Jiri Kosina <jikos@kernel.org> wrote:
> > > On Thu, 12 May 2022, Dmitry Torokhov wrote:
> > > > I am curious, could not this be achieved without a kernel driver by
> > > > simply using udev to map this usage code to KEY_RESERVED?
> > >
> > > Hmm, good point, using KEY_RESERVED mapping to achieve the key being
> > > actually ignored didn't immediately occur to me.
> > >
> > > Pablo, could you please verify that it behaves in the expected way, and
> > > confirm that we could drop the 'driver' in favor of udev rule?
> >
> > I think I've achieved the same result by adding the following to udev
> > hwdb. Dmitry, is this what you had in mind, or is there a better way
> > of doing this?
> >
> > evdev:input:b0003v18D1p8001*
> >  KEYBOARD_KEY_b002f=reserved
>
> No, that is exactly what I had in mind, thank you. Please submit this
> entry to upstream systemd/udev project (and we can cherry-pick it into
> our udev as well).
>
> In general I think we should try to avoid trivial "fixup" HID drivers if
> it is possible. I also wondered if we could be supplying fixed-up HID
> descriptors via request_firmware() for HID devices.

Just FYI, in case you haven't noticed it :)
I am currently working on supporting exactly this kind of fixups
through eBPF. I had in the past a request_firmware() patch for wacom
devices, but there were way too much problems raised by that because
you basically need to have the API right from the first attempt.

With eBPF, you can programmatically change the report descriptor for
this particular use case, or you could blindly load a new one. But the
other advantage that eBPF provides is that we can also change the
stream of events to accommodate for device mishaps, like a bouncing
button or garbage in the data.

Greg KH requested that we embed such fixups in the kernels directly,
and so I'm going to try to add that feature too. But we can also have
udev rules in userspace that would fix devices based on the context.
And the long term plan is also to convert existing simple fixup
drivers into eBPF progs that would be shipped by the kernel so we
don't lose functionalities.

Cheers,
Benjamin

>
> Thanks.
>
> --
> Dmitry
>

