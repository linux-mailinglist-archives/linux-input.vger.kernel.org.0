Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570A5639A01
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 12:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiK0LEV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 06:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiK0LEV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 06:04:21 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF0811829;
        Sun, 27 Nov 2022 03:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1669547051; bh=j5x/YM8Ee+FDaAMjtTqVMDmvqJNc8X54OUCWd4hc4cA=;
        h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
        b=ds7yHmw5KYLe6cXeDK5wyFgfOEiXvRPItGqPvv4U/HmvxUw5QvUyKAlk95RTLfML6
         PZC+nr9LXZpz6fddvIROX6HCN5NIQfA9ykypM7joBrD3qAQmxGIENa/mYckzpp2fGD
         0iPVZsZGlHUpwrxg4Fd/taX/1zBdAV7k70B2TvFrygztMVkZ5mDk5Nddtd1Hx4WbYl
         t4BvWgUsf/0EaOADsllN2RxseWkEHszLz1blCMG/5Iq4+6+355ZdpvN8pub1ZbNMCE
         QOMtGJbcOk9DetGjvuXtjtySszrbR7EWjnuSzHyXXGJ6HGKxitkrd/eXRnasqnuocK
         TLXYjsSdd0Fjg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from 9300 ([93.221.18.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVDW-1pIzGE3OSu-00JpuS; Sun, 27
 Nov 2022 12:04:10 +0100
Date:   Sun, 27 Nov 2022 12:04:09 +0100 (CET)
From:   Andreas Bergmeier <abergmeier@gmx.net>
To:     Andreas Bergmeier <abergmeier@gmx.net>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: Litra Glow on Linux
In-Reply-To: <e6cb795-e8c4-4570-7a7b-3bbd133b98cb@9300>
Message-ID: <5ea1b921-d4b3-403c-64cd-58939571c638@9300>
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com> <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com> <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com> <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com> <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com> <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
 <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com> <CAO-hwJ+PysPKFG=a9+L8vwhiw4uY3F3DZmg4FwgPWGZ7LPt4EA@mail.gmail.com> <2a20d7d1-55df-4861-5cf1-dee19536ed5@9300> <CAO-hwJJDE-8TL2MbTX2xX3RfKEeh8H5h24UkcZJJhH5ptdpRaQ@mail.gmail.com>
 <e6cb795-e8c4-4570-7a7b-3bbd133b98cb@9300>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:rVo0zLsnEub5jUisHHE/8DViIpvORT2yKsvPAPj9cpu4Rt2qWzi
 0h3zwJJ3Z9y0BM0BZN0/Ji3Dz2d1d656QUKSjIOOx+ayKqNai3xua1TqqH6OIHxK4yZTB6w
 eDlnT8TeTWdgWbxlXqmUzcMYsp8tXjb+Q7GwCXw0Hya+XRQdfE0aXELditY+k/ceB+UCfD8
 FkSQMHaGRPF5SnW8UboHA==
UI-OutboundReport: notjunk:1;M01:P0:tcliyAm9XJk=;vtYs//Q6vNXaqYFGze1HXLlM+eN
 e8oVYTjtC4J9nA7AfwvWeXGac9ktzw+yyG9ABkilVsuVgiX65xZrJyD9ssBQdux8MWIZtGSwl
 sosigBqQQwTuSyJenklGIK+XGaXDdBat7UzkiJlD2J0UvR+CCVZ8tFs/2SM+k6DtG7pJmVJJD
 kYmZ0MxV/QBxFITMNC/uhizXYWRwW/QdJyFdJ/ZyAqbQJbams8bxaxpsmzzgtOw/qcheMXxs2
 8/KaBhM9ol8SgkA8gk2E44saIWfszE7O1tebI7cAysiRLw6qQKrfGSScGRBqAMgd9/+nvO+pW
 Lsn+EBsbelGGgzk2KEKDT+W2TkQuixt/YA2kDwJTQYEfWdo4RYkx8R4ZzAxJvAJOnAcpbmEpW
 DyCqgRQlp+U82phYuCZLipy8+Xe6cinc/zfT8PeNZqBstTqZYMdnHrhAPWBciuuQnyXad6WHT
 qwuOxvSGGoT/+dFt4Mrh3Lqh3W6XRy/syyrB65ROqkHYABe0dNinI+J1zcaLIYlCEVQKBTR8A
 8ODuw3V0H/13osPGIU6woDotVOlqkXVsAN7zU+abIHXHuyfoQuO9LKtngIHzk9L4D0NmdHmrW
 T+aViIWFMh7G/2QbPV7e9ZgNOXhJKxlkZFZQho1er2+8Lf1LQDdPD9QOlZ+xUJOnYQLbSOf7r
 odjVdvlTRxTy7Jv9kxzXSrECsJtW+w6fqeVRcFlpzlH7TEuyJOUeVMxaWCrxNEiEARRdxyaKO
 TIAnDvNL7qEADkrYxbagmgdLL542SfarPPif6dYEGbaUEwWwziI2iT510WVZvIC0DL7AOaSqJ
 TXo5YoISaZWOzkqFkC2dvnknoS2YipYA42TNfUg4wGi0FzM0QE/XvJ+SMTaZTjZzY44Y9+3Oe
 fwBYDLH7A4TgXfx8ZOM6QCunaziaBPA/5ouQVdpraQMegt7U86SsgoCIhNz0BGjQy70mXTwvK
 YjYFRQ==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        MALFORMED_FREEMAIL,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Sat, 19 Nov 2022, Andreas Bergmeier wrote:

> So after some tinkering I have code now that succeeds in retrieving stat=
e
> via sending reports once. After that all following sends time out.
> I am at a loss what I am doing wrong, tbh. RFC below.
I noticed that by default hidraw, hiddev and hid-input are loaded for
Glow. Probably because it exposes a Consumer Control page in Reports.
Is it possible that hid-input interferes with hid-logitech-hidpp?
I was trying to disable hid-input using
- HIDPP_QUIRK_NO_HIDINPUT
- hid_ignore_list

For the former it still seems to load hid-input.
For the latter it doesn't seem to load hid-logitech-hidpp.
I couldn't yet untangle all the hid driver indirections and loading.
