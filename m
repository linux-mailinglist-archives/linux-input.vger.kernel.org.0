Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128676A0C5A
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 15:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbjBWO7W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 23 Feb 2023 09:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbjBWO7V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 09:59:21 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE27918154;
        Thu, 23 Feb 2023 06:59:17 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id E10561BF212;
        Thu, 23 Feb 2023 14:59:13 +0000 (UTC)
Message-ID: <30a727ca72151dc1cba1028715647de44a8c920a.camel@hadess.net>
Subject: Re: [PATCH 4/5] USB: core: Add API to change the wireless_status
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Thu, 23 Feb 2023 15:59:13 +0100
In-Reply-To: <Y/dvsH0IXhdOKh3L@kroah.com>
References: <20230223132452.37958-1-hadess@hadess.net>
         <20230223132452.37958-4-hadess@hadess.net> <Y/dvsH0IXhdOKh3L@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2023-02-23 at 14:52 +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 23, 2023 at 02:24:51PM +0100, Bastien Nocera wrote:
> > Allow device specific drivers to change the wireless status of a
> > device.
> > This will allow user-space to know whether the device is available,
> > whether or not specific USB interfaces can detect it.
> > 
> > This can be used by wireless headsets with USB receivers to
> > propagate to
> > user-space whether or not the headset is turned on, so as to
> > consider it
> > as unavailable, and not switch to it just because the receiver is
> > plugged in.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  drivers/usb/core/message.c | 13 +++++++++++++
> >  drivers/usb/core/usb.c     | 24 ++++++++++++++++++++++++
> >  include/linux/usb.h        |  4 ++++
> >  3 files changed, 41 insertions(+)
> > 
> > diff --git a/drivers/usb/core/message.c
> > b/drivers/usb/core/message.c
> > index 127fac1af676..d5c7749d515e 100644
> > --- a/drivers/usb/core/message.c
> > +++ b/drivers/usb/core/message.c
> > @@ -1908,6 +1908,18 @@ static void __usb_queue_reset_device(struct
> > work_struct *ws)
> >         usb_put_intf(iface);    /* Undo _get_ in
> > usb_queue_reset_device() */
> >  }
> >  
> > +/*
> > + * Internal function to set the wireless_status sysfs attribute
> > + * See usb_set_wireless_status() for more details
> > + */
> > +static void __usb_wireless_status_intf(struct work_struct *ws)
> > +{
> > +       struct usb_interface *iface =
> > +               container_of(ws, struct usb_interface,
> > wireless_status_work);
> > +
> > +       usb_update_wireless_status_attr(iface);
> > +       usb_put_intf(iface);    /* Undo _get_ in
> > usb_set_wireless_status() */
> > +}
> 
> Why is this in a workqueue?  Why can't it just happen when asked?
> 
> I do not see any justification for that in your changelog or code :(

Because, in many cases, updates would be triggered from USB events,
which happen in a softirq. Is that explanation good enough for the
commit message, or do you prefer it in the code?

Looks something like this if you don't use a workqueue:
Call Trace:
 <IRQ>
 dump_stack_lvl+0x5b/0x77
 mark_lock.cold+0x48/0xe1
 ? lock_is_held_type+0xe8/0x140
 ? lock_is_held_type+0xe8/0x140
 __lock_acquire+0x800/0x1ef0
 ? update_load_avg+0x762/0x890
 lock_acquire+0xce/0x2d0
 ? __kmem_cache_alloc_node+0x31/0x3b0
 ? lock_is_held_type+0xe8/0x140
 ? find_held_lock+0x32/0x90
 fs_reclaim_acquire+0xa5/0xe0
 ? __kmem_cache_alloc_node+0x31/0x3b0
 __kmem_cache_alloc_node+0x31/0x3b0
 ? usb_set_wireless_status+0x29/0x120
 kmalloc_trace+0x26/0x60
 usb_set_wireless_status+0x29/0x120
 hidpp_raw_hidpp_event.cold+0x107/0x119 [hid_logitech_hidpp]
 ? lock_release+0x14f/0x460
 hidpp_raw_event+0xf2/0x610 [hid_logitech_hidpp]
 ? _raw_spin_unlock_irqrestore+0x40/0x60
 hid_input_report+0x142/0x160
 hid_irq_in+0x177/0x1a0
 __usb_hcd_giveback_urb+0x9a/0x110
 usb_giveback_urb_bh+0x97/0x110
 tasklet_action_common.constprop.0+0xe3/0x110
 __do_softirq+0xec/0x590
 __irq_exit_rcu+0xf9/0x170
 irq_exit_rcu+0xa/0x30
 common_interrupt+0xb9/0xd0
 </IRQ>
 <TASK>
 asm_common_interrupt+0x22/0x40
RIP: 0010:cpuidle_enter_state+0xeb/0x320
Code: 4b 99 75 ff 45 84 ff 74 16 9c 58 0f 1f 40 00 f6 c4 02 0f 85 05 02
00 00 31 ff e8 80 b6 7d ff e8 1b 9c 85 ff fb 0f 1f 44 00 00 <45> 85 ed
0f 88 e2 00 00 00 49 63 cd 4c 89 f2 48 8d 04 49 48 8d 04
RSP: 0018:ffffaa07c017be98 EFLAGS: 00000206
RAX: 00000000000a8327 RBX: ffffca07be8036b8 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffffb46ba489 RDI: ffffffffb463dd36
RBP: 0000000000000008 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffffb50d5e00
R13: 0000000000000008 R14: 0000001da3b692b2 R15: 0000000000000000
 ? cpuidle_enter_state+0xe5/0x320
 cpuidle_enter+0x29/0x40
 do_idle+0x21d/0x2b0
 cpu_startup_entry+0x19/0x20
 start_secondary+0x113/0x140
 secondary_startup_64_no_verify+0xe5/0xeb
 </TASK>
BUG: sleeping function called from invalid context at
include/linux/sched/mm.h:274
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, name:
swapper/5
preempt_count: 101, expected: 0

