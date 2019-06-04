Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B74AD34237
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 10:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfFDIxZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 04:53:25 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41904 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfFDIxZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jun 2019 04:53:25 -0400
Received: by mail-qt1-f193.google.com with SMTP id s57so5676778qte.8
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2019 01:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sVr7blrSWK0UByMgK8SdANdy6UgQTdw57Gh17vSspak=;
        b=tc2t1HFAEvBAlqMWJzJU+1jhXwojlnC6kNNXEevDmvoE977wesDYhSsE3AGYy9Rijf
         Sc8XN/Dd+iYG9O4EG7utG9q4vJ8bI2ULJH77br0prWXeU7WAHn8YP5alVfdVHYANUs8m
         s7/qZboiPDi67YEOOOV4M71hSbHX/PcV4krRy+aT5TQBn4NOY7qWeIknXCk+elTsNBXN
         rEP1WZdzDj3i6hq9Nudq5oSBgnQxlA8ysS48R3y3k9Vj5hC1300aQQoSbY7mFlUosbI4
         37WzLrMmeYX2cPtsu3MdjQofaKgpddDeZyxIPfO9o7qSyIs0nGnm0rbGxzReVFDHhead
         JOiQ==
X-Gm-Message-State: APjAAAWAfl4dRYKmV83aBtRRi+7PYypujyhLdQY7ePq4woOcYi7T0Dsa
        cBJWiGfaJtu4HwG5c8bkBI36yuiarUlgTBsBvPJ+/A==
X-Google-Smtp-Source: APXvYqwcmdQn7jDdAX4WgObYwtS3WxheoXf60Q29VNVzRPMwaGTHOaSlfLpwLzwB163jQdXsgkYWrER3QOHoHJmUpZk=
X-Received: by 2002:ac8:2998:: with SMTP id 24mr26315694qts.31.1559638404643;
 Tue, 04 Jun 2019 01:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
 <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm> <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com>
 <8a17e6e2-b468-28fd-5b40-0c258ca7efa9@intel.com> <4689a737-6c40-b4ae-cc38-5df60318adce@redhat.com>
 <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com> <nycvar.YFH.7.76.1906010014150.1962@cbobk.fhfr.pm>
 <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com> <5471f010-cb42-c548-37e2-2b9c9eba1184@redhat.com>
 <CAO-hwJKRRpsShw6B-YLmsEnjQ+iYtz+VmZK+VSRcDmiBwnS+oA@mail.gmail.com>
 <e431dafc-0fb4-4be3-ac29-dcf125929090@redhat.com> <CAO-hwJ+5UYJMnuCS0UL4g45Xc181LraAzc-CMuYB2rcqKGe_Sw@mail.gmail.com>
 <4548d196-b75f-c4d0-8f3c-3e734b9a758c@redhat.com> <c05929f4-00b6-e098-cd69-cd6539ccd3f1@redhat.com>
In-Reply-To: <c05929f4-00b6-e098-cd69-cd6539ccd3f1@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 Jun 2019 10:53:12 +0200
Message-ID: <CAO-hwJJWWRf8cCLCB3JdfFGCGPnp9ar9HC_QAg7crJ0y+pA-hg@mail.gmail.com>
Subject: Re: hid-related 5.2-rc1 boot hang
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 4, 2019 at 10:36 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 04-06-19 10:05, Hans de Goede wrote:
>
> <snip>
>
> >>>> We should likely just remove c52f from the list of supported devices.
> >>>> C52f receivers seem to have a different firmware as they are meant to
> >>>> work with different devices than C534. So I guess it is safer to not
> >>>> handle those right now and get the code in when it is ready.
> >>>
> >>> Ack. Can you prepare a patch to drop the c52f id?
> >>
> >> Yes. I have an other revert never submitted that I need to push, so I
> >> guess I can do a revert session today.
> >>
> >> I think I'll also buy one device with hopefully the C52F receiver as
> >> the report descriptors attached in
> >> https://bugzilla.kernel.org/show_bug.cgi?id=203619 seems different to
> >> what I would have expected.
> >
> > They are actually what I expected :)
> >
> > The first USB interface is a mouse boot class device, since this is a mouse
> > only receiver. This means that the mouse report is unnumbered and we need to
> > extend the unnumbered mouse-report handling to handle this case. Also the
> > device is using the same highres mouse-reports as the gaming receiver is.
> >
> > I'm actually preparing a patch right now which should fix this. Still might
> > be better to do the revert for 5.2 and get proper support for the c52f
> > receiver into 5.3.
>
> I've attached a patch to the bug:
> https://bugzilla.kernel.org/show_bug.cgi?id=203619

Cool, thanks.

>
> Which should fix this. It is quite simple and safe, so if we get testing
> feedback relatively soon, we could go with the fix instead of dropping the
> product-id, your call.

I should receive the M280 tomorrow, hopefully with the C52F. If the
receiver is correct and the tests are successful, I'd prefer to take
this one over the revert :)

Cheers,
Benjamin
