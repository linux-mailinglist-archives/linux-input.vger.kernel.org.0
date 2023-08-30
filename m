Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1CC78DCB7
	for <lists+linux-input@lfdr.de>; Wed, 30 Aug 2023 20:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbjH3Sq3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Aug 2023 14:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245095AbjH3O0W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Aug 2023 10:26:22 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52BD124
        for <linux-input@vger.kernel.org>; Wed, 30 Aug 2023 07:26:18 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-58cd9d9dbf5so12980127b3.0
        for <linux-input@vger.kernel.org>; Wed, 30 Aug 2023 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693405578; x=1694010378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLlVaxy3KfuD5SwetE5WNifV4FNYkcQjKz5YIqSHwgQ=;
        b=FMg/afYywfygfd9FPZ4vrdl1+mHjK3bQQkAy7XrK8P6+66EqjaJdVwbECRe8azsFwH
         HACl5SVK5aY9zJ+aFIis9zZtgVQUg2sdeWcc7aKKfWRE24WeCSblk9/q+YO3d2FXBVtw
         CfOWlRw6C/Ly+rz6zwq+C38rKH6WEKo3THwlM67u1zqbRrFqDSxv3zaSGdTWuKZtkdgt
         +SY6f/E9ZTBJlMmEheTmbMaEuO53h4RbBDGL9J81FozMojy8N2mu/P9/Wi/MtTivb8GO
         AhYlMblVv2QeoSgp1r+h3QEnIDAwSoKwCAYqVQAGUsONNsEPqcVs+AjgOo1wkxVvBuDx
         rzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693405578; x=1694010378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLlVaxy3KfuD5SwetE5WNifV4FNYkcQjKz5YIqSHwgQ=;
        b=akLal7Thw0C2Nl4oSH6ppbot0Xy6r8JEk/QSv7cxC7B+psN0iX/xbR2zhQnFTlyYjl
         ftVEMO7ouKVJMPw+96l+qvOrNIycPlTlzJNNro/uUjj23bOv2WCkIyTRySDbKLqeIh2J
         rOg2a6j8rIWrOLGwK+v3+y8bWQWPWBtDuBtSPiSfFKrqe9o+WJrUS83I6WlL+yWt8KyM
         R/6Ew4/l4F8LCXuKNsIpPU6OQ4BskDKbqurAuxDItAWyEFnZCGQBnDSYec0MDVkbaLBi
         1wXnZuMdph5kfpALsJS5LHxW5h5tiFv7WY1dLArMnAtgaepxbmkCh4mDg9ErGYC7/xYn
         w4XQ==
X-Gm-Message-State: AOJu0Yz151kSu9njwvMqebZskLlqZxQwFNyORum53HpuwgpX6WqeDAwf
        D2RtxhmuLTuEqmTvCkX1KD5mhPy5Db00CvinPZSKx1znGWmQFVkG6hQ=
X-Google-Smtp-Source: AGHT+IGUf8QqADTpwZEdTaNjF8Lvb9rGB6XHTii/qiedK9o1jIuHzIXNKKQXjy5HSeGhfXoKYHBjPNSb7+VJXRQCMto=
X-Received: by 2002:a81:b40a:0:b0:589:a400:a046 with SMTP id
 h10-20020a81b40a000000b00589a400a046mr2247058ywi.14.1693405576575; Wed, 30
 Aug 2023 07:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
 <ZNGdYCXOHRqWnoeT@debian.me> <CANWZPgKAtbNRUy0pyL7Zf-S-zLeMkJZ7fSWpFO8__YG0_e2Zgw@mail.gmail.com>
 <CAHQZ30AhngEgVR-Hcjcze2HyZOG=4fbfp_S2=Or7JUJUUxm4mQ@mail.gmail.com>
 <CANWZPgLcHa2x-Rdy6Hma39p-6E6_5UGUamjPZkKYqz_q0yKJ2g@mail.gmail.com>
 <CANWZPg+C4=U1khLJbvUb0nuDQq+ETULZdQyWDBhFhYN_3Wa=3g@mail.gmail.com>
 <CANWZPgKe6GRUBVyi9Ua0Ns=eQDHT2riSsUZ7gr2nGfXT+jM00w@mail.gmail.com> <a0b8cbf4-a3db-5b05-14ba-297fe24efd52@leemhuis.info>
In-Reply-To: <a0b8cbf4-a3db-5b05-14ba-297fe24efd52@leemhuis.info>
From:   =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= 
        <koalinux@gmail.com>
Date:   Wed, 30 Aug 2023 17:25:40 +0300
Message-ID: <CANWZPgLpgPCFrnQwwzKf-u+Nf21F3bwDxi5pEn+whVu0diO=vg@mail.gmail.com>
Subject: Re: atkbd input regression
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 30 Aug 2023 at 14:06, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
> So strictly speaking all this sounds a lot like this is caused by kernel
> regression that thus should be fixed in the kernel once this was
> bisected (which iirc hasn't happened yet).

    I'm afraid it may be a distro specific problem, if I'm not so mistaken
from the time Gentoo switched its default udev from eudev to systemd
udev, which also explain why I can't rebuild the good kernel nowadays,
test, and have the expected good results, because the new initramfs
will receive a copy of the new systemd udev, and not the former eudev,
and it acts as all my broken kernels in time.

    There is still room to be a kernel issue, since rethinking the issue, t=
he
kernel on early boot does what is expected, it configures the device and
with udev makes it work for the ttys, the problem comes when the wayland
seat comes available, where plasma or wayland needs to advertise the
kernel of the new seat, and the kernel then needs to generate the correct
event to makes udev populate the new information and tags that are
missing when the device doesn't work. This can be either a missing
implementation on Gentoo side because of using systemd udev without
the rest of systemd, or a kernel issue if the kernel is receiving the
information of the new seat and not generating an uevent to udev
to populate the new info. So in short, I may need to revisit this in the
following days.

> OTOH this afaics (please correct me if I'm wrong!) is the first such
> report, so the problem is likely pretty specific or might only occur on
> your system. In that case just looking for some solution for your system
> might be fine.

    There is similar cases in the Gentoo forum that eventually gave up
on Gentoo[1] and made a switch to Fedora to be done with this. I just prefe=
r
to look for a solution to the problem and fix it for everybody. So bear
with it while I dig into the code path that is propagating the seat info to
the kernel and udev.

[1] https://forums.gentoo.org/viewtopic-t-1161962-highlight-serial+keyboard=
.html

    Thanks!

    Jos=C3=A9.
