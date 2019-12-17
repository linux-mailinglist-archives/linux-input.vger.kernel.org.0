Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B220122B76
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 13:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbfLQM1h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 07:27:37 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43641 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbfLQM1g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 07:27:36 -0500
Received: by mail-qk1-f194.google.com with SMTP id t129so1849844qke.10
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2019 04:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6rcXYYUudY3RLSfy+6L6LIH+O+uWg3mOYFXeg2Oxrcw=;
        b=E9S8rFxR2HA9hoJmPq8swoUl53AtPzA+DySzlXOQJnlJVvkowM6zHj+hY52/F9IrWG
         3PiXKBhIUvpR1K83FPuXapyZBlYiPIQmMacZJsfeFE42POxhEln/nTHXVLYNignwDihw
         zH3MAAee1NAMzIYY88KZzu1kDzQy3MBpEGGORXfzmrdGc/4iW8yAoPqcXKPNn8014E9z
         JJJWzc51uYEi2h6QImYOYMW4AuJYfAxc32eDUFs6iNhtn8iBhj0blBZhJVrzlt0RCyhv
         08aHYbRw0jWqANqMOKyPeeU+9gcElsH/pivOS4nGFrOWYI2l/klv1m05D9t6C0O/kFvU
         rjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6rcXYYUudY3RLSfy+6L6LIH+O+uWg3mOYFXeg2Oxrcw=;
        b=n635npyDJ3AXR3PuT//4CpMJ+vwf/xPD+tfBkfI1I+Bk16UMWnwgh2rmNhY3TQVRmq
         Hfzn+3T/nLhH4B0fGklETRYVzEG7kVfqceBhtY36QTXvrkSVrffnsNsBlucq75DbRGKw
         Ei339UK6oOtDUoWcyKWpt2H0pVEeojpB/BE0yPro/1xs8U/s6coMs3GYJph/9iVyp04H
         hwoGthQUdkUj1Ewnbe8zzRznuv/np3yrGTFfDgEe+OvUsWAFq+ppMZDjKSb6w4l2B5xy
         vmm3Vf6k5ohxZ5gZEboVWA6li4WS6vNdszz3xMCayXUj/Nqe5CD8StK8jk+YOjCVTFWb
         4W9Q==
X-Gm-Message-State: APjAAAWzknTD/Iw5rmiZNLO4AYU9fsANaHhsO8KjWVbI41erjEcW800w
        Ore4OGTRCQIEsFUM9Ev8SDWa32Vf7eGzMfOMCWrEzw==
X-Google-Smtp-Source: APXvYqyeD4S/jNIImRT84+ra9v6zAfZtuEtEXeXxpTGW4JLRAEoi3S5TPviSogy5qShr8SHQzcQhRROnIfvO9/oJ4R8=
X-Received: by 2002:ae9:e50c:: with SMTP id w12mr4261043qkf.407.1576585653081;
 Tue, 17 Dec 2019 04:27:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576170740.git.andreyknvl@google.com> <95e7a12ac909e7de584133772efc7ef982a16bbb.1576170740.git.andreyknvl@google.com>
 <CACT4Y+Yf1HiF7DHpryu_+93BJdXPRFX58yyLPhSKUedy2z_tGw@mail.gmail.com>
In-Reply-To: <CACT4Y+Yf1HiF7DHpryu_+93BJdXPRFX58yyLPhSKUedy2z_tGw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 17 Dec 2019 13:27:21 +0100
Message-ID: <CACT4Y+YfS-S4WGWLzE_44hcpH8LJVH4=+tDC3M1Le0rtNgAm5A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] kcov: collect coverage from interrupts
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 17, 2019 at 1:21 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
>   On Thu, Dec 12, 2019 at 6:15 PM Andrey Konovalov
> <andreyknvl@google.com> wrote:
> >
> > This change extends kcov remote coverage support to allow collecting
> > coverage from interrupts in addition to kernel background threads.
> >
> > To collect coverage from code that is executed in interrupt context, a
> > part of that code has to be annotated with kcov_remote_start/stop() in a
> > similar way as how it is done for global kernel background threads. Then
> > the handle used for the annotations has to be passed to the
> > KCOV_REMOTE_ENABLE ioctl.
> >
> > Internally this patch adjusts the __sanitizer_cov_trace_pc() compiler
> > inserted callback to not bail out when called from interrupt context.
> > kcov_remote_start/stop() are updated to save/restore the current per
> > task kcov state in a per-cpu area (in case the interrupt came when the
> > kernel was already collecting coverage in task context). Coverage from
> > interrupts is collected into pre-allocated per-cpu areas, whose size is
> > controlled by the new CONFIG_KCOV_IRQ_AREA_SIZE.
> >
> > This patch also cleans up some of kcov debug messages.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > ---
> >  Documentation/dev-tools/kcov.rst   |  16 +--
> >  drivers/usb/gadget/udc/dummy_hcd.c |   1 +
> >  include/linux/sched.h              |   3 +
> >  kernel/kcov.c                      | 196 +++++++++++++++++++----------
> >  lib/Kconfig.debug                  |   9 ++
> >  5 files changed, 154 insertions(+), 71 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> > index 1c4e1825d769..fc2bc6883431 100644
> > --- a/Documentation/dev-tools/kcov.rst
> > +++ b/Documentation/dev-tools/kcov.rst
> > @@ -217,14 +217,14 @@ This allows to collect coverage from two types of kernel background
> >  threads: the global ones, that are spawned during kernel boot in a limited
> >  number of instances (e.g. one USB hub_event() worker thread is spawned per
> >  USB HCD); and the local ones, that are spawned when a user interacts with
> > -some kernel interface (e.g. vhost workers).
> > +some kernel interface (e.g. vhost workers); as well as from interrupts.
> >
> > -To enable collecting coverage from a global background thread, a unique
> > -global handle must be assigned and passed to the corresponding
> > -kcov_remote_start() call. Then a userspace process can pass a list of such
> > -handles to the KCOV_REMOTE_ENABLE ioctl in the handles array field of the
> > -kcov_remote_arg struct. This will attach the used kcov device to the code
> > -sections, that are referenced by those handles.
> > +To enable collecting coverage from a global background thread or from an
> > +interrupt, a unique global handle must be assigned and passed to the
> > +corresponding kcov_remote_start() call. Then a userspace process can pass
> > +a list of such handles to the KCOV_REMOTE_ENABLE ioctl in the handles
> > +array field of the kcov_remote_arg struct. This will attach the used kcov
> > +device to the code sections, that are referenced by those handles.
> >
> >  Since there might be many local background threads spawned from different
> >  userspace processes, we can't use a single global handle per annotation.
> > @@ -242,7 +242,7 @@ handles as they don't belong to a particular subsystem. The bytes 4-7 are
> >  currently reserved and must be zero. In the future the number of bytes
> >  used for the subsystem or handle ids might be increased.
> >
> > -When a particular userspace proccess collects coverage by via a common
> > +When a particular userspace proccess collects coverage via a common
> >  handle, kcov will collect coverage for each code section that is annotated
> >  to use the common handle obtained as kcov_handle from the current
> >  task_struct. However non common handles allow to collect coverage
> > diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> > index 4c9d1e49d5ed..faf84ada71a5 100644
> > --- a/drivers/usb/gadget/udc/dummy_hcd.c
> > +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/usb/gadget.h>
> >  #include <linux/usb/hcd.h>
> >  #include <linux/scatterlist.h>
> > +#include <linux/kcov.h>
> >
> >  #include <asm/byteorder.h>
> >  #include <linux/io.h>
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 467d26046416..47d1d556f795 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -1229,6 +1229,9 @@ struct task_struct {
> >
> >         /* KCOV sequence number: */
> >         int                             kcov_sequence;
> > +
> > +       /* Collect coverage from interrupt context: */
> > +       bool                            kcov_interrupt;
> >  #endif
> >
> >  #ifdef CONFIG_MEMCG
> > diff --git a/kernel/kcov.c b/kernel/kcov.c
> > index f50354202dbe..5b48a7a5c465 100644
> > --- a/kernel/kcov.c
> > +++ b/kernel/kcov.c
> > @@ -26,6 +26,7 @@
> >  #include <asm/setup.h>
> >
> >  #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
> > +#define kcov_err(fmt, ...) pr_err("%s: " fmt, __func__, ##__VA_ARGS__)
> >
> >  /* Number of 64-bit words written per one comparison: */
> >  #define KCOV_WORDS_PER_CMP 4
> > @@ -86,6 +87,17 @@ static DEFINE_SPINLOCK(kcov_remote_lock);
> >  static DEFINE_HASHTABLE(kcov_remote_map, 4);
> >  static struct list_head kcov_remote_areas = LIST_HEAD_INIT(kcov_remote_areas);
> >
> > +struct kcov_remote_irq_data {
> > +       unsigned int            mode;
> > +       unsigned int            size;
> > +       void                    *area;
> > +       struct kcov             *kcov;
> > +       unsigned long           flags;
> > +};
> > +
> > +DEFINE_PER_CPU(struct kcov_remote_irq_data, kcov_remote_irq);
> > +DEFINE_PER_CPU(void *, kcov_irq_area);
>
> I would combine these 2 vars together.
> Each kcov_remote_irq_data field and kcov_irq_area are all various bits
> of kcov irq-related state. Little point in separating them into 2
> per-cpu variables. What may help is better names, e.g. what's the
> difference between kcov_remote_irq.area and kcov_irq_area?
> I would understand if kcov_remote_irq would only be used in
> kcov_remote_swap_irq as current task save area, but flags already
> don't belong to this category.
>
>
> > +
> >  /* Must be called with kcov_remote_lock locked. */
> >  static struct kcov_remote *kcov_remote_find(u64 handle)
> >  {
> > @@ -98,6 +110,7 @@ static struct kcov_remote *kcov_remote_find(u64 handle)
> >         return NULL;
> >  }
> >
> > +/* Must be called with kcov_remote_lock locked. */
> >  static struct kcov_remote *kcov_remote_add(struct kcov *kcov, u64 handle)
> >  {
> >         struct kcov_remote *remote;
> > @@ -119,16 +132,13 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
> >         struct kcov_remote_area *area;
> >         struct list_head *pos;
> >
> > -       kcov_debug("size = %u\n", size);
> >         list_for_each(pos, &kcov_remote_areas) {
> >                 area = list_entry(pos, struct kcov_remote_area, list);
> >                 if (area->size == size) {
> >                         list_del(&area->list);
> > -                       kcov_debug("rv = %px\n", area);
> >                         return area;
> >                 }
> >         }
> > -       kcov_debug("rv = NULL\n");
> >         return NULL;
> >  }
> >
> > @@ -136,7 +146,6 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
> >  static void kcov_remote_area_put(struct kcov_remote_area *area,
> >                                         unsigned int size)
> >  {
> > -       kcov_debug("area = %px, size = %u\n", area, size);
> >         INIT_LIST_HEAD(&area->list);
> >         area->size = size;
> >         list_add(&area->list, &kcov_remote_areas);
> > @@ -148,9 +157,11 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
> >
> >         /*
> >          * We are interested in code coverage as a function of a syscall inputs,
> > -        * so we ignore code executed in interrupts.
> > +        * so we ignore code executed in interrupts, unless we are in a remote
> > +        * coverage collection section happening in an interrupt, which is
> > +        * indicated by the t->kcov_interrupt flag.
> >          */
> > -       if (!in_task())
> > +       if (!in_task() && !t->kcov_interrupt)
> >                 return false;
> >         mode = READ_ONCE(t->kcov_mode);
> >         /*
> > @@ -331,12 +342,12 @@ static void kcov_stop(struct task_struct *t)
> >         barrier();
> >         t->kcov_size = 0;
> >         t->kcov_area = NULL;
> > +       t->kcov = NULL;
> >  }
> >
> >  static void kcov_task_reset(struct task_struct *t)
> >  {
> >         kcov_stop(t);
> > -       t->kcov = NULL;
> >         t->kcov_sequence = 0;
> >         t->kcov_handle = 0;
> >  }
> > @@ -361,18 +372,18 @@ static void kcov_remote_reset(struct kcov *kcov)
> >         int bkt;
> >         struct kcov_remote *remote;
> >         struct hlist_node *tmp;
> > +       unsigned long flags;
> >
> > -       spin_lock(&kcov_remote_lock);
> > +       spin_lock_irqsave(&kcov_remote_lock, flags);
> >         hash_for_each_safe(kcov_remote_map, bkt, tmp, remote, hnode) {
> >                 if (remote->kcov != kcov)
> >                         continue;
> > -               kcov_debug("removing handle %llx\n", remote->handle);
> >                 hash_del(&remote->hnode);
> >                 kfree(remote);
> >         }
> >         /* Do reset before unlock to prevent races with kcov_remote_start(). */
> >         kcov_reset(kcov);
> > -       spin_unlock(&kcov_remote_lock);
> > +       spin_unlock_irqrestore(&kcov_remote_lock, flags);
> >  }
> >
> >  static void kcov_disable(struct task_struct *t, struct kcov *kcov)
> > @@ -401,12 +412,13 @@ static void kcov_put(struct kcov *kcov)
> >  void kcov_task_exit(struct task_struct *t)
> >  {
> >         struct kcov *kcov;
> > +       unsigned long flags;
> >
> >         kcov = t->kcov;
> >         if (kcov == NULL)
> >                 return;
> >
> > -       spin_lock(&kcov->lock);
> > +       spin_lock_irqsave(&kcov->lock, flags);
> >         kcov_debug("t = %px, kcov->t = %px\n", t, kcov->t);
> >         /*
> >          * For KCOV_ENABLE devices we want to make sure that t->kcov->t == t,
> > @@ -430,12 +442,12 @@ void kcov_task_exit(struct task_struct *t)
> >          * By combining all three checks into one we get:
> >          */
> >         if (WARN_ON(kcov->t != t)) {
> > -               spin_unlock(&kcov->lock);
> > +               spin_unlock_irqrestore(&kcov->lock, flags);
> >                 return;
> >         }
> >         /* Just to not leave dangling references behind. */
> >         kcov_disable(t, kcov);
> > -       spin_unlock(&kcov->lock);
> > +       spin_unlock_irqrestore(&kcov->lock, flags);
> >         kcov_put(kcov);
> >  }
> >
> > @@ -446,12 +458,13 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
> >         struct kcov *kcov = vma->vm_file->private_data;
> >         unsigned long size, off;
> >         struct page *page;
> > +       unsigned long flags;
> >
> >         area = vmalloc_user(vma->vm_end - vma->vm_start);
> >         if (!area)
> >                 return -ENOMEM;
> >
> > -       spin_lock(&kcov->lock);
> > +       spin_lock_irqsave(&kcov->lock, flags);
> >         size = kcov->size * sizeof(unsigned long);
> >         if (kcov->mode != KCOV_MODE_INIT || vma->vm_pgoff != 0 ||
> >             vma->vm_end - vma->vm_start != size) {
> > @@ -461,7 +474,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
> >         if (!kcov->area) {
> >                 kcov->area = area;
> >                 vma->vm_flags |= VM_DONTEXPAND;
> > -               spin_unlock(&kcov->lock);
> > +               spin_unlock_irqrestore(&kcov->lock, flags);
> >                 for (off = 0; off < size; off += PAGE_SIZE) {
> >                         page = vmalloc_to_page(kcov->area + off);
> >                         if (vm_insert_page(vma, vma->vm_start + off, page))
> > @@ -470,7 +483,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
> >                 return 0;
> >         }
> >  exit:
> > -       spin_unlock(&kcov->lock);
> > +       spin_unlock_irqrestore(&kcov->lock, flags);
> >         vfree(area);
> >         return res;
> >  }
> > @@ -550,10 +563,10 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
> >         int mode, i;
> >         struct kcov_remote_arg *remote_arg;
> >         struct kcov_remote *remote;
> > +       unsigned long flags;
> >
> >         switch (cmd) {
> >         case KCOV_INIT_TRACE:
> > -               kcov_debug("KCOV_INIT_TRACE\n");
> >                 /*
> >                  * Enable kcov in trace mode and setup buffer size.
> >                  * Must happen before anything else.
> > @@ -572,7 +585,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
> >                 kcov->mode = KCOV_MODE_INIT;
> >                 return 0;
> >         case KCOV_ENABLE:
> > -               kcov_debug("KCOV_ENABLE\n");
> >                 /*
> >                  * Enable coverage for the current task.
> >                  * At this point user must have been enabled trace mode,
> > @@ -598,7 +610,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
> >                 kcov_get(kcov);
> >                 return 0;
> >         case KCOV_DISABLE:
> > -               kcov_debug("KCOV_DISABLE\n");
> >                 /* Disable coverage for the current task. */
> >                 unused = arg;
> >                 if (unused != 0 || current->kcov != kcov)
> > @@ -610,7 +621,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
> >                 kcov_put(kcov);
> >                 return 0;
> >         case KCOV_REMOTE_ENABLE:
> > -               kcov_debug("KCOV_REMOTE_ENABLE\n");
> >                 if (kcov->mode != KCOV_MODE_INIT || !kcov->area)
> >                         return -EINVAL;
> >                 t = current;
> > @@ -627,41 +637,42 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
> >                 kcov->t = t;
> >                 kcov->remote = true;
> >                 kcov->remote_size = remote_arg->area_size;
> > -               spin_lock(&kcov_remote_lock);
> > +               spin_lock_irqsave(&kcov_remote_lock, flags);
> >                 for (i = 0; i < remote_arg->num_handles; i++) {
> > -                       kcov_debug("handle %llx\n", remote_arg->handles[i]);
> >                         if (!kcov_check_handle(remote_arg->handles[i],
> >                                                 false, true, false)) {
> > -                               spin_unlock(&kcov_remote_lock);
> > +                               spin_unlock_irqrestore(&kcov_remote_lock,
> > +                                                       flags);
> >                                 kcov_disable(t, kcov);
> >                                 return -EINVAL;
> >                         }
> >                         remote = kcov_remote_add(kcov, remote_arg->handles[i]);
> >                         if (IS_ERR(remote)) {
> > -                               spin_unlock(&kcov_remote_lock);
> > +                               spin_unlock_irqrestore(&kcov_remote_lock,
> > +                                                       flags);
> >                                 kcov_disable(t, kcov);
> >                                 return PTR_ERR(remote);
> >                         }
> >                 }
> >                 if (remote_arg->common_handle) {
> > -                       kcov_debug("common handle %llx\n",
> > -                                       remote_arg->common_handle);
> >                         if (!kcov_check_handle(remote_arg->common_handle,
> >                                                 true, false, false)) {
> > -                               spin_unlock(&kcov_remote_lock);
> > +                               spin_unlock_irqrestore(&kcov_remote_lock,
> > +                                                       flags);
> >                                 kcov_disable(t, kcov);
> >                                 return -EINVAL;
> >                         }
> >                         remote = kcov_remote_add(kcov,
> >                                         remote_arg->common_handle);
> >                         if (IS_ERR(remote)) {
> > -                               spin_unlock(&kcov_remote_lock);
> > +                               spin_unlock_irqrestore(&kcov_remote_lock,
> > +                                                       flags);
> >                                 kcov_disable(t, kcov);
> >                                 return PTR_ERR(remote);
> >                         }
> >                         t->kcov_handle = remote_arg->common_handle;
> >                 }
> > -               spin_unlock(&kcov_remote_lock);
> > +               spin_unlock_irqrestore(&kcov_remote_lock, flags);
> >                 /* Put either in kcov_task_exit() or in KCOV_DISABLE. */
> >                 kcov_get(kcov);
> >                 return 0;
> > @@ -677,6 +688,7 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> >         struct kcov_remote_arg *remote_arg = NULL;
> >         unsigned int remote_num_handles;
> >         unsigned long remote_arg_size;
> > +       unsigned long flags;
> >
> >         if (cmd == KCOV_REMOTE_ENABLE) {
> >                 if (get_user(remote_num_handles, (unsigned __user *)(arg +
> > @@ -697,9 +709,9 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> >         }
> >
> >         kcov = filep->private_data;
> > -       spin_lock(&kcov->lock);
> > +       spin_lock_irqsave(&kcov->lock, flags);
> >         res = kcov_ioctl_locked(kcov, cmd, arg);
> > -       spin_unlock(&kcov->lock);
> > +       spin_unlock_irqrestore(&kcov->lock, flags);
> >
> >         kfree(remote_arg);
> >
> > @@ -716,8 +728,8 @@ static const struct file_operations kcov_fops = {
> >
> >  /*
> >   * kcov_remote_start() and kcov_remote_stop() can be used to annotate a section
> > - * of code in a kernel background thread to allow kcov to be used to collect
> > - * coverage from that part of code.
> > + * of code in a kernel background thread or in an interrupt to allow kcov to be
> > + * used to collect coverage from that part of code.
> >   *
> >   * The handle argument of kcov_remote_start() identifies a code section that is
> >   * used for coverage collection. A userspace process passes this handle to
> > @@ -728,9 +740,9 @@ static const struct file_operations kcov_fops = {
> >   * the type of the kernel thread whose code is being annotated.
> >   *
> >   * For global kernel threads that are spawned in a limited number of instances
> > - * (e.g. one USB hub_event() worker thread is spawned per USB HCD), each
> > - * instance must be assigned a unique 4-byte instance id. The instance id is
> > - * then combined with a 1-byte subsystem id to get a handle via
> > + * (e.g. one USB hub_event() worker thread is spawned per USB HCD) and for
> > + * interrupts, each instance must be assigned a unique 4-byte instance id. The
> > + * instance id is then combined with a 1-byte subsystem id to get a handle via
> >   * kcov_remote_handle(subsystem_id, instance_id).
> >   *
> >   * For local kernel threads that are spawned from system calls handler when a
> > @@ -749,13 +761,48 @@ static const struct file_operations kcov_fops = {
> >   *
> >   * See Documentation/dev-tools/kcov.rst for more details.
> >   *
> > - * Internally, this function looks up the kcov device associated with the
> > + * Internally, kcov_remote_start() looks up the kcov device associated with the
> >   * provided handle, allocates an area for coverage collection, and saves the
> >   * pointers to kcov and area into the current task_struct to allow coverage to
> >   * be collected via __sanitizer_cov_trace_pc()
> >   * In turns kcov_remote_stop() clears those pointers from task_struct to stop
> >   * collecting coverage and copies all collected coverage into the kcov area.
> >   */
> > +
> > +void kcov_remote_swap_irq(struct task_struct *t,
> > +                               struct kcov_remote_irq_data *irq)
> > +{
> > +       t->kcov = xchg(&irq->kcov, t->kcov);
> > +       t->kcov_size = xchg(&irq->size, t->kcov_size);
>
>
> > +       t->kcov_area = xchg(&irq->area, t->kcov_area);
> > +       t->kcov_mode = xchg(&irq->mode, t->kcov_mode);
>
> Do we need these xchg here? Why?
> They look fishy. If somebody actually uses these fields concurrently,
> then they can get inconsistent kcov_area/size/mode, which will explode
> badly (overwrite beyond area). So these field atomic updates only seem
> to give a false sense of safety.
> If nobody uses this, then no need in atomic updates.
> If somebody uses this, atomic updates won't help.
>
>
> > +}
> > +
> > +bool kcov_remote_start_irq(struct task_struct *t)
> > +{
> > +       struct kcov_remote_irq_data *irq = &get_cpu_var(kcov_remote_irq);
>
> We are already (1) in interrupt and (2) inside of spin_lock_irqsave,
> and we seem to rely on that below when we do non-atomic xchg on
> t->kcov_interrupt. Do we need get/put_cpu_var here? It seems using
> this_cpu_ptr will make it simpler.
>
>
> > +
> > +       if (t->kcov_interrupt) {
> > +               /* Nested interrupt. */
> > +               put_cpu_var(kcov_remote_irq);
> > +               return false;
> > +       }
> > +       t->kcov_interrupt = true;
>
> I can't fully understand what happens with nested interrupts.
> We very much rely on the fact that we disabled interrupts for the
> whole traced region.
> But what happens with NMIs? Let's say nmi arrives when we set
> t->kcov_interrupt = true but did not execute kcov_remote_swap_irq yet
> (or worse, in the middle of kcov_remote_swap_irq)?
>
>
> > +       kcov_remote_swap_irq(t, irq);
> > +       put_cpu_var(kcov_remote_irq);
> > +       return true;
> > +}
> > +
> > +void kcov_remote_stop_irq(struct task_struct *t)
> > +{
> > +       struct kcov_remote_irq_data *irq = &get_cpu_var(kcov_remote_irq);
> > +
> > +       kcov_remote_swap_irq(t, irq);
>
> What is an NMI arrives while we are swapping?
>
>
> > +       t->kcov_interrupt = false;
> > +       local_irq_restore(irq->flags);
>
> Interesting. Is it OK to prolong irq disabling region that much?...
>
> > +       put_cpu_var(kcov_remote_irq);
> > +}
> > +
> >  void kcov_remote_start(u64 handle)
> >  {
> >         struct kcov_remote *remote;
> > @@ -764,28 +811,32 @@ void kcov_remote_start(u64 handle)
> >         unsigned int size;
> >         enum kcov_mode mode;
> >         int sequence;
> > +       unsigned long flags;
> >
> >         if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
> >                 return;
> > -       if (WARN_ON(!in_task()))
> > +       if (WARN_ON(in_nmi()))
> >                 return;
> >         t = current;
> >         /*
> > -        * Check that kcov_remote_start is not called twice
> > -        * nor called by user tasks (with enabled kcov).
> > +        * Check that kcov_remote_start is not called twice in background
> > +        * threads nor called by user tasks (with enabled kcov).
> >          */
> > -       if (WARN_ON(t->kcov))
> > +       if (WARN_ON(in_task() && t->kcov))
> >                 return;
> >
> > -       kcov_debug("handle = %llx\n", handle);
> > -
> > -       spin_lock(&kcov_remote_lock);
> > +       spin_lock_irqsave(&kcov_remote_lock, flags);
> >         remote = kcov_remote_find(handle);
> >         if (!remote) {
> > -               kcov_debug("no remote found");
> > -               spin_unlock(&kcov_remote_lock);
> > +               spin_unlock_irqrestore(&kcov_remote_lock, flags);
> >                 return;
> >         }
> > +       if (!in_task() && !kcov_remote_start_irq(t)) {
> > +               spin_unlock_irqrestore(&kcov_remote_lock, flags);
> > +               return;
> > +       }
> > +       kcov_debug("handle = %llx, context: %s\n", handle,
> > +                       in_task() ? "task" : "irq");
> >         /* Put in kcov_remote_stop(). */
> >         kcov_get(remote->kcov);
> >         t->kcov = remote->kcov;
> > @@ -793,11 +844,19 @@ void kcov_remote_start(u64 handle)
> >          * Read kcov fields before unlock to prevent races with
> >          * KCOV_DISABLE / kcov_remote_reset().
> >          */
> > -       size = remote->kcov->remote_size;
> > +       size = min_t(unsigned int, remote->kcov->remote_size,
> > +                       CONFIG_KCOV_IRQ_AREA_SIZE);
>
> This seems to only be relevant for the irq case.
>
> >         mode = remote->kcov->mode;
> >         sequence = remote->kcov->sequence;
> > -       area = kcov_remote_area_get(size);
> > -       spin_unlock(&kcov_remote_lock);
> > +       if (in_task()) {
> > +               area = kcov_remote_area_get(size);
> > +               spin_unlock_irqrestore(&kcov_remote_lock, flags);
> > +       } else {
> > +               area = *this_cpu_ptr(&kcov_irq_area);
> > +               /* Flags are restored by kcov_remote_stop_irq(). */
> > +               this_cpu_ptr(&kcov_remote_irq)->flags = flags;
> > +               spin_unlock(&kcov_remote_lock);
> > +       }
> >
> >         if (!area) {
> >                 area = vmalloc(size * sizeof(unsigned long));
>
> And this only for the !irq case, so may be better to move inside of
> the if above to not confuse the reader.
>
>
> > @@ -810,8 +869,6 @@ void kcov_remote_start(u64 handle)
> >         /* Reset coverage size. */
> >         *(u64 *)area = 0;
> >
> > -       kcov_debug("area = %px, size = %u", area, size);
> > -
> >         kcov_start(t, size, area, mode, sequence);
>
> Don't we overwrite and lose the original t->kcov_sequence here?

Overall it may benefit from more explicitly writing down exact
sequence of changes that happens with task state during start/stop.
We try to reuse some code in kcov_remote_swap_irq, but it confused me
a lot initially until I realized that we don't actually swap and that
rather save and restore.
We either need to rely on kcov_interrupt to start/stop tracing, but
then carefully arrange memory accesses in
kcov_remote_start_irq/stop_irq as we do in kcov_start/stop; or maybe
play by the rules and call kcov_stop on the current task, update
state, call kcov_start with interrupt state and do the opposite when
we stop irq tracing.
