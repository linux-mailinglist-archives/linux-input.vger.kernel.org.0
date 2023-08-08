Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA0E774922
	for <lists+linux-input@lfdr.de>; Tue,  8 Aug 2023 21:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjHHTs4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Aug 2023 15:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234770AbjHHSwJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Aug 2023 14:52:09 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92A55DBE8
        for <linux-input@vger.kernel.org>; Tue,  8 Aug 2023 10:05:12 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-56ce156bd37so3729589eaf.3
        for <linux-input@vger.kernel.org>; Tue, 08 Aug 2023 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691514312; x=1692119112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09klJUG3E7m7lMTHPxkNawbEkMYXnC041vOPFpaGyec=;
        b=c6MLPQTZd2L9RxtvYv8l2+KodzWywARKFDn5u6KP3SzpgqQzOd1821QxG9ylfhc47m
         O1Tl9nfu3kp/4Tcv3nYicwkO8TEpaA0+HRvDQABgZHiGaEPNAPI/VnhTg3VZjZ1swYU1
         6vev8t+C6cXjhOmqYp0xoIAX6wlm2enkhqAP2G5vuMcZAVl4wMWBs3Ec2bS9/57R+Hbo
         4VMhne5rU+p96tsZhbvFj8G5YnzuNCGQS/wx3LWAf8KzZURDimE0kp2+bhIi/QrlB5oz
         Vq/0UlZilsAY8uoL38aEfW5MTPeJtbch8qO1V1TGWY2C4bcq6781aaCYkQzx90WegiZK
         W4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514312; x=1692119112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09klJUG3E7m7lMTHPxkNawbEkMYXnC041vOPFpaGyec=;
        b=fQMKqvx1HMSAlYkdN1AFcBjE9wYLP58MvrZtMBAyjxNTnn0KPFM9ANbhbJkCSr29JA
         ynlLK4E/UtYozA//B5i+rzrlJ1UhyQiRGyzlTsI5muke3RykkVs1wHtgNR9wyvOND8go
         VujB17c0U81dCdNoEcnaOpjvjLDhmEFVTg7IvITL+1P/vWwzP2hxm0yZROF8PszjTdlr
         d1sq9KySK9GLxMKD2QQG2/bwUZypxMEtelicP5XrxFnAOPloCjjWoKhAXQvSjDSCSIj+
         wl6SeCfuQFng7jC0DFkp4tweZjVHvBNWLvAYe6A4dxYRFH3BWTycxjJLgLbnnnsxRne7
         Ms+A==
X-Gm-Message-State: AOJu0YyOH7+/Mc6U3HIUhdkROXBwGJ7O3Ps5DPysgMGtSsQDkrhhA0Fg
        B575YSKLDVsJB2dhM/RvuXhrmj5qwXk6PG9E25uJvqgrxNzMpzD77kI=
X-Google-Smtp-Source: AGHT+IHlFLAeyv78YVYnq1ySVnVkxYkbJrCQSKBgHmGWKUUsTThVMRgiG15Q+zST67zlAt4VNOFqtAtDE1owyOCFMI8=
X-Received: by 2002:a0d:e647:0:b0:577:a46:26e5 with SMTP id
 p68-20020a0de647000000b005770a4626e5mr10443409ywe.31.1691474058453; Mon, 07
 Aug 2023 22:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
 <a65bd290-52d5-475c-0234-85759c5892a2@leemhuis.info>
In-Reply-To: <a65bd290-52d5-475c-0234-85759c5892a2@leemhuis.info>
From:   =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= 
        <koalinux@gmail.com>
Date:   Tue, 8 Aug 2023 08:53:49 +0300
Message-ID: <CANWZPgLxq+G9+ytvLNoyVJqZGncBsPbj6PbjwgwYb-wPCFvARQ@mail.gmail.com>
Subject: Re: atkbd input regression
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 7 Aug 2023 at 10:53, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 07.08.23 07:19, Jos=C3=A9 Ram=C3=B3n Mu=C3=B1oz Pekkarinen wrote:
> >     Sorry again, now in plaintext mode.
> >
> >     Hi,
> >
> >     I'd like to seek help or advise in a possible
> > regression that I detected on my system(a
> > Thinkpad L14 Gen 1) that concerns the atkbd
> > module. My OS is a gentoo, with self built
> > kernels, and a plasma desktop environment
> > using wayland. Up to the kernel 5.16.x my
> > builtin keyboard worked(and works still)
> > fine both in tty and the plasma session, but
> > from that kernel on, the keyboard works only
> > in tty, and no longer in the plasma session.
>
> Could you try bisecting this? A few howtos on the net describe what to
> do. Be sure to use the configuration for your working 5.16 kernel for
> any builds of newer versions (ideally put it <somewhere> and run "cp
> <somewhere> .config; make oldconfig" every time before building a newer
> kernel.

    I'm afraid I run into unexpected results, since rebuilding the
same version of the kernel that works resulted in a non working
keyboard for my kernel 5.16 also, and I needed to recover the
former build from some backup. This make me think the problem
could be somewhere else.

    Thanks!

    Jos=C3=A9
