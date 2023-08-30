Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCF878DCBD
	for <lists+linux-input@lfdr.de>; Wed, 30 Aug 2023 20:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbjH3Sqf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Aug 2023 14:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243465AbjH3LGN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Aug 2023 07:06:13 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592A71BF
        for <linux-input@vger.kernel.org>; Wed, 30 Aug 2023 04:06:10 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qbJ1U-00089x-JT; Wed, 30 Aug 2023 13:06:08 +0200
Message-ID: <a0b8cbf4-a3db-5b05-14ba-297fe24efd52@leemhuis.info>
Date:   Wed, 30 Aug 2023 13:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: atkbd input regression
Content-Language: en-US, de-DE
To:     =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= 
        <koalinux@gmail.com>, linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        Linux Regressions <regressions@lists.linux.dev>
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
 <ZNGdYCXOHRqWnoeT@debian.me>
 <CANWZPgKAtbNRUy0pyL7Zf-S-zLeMkJZ7fSWpFO8__YG0_e2Zgw@mail.gmail.com>
 <CAHQZ30AhngEgVR-Hcjcze2HyZOG=4fbfp_S2=Or7JUJUUxm4mQ@mail.gmail.com>
 <CANWZPgLcHa2x-Rdy6Hma39p-6E6_5UGUamjPZkKYqz_q0yKJ2g@mail.gmail.com>
 <CANWZPg+C4=U1khLJbvUb0nuDQq+ETULZdQyWDBhFhYN_3Wa=3g@mail.gmail.com>
 <CANWZPgKe6GRUBVyi9Ua0Ns=eQDHT2riSsUZ7gr2nGfXT+jM00w@mail.gmail.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CANWZPgKe6GRUBVyi9Ua0Ns=eQDHT2riSsUZ7gr2nGfXT+jM00w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693393570;9f16f6e4;
X-HE-SMSGID: 1qbJ1U-00089x-JT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28.08.23 10:53, José Ramón Muñoz Pekkarinen wrote:
> On Sun, 27 Aug 2023 at 18:59, José Ramón Muñoz Pekkarinen
> <koalinux@gmail.com> wrote:
>>>
>>>     Excuse the long wait, I've been investigating with the kde community
>>> and reading the code of libinput, systemd and the like, and I managed to
>>> find a difference that I'm not quite sure it is relevant to narrow the issue.
>>> While the keyboard is populated in the udev database as this:
>>>
>>> $ udevadm info -e
>>> P: /devices/platform/i8042/serio0/input/input0
>>> M: input0
>>> R: 0
>>> U: input
>>> E: DEVPATH=/devices/platform/i8042/serio0/input/input0
>>> E: SUBSYSTEM=input
>>> E: PRODUCT=11/1/1/ab54
>>> E: NAME="AT Translated Set 2 keyboard"
>>> E: PHYS="isa0060/serio0/input0"
>>> E: PROP=0
>>> E: EV=120013
>>> E: KEY=402000000 3803078f800d001 feffffdfffefffff fffffffffffffffe
>>> E: MSC=10
>>> E: LED=7
>>> E: MODALIAS=input:b0011v0001p0001eAB54-e0,1,4,11,14,k71,72,73,74,75,76,77,79,7A,7B,7C,7D,7E,7F,80,8C,8E,8F,9B,9C,9D,9E,9F,A3,A4,A5,A6,AC,AD,B7,B8,B9,D9,E2,ram4,l0,1,2,sfw
>>>
>>>     There is no longer a corresponding entry under /run/udev/data,
>>> the following is the output of the ls -la /run/udev/data on 6.4.12:
>>>
>>> total 116
>>> [...]
>>>
>>>     To what I read, having it in the db either populated
>>> by the file under /run/udev/data, or populated from sysfs
>>> should be enough, but for some reason, it seems systemd
>>> and libudev expects the file under this folder.
>
>     I found that according to some early output on udev, the problem
> maybe that Gentoo is triggering the device discovery before the
> kernel is having multiple uevent files available. Retriggering the
> device discovery on a later stage makes the discovery of the
> devices work correctly and I can use the devices as in former
> kernels. The command to do so is:
> 
> # udevadm trigger --type=devices --action=add
> 
>     Is this something that can be improved from kernel end or should
> I just look for some solution on Gentoo side to delay that trigger and
> be done with it?

So strictly speaking all this sounds a lot like this is caused by kernel
regression that thus should be fixed in the kernel once this was
bisected (which iirc hasn't happened yet).

OTOH this afaics (please correct me if I'm wrong!) is the first such
report, so the problem is likely pretty specific or might only occur on
your system. In that case just looking for some solution for your system
might be fine.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
