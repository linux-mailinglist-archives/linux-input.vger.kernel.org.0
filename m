Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38F613AE5D
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 17:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgANQGY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 11:06:24 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:50730 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726365AbgANQGY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 11:06:24 -0500
Received: (qmail 4192 invoked by uid 2102); 14 Jan 2020 11:06:22 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 14 Jan 2020 11:06:22 -0500
Date:   Tue, 14 Jan 2020 11:06:22 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     syzbot <syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com>,
        <andreyknvl@google.com>, <benjamin.tissoires@redhat.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Write in hiddev_disconnect
In-Reply-To: <20200114152414.GC3719@kadam>
Message-ID: <Pine.LNX.4.44L0.2001141100290.1593-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 14 Jan 2020, Dan Carpenter wrote:

> I'm trying to take a stab at diagnosing these bugs.  (But I'm seldom
> smart enough to actually fix anything).  These hiddev_disconnect() bugs
> are a race condition:
> 
> devel/drivers/hid/usbhid/hiddev.c
>    924  void hiddev_disconnect(struct hid_device *hid)
>    925  {
>    926          struct hiddev *hiddev = hid->hiddev;
>    927          struct usbhid_device *usbhid = hid->driver_data;
>    928  
>    929          usb_deregister_dev(usbhid->intf, &hiddev_class);
>    930  
>    931          mutex_lock(&hiddev->existancelock);
>    932          hiddev->exist = 0;
>                 ^^^^^^^^^^^^^^^^^^
> We set "exist = 0;"
> 
>    933  
>    934          if (hiddev->open) {
>    935                  mutex_unlock(&hiddev->existancelock);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Then we drop the lock.
> 
>    936                  hid_hw_close(hiddev->hid);
>    937                  wake_up_interruptible(&hiddev->wait);
>                                                ^^^^^^
> The other thread frees hiddev and it crashes here.
> 
>    938          } else {
>    939                  mutex_unlock(&hiddev->existancelock);
>    940                  kfree(hiddev);
>    941          }
>    942  }
> 
> The other thread is doing:
> 
> drivers/hid/usbhid/hiddev.c
>    216  static int hiddev_release(struct inode * inode, struct file * file)
>    217  {
>    218          struct hiddev_list *list = file->private_data;
>    219          unsigned long flags;
>    220  
>    221          spin_lock_irqsave(&list->hiddev->list_lock, flags);
>    222          list_del(&list->node);
>    223          spin_unlock_irqrestore(&list->hiddev->list_lock, flags);
>    224  
>    225          mutex_lock(&list->hiddev->existancelock);
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Takes the lock.
> 
>    226          if (!--list->hiddev->open) {
>                      ^^^^^^^^^^^^^^^^^^^^
> Decrements open.
> 
>    227                  if (list->hiddev->exist) {
>                             ^^^^^^^^^^^^^^^^^^^
> This is false.
> 
>    228                          hid_hw_close(list->hiddev->hid);
>    229                          hid_hw_power(list->hiddev->hid, PM_HINT_NORMAL);
>    230                  } else {
>    231                          mutex_unlock(&list->hiddev->existancelock);
>    232                          kfree(list->hiddev);
>                                       ^^^^^^^^^^^^
> Freed here.
> 
>    233                          vfree(list);
>    234                          return 0;
>    235                  }
>    236          }
>    237  
>    238          mutex_unlock(&list->hiddev->existancelock);
>    239          vfree(list);
>    240  
>    241          return 0;
>    242  }
> 
> I'm not sure what the fix should be though.

Good sleuthing!

It certainly looks as though hiddev_disconnect() should not try to
reference hiddev after dropping the existance_lock -- at least, not in
the case that the device file is still open.  So I suggest reordering
the statements in that routine: First call hid_hw_close() and
wake_up_interruptible(), then drop the mutex.

Too bad syzbot doesn't have a reproducer to test this, though.

Alan Stern

