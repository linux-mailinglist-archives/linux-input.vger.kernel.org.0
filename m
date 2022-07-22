Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4470457E759
	for <lists+linux-input@lfdr.de>; Fri, 22 Jul 2022 21:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235994AbiGVTZk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jul 2022 15:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236314AbiGVTZh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jul 2022 15:25:37 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEBC25598
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 12:25:32 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id b26so7799115wrc.2
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31icxWnyu/VKziMVqt/l8OwisKA+WLpqBHRzvmlVV+I=;
        b=U8rVukXquHh0a6DJvfBItyI9P/FQDFtzFbqhOM3XUor3yifeawbC12PQacWwlUQ8XW
         bHZWqgTbfa0tTW68t0V+xLA8Or9tNiZPFWfzCybbrsE4OVxNzk36o3sqwL31apd+XATs
         YBwSY8D6Tk8rRonHm/ZCbOIJNwxgmXMxudI/928jhHEihjRf709j6/yiEoCMdH625pgR
         QkOdkR71gEZ1x87G6wZGw+7vit9VslMYWn3RXZDwK+F0WY1DG49elESDCebZ1nWDWpnF
         zW8lLItBI7zUOaCsHYP5nmqq20MaIncnLtTYFr/uWo3iB8ccKmh5LZnZihp5nYrRxSf6
         M+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31icxWnyu/VKziMVqt/l8OwisKA+WLpqBHRzvmlVV+I=;
        b=N7KjgAnYKpzG6m0r20F4jCvQWByzGnnfykWajTnPWR8G5kQAdXowHLa6MIPKRfeQjb
         CWmJBJEOIp7CVABOes1NNpVNaQgtmTlfz0cq5YcTMMlPgM6eGNJ80fiDVUn1D7Hat8Xy
         wKKc9u3BIPEKwLPmIGBWsSqUcSIVx2Auy9+pVCQ9bne6wLuRkuBVTs+Dd6iPBvmNY8CU
         y7Uti6cjz9Hkkc5DNSFMgptweqAYYK761YJYjDTP5aijOTQX4ZysbA8Kc9N4f0SAB/1a
         JcZPCZO3cJosTzm1IPHLcodOsYtw9xK8Ac5fvVgiBvFPgcD46N4lb9ZxMx6xyZ1vdQo7
         O47w==
X-Gm-Message-State: AJIora99hqpx0m4eDHnlsHJ0uSO94UheAwLXXQisPtLuKUlbSzX+Yh+0
        FnqkKWfaEPTighCzRModvwI=
X-Google-Smtp-Source: AGRyM1uy3wUCAkQoxOoJsKjtpx8AoPjFOaHoM9NIKhSVyAU2kgpMWYgsDhQP0EZW7G4f/OfUmbpVdQ==
X-Received: by 2002:adf:f8ca:0:b0:21e:40f3:4f5c with SMTP id f10-20020adff8ca000000b0021e40f34f5cmr915526wrq.618.1658517931108;
        Fri, 22 Jul 2022 12:25:31 -0700 (PDT)
Received: from opensuse.localnet (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d40d1000000b0021d6dad334bsm5219927wrq.4.2022.07.22.12.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 12:25:29 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        syzkaller-bugs@googlegroups.com, Johan Hovold <johan@kernel.org>,
        rydberg@bitmath.org,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org, ira.weiny@intel.com
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Date:   Fri, 22 Jul 2022 21:25:28 +0200
Message-ID: <12025973.O9o76ZdvQC@opensuse>
In-Reply-To: <1902535.PYKUYFuaPT@opensuse>
References: <000000000000ed47a705e2cbd347@google.com> <30ccf517-f6b3-fc54-33d0-ffc24ada4b29@I-love.SAKURA.ne.jp> <1902535.PYKUYFuaPT@opensuse>
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

On venerd=C3=AC 22 luglio 2022 21:15:34 CEST Fabio M. De Francesco wrote:
> On venerd=C3=AC 22 luglio 2022 16:39:09 CEST Tetsuo Handa wrote:
> > On 2022/07/22 22:53, syzbot wrote:
> > > patch:          https://syzkaller.appspot.com/x/patch.diff?
> x=3D1141355e080000
> >=20
> > This patch helps only if iforce_usb_disconnect() is called while=20
waiting=20
> at
> > wait_event_interruptible(iforce->wait, !test_bit(IFORCE_XMIT_RUNNING,=20
> iforce->xmit_flags)).
> >=20
> > It is possible that iforce_usb_disconnect() is called before
> > iforce_send_packet(iforce, FF_CMD_ENABLE, "\001") sets=20
> IFORCE_XMIT_RUNNING bit.
>=20
> I haven't spent time looking closely at this driver, I'm also reacting at=
=20

Sorry, please delete that spurious "also". Perhaps I wanted to write=20
"only".

Thanks,

=46abio

> what you said about to signal the waiter that the flag changed.
=20




