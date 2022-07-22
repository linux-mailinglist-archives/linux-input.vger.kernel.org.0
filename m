Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B18E57E722
	for <lists+linux-input@lfdr.de>; Fri, 22 Jul 2022 21:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbiGVTPl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jul 2022 15:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiGVTPk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jul 2022 15:15:40 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD7F25C60
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 12:15:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b26so7770385wrc.2
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 12:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t6WSkL/rKnJ8hldP6ixlYMxiwEi7NAqi0Ur5QaFttHU=;
        b=OwlhhLqMTlMWPGpUzRVg/zDMgrMq2ORQJtA41agqZW/2K2RmQq18PENHXvA3NZt063
         OCCWEikFGULGXAvQk1q8i2WEkeq3OTIN4jsV5vL5E7ZMg+qBV4MS9fBMWO/m8dCS0ICI
         ME2Upx5MadXdTXJGIV/n7pJHf0oxALPYZXJa0RhrOQGkCnR1Xpb46WfLxZhhb5eRO/33
         q2pab1b/AU0RHHKe0Ekn90PjR9aZknu5Bt3pglMJhKFmlw4+eISo37ii9ftiNqjKtmrd
         /iKm9uTmiinNT3XS6s9xeCiN37GTQei2tGaznvHMU65QsRHFdqoFrRWCu9UTQ1yEkIfb
         I0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t6WSkL/rKnJ8hldP6ixlYMxiwEi7NAqi0Ur5QaFttHU=;
        b=X+ONJ0BVXnw7kedjCBR81ByPJ+aE/KLPkS2+zV7wHdZWobVnl/mi2JqbwJL3E1dau9
         7UaYhnP/GX2Jd9wIIJg4lgheZggv1gaCh1XMQyxrqWyFbUX1yU3X1rFEZL9Wbl+aOaJM
         7rkI71MuZT4P6TmfMvN4TAD50de08I6xnWsyTznoqjTsGSJP9wSdATHOU/2261A9aBvy
         fwQBv+Vq/SuHzbzq4sCUwHEEO9gAX+eEwUVsaEqlP5ScSasYAAe7v/6U0M+eC36wlxdN
         YQky4G9C69Cs2uJ0SRTXmxtx8Q9+qdUP1OE4+OwRS4b53NUBVsHrhJeh5gljxbAq/Dat
         bvmg==
X-Gm-Message-State: AJIora8Ff2w3GFxgd8VnFNiwLRmgnh7aR/r6e13AwNXVAz0iOvS1MQrW
        cFEnzsXJ2WdTz2AkwRDfm3o=
X-Google-Smtp-Source: AGRyM1tUvtT/eJEjd3HKRia/AvTgV07um+O1SILxpBfDD3EKdzGbO8xAgZjp144cXIJ3U0PvNJa7Dg==
X-Received: by 2002:a05:6000:1d1:b0:21d:6673:9894 with SMTP id t17-20020a05600001d100b0021d66739894mr885660wrx.640.1658517337279;
        Fri, 22 Jul 2022 12:15:37 -0700 (PDT)
Received: from opensuse.localnet (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
        by smtp.gmail.com with ESMTPSA id r8-20020adfdc88000000b0021e13efa17esm5160978wrj.70.2022.07.22.12.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 12:15:35 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     syzkaller-bugs@googlegroups.com, Johan Hovold <johan@kernel.org>,
        rydberg@bitmath.org,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org, ira.weiny@intel.com
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Date:   Fri, 22 Jul 2022 21:15:34 +0200
Message-ID: <1902535.PYKUYFuaPT@opensuse>
In-Reply-To: <30ccf517-f6b3-fc54-33d0-ffc24ada4b29@I-love.SAKURA.ne.jp>
References: <000000000000ed47a705e2cbd347@google.com> <8095587.T7Z3S40VBb@opensuse> <30ccf517-f6b3-fc54-33d0-ffc24ada4b29@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On venerd=C3=AC 22 luglio 2022 16:39:09 CEST Tetsuo Handa wrote:
> On 2022/07/22 22:53, syzbot wrote:
> > patch:          https://syzkaller.appspot.com/x/patch.diff?
x=3D1141355e080000
>=20
> This patch helps only if iforce_usb_disconnect() is called while waiting=
=20
at
> wait_event_interruptible(iforce->wait, !test_bit(IFORCE_XMIT_RUNNING,=20
iforce->xmit_flags)).
>=20
> It is possible that iforce_usb_disconnect() is called before
> iforce_send_packet(iforce, FF_CMD_ENABLE, "\001") sets=20
IFORCE_XMIT_RUNNING bit.

I haven't spent time looking closely at this driver, I'm also reacting at=20
what you said about to signal the waiter that the flag changed.

=46irst of all, I want to thank you because (1) I see how much time you use=
=20
to spend fixing tons of bugs reported by Syzbot and (2) _you_ made the=20
analysis which easily lead me to this "proof of concept" diff=20
(acknowledgment is due!). =20

I sent this patch for two different reasons:

1) If it passes, and it actually passes tests, I probably go deeper and see=
=20
if it is enough or other things must be considered. You mentioned another=20
case where it cannot work, but I have had no time to see it yet.=20

2) Actually I didn't like that you made a timeout wait. I wanted to "prove"=
=20
that Syzbot tests _can_ pass for a myriad reasons, but this is not a=20
guarantee that a patch is "good".

>=20
> On 2022/07/22 1:53, Fabio M. De Francesco wrote:
> > On gioved=C3=AC 21 luglio 2022 17:06:26 CEST Tetsuo Handa wrote:
> >> On 2022/07/21 23:45, Fabio M. De Francesco wrote:
> >>> If it can be fixed, as you said, by a simple notification to=20
> >>> wait_event_interruptible(), why not changing iforce_usb_disconnect()=
=20
the=20
> >>> following way?
> >>>
> >>> static void iforce_usb_disconnect(struct usb_interface *intf)
> >>> {
> >>>         struct iforce_usb *iforce_usb =3D usb_get_intfdata(intf);
> >>>
> >>>         usb_set_intfdata(intf, NULL);
> >>>
> >>>         __set_bit(IFORCE_XMIT_RUNNING, iforce_usb-
>iforce.xmit_flags);
> >>
> >> I assume you meant clear_bit() here, for
> >>
> >> 	wait_event_interruptible(iforce->wait,
> >> 		!test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags));
> >>
> >> waits until IFORCE_XMIT_RUNNING bit is cleared.
> >>
> >=20
> > Sorry, yes you are correct. I didn't note that negation of test_bit().
> > However, you understood what I was trying to convey :-)
> >=20
> >> However, clear_bit() is racy, for IFORCE_XMIT_RUNNING bit is set by
> >> iforce_send_packet() at the previous line.
> >=20
> > Why not protecting with a mutex, I mean both in iforce_usb_disconnect()=
=20
and=20
> > soon before calling iforce_send_packet() in iforce_close()?
>=20
> Protecting with a mutex does not help. It is possible that=20
clear_bit(IFORCE_XMIT_RUNNING)
> is called before iforce_send_packet() is called.

I'm sorry, you are right. No mutex. In fact you see no mutexes in my patch.

I had misunderstood easily what you said because I had no context. I have=20
not yet all the necessary context to prepare a "real" patch. As said, it=20
was only a "proof of concept".


> >=20
> > It did not trigger this problem because of _timeout(), I guess.
>=20
> Right.

This is not something you should do, since you have much more experience to=
=20
figure out how to fix it properly :-)

> >=20
> > If I recall correctly, this task hanged in wait_event_interruptible()=20
and=20
> > your problem was how to clear that bit and make the task return from=20
> > wait_event_interruptible(). Correct?
>=20
> Not limited to clearing IFORCE_XMIT_RUNNING bit. We could introduce a new
> bit for disconnect event and check both bits at=20
wait_event_interruptible().

It sounds reasonable.

> >> Since wait_event_interruptible() was used here, I think we can expect=
=20
that
> >> it is tolerable to continue without waiting for the command to=20
complete...
> >=20
> > Ah, yes. Maybe you are right here but I wouldn't bet on what authors=20
> > thought when they called wait_event_interruptible() :-)
>=20
> The author who added this wait_event_interruptible() call is Dmitry=20
Torokhov.

I didn't check. For what I saw in other cases, he knows what he does ;)

>=20
>   commit c2b27ef672992a206e5b221b8676972dd840ffa5
>   Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>   Date:   Wed Dec 30 12:18:24 2009 -0800
>=20
>       Input: iforce - wait for command completion when closing the device
>=20
>       We need to wait for the command to disable FF effects to complete=20
before
>       continuing with closing the device.
>=20
>       Tested-by: Johannes Ebke <johannes.ebke@physik.uni-muenchen.de>
>       Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
>=20
> Dmitry, what do you think? Even without iforce_usb_disconnect() race,
> a joystick device not responding for many seconds would be annoying.

Thanks,

=46abio


