Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471354EC487
	for <lists+linux-input@lfdr.de>; Wed, 30 Mar 2022 14:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344509AbiC3Mly (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Mar 2022 08:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344823AbiC3Mlk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Mar 2022 08:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79396102412
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648643451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EHl9Iys2fNo0cHL3L00P9uLCZVoH7/jMKcSWCaOEXSw=;
        b=UOXDDiVuj0i9l/guftspBTxzVi9XeNC8G6K5ExycSqCUHdG4qMV/+REIXUn5IHbQ3ljDqm
        gg3Ijfp5i8q6aJOZm5f5DvYted0EAyu46BAmsIIuukwPyTj4d1pBFrG9cd7hj//Y9PZk8+
        /VPf6UndkrtBtM+WPKr6vvpSQeumT9E=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-wLzwGvWLMIOotX-NbpDaSg-1; Wed, 30 Mar 2022 08:30:50 -0400
X-MC-Unique: wLzwGvWLMIOotX-NbpDaSg-1
Received: by mail-pf1-f199.google.com with SMTP id x6-20020aa79566000000b004fb3bf117daso6704935pfq.17
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 05:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EHl9Iys2fNo0cHL3L00P9uLCZVoH7/jMKcSWCaOEXSw=;
        b=EnMk9g+6CyhDp5lSBPOQjs6D3AIxoTX5aiLKK+LFwCIVQgK5LlYCtVBVGur4iZq0Lc
         eHgYwsB5ZP2Aw8uKy7lbseZayhG2PCoDm1D1T7Yn5BRgPKvshLhH5bVi0yHOX1QfkR9N
         0MtaYISxaDfhSia8LZUVIq5qvgP6iJC2WSpaHW+DqRm4f3/J6lkUSbuquKJwUNjsB89j
         WXx8bkmdfBLwnAPuDAZTF46XhWTqKjb8i5ZRbqH0ufHfVdTapnEgLJDI6mN3JQUg8gWg
         G+KLyglYAvd6caK5QVxSbZI1ef5savUcDGmgmhV25lCoyiEnNiM1Boe5HudCpaqhCqPS
         incA==
X-Gm-Message-State: AOAM532Isvru+tpRva2NZ/5ilQf8iF0UryPyBKjYZVDml2prvVzMcUR4
        XjirJBjFk3AruncsgYLZUyzNiRj3rZ4+GUzVHPBTeT8gG0N4FMXuwomnB+jC1cFRql2rYgEp4hC
        c97uxG8QvyGIzfop05teQ1q5RbVcOE1pmDSPs/s8=
X-Received: by 2002:a63:416:0:b0:386:66e:33d9 with SMTP id 22-20020a630416000000b00386066e33d9mr6130719pge.146.1648643448672;
        Wed, 30 Mar 2022 05:30:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxekgq7KrEQL6DDoYa2FqMqNPIp9xe0b62gAYQ5LJDPH7bPsfl3FeLlM+UX3hqiOfixrB+XHzDe6gin6hyPK0o=
X-Received: by 2002:a63:416:0:b0:386:66e:33d9 with SMTP id 22-20020a630416000000b00386066e33d9mr6130693pge.146.1648643448387;
 Wed, 30 Mar 2022 05:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220321184404.20025-1-jose.exposito89@gmail.com> <44abc738-1532-63fa-9cd1-2b3870a963bc@leemhuis.info>
In-Reply-To: <44abc738-1532-63fa-9cd1-2b3870a963bc@leemhuis.info>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 30 Mar 2022 14:30:37 +0200
Message-ID: <CAO-hwJJweSuSBE_18ZbvqS12eX9GcS+aJoe7SRFJdASOrN3bqw@mail.gmail.com>
Subject: Re: [PATCH] Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"
To:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>, Takashi Iwai <tiwai@suse.de>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>, regressions@lists.linux.dev,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 30, 2022 at 2:27 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker.
>
> On 21.03.22 19:44, Jos=C3=A9 Exp=C3=B3sito wrote:
> > This reverts commit 37ef4c19b4c659926ce65a7ac709ceaefb211c40.
> >
> > The touchpad present in the Dell Precision 7550 and 7750 laptops
> > reports a HID_DG_BUTTONTYPE of type MT_BUTTONTYPE_CLICKPAD. However,
> > the device is not a clickpad, it is a touchpad with physical buttons.
> >
> > In order to fix this issue, a quirk for the device was introduced in
> > libinput [1] [2] to disable the INPUT_PROP_BUTTONPAD property:
> >
> >       [Precision 7x50 Touchpad]
> >       MatchBus=3Di2c
> >       MatchUdevType=3Dtouchpad
> >       MatchDMIModalias=3Ddmi:*svnDellInc.:pnPrecision7?50*
> >       AttrInputPropDisable=3DINPUT_PROP_BUTTONPAD
> >
> > However, because of the change introduced in 37ef4c19b4 ("Input: clear
> > BTN_RIGHT/MIDDLE on buttonpads") the BTN_RIGHT key bit is not mapped
> > anymore breaking the device right click button and making impossible to
> > workaround it in user space.
> >
> > In order to avoid breakage on other present or future devices, revert
> > the patch causing the issue.
> >
> > Cc: stable@vger.kernel.org
> > Link: https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests=
/481 [1]
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1868789  [2]
> > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> > [...]
>
> Jiri, Benjamin, what the status here? Sure, this is not a crucial
> regression and we are in the middle of the merge window, but it looks
> like nothing has happened for a week now. Or was progress made somewhere
> and I just missed it?

No, I think it just wasn't picked up by the input maintainer yet
(Dmitry, now in CC).

FWIW:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Jos=C3=A9, please do not forget to add the input maintainer when you target
the input tree, not the HID one :)

Cheers,
Benjamin

>
> #regzbot ^backmonitor:
> https://lore.kernel.org/stable/s5htubv32s8.wl-tiwai@suse.de/
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
>
>

