Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C6B522261
	for <lists+linux-input@lfdr.de>; Tue, 10 May 2022 19:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347972AbiEJR2J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 May 2022 13:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347758AbiEJR2I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 May 2022 13:28:08 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5562426FA46
        for <linux-input@vger.kernel.org>; Tue, 10 May 2022 10:24:10 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id r1so5273999ybo.7
        for <linux-input@vger.kernel.org>; Tue, 10 May 2022 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GIK1UOt8WmLYDY1AK0Oz1b5uyj9+5eAuc5GwQtC1nWY=;
        b=VZBned3XBjqiowZcQKnDmaBPBlw34BoAmkkCy9Ke3ulBp+1YFOM69Jbv925by4qX/O
         pRRiHPNwbbjmwxxGTJkQD8wm4cdbKY0kpqWRi4BOO3rDjpQaD+bn+HfFFyI7w5kQiuZJ
         dCBW/UidOzLlOVQJV27ncwFONTpeNpMxkyVTMk/kTRj72xpEFXkcuMj8o6xmSiU0SPIQ
         8TlOCtwrEncFQfK1wOHJYSFuXEdNuNSJVuZu7hx8I5S4SIKqrMA705/+Pt7b9ddKQ3kE
         mDJJUAHKg0vzIdbXgYBfyImq9ggD5X7aZ4M+syIvrUlJIllAvlvY5oSPWedVDilt2Q/Z
         NOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GIK1UOt8WmLYDY1AK0Oz1b5uyj9+5eAuc5GwQtC1nWY=;
        b=omwwjS9iFo5ZcuS1sCogd2EC0+bet1NWhIasWPCA09/2vA/Jjg+gGkFuTyJdsP7s2u
         KoL7kAeFKcnFlGHVR1l10WXWz3nmaUFABrMa90c6gTOG98IGowOB+xvG8/IM+xtm4Q/I
         JJodorPnZvcZt1Un5+6GROStFisN1fpsJiTueneGWo5c0EcB0mE4sS9NiZCd//MejriW
         bQDdGLIXnPDqbojKQmaOs7BPlwErzuTGCNyJTd7xL5YPvPoNqt43T6IzGMY56PX3xSPM
         ieLWtnvyDDuHl8r3hB4oLRzxCiaf3J09qrjnHdEzYKCW+I6Z+ZNEcFV3mjh+2hmqqcnE
         xeyg==
X-Gm-Message-State: AOAM531JiBtCUBtj+T6nia2LoEeaGhyrfBiDkiHp8zifsB68vwu4bKNg
        u9py3/GbmC3be+kF/sdUfyYtgii6paXfCGVQqIMsQg==
X-Google-Smtp-Source: ABdhPJyYU8a6vpSjZnSsb7QP6GMnUutkDxLXMgzxdxSTHjWu+NG3Z2hQo+bRyJYvPwmy+Nokvx5tjl+pgBoAhX2ynaU=
X-Received: by 2002:a05:6902:1141:b0:649:aa34:3275 with SMTP id
 p1-20020a056902114100b00649aa343275mr19335208ybu.406.1652203449592; Tue, 10
 May 2022 10:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220419122632.2988786-1-acz@semihalf.com> <YmByPhFWkzpPrpYe@google.com>
 <CAB4aORXvVzD4YPC2RdA6pFzSSeLj2oqMpanbGziWkf99WSHGsQ@mail.gmail.com> <CAO-hwJKuDRQOWVyv5eudq8QF1yV=1C-HC0hR-AD5JDOQBw0reA@mail.gmail.com>
In-Reply-To: <CAO-hwJKuDRQOWVyv5eudq8QF1yV=1C-HC0hR-AD5JDOQBw0reA@mail.gmail.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Tue, 10 May 2022 19:23:58 +0200
Message-ID: <CAB4aORX0d0rPhdEV1mqf_EvpO1wnau2KxNroS_9GxbFKx5aw4w@mail.gmail.com>
Subject: Re: [PATCH] HID: add HID device reset callback
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 6, 2022 at 9:08 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Thu, Apr 21, 2022 at 1:23 PM Angela Czubak <acz@semihalf.com> wrote:
> >
> > Hi Dmitry,
> >
> > On Wed, Apr 20, 2022 at 10:51 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Angela,
> > >
> > > On Tue, Apr 19, 2022 at 12:26:32PM +0000, Angela Czubak wrote:
> > > > @@ -529,6 +529,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
> > > >               /* host or device initiated RESET completed */
> > > >               if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
> > > >                       wake_up(&ihid->wait);
> > > > +             if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
> > > > +                     ihid->hid->driver->reset(ihid->hid);
> > >
> > > I wonder if this would not be better to execute the reset callback
> > > first, before signalling that the reset has completed instead of racing
> > > with i2c_hid_hw_reset()?
> > >
> >
> > I think it could result in a deadlock. If we don't clear
> > I2C_HID_RESET_PENDING, and if it has been set, then reset_lock
> > is still taken. This way, if the reset callback wants to send a report
> > to the device, it will keep spinning on reset_lock
> > in i2c_hid_output_raw_report().
> > Since the reset callback will be most likely used to re-configure
> > the device, we need to be able to send any report and not hang
> > on reset_lock.
> > Let me know if you think this not an issue or there is an additional
> > comment needed in the patch so that the reasoning standing
> > by the order of issuing the callback and clearing the bit is clear.
>
> I think you are both correct, and that this patch thus needs some changes:
> - first, I'd like to have one user at least of this reset callback in
> a subsequent patch. Adding one callback without user is just adding
> dead code
ACK, I will send it with a new version of haptic patches.
> - then there are 2 types of reset that probably each need a special treatment:
>   * host initiated resets: those are the ones "racing" with
> i2c_hid_hwreset(), in a sense that this function call might also call
> POWER_ON on some devices, which means we can not immediately do
> transfers to the device with this current code
>   * device initiated resets (when I2C_HID_RESET_PENDING is not set):
> that code is fine in that case, because we have no other entry point
> - there is a third type of resets happening: on probe and resume, so
> maybe there we do not want to call this callback simply because we
> already have probe and reset_resume callbacks.
Now that I look at the code it looks as if the reset callback should
not be able to take reset_lock at all as it will be executed in the
interrupt context.
I am not sure if I understand all of the issue, so here is my plan:
- issue the reset callback only if the I2C_HID_RESET_PENDING bit has
not been set,
- add a comment stating that the callback must not wait/sleep as it
will be called in the interrupt context (any feature reports must be
deferred).
Are there any races left in this scenario? I suppose reset_lock should
be enough to make sure we don't send any feature reports when
i2c_hid_hwreset() is being executed.
>
> Cheers,
> Benjamin
>
> >
> > > Thanks.
> > >
> > > --
> > > Dmitry
> >
>
