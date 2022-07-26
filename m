Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35883580A82
	for <lists+linux-input@lfdr.de>; Tue, 26 Jul 2022 06:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiGZEkO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jul 2022 00:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiGZEkN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jul 2022 00:40:13 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4861030
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 21:40:11 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id w8-20020a05600c014800b003a32e89bc4eso7443634wmm.5
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 21:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wmrjJHdmyXVJlkbkAFdyDw0qE2kp09/60f80WozTcs4=;
        b=SALKUKmcCNfvDet9aGNOli5f3SDjWNfuDGmcYewuxRI51VeAdt84mwJz1oQhocRjWS
         KkKIB9bJZjgzYgmjmiF858DyS+20+7R3h5q3pqZDrJBpXsWyi4Va5bJpvZOGz44gXwLp
         kz31pA9oCwfkal26m90GTGeqdTBUwvlg6vXfToBX/M8wGAu63J70woqkiGHK10rjCWO8
         Up6sxpH/pRCvfB+CRk8jNmqUL2hDye6qt+BOf7K6SXbCG/v6QtSxdtr2MC8DeY5nnVAd
         +yBRT26HaCsSHoYQ0nip9FG9J47sl64kV5QzgNkK00J7qkoK6TJHpJ8zqf+IyF70HNSY
         hvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wmrjJHdmyXVJlkbkAFdyDw0qE2kp09/60f80WozTcs4=;
        b=o9hGCdHyn3z+swk9EA997cmiCbeulJYgIInotfRu9UcbspUEAxTDd8AHKGef3VS5KE
         Ksizf9in78/yS5qwERVAxo1QItvwbnP1bPe803P3FdT8Hy11fWV//QSaUD5k89pR+RZO
         Ng+Ytw+GiOb+a/XBFKtp0yxWXc/n6tYXnK8KbuzbDeyWNngTgCYjhuWsjm+WxanTmCDh
         brHN4R4jBUhCwKBnjk2XKjUNdtl/3iiN2DVB7m2hvQrHP/iZQUir+iU5Rl281qfzU2RI
         /9dca8tC7qgNTNAskGYzmd4n8CUcVlq+Ul9J09ui1cXT5X1wdyE6tNqx/aAXPaASL7aA
         OOew==
X-Gm-Message-State: AJIora9zK57oZ3+pzqsi7s3YMtMSfozX2C0vQ3jBWk0jhUZ5TIZFFuMm
        RY7o0mmQT/LlSqe+fCThDzw=
X-Google-Smtp-Source: AGRyM1vTNRC/qBCuNBINMFzd2Mx1s4jA4VXCUgJjk5iRAGJjCGPqpShDqZNmiOiSKqMMbfie8/GwXg==
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id o21-20020a05600c4fd500b003a346646d55mr10845931wmq.73.1658810409797;
        Mon, 25 Jul 2022 21:40:09 -0700 (PDT)
Received: from opensuse.localnet (host-79-56-6-250.retail.telecomitalia.it. [79.56.6.250])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c510f00b003a30fbde91dsm22331981wms.20.2022.07.25.21.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 21:40:08 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        syzkaller-bugs@googlegroups.com, Johan Hovold <johan@kernel.org>,
        rydberg@bitmath.org,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org, ira.weiny@intel.com
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Date:   Tue, 26 Jul 2022 06:40:04 +0200
Message-ID: <3180606.aeNJFYEL58@opensuse>
In-Reply-To: <f23c165c-3f2b-e802-21ce-70eef22ebe31@I-love.SAKURA.ne.jp>
References: <000000000000ed47a705e2cbd347@google.com> <03fda856-2c47-b8a4-908c-16e942678250@I-love.SAKURA.ne.jp> <f23c165c-3f2b-e802-21ce-70eef22ebe31@I-love.SAKURA.ne.jp>
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

On marted=C3=AC 26 luglio 2022 05:53:36 CEST Tetsuo Handa wrote:
> On 2022/07/23 4:15, Fabio M. De Francesco wrote:
> > I had misunderstood easily what you said because I had no context. I=20
have=20
> > not yet all the necessary context to prepare a "real" patch. As said,=20
it=20
> > was only a "proof of concept".
>=20
> Well, it seems that the cause of this problem is nothing but lack of=20
wake_up()
> after clear_bit(). Debug printk() patch shown below says that=20
iforce_usb_out()
>  from interrupt context hit "urb->status -71, exiting" when=20
iforce_close()
>  from process context was in progress.
>=20

Thanks to keep on working on this issue. As said, that _timeout() was not=20
good and the wake ups (better, wake_up_all()) were exactly what you needed.=
  =20
Now you have all the necessary information to send a real patch :-)

Thanks,

=46abio

> [  491.314788][ T2962] iforce_close(ffff88807e6b8000) start
> [  491.316393][   T14] usb 1-1: USB disconnect, device number 117
> [  491.320453][ T2962] iforce_send_packet(ffff88807e6b8000) start
> [  491.326488][    C0] iforce 1-1:0.0: urb->status -71, exiting
> [  491.327471][   T14] iforce_usb_disconnect(ffff88807e6b8000) start
> [  491.335041][ T2962] iforce_send_packet(ffff88807e6b8000)=3D0
> [  491.351266][ T2962] wait_event_interruptible(ffff88807e6b8000) end
> [  491.357778][ T2962] iforce_close(ffff88807e6b8000) end
> [  491.366421][   T14] input_unregister_device(ffff88807e6b8000) end
> [  491.372939][   T14] iforce_usb_disconnect(ffff88807e6b8000) end
>=20
> On 2022/07/26 12:08, syzbot wrote:
> > Hello,
> >=20
> > syzbot has tested the proposed patch and the reproducer did not trigger=
=20
any issue:
> >=20
> > Reported-and-tested-by:=20
syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com
> >=20
> > Tested on:
> >=20
> > commit:         e0dccc3b Linux 5.19-rc8
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?
x=3D15e470de080000
> > kernel config:  https://syzkaller.appspot.com/x/.config?
x=3D26034e6fe0075dad
> > dashboard link: https://syzkaller.appspot.com/bug?
extid=3Ddeb6abc36aad4008f407
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU=20
Binutils for Debian) 2.35.2
> > patch:          https://syzkaller.appspot.com/x/patch.diff?
x=3D14b307f6080000
> >=20
> > Note: testing is done by a robot and is best-effort only.
>=20




