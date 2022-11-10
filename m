Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98846624253
	for <lists+linux-input@lfdr.de>; Thu, 10 Nov 2022 13:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiKJMZz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Nov 2022 07:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiKJMZm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Nov 2022 07:25:42 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A278782C4E;
        Thu, 10 Nov 2022 04:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668083049; bh=Y/3pD6FUy+ra47umFk7PXDjQfRYYAyaZC3z1OD1CCdA=;
        h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
        b=iob6GufqwOc51GFy7lbGikmwaCqeLF+fskcBVKJ72RxElBbrrczo+5AdEyI9SG50B
         Ur+pGX4a1tDS5glWj6WBYHN4gPw7vnqNbXVVo/CRBdljMtg3OJAUPixgVUL4Zcuv1y
         qXlcMBJeAFcKStxRlp9OXziGKiMYh76stWrW9WzxR3Re+vGPGldn23cMQeAjePK2Og
         ogMLd6PJtn/Dyq7VFnaNWpmbXetP7wnSeLHHdm1sMbaxlP9PArtYwPmVhLiHKQP3Mf
         SF6CmYMJz3sXYdQlnd59p+szJz/Xak0bno86Zk02qwJT8WuGajS5DeX6ytJudItcyk
         yvitqSwKni2lA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from 9300 ([93.221.18.29]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2E1M-1oyu6J0X9y-013g8e; Thu, 10
 Nov 2022 13:24:09 +0100
Date:   Thu, 10 Nov 2022 13:24:08 +0100 (CET)
From:   Andreas Bergmeier <abergmeier@gmx.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     ?Andreas Bergmeier <abergmeier@gmx.net>,
        linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: Litra Glow on Linux
In-Reply-To: <CAO-hwJ+PysPKFG=a9+L8vwhiw4uY3F3DZmg4FwgPWGZ7LPt4EA@mail.gmail.com>
Message-ID: <2a20d7d1-55df-4861-5cf1-dee19536ed5@9300>
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com> <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com> <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com> <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com> <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com> <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
 <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com> <CAO-hwJ+PysPKFG=a9+L8vwhiw4uY3F3DZmg4FwgPWGZ7LPt4EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:vdYEGVUHXgIDoGDcRrU7a+A3Blh96jrzfTH6mSlpPGHmCfeyIYp
 cM5H4aqcr5wC+brVAifCV6rDkHwtWoe7zgzRtCTChbtu+a1ZR/CIzLQ+rrIaCAwovrhPbnQ
 D1/xlzzcuKnKfh5lrPVIDni86GbEFoCSpP5UnFBkmHjYrd2wUKmVpmQOShQd+9g8iXVfix9
 0d+nr0KL53DhupM53HhVw==
UI-OutboundReport: notjunk:1;M01:P0:7Ddeiq5YNYY=;8m9JXgFojJ6jSj3eIxtD12cy/tt
 THVDUR3uqXWxZgT6AkraHGrl7wS6y4eu9JAUI5N9nZLKJQ3Yx/1eMgCxuOOkNpPIefV/BAiYM
 vEO3+QmZjBnP6kn3dTEZ0g9dsp7Iq80mkcvZlRnfWwnzASTYQ8xHuQx4mq4X39bHs6R5g59nC
 XLnpRLOmanarJb/mzAcHclh2TdyTLSUUhuQdF5PRXdFox/XozBczlO+3xTOSvx++m162Ix5Bb
 6UwVvithxUdUq9Sy0ALZSGg+KnShynVQx+3To1fTuRtX3PydW4ad1qRMv86tBB+c99R8PQjQQ
 jXGEbDRsqtLbjeLmFNor2iPjLJBy8Dwa6fIF0xX1+Ggwu4wtZGDTeeqOlgOwYP4/b8YeGLtv4
 FG4/lQa8RjdUxAu/dK8Y+Ckv3+kdojUr1Vtz3iEsrKSAHPyp6HiyMCZpPfmykrhxpJe/tb+Hd
 7UvMe5w6G3GOJi3KGiK+JP2+gbCvRFZyKfDE0mpivJtcCx5mfCuKIy2TaEb5zcCp1bgBFKe16
 w7Rbc+L08yjJMwYUGH1eCWiezJZ7Y4z7JJFjFY3mk319MLtU2KD3LrYjtUb23G4bpGpUkQ0Dz
 PgDQqbqqj1Nj5M62BATXh4i66DdOO5tKmAmAMswvW+y2I4UpKwkOJtbJfa7i+NBa8oo3KpIf/
 ATw7qM4KDiTZBcJV9gbQvLiR9kQIcchjVxxanugvYg55QlMSESmKbBtEwW3XWVzWg5vsEIGoS
 0AM3CHCN7ZqvvBOEERtYABxeKzhmDjR6BNpzvA6n7IZFnH+zDiKF/RqxZU+ZKlZ6xabjXbyL1
 6/rwEyriBbZObfcIQqvI6iOcSksmN/TshXegkZd9vcBgrAWhPZ3IQQmhhXkCH2EESZyX81G+u
 oHyDK/CuiIiRW+H0D0FW4IOwmJbx5LnEdhOLwPa42bEM7Ag9pTReaU3loQcT7HILLCj6wVZMW
 ugTsh0GMrj0PVOadQyILVTRaOEA=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Thu, 10 Nov 2022, Benjamin Tissoires wrote:

> On Thu, Nov 10, 2022 at 4:29 AM Andreas Bergmeier <abergmeier@gmx.net> w=
rote:
> >
> > On Wed, 9 Nov 2022 at 21:27, Andreas Bergmeier <abergmeier@gmx.net> wr=
ote:
> > >
> > > Finally I have an environment where I can test my kernel code.
> > >
> > > On Mon, 31 Oct 2022 at 10:29, Benjamin Tissoires
> > > <benjamin.tissoires@redhat.com> wrote:
> > > > For identifying the GLOW device you should be adding an id in the
> > > > table of hid-logitech-hidpp, with a driver data that tells the dri=
ver
> > > > to look for 0x1990.
> > > >
> > > > >
> > > > > > - you need to add a hook in connect_event to register the led =
class
> > > > > > device that will hook on to the actual LED of the device
> > > Sadly my tests did not go very far. The code fails already when
> > > calling the `probe` callback (`hidpp_probe`).
> > > When it calls into `hidpp_root_get_protocol_version` it seems to
> > > receive `HIDPP_ERROR_RESOURCE_ERROR`.
> > > Which then leads to an error message: Device not connected
> > > Upon looking at `HIDPP_ERROR_RESOURCE_ERROR` (9) there is no
> > > documentation what it means in code.
> > > From a look into the docs it says that 9 is UNSUPPORTED error for 2.=
0
> > > devices. Thus I am wondering how the code knows
> > > that it is a problem with connectivity.
>
> From the top of my memory, this was told to us that this is the way we
> detect if the device was connected or not in the unifying case. Though
> in your case, it's a USB device, so there is no such thing as "not
> connected"...
So isn't the current error handling at a minimum misleading?


> > > Couldn't it also mean that the
> > > device is not supporting getting the protocol version?
>
> Probably. What happens if you comment out that protocol version
> request and force connected to be true?
Well I went the other way around. I had a look at the hidpp utility
sources:
https://github.com/cvuchener/hidpp/blob/057407fbb7248bbc6cefcfaa860758d071=
1c01b9/src/libhidpp/hidpp/Device.cpp#L82
Which seems to do a similar thing. From the top of my head the only
difference seems to be that they are sending `0x1` as a ping value instead
of `0x5a`. Might give that a shot next.
Anyway hidpp-list-features successfully reads the protocol version in
userspace (4, 2) as seen here:
https://github.com/abergmeier/litra_glow_linux/blob/main/hidpp-list-featur=
es

> In your case though, it would be interesting to know if we should
> bypass that verification.
Since reading the protocol version seems generally possible I think we
should understand what logitech-hidpp does wrong first.


> > Also, looking into `supported_reports` turned out to be 2 (very long).
>
> Oops, you mistook the bit definition with the value:
> #define HIDPP_REPORT_SHORT_SUPPORTED  BIT(0)  -> value of 1
> #define HIDPP_REPORT_LONG_SUPPORTED  BIT(1)  -> value of 2
> #define HIDPP_REPORT_VERY_LONG_SUPPORTED  BIT(2)  -> value of 4
Ah indeed, thx.

> And this is expected because you don't have VERY_LONG support on your de=
vice.
True. The question remains whether the upgrade from LONG to VERY_LONG
could be needed should a device only support VERY_LONG.
