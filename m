Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613F057D208
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 18:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbiGUQxm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 12:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbiGUQxl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 12:53:41 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8518BAA5
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 09:53:40 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so3724941wme.0
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=es2QHfUG+gPtBVnpSmILyEScnFcAepnwVg/pNhwhfZc=;
        b=lkyPBqEVucaQEvXzHmAycxcT/d/ZQm5d5OfnYAM080NRtEhiEAdj60KVPJU6roS4rj
         Ee0P8qBoFK4y/PwYYPVHJ6wwA3h9bH9bpZAHbzw1S6LYtWk3jIUbWsyRzyPbmzVzrMKY
         I3lEogd/aDrODCS+yaod3Kgp35hwmRRIKBLoZWdfbThEJjPY/JWWxBjop5x9z33HU0TG
         OZUwjhECcCPnXixYfhcecYiWLI35IOqA324r6HUOz2jdppcchJL79e59XG4svvZsT9aY
         8b6NrzcTWMHq9ni+y5x8YxRVHd5/AsMOYoprAYMCytW/Yz6hk600wkKSTDFsIzSQ/k+A
         n1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=es2QHfUG+gPtBVnpSmILyEScnFcAepnwVg/pNhwhfZc=;
        b=tvp0++xUn9pgNGMJ773hn/qMZxWrNUv4lCAlFtkEi8dJEflE7LkZ5qc7g91HzDdNZF
         sMx/Gu7jmLaBHmz+eUycpaUg3MojRm0+NqZ9KVmZtg+gex0SwT0qIaNbNSsZO1iUD1fq
         YgfJGAapC1ghxrGbomGKaoZhWzxiqtUY8CKyrMVkrHqe5Pf5AnlapChBbJJq2IwdcEUe
         fqNTU1P/7O7EQFMNlKSI1PQTpwDpwP0RqY7bdU9DeYbNDdzJSSMAoD+2m+nCiB1hh/NB
         TQBSSBSs8JTf5VEUxGs0ssUVrbk921XBsHeRPvxEe4JsnXDSHdb+PDo8Mxs6V9NmeZwZ
         FMKw==
X-Gm-Message-State: AJIora/MfCQ9TxAYAk5TGp3r5kXjFypigb7fDzhP0OA75H4bVjIqwi2j
        +SiGOJgxHhSbQn+3Q76DCxw=
X-Google-Smtp-Source: AGRyM1voL/M0L7vCqIk0ekS6BBCiwBO1s0zhPhH0HKUiQEsEbZBsrWpsbm9UafWrcFy6qKbjgi5zLw==
X-Received: by 2002:a05:600c:3b9a:b0:3a3:21c2:e289 with SMTP id n26-20020a05600c3b9a00b003a321c2e289mr9013874wms.77.1658422418773;
        Thu, 21 Jul 2022 09:53:38 -0700 (PDT)
Received: from opensuse.localnet (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
        by smtp.gmail.com with ESMTPSA id i13-20020adff30d000000b0021e4982270asm2506258wro.13.2022.07.21.09.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 09:53:37 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     syzkaller-bugs@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        syzkaller-bugs@googlegroups.com, rydberg@bitmath.org,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Date:   Thu, 21 Jul 2022 18:53:27 +0200
Message-ID: <8095587.T7Z3S40VBb@opensuse>
In-Reply-To: <2bcd5385-2423-2e8f-be01-9db93afaba43@I-love.SAKURA.ne.jp>
References: <000000000000ed47a705e2cbd347@google.com> <8106256.T7Z3S40VBb@opensuse> <2bcd5385-2423-2e8f-be01-9db93afaba43@I-love.SAKURA.ne.jp>
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

On gioved=C3=AC 21 luglio 2022 17:06:26 CEST Tetsuo Handa wrote:
> On 2022/07/21 23:45, Fabio M. De Francesco wrote:
> > If it can be fixed, as you said, by a simple notification to=20
> > wait_event_interruptible(), why not changing iforce_usb_disconnect()=20
the=20
> > following way?
> >=20
> > static void iforce_usb_disconnect(struct usb_interface *intf)
> > {
> >         struct iforce_usb *iforce_usb =3D usb_get_intfdata(intf);
> >=20
> >         usb_set_intfdata(intf, NULL);
> >=20
> >         __set_bit(IFORCE_XMIT_RUNNING, iforce_usb->iforce.xmit_flags);
>=20
> I assume you meant clear_bit() here, for
>=20
> 	wait_event_interruptible(iforce->wait,
> 		!test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags));
>=20
> waits until IFORCE_XMIT_RUNNING bit is cleared.
>=20

Sorry, yes you are correct. I didn't note that negation of test_bit().
However, you understood what I was trying to convey :-)

> However, clear_bit() is racy, for IFORCE_XMIT_RUNNING bit is set by
> iforce_send_packet() at the previous line.

Why not protecting with a mutex, I mean both in iforce_usb_disconnect() and=
=20
soon before calling iforce_send_packet() in iforce_close()?

> >         wake_up(&iforce_usb->iforce.wait);
> >=20
> >         input_unregister_device(iforce_usb->iforce.dev);
> >=20
> >         usb_free_urb(iforce_usb->irq);
> >         usb_free_urb(iforce_usb->out);
> >=20
> >         kfree(iforce_usb);
> > }
> >=20
> > I am sorry if I'm overlooking anything, especially because I'm entering=
=20
> > this thread without reading the other messages and so without knowing=20
the=20
> > whole context. Furthermore I haven't even test-compiled these changes=20
:-(
>=20
> So far, I asked syzbot to test
>=20
> --- a/drivers/input/joystick/iforce/iforce-usb.c
> +++ b/drivers/input/joystick/iforce/iforce-usb.c
> @@ -258,6 +258,9 @@ static void iforce_usb_disconnect(struct=20
usb_interface *intf)
> =20
>  	usb_set_intfdata(intf, NULL);
> =20
> +	usb_poison_urb(iforce_usb->irq);
> +	usb_poison_urb(iforce_usb->out);
> +
>  	input_unregister_device(iforce_usb->iforce.dev);
> =20
>  	usb_free_urb(iforce_usb->irq);
>=20
> which still triggered this problem, and
>=20
> --- a/drivers/input/joystick/iforce/iforce-main.c
> +++ b/drivers/input/joystick/iforce/iforce-main.c
> @@ -200,8 +200,10 @@ static void iforce_close(struct input_dev *dev)
>  		/* Disable force feedback playback */
>  		iforce_send_packet(iforce, FF_CMD_ENABLE, "\001");
>  		/* Wait for the command to complete */
> -		wait_event_interruptible(iforce->wait,
> -			!test_bit(IFORCE_XMIT_RUNNING, iforce-
>xmit_flags));
> +		wait_event_interruptible_timeout
> +			(iforce->wait,
> +			 !test_bit(IFORCE_XMIT_RUNNING, iforce-
>xmit_flags),
> +			 5 * HZ);
>  	}
> =20
>  	iforce->xport_ops->stop_io(iforce);
>=20
> which did not trigger this problem.

It did not clear this problem because of _timeout(), I guess.

If I recall correctly, this task hanged in wait_event_interruptible() and=20
your problem was how to clear that bit and make the task return from=20
wait_event_interruptible(). Correct?

Now you changed this code to return after some time, despite that flag.
Are you sure this is the better suited way to fix this bug?

>=20
> Since wait_event_interruptible() was used here, I think we can expect=20
that
> it is tolerable to continue without waiting for the command to=20
complete...

Ah, yes. Maybe you are right here but I wouldn't bet on what authors=20
thought when they called wait_event_interruptible() :-)

Thanks,

=46abio

> --=20
> You received this message because you are subscribed to the Google Groups=
=20
"syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
=20
email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/
msgid/syzkaller-bugs/2bcd5385-2423-2e8f-be01-9db93afaba43%40I-
love.SAKURA.ne.jp.
>=20




