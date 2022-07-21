Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 162FE57CE06
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 16:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiGUOph (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 10:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiGUOpg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 10:45:36 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA25A27CF7
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 07:45:35 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id z13so2575538wro.13
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M87+i2xx+h2lHPyR5XSgQKhtWeGWxogY0xblNvmnUYg=;
        b=qAM9bsr6LjkAVh1iPhSnsFGOeDMt0NSDi3LFnSyXi+6rmkZgTfTdrgSpj6l7L7b1IG
         GFWLo4ujG/g/2fL9E7/LEoveisUSFTWiOAa92B7DfkszNWPzWycmiHIfa4C8pZcj3lBq
         3rB3JGN5B+sxPhDvfGaFV7Jgv96QH1SMFBpibUpjWVBQCuB1J3lnuTZ9TqR4dM9zHB18
         tsOCVnVlbJ6NhS0jbBiRLx+sxMcsOLLD4GRJFCKUb15krOQnMft1qOLse9MAgWqtSjtv
         cYWTX21GKWK5WmgbeQPDfMAveUhpXXf74X2fct6T70TKEWb04KLrmhM/7vNpGb/2IoBy
         hN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M87+i2xx+h2lHPyR5XSgQKhtWeGWxogY0xblNvmnUYg=;
        b=s7YYnJA5E/eNJsu1gmxraZ0KuYPfOWRtFhhOcn8gNXq721HSB1yEhvA1BHkAR6lLx0
         HMw20asXXdQKq1Yt5UjFF0I5MiINndKz025fIWD+j4MJPSDlBD8B8o0+GJOw6qwp5Ibn
         Gyw8wsKDYXql9Am3SwzvqFAs0Vl79Bj2jHqVgq0ag7bie64D6uyWGIMDuaD2Mn6Tj2vx
         GqUoZcpojtyQ0oqw4lFxZzXiJwykP4JNMLUxwfGgaVzxOM9NoRjPuWvYKkD25jEf9B2v
         urFEpFsd7XvDW7HINU23wH/x0+mjjmIDvTP4/No8tBO5rM/1pqe1Ea0K3kCNFPWBgnFD
         tDSw==
X-Gm-Message-State: AJIora9nq4L6NKQT6crEflJ2SpmUgOPNWLu+kX0f4gTQIr5XrhYRPsvE
        x1MO3UTqnnSJ/fA7FEjVftI=
X-Google-Smtp-Source: AGRyM1u2dX7Kad2txQ1MoySE9/xkAzjSZ2S6JPKpijAaI4jXm7gN3ZwLIlB0299hA6fkP/FKa4OGrA==
X-Received: by 2002:a05:6000:178a:b0:21d:beeb:7878 with SMTP id e10-20020a056000178a00b0021dbeeb7878mr31838877wrg.708.1658414734025;
        Thu, 21 Jul 2022 07:45:34 -0700 (PDT)
Received: from opensuse.localnet (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
        by smtp.gmail.com with ESMTPSA id k66-20020a1ca145000000b003a2fdde48d1sm2131090wme.25.2022.07.21.07.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 07:45:32 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        syzkaller-bugs@googlegroups.com, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Date:   Thu, 21 Jul 2022 16:45:31 +0200
Message-ID: <8106256.T7Z3S40VBb@opensuse>
In-Reply-To: <bae8fb53-969c-0e92-2e57-f602e4eb848e@I-love.SAKURA.ne.jp>
References: <000000000000ed47a705e2cbd347@google.com> <bae8fb53-969c-0e92-2e57-f602e4eb848e@I-love.SAKURA.ne.jp>
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

On gioved=C3=AC 21 luglio 2022 13:11:44 CEST Tetsuo Handa wrote:
> Hello.
>=20
> syzbot is reporting that iforce_close() from input_close_device() from
> joydev_close_device() from joydev_release() forever sleeps at
>=20
> 	wait_event_interruptible(iforce->wait,
> 			!test_bit(IFORCE_XMIT_RUNNING, iforce-
>xmit_flags));
>=20
> with dev->mutex held, which in turn prevents input_disconnect_device()=20
from
> __input_unregister_device() from input_unregister_device() from
> iforce_usb_disconnect() from setting dev->going_away =3D true.
>=20
> We somehow need to wake up this wait_event_interruptible() in=20
iforce_close()
> if iforce_usb_disconnect() is in progress. But iforce_usb_disconnect()=20
does
> not manipulate flags for waking up this wait_event_interruptible(). How=20
can
> we wake up this wait_event_interruptible()?
>=20
I haven't been following this thread, except reading only this message. It=
=20
may well be I'm saying something which is not suited for solving your=20
problem.

If it can be fixed, as you said, by a simple notification to=20
wait_event_interruptible(), why not changing iforce_usb_disconnect() the=20
following way?

static void iforce_usb_disconnect(struct usb_interface *intf)
{
        struct iforce_usb *iforce_usb =3D usb_get_intfdata(intf);

        usb_set_intfdata(intf, NULL);

        __set_bit(IFORCE_XMIT_RUNNING, iforce_usb->iforce.xmit_flags);
        wake_up(&iforce_usb->iforce.wait);

        input_unregister_device(iforce_usb->iforce.dev);

        usb_free_urb(iforce_usb->irq);
        usb_free_urb(iforce_usb->out);

        kfree(iforce_usb);
}

I am sorry if I'm overlooking anything, especially because I'm entering=20
this thread without reading the other messages and so without knowing the=20
whole context. Furthermore I haven't even test-compiled these changes :-(

Thanks,

=46abio


