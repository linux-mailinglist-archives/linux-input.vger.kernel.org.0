Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E8D623A6C
	for <lists+linux-input@lfdr.de>; Thu, 10 Nov 2022 04:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbiKJD3x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Nov 2022 22:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiKJD3w (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Nov 2022 22:29:52 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B54A1ADBB;
        Wed,  9 Nov 2022 19:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668050988; bh=Dn25TDAi743E2aB7e66zeKUGnRW9bsP67aus5L5K+68=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=dCd99CjqZ6xcEWdrKQHDL3kiuUYPh1AWe51oXb1jyH7fpnjVoiyxCaksv2mfu6d4k
         pCyNc2WJNfwtnIbj6M0CqodozRQe+WsWZol8mxoluXM1DmumO/y+8jt6OtkBQKnnUv
         LJRET+L7/q6Hq8+Puh6PtWZWQuxVJj/ZHpKpqe5Tx8oZWjXpucKZ94+Voe/pALBsxu
         NbgEQkdM8TzmabPsN3HL3c23t2N8xgi10jbBaZoQBuNxqemPgeJTzmVXcRtLyO0G7M
         htnogB2qDRXfqW+ENr6/O2yt832epQpVy8FOkyDcqxYR/QPWgDxG05FtokPAcIYvEv
         66Di4IsIN7J7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f42.google.com ([209.85.218.42]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9nxt-1owXAP1iE9-005t4E; Thu, 10 Nov 2022 04:29:48 +0100
Received: by mail-ej1-f42.google.com with SMTP id q9so2004463ejd.0;
        Wed, 09 Nov 2022 19:29:48 -0800 (PST)
X-Gm-Message-State: ACrzQf3Do5vYwrgumY1fAKh4fo07SeCfJISI08XMkXBM4asyj/vfZM50
        gh0b7mbndpQJnkLvxQOkwNMf1z29+kl6unklvpE=
X-Google-Smtp-Source: AMsMyM4r7FXSGSTWHrkii3EKJv+k8ERelT4VoHJ7mS64++RFsodc+4q07n+wm7wmbterYi20f3BWggwUWV0MYd+wCYw=
X-Received: by 2002:a17:906:40c6:b0:78d:4ba6:f65a with SMTP id
 a6-20020a17090640c600b0078d4ba6f65amr2186907ejk.186.1668050987983; Wed, 09
 Nov 2022 19:29:47 -0800 (PST)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
 <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
 <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com> <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
In-Reply-To: <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Thu, 10 Nov 2022 04:29:35 +0100
X-Gmail-Original-Message-ID: <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com>
Message-ID: <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CduAreEgIvBa5+VcPGZyYTXyphIl1+J2e47s5K9LSBl2nHE2Vg2
 mCfej749CwF+EC08iMNH2vdlF+lyYxnvNehi1Ha709BjFLJAWzEkfBlCMT19FdMqZ3wGWPf
 yjDSsumxwnYyO9+CUOolAaV708GYVM6mWLVeLNNcDCj0hQNFR/NFmDDzVvBajq07i5Ka5kd
 IMbKdFTeJf1U4Li3nwX9A==
UI-OutboundReport: notjunk:1;M01:P0:v2tdjNsKgWY=;JPw36RwZF1SG/33Qkv90/yEeaRd
 SJfuCrWo2ARRh71WRSP+K7oCIze7ryXPE900vM28AvmixVK6a5KUqONEyraYhay2M+98SNhhR
 dM9AcmqkKBz9kyWBr4QKNchwzP1xlhWxgY0TdMSZZSHP/+5pwWgrXnV26PixwCtYxg4Lf6Y3n
 6LYIUqccj7NUtghNlH2Wv6DxIM8RkEC5K540P3sZeBc7NNgH7PAuGx4s6LIWa7XutUo0snj1h
 gFdFLWjpm3gew32vD9nlKooFdyMM+re5A6Dh48EuX8DaiyeLFIHzlR87DgVMO638Mea5jrngO
 oOUZuMdV5CAEDxN42I+4UyqK6Q39K8uj6RX7ACnFa71x8hOgSdkeh63C4uiiIYKP8tKn3GvtJ
 c/gL5pNU+nnPw/v+4Tp/93vnvgKlKFDDAPNvbe9E25eZVu+KbMZEhN6st+gNFe/hAhY1+WFup
 HcjJpxvVpjgWwjje/t1t0P0Jd1yUrZeYzVoP00OUUYw+Zia5Rf/RXAiyRBBwqfMfU0mZqo8tn
 sl44wkDcaDNiS+gXbnV496co5ILXxESrKDenzIMPgkq82mVQtFslDwK5WTCVxwdpBgfAiz4Cv
 sFNo98NtGywPoY4ehM1fXTbOVtr34nz9cDbYtLBiTkowgp5l/rqn6o06cj0XDSnabpVbQXCo8
 6T2jg5b9N1exj/1ZXy912IUV6EcKWQrmFdbrjS8PlxviZRWtD1qVq9Od1YgrmWg1PaayOIn+I
 5CIaRu21bI0MEIWjKS4Fm1MDv9516/gImfiype5hwe3CnTfiwdcG3fQ7FuNdZ0KsL77767Oxg
 IZmRsx3Z3zoQCqWGhdi3XImjeinwr6gP3bPOqBkiOA51lfw9X6gkQAXmFleSWjJRvnRxzVXd6
 vb1slOlPQqsCF7N8BsJhs1FAKM6PbJTTTZ0my1ZhoO4hAaJy0dBlGTbwora+OVEdVNTcTHsuc
 tfHGOzbDbrhvrD+cUtlWMiXQb3c=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 9 Nov 2022 at 21:27, Andreas Bergmeier <abergmeier@gmx.net> wrote:
>
> Finally I have an environment where I can test my kernel code.
>
> On Mon, 31 Oct 2022 at 10:29, Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> > For identifying the GLOW device you should be adding an id in the
> > table of hid-logitech-hidpp, with a driver data that tells the driver
> > to look for 0x1990.
> >
> > >
> > > > - you need to add a hook in connect_event to register the led class
> > > > device that will hook on to the actual LED of the device
> Sadly my tests did not go very far. The code fails already when
> calling the `probe` callback (`hidpp_probe`).
> When it calls into `hidpp_root_get_protocol_version` it seems to
> receive `HIDPP_ERROR_RESOURCE_ERROR`.
> Which then leads to an error message: Device not connected
> Upon looking at `HIDPP_ERROR_RESOURCE_ERROR` (9) there is no
> documentation what it means in code.
> From a look into the docs it says that 9 is UNSUPPORTED error for 2.0
> devices. Thus I am wondering how the code knows
> that it is a problem with connectivity. Couldn't it also mean that the
> device is not supporting getting the protocol version?
> And why is protocol version only enforced for non unifying devices?
Also, looking into `supported_reports` turned out to be 2 (very long).
Inside of `hidpp_root_get_protocol_version` it does upgrade SHORT to
LONG if the former is not supported.
On a whim I then added upgrade of LONG to VERY LONG if the former is
not supported. Sadly, the results stayed the same.
