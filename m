Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 246C4343B4
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 12:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfFDKIN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 06:08:13 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36582 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfFDKIN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jun 2019 06:08:13 -0400
Received: by mail-qt1-f193.google.com with SMTP id u12so13042375qth.3
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2019 03:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nv9RCGdqeXyo/YOKhXPY6nJglJbRUxkUzDCDcIP2Gh8=;
        b=qBEp7wiuQKwnlTqRE5DV4TGI6AZfY8oz/cys4PeqSieo5O1VtnNBvvaqiIGaRAFX51
         36Yt6kmrYKrOIqn47bhsykxTzwtc2kdflaH1ZOWHjjfgegD/ex1AOAC/mX4PD9I79Fyv
         tM8hvQn8AD5tzVbQmekCM7jF2UGEdD1KanusSKFCUleB7pJrVwka8jj/ecg/xv4dmdeA
         qJl4fOOFi8uzLIFSkMcCplDihR797Oi35QhaVaBEVVUgYDV2H7Z1nMqq8CfNYihpQUTw
         OsJKNj64Lpe+vPHU2ch1ZVz7+i82aZWF8hm61d1+0Q1L9XODydT7SuhusBHi3moo1xEj
         JVBw==
X-Gm-Message-State: APjAAAVj+VhkZ+gTyxkrMk/iyq9swwFOjg1s2T7jR8PsG+MM+I0hBkch
        ixHmyiKxlNHOeYB6Q2PB6idioZH2G9MC432Anfupzw==
X-Google-Smtp-Source: APXvYqwi0t2B9beN/ICWcGuIRIlw8oU0ffO7szjab4Wkf3tbHWkJU4VvhT02kbVrLBRt3JTBOIWRMNsY05IfaR1oXAo=
X-Received: by 2002:a0c:fde5:: with SMTP id m5mr7141286qvu.192.1559642892743;
 Tue, 04 Jun 2019 03:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
 <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm> <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com>
 <8a17e6e2-b468-28fd-5b40-0c258ca7efa9@intel.com> <4689a737-6c40-b4ae-cc38-5df60318adce@redhat.com>
 <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com> <nycvar.YFH.7.76.1906010014150.1962@cbobk.fhfr.pm>
 <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com> <5471f010-cb42-c548-37e2-2b9c9eba1184@redhat.com>
 <CAO-hwJKRRpsShw6B-YLmsEnjQ+iYtz+VmZK+VSRcDmiBwnS+oA@mail.gmail.com>
 <e431dafc-0fb4-4be3-ac29-dcf125929090@redhat.com> <CAO-hwJ+5UYJMnuCS0UL4g45Xc181LraAzc-CMuYB2rcqKGe_Sw@mail.gmail.com>
In-Reply-To: <CAO-hwJ+5UYJMnuCS0UL4g45Xc181LraAzc-CMuYB2rcqKGe_Sw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 Jun 2019 12:08:00 +0200
Message-ID: <CAO-hwJK0j8SottiqCdDseBW_vR=GjKO4YrFCtjzYeUh-eKPOpA@mail.gmail.com>
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

On Tue, Jun 4, 2019 at 9:51 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Mon, Jun 3, 2019 at 4:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 03-06-19 15:55, Benjamin Tissoires wrote:
> > > On Mon, Jun 3, 2019 at 11:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
> > >>
> > >> Hi Again,
> > >>
> > >> On 03-06-19 11:11, Hans de Goede wrote:
> > >> <snip>
> > >>
> > >>>> not sure about the rest of logitech issues yet) next week.
> > >>>
> > >>> The main problem seems to be the request_module patches. Although I also
> > >
> > > Can't we use request_module_nowait() instead, and set a reasonable
> > > timeout that we detect only once to check if userspace is compatible:
> > >
> > > In pseudo-code:
> > > if (!request_module_checked) {
> > >    request_module_nowait(name);
> > >    use_request_module = wait_event_timeout(wq,
> > >          first_module_loaded, 10 seconds in jiffies);
> > >    request_module_checked = true;
> > > } else if (use_request_module) {
> > >    request_module(name);
> > > }
> >
> > Well looking at the just attached dmesg , the modprobe
> > when triggered by udev from userspace succeeds in about
> > 0.5 seconds, so it seems that the modprobe hangs happens
> > when called from within the kernel rather then from within
> > userspace.
> >
> > What I do not know if is the hang is inside userspace, or
> > maybe it happens when modprobe calls back into the kernel,
> > if the hang happens when modprobe calls back into the kernel,
> > then other modprobes (done from udev) likely will hang too
> > since I think only 1 modprobe can happen at a time.
> >
> > I really wish we knew what distinguished working systems
> > from non working systems :|
> >
> > I cannot find a common denominator; other then the systems
> > are not running Fedora. So far we've reports from both Ubuntu 16.04
> > and Tumbleweed, so software version wise these 2 are wide apart.
>
> I am trying to reproduce the lock locally, and installed an opensuse
> Tumbleweed in a VM. When forwarding a Unifying receiver to the VM, I
> do not see the lock with either my vanilla compiled kernel and the rpm
> found in http://download.opensuse.org/repositories/Kernel:/HEAD/standard/x86_64/
>
> Next step is install Tumbleweed on bare metal, but I do not see how
> this could introduce a difference (maybe USB2 vs 3).

Making progress here.

The difference between Ubuntu/Tumbleweed and Fedora: usbhid is shipped
as a module while in Fedora usbhid is included in the kernel.

If I rmmod hid_* and usbhid, then modprobe usbhid, the command hangs
for 3 minutes.
If usbhid is already loaded, inserting a receiver is immediate
regarding the loading of the external modules.

So my assumption is that when the device gets detected at boot, usbhid
gets loaded by the kernel event, which in turns attempts to call
__request_module, but the modprobe can't be fulfilled because it's
already waiting for the initial usbhid modprobe to finish.

Still don't know how to solve that, but I thought I should share.

Cheers,
Benjamin
