Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61092128F5C
	for <lists+linux-input@lfdr.de>; Sun, 22 Dec 2019 19:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfLVSo4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Dec 2019 13:44:56 -0500
Received: from hygieia.sysophe.eu ([138.201.91.14]:33275 "EHLO
        hygieia.sysophe.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfLVSo4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Dec 2019 13:44:56 -0500
X-Greylist: delayed 410 seconds by postgrey-1.27 at vger.kernel.org; Sun, 22 Dec 2019 13:44:55 EST
Received: from hemera.lan.sysophe.eu (unknown [IPv6:2a06:4944:bfe:5600:fa75:a4ff:fe28:fe3a])
        by smtp.sysophe.eu (Postfix) with ESMTPSA id 9717210360441;
        Sun, 22 Dec 2019 19:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sysophe.eu; s=201205;
        t=1577039503; x=1577125903;
        bh=7gBx+VSPddS7vCOze4HplGbV+LwhkjaL63c8//6KUU8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=T0nPyxi4l4eY8Sz5BnuTOgILD5uy2O19/REHKR2sgedyWg3bga7JsA4sLDCO46qu4
         C+hZnfNqm4xy9lkgMGug5RqC9GFgwTcez93WPWDikJ0SBJ4NNLtZCimW8mQqqFOkUg
         YDgcnI11VMeX2bO6bOhsMG2/USGAEClU4ra1aCZI=
Date:   Sun, 22 Dec 2019 19:37:39 +0100
From:   Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@sysophe.eu>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: hid-picolcd: fix possible sleep-in-atomic-context
 bug
Message-ID: <20191222193739.76123ce7@hemera.lan.sysophe.eu>
In-Reply-To: <e36ad913-c498-4d5a-0a5a-bec016d49a16@gmail.com>
References: <20191218080201.2508-1-baijiaju1990@gmail.com>
        <20191218094141.785d8e31@pluto.restena.lu>
        <e36ad913-c498-4d5a-0a5a-bec016d49a16@gmail.com>
X-Mailer: Claws Mail 3.16.0git897 (GTK+ 3.24.11; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jia-Ju,

I've had a deeper look at the code (possibly also applies to hid-lg4ff).


The hdev->ll_driver->request (at least on USB bus which is the only one
that matters for hid-picolcd) points to:
  usbhid_request() from drivers/hid/usbhid/hid-core.c

This one directly calls usbhid_submit_report() which then directly calls
__usbhid_submit_report() under spinlock.

Thus for USB bus there is no possible sleep left.


Just moving the hid_hw_request() calls out of the spinlock is
incorrect though as it would introduce the possibility of unexpected
concurrent initialization/submissions of reports from the distinct
sub-drivers. The report pointer used is not call-private but comes from
feature description and is filled with data on each call within the
spinlock.


The question could be whether the generic fallback in hid_hw_request()
should be adjusted to be non-sleeping.
It has been introduced rather more recently than both drivers you
detected.


Best regards,
Bruno Pr=C3=A9mont

On Wed, 18 Dec 2019 20:11:47 Jia-Ju Bai wrote:
> Thanks for the reply.
>=20
> On 2019/12/18 16:41, Bruno Pr=C3=A9mont wrote:
> > Hi Jia-Ju,
> >
> > Your checker has been looking at fallback implementation for
> > the might-sleep hid_alloc_report_buf(GFP_KERNEL).
> >
> > Did you have a look at the low-lever bus-driver implementations:
> >    hdev->ll_driver->request
> >                     ^^^^^^^
> >
> > Are those all sleeping as well or maybe they don't sleep?\ =20
>=20
> In fact, I find that a function possibly-related to this function=20
> pointer can sleep:
>=20
> drivers/hid/intel-ish-hid/ishtp-hid.c, 97:
>  =C2=A0=C2=A0=C2=A0 kzalloc(GFP_KERNEL) in ishtp_hid_request
>=20
> But I am not quite sure whether this function is really referenced by=20
> the function pointer, so I did not report it.
>=20
>=20
> Best wishes,
> Jia-Ju Bai

