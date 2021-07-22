Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3013D2025
	for <lists+linux-input@lfdr.de>; Thu, 22 Jul 2021 10:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhGVIGj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Jul 2021 04:06:39 -0400
Received: from outgoing-yousee.gl-mut-gbl.as8677.net ([193.201.76.59]:34757
        "EHLO outgoing-yousee.gl-mut-gbl.as8677.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230401AbhGVIGj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Jul 2021 04:06:39 -0400
Received: from filter.yousee.as8677.net (localhost [127.0.0.1])
        by mwumf0303.yousee.as8677.net (SMTP Server) with ESMTP id 4GVmKW04nGz7CT
        for <linux-input@vger.kernel.org>; Thu, 22 Jul 2021 10:47:11 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4GVmKV6pTZz7CS","contextId":"c2ed5699-2870-432a-9a55-7d8026b27879"}
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=webspeed.dk; s=sela;
 t=1626943630; h=Subject:From:To:Cc:Date:In-Reply-To:References; bh=FPcLYgIRqu
  p4alxdJ4hT/aff1ekXYmakS0r5dUT2lGo=; b=pPxMxDeE3PWGJ+KimaAmL0l0y35AU+VLlQ6Cre
  R4ZUEAYWOnd1aAtRsqC9m2aqSu761tWzTCiSy/GPBz+tGUwUgadTTMuxhDS0aiztRkuwO+6WcP/H
  NGDlTKORYikzsBMXLp8NoaDL9l67wQhsE2ffvTEfeQUyFcemCrjqwf/tFWcNwRXIP9/oTnCI/FzZ
  J8lqgrjI4CHn6muUuw+15eQ+Bwnrws75NOPW7NkeiN1Pa3ecsFcmHUsSQ1s7Ub4Lgf4p5tbnPS+2
  rKksalxHklDdPgQQWVwvTFq+bJbXlVPYctTsTGlq1UhSTXpuOogcDimQIF9pq8ST8ohJOUXXN4zw
  ==
Received: from outgoing-yousee.gl-mut-gbl.as8677.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mwumf0303.yousee.as8677.net (SMTP Server) with ESMTPS id 4GVmKV6pTZz7CS
        for <linux-input@vger.kernel.org>; Thu, 22 Jul 2021 10:47:10 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4GVmKV3R96z7C2","contextId":"f471d793-8140-4c52-a29e-b4d1ebcd7b25"}
X-yse-mailing: LEGIT
X-yse-spamrating: 36
X-yse-spam: not-spam
X-yse-spamcause: OK, (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvtddrfeeigddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfvffevpdggtfgfpffufgeuufevtffkuefgpdfqfgfvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpefjrghnshcuufgthhhulhhtiicuoehhrghnshdrshgthhhulhhtiiesfigvsghsphgvvggurdgukheqnecuggftrfgrthhtvghrnhepteetleegffelieetvddthfekvdelgfeggfeugfdvueeitdeluddutefghfdugfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghdpvgigrdhinhenucfkphepvddruddtgedrudduiedrudekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedruddrvdefgegnpdhinhgvthepvddruddtgedrudduiedrudekgedpmhgrihhlfhhrohhmpehhrghnshdrshgthhhulhhtiiesfigvsghsphgvvggurdgukhdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesghhmrghilhdrtghomhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhm
Received: from [192.168.1.234] (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hans.schultz@webspeed.dk)
        by mwumf0303.yousee.as8677.net (SMTP Server) with ESMTPSA id 4GVmKV3R96z7C2;
        Thu, 22 Jul 2021 10:47:10 +0200 (CEST)
Authentication-Results: yousee.as8677.net; auth=pass (PLAIN) smtp.auth=hans.schultz@webspeed.dk
Message-ID: <d0ce2e386080ead084c6b270aecaff9ed8915507.camel@webspeed.dk>
Subject: Re: Elantech touchpad not working on mainline kernels
From:   Hans Schultz <hans.schultz@webspeed.dk>
To:     Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 22 Jul 2021 10:45:22 +0200
In-Reply-To: <CAN+gG=FrMYzohpc1QVGPK1mKgX=x8WDzgWQsgYHKSa6AYkQr5A@mail.gmail.com>
References: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
         <CAKdAkRRe0GkdOEQhb7WV6CtOw_1D0bbxCcDKadivc+uQrAvBhw@mail.gmail.com>
         <c727d6900e2af325b9e91b9f2d0adc8677cd8eea.camel@webspeed.dk>
         <CAKdAkRT=O5f7=bCOKUea0LDQnEUtV8Mu0yMbQNTcoB+7Q_3GNA@mail.gmail.com>
         <578761643e8a040fc1952ed1701371be15cb267a.camel@webspeed.dk>
         <8ea9fed2bbe1c1e23afa3103177511c9501ee580.camel@webspeed.dk>
         <CAKdAkRQ5N-Sk6=ddXHpj_wUkiDs1xUe6ZzePhHqg9sg3Xe0Gaw@mail.gmail.com>
         <CAN+gG=FrMYzohpc1QVGPK1mKgX=x8WDzgWQsgYHKSa6AYkQr5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2021-07-22 at 09:55 +0200, Benjamin Tissoires wrote:
> On Wed, Jul 21, 2021 at 10:42 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > 
> > On Wed, Jul 21, 2021 at 12:53 PM Hans Schultz <
> > hans.schultz@webspeed.dk> wrote:
> > > 
> > > On Wed, 2021-07-21 at 21:31 +0200, Hans Schultz wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On Wed, 2021-07-21 at 12:14 -0700, Dmitry Torokhov wrote:
> > > > > On Wed, Jul 21, 2021 at 11:09 AM Hans Schultz <
> > > > > hans.schultz@webspeed.dk> wrote:
> > > > > > 
> > > > > > On Wed, 2021-07-21 at 10:48 -0700, Dmitry Torokhov wrote:
> > > > > > > Hi Hans,
> > > > > > > 
> > > > > > > On Sun, May 30, 2021 at 2:12 AM Hans Schultz <
> > > > > > > hans.schultz@webspeed.dk> wrote:
> > > > > > > > 
> > > > > > > > Hello,
> > > > > > > > I have a problem getting my Elantech touchpad to work
> > > > > > > > with
> > > > > > > > the
> > > > > > > > mainline
> > > > > > > > kernels, and I need some assistance with the code to
> > > > > > > > resolve
> > > > > > > > the
> > > > > > > > problem.
> > > > > > > > The kernels that have tried are 5.9.11 and 5.11.11.
> > > > > > > > 
> > > > > > > > With boot parameters i8042.notimeout i8042.nomux, the
> > > > > > > > touchpad is
> > > > > > > > detected but does not work. There is absolutely no
> > > > > > > > response
> > > > > > > > from
> > > > > > > > it
> > > > > > > > with any hid modules loaded.
> > > > > > > > 
> > > > > > > > It is reported and seen working on a Lubuntu distro
> > > > > > > > (bionic
> > > > > > > > kernel)
> > > > > > > > when inserting the i2c_hid module. The insertion of the
> > > > > > > > i2c_hid
> > > > > > > > module
> > > > > > > > pulls in the hid_multitouch module when it works, no
> > > > > > > > boot
> > > > > > > > parameters
> > > > > > > > necessary.
> > > > > > > > In the case where it does not work, insering the
> > > > > > > > i2c_hid
> > > > > > > > module
> > > > > > > > does
> > > > > > > > not pull in the hid_multitouch module.
> > > > > > > > 
> > > > > > > > I have the bionic kernel code, but I have not as of yet
> > > > > > > > been
> > > > > > > > able
> > > > > > > > to
> > > > > > > > detect what makes it work in contrast to the kernel.org
> > > > > > > > kernels.
> > > > > > > > 
> > > > > > > > This I think should lead to a kernel patch.
> > > > > > > 
> > > > > > > There is not much to go on with. What is the hardware,
> > > > > > > your
> > > > > > > kernel
> > > > > > > .config, dmesg from unsuccessful boot? If you have logs
> > > > > > > from
> > > > > > > the
> > > > > > > working kernel that would help too.
> > > > > > > 
> > > > > > > Thanks.
> > > > > > > 
> > > > > > 
> > > > > > The best info I have on the hardware is from Xorg log with
> > > > > > the
> > > > > > working
> > > > > > Lubuntu kernel:
> > > > > > [ 130.980] (II) Loading
> > > > > > /usr/lib/xorg/modules/input/synaptics_drv.so
> > > > > > [ 130.982] (II) Module synaptics: vendor="X.Org Foundation"
> > > > > > [ 130.982] (II) Using input driver 'synaptics' for '0X45
> > > > > > 0X4C
> > > > > > 0X41
> > > > > > 0:00
> > > > > > 04F3:308C Touchpad'
> > > > > > 
> > > > > > I might be able to get the kernel messages when inserting
> > > > > > the
> > > > > > working
> > > > > > module, but I think it will not tell much more.
> > > > > 
> > > > > OK, if you say so. Then the only suggestion I have is to
> > > > > verify
> > > > > that
> > > > > your kernel config enables all necessary options for your
> > > > > hardware.
> > > > > I'd double check if you have Designware I2C controller
> > > > > enabled,
> > > > > ACPI
> > > > > LPSS, etc.
> > > > > 
> > > > > > To me it is clearly a code issue as the working kernel
> > > > > > pulls in
> > > > > > hid_multitouch when inserting i2c_hid, while the non-
> > > > > > working does
> > > > > > not.
> > > > > > 
> > > > > > All kernels I have tried up to now from kernel.org do not
> > > > > > work.
> > > > > > The
> > > > > > latest being 5.13.4.
> > > > > 
> > > > > Thanks.
> > > > > 
> > > > 
> > > > I have a thread with all the dmesg info for both the working
> > > > and non-
> > > > working cases here :
> > > > https://gitlab.freedesktop.org/libinput/libinput/-/issues/544
> > > > 
> > > > Benjamin has also asked for the acpidump info, which is there.
> > > > (funny
> > > > as the responses to my problem come at the same time after a
> > > > long
> > > > time.
> > > > :-) )
> > > > 
> > > > I will check my .config...
> > > > 
> > > > Thanks,
> > > > Hans
> > > 
> > > Here are my I2C kernel settings. I only added what I could see as
> > > with
> > > Intel hw, so no Designware!
> > 
> > However if you consult the dmesg from the working kernel you will
> > observe:
> > 
> > [   79.964148] input: 0X45 0X4C 0X41 0:00 04F3:308C Mouse as
> > /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-8/i2c-0X45
> > 0X4C
> > 0X41 0:00/0018:04F3:308C.0002/input/input24
> > [   79.964222] input: 0X45 0X4C 0X41 0:00 04F3:308C Touchpad as
> > /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-8/i2c-0X45
> > 0X4C
> > 0X41 0:00/0018:04F3:308C.0002/input/input26
> > 
> > so it clearly uses designware-compatible IP block even though it is
> > an
> > Intel system.
> 
> FWIW, I think Intel platform *always* rely on designware for the I2C
> adapter implementation. So if you haven't enabled that driver there
> is
> no chance for you to have a working touchpad.
> 
> Cheers,
> Benjamin
> 
> > 
> > Can you try grabbing config from the working kernel and use it if
> > you
> > want to compile your own? There are a lot of hardware dependencies
> > in
> > modern systems that may not be immediately obvious.
> > 
> > Thanks.
> > 
> > --
> > Dmitry

I have now tried taking the kernel config from the working example and
building a 5.13.4 kernel based on that, but it still does not work.

My original approach was assuming that the Lubuntu kernel was module
based, which they normally are to be flexible, and checking module for
module what I had of modules in my kernel build and the module list
from the Lubuntu kernel.

The designware part in the Lubuntu kernel it shows was not included as
a module but was in the kernel bin. Adding the designware parts to my
kernel did not resolve the issue either.

Still inserting i2c_hid does not pull in hid_multitouch.

Is there code differences that Ubuntu have made to their kernel that
can explain this? I have been looking through the code and there is
definitely differences, f.ex. in the quirks department.
