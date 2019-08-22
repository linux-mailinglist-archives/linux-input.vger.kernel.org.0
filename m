Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C470C99758
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 16:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731942AbfHVOt6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 10:49:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52248 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1731572AbfHVOt6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 10:49:58 -0400
Received: (qmail 1325 invoked by uid 2102); 22 Aug 2019 10:49:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Aug 2019 10:49:57 -0400
Date:   Thu, 22 Aug 2019 10:49:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     Oliver Neukum <oneukum@suse.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] HID: quirks: Disable runtime suspend on Microsoft Corp.
 Basic Optical Mouse v2.0
In-Reply-To: <D6E31CB0-BC2B-4B52-AF18-4BE990D3FDA5@canonical.com>
Message-ID: <Pine.LNX.4.44L0.1908221043080.1311-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 22 Aug 2019, Kai-Heng Feng wrote:

> at 18:38, Oliver Neukum <oneukum@suse.com> wrote:
> 
> > Am Donnerstag, den 22.08.2019, 18:04 +0800 schrieb Kai-Heng Feng:
> >> Hi Oliver,
> >>
> >> at 17:45, Oliver Neukum <oneukum@suse.com> wrote:
> >>
> >>> Am Donnerstag, den 22.08.2019, 17:17 +0800 schrieb Kai-Heng Feng:
> >>>> The optical sensor of the mouse gets turned off when it's runtime
> >>>> suspended, so moving the mouse can't wake the mouse up, despite that
> >>>> USB remote wakeup is successfully set.
> >>>>
> >>>> Introduce a new quirk to prevent the mouse from getting runtime
> >>>> suspended.
> >>>
> >>> Hi,
> >>>
> >>> I am afraid this is a bad approach in principle. The device
> >>> behaves according to spec.
> >>
> >> Can you please point out which spec it is? Is it USB 2.0 spec?
> >
> > Well, sort of. The USB spec merely states how to enter and exit
> > a suspended state and that device state must not be lost.
> > It does not tell you what a suspended device must be able to do.
> 
> But shouldn’t remote wakeup signaling wakes the device up and let it exit  
> suspend state?
> Or it’s okay to let the device be suspended when remote wakeup is needed  
> but broken?
> 
> >
> >>> And it behaves like most hardware.
> >>
> >> So seems like most hardware are broken.
> >> Maybe a more appropriate solution is to disable RPM for all USB mice.
> >
> > That is a decision a distro certainly can make. However, the kernel
> > does not, by default, call usb_enable_autosuspend() for HID devices
> > for this very reason. It is enabled by default only for hubs,
> > BT dongles and UVC cameras (and some minor devices)
> >
> > In other words, if on your system it is on, you need to look
> > at udev, not the kernel.
> 
> So if a device is broken when “power/control” is flipped by user, we should  
> deal it at userspace? That doesn’t sound right to me.
> 
> >
> >>> If you do not want runtime PM for such devices, do not switch
> >>> it on.
> >>
> >> A device should work regardless of runtime PM status.
> >
> > Well, no. Runtime PM is a trade off. You lose something if you use
> > it. If it worked just as well as full power, you would never use
> > full power, would you?
> 
> I am not asking the suspended state to work as full power, but to prevent a  
> device enters suspend state because of broken remote wakeup.
> 
> >
> > Whether the loss of functionality or performance is worth the energy
> > savings is a policy decision. Hence it belongs into udev.
> > Ideally the kernel would tell user space what will work in a
> > suspended state. Unfortunately HID does not provide support for that.
> 
> I really don’t think “loss of functionally” belongs to policy decision. But  
> that’s just my opinion.
> 
> >
> > This is a deficiency of user space. The kernel has an ioctl()
> > to let user space tell it, whether a device is fully needed.
> > X does not use them.
> 
> Ok, I’ll take a look at other device drivers that use it.
> 
> >
> >>> The refcounting needs to be done correctly.
> >>
> >> Will do.
> >
> > Well, I am afraid your patch breaks it and if you do not break
> > it, the patch is reduced to nothing.
> 
> Maybe just calling usb_autopm_put_interface() in usbhid_close() to balance  
> the refcount?
> 
> >
> >>> This patch does something that udev should do and in a
> >>> questionable manner.
> >>
> >> IMO if the device doesn’t support runtime suspend, then it needs to be
> >> disabled in kernel but not workaround in userspace.
> >
> > You switch it on from user space. Of course the kernel default
> > must be safe, as you said. It already is.
> 
> I’d also like to hear maintainers' opinion on this issue.

I agree with Oliver.  There is no formal requirement on what actions
should cause a mouse to generate a remote wakeup request.  Some mice
will do it when they are moved and some mice won't.

If you don't like the way a particular mouse behaves then you should
not allow it to go into runtime suspend.  By default, the kernel
prevents _all_ USB mice from being runtime suspended; the only way a
mouse can be suspended is if some userspace program tells the kernel to
allow it.

It might be a udev script which does this, or a powertop setting, or
something else.  Regardless, what the kernel does is correct.  
Furthermore, the kernel has to accomodate users who don't mind pressing
a mouse button to wake up their mice.  For their sake, the kernel
should not forbid a mouse from ever going into runtime suspend merely
because it won't generate a wakeup request when it is moved.

Alan Stern

