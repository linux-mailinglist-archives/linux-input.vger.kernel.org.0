Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B900D34696
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 14:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbfFDMZ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 08:25:26 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36912 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbfFDMZX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jun 2019 08:25:23 -0400
Received: by mail-qt1-f194.google.com with SMTP id y57so13442724qtk.4
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2019 05:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EP1kH28ujlhXzrN0kJ5T1Zc8fE+8ihgsKbZLbgadYio=;
        b=MBnOIWXoaHSnP1+xTx20v3XjLuzuueiadJgDfnm7xxJhXc75J1utolsHDcTkR/Fh1s
         SS4cBptN6KVUH4P3YBgmK0ILo+8MMnm/ZMhn+/JCl8lYBCBWg6InZ/0CBIsehJgwqZxW
         QUxX3UDxuUiPMce6W2FGMmNm2VgvJ9zQQ/lm1mMZ/LHsm9heA+swBANKqXxPgxExBUDE
         h8s4ICsQo1ydya2hw3VcWppTt5UXZFqAQSDzlVjnrAd0dZWnz7g8U5yVvTfVtnI4ENf5
         OZjSHwcD2WTaLuNrl51q7TrLr3cgMGvONA1o12a9actcMbyt232wbkx4rL1vGxOPJQar
         4mVA==
X-Gm-Message-State: APjAAAXdeya3bfCg+dX5h8IS9ihhTxUlxYyC3z3olhbk9QVJzYAmcj3i
        0mXeT0N0skdkoL+lCLRHGpth5udrumUlK54e4+3Q8g==
X-Google-Smtp-Source: APXvYqy2IkU9jXINyPZOZyXZh6eR/WEO0Yn3TRuGEzbpdlfGyYjfroiCwS6PZwQ5TUnW4fCpgPPlAQ//lH4IvkNgp4E=
X-Received: by 2002:ac8:224d:: with SMTP id p13mr8000915qtp.154.1559651120317;
 Tue, 04 Jun 2019 05:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
 <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm> <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com>
 <8a17e6e2-b468-28fd-5b40-0c258ca7efa9@intel.com> <4689a737-6c40-b4ae-cc38-5df60318adce@redhat.com>
 <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com> <nycvar.YFH.7.76.1906010014150.1962@cbobk.fhfr.pm>
 <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com> <5471f010-cb42-c548-37e2-2b9c9eba1184@redhat.com>
 <CAO-hwJKRRpsShw6B-YLmsEnjQ+iYtz+VmZK+VSRcDmiBwnS+oA@mail.gmail.com>
 <e431dafc-0fb4-4be3-ac29-dcf125929090@redhat.com> <CAO-hwJ+5UYJMnuCS0UL4g45Xc181LraAzc-CMuYB2rcqKGe_Sw@mail.gmail.com>
 <CAO-hwJK0j8SottiqCdDseBW_vR=GjKO4YrFCtjzYeUh-eKPOpA@mail.gmail.com> <ea7b2dee-15a6-9b52-fbff-558c36cd72df@redhat.com>
In-Reply-To: <ea7b2dee-15a6-9b52-fbff-558c36cd72df@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 Jun 2019 14:25:07 +0200
Message-ID: <CAO-hwJ+ZBuXtuk+i1Q9DwO=uLXDh4oToQyMWhK-8t+ZTS-jUjA@mail.gmail.com>
Subject: Re: hid-related 5.2-rc1 boot hang
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000000038b4058a7e93ce"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000000038b4058a7e93ce
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 4, 2019 at 12:50 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 04-06-19 12:08, Benjamin Tissoires wrote:
> > On Tue, Jun 4, 2019 at 9:51 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> >>
> >> On Mon, Jun 3, 2019 at 4:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On 03-06-19 15:55, Benjamin Tissoires wrote:
> >>>> On Mon, Jun 3, 2019 at 11:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>
> >>>>> Hi Again,
> >>>>>
> >>>>> On 03-06-19 11:11, Hans de Goede wrote:
> >>>>> <snip>
> >>>>>
> >>>>>>> not sure about the rest of logitech issues yet) next week.
> >>>>>>
> >>>>>> The main problem seems to be the request_module patches. Although I also
> >>>>
> >>>> Can't we use request_module_nowait() instead, and set a reasonable
> >>>> timeout that we detect only once to check if userspace is compatible:
> >>>>
> >>>> In pseudo-code:
> >>>> if (!request_module_checked) {
> >>>>     request_module_nowait(name);
> >>>>     use_request_module = wait_event_timeout(wq,
> >>>>           first_module_loaded, 10 seconds in jiffies);
> >>>>     request_module_checked = true;
> >>>> } else if (use_request_module) {
> >>>>     request_module(name);
> >>>> }
> >>>
> >>> Well looking at the just attached dmesg , the modprobe
> >>> when triggered by udev from userspace succeeds in about
> >>> 0.5 seconds, so it seems that the modprobe hangs happens
> >>> when called from within the kernel rather then from within
> >>> userspace.
> >>>
> >>> What I do not know if is the hang is inside userspace, or
> >>> maybe it happens when modprobe calls back into the kernel,
> >>> if the hang happens when modprobe calls back into the kernel,
> >>> then other modprobes (done from udev) likely will hang too
> >>> since I think only 1 modprobe can happen at a time.
> >>>
> >>> I really wish we knew what distinguished working systems
> >>> from non working systems :|
> >>>
> >>> I cannot find a common denominator; other then the systems
> >>> are not running Fedora. So far we've reports from both Ubuntu 16.04
> >>> and Tumbleweed, so software version wise these 2 are wide apart.
> >>
> >> I am trying to reproduce the lock locally, and installed an opensuse
> >> Tumbleweed in a VM. When forwarding a Unifying receiver to the VM, I
> >> do not see the lock with either my vanilla compiled kernel and the rpm
> >> found in http://download.opensuse.org/repositories/Kernel:/HEAD/standard/x86_64/
> >>
> >> Next step is install Tumbleweed on bare metal, but I do not see how
> >> this could introduce a difference (maybe USB2 vs 3).
> >
> > Making progress here.
> >
> > The difference between Ubuntu/Tumbleweed and Fedora: usbhid is shipped
> > as a module while in Fedora usbhid is included in the kernel.
> >
> > If I rmmod hid_* and usbhid, then modprobe usbhid, the command hangs
> > for 3 minutes.
> > If usbhid is already loaded, inserting a receiver is immediate
> > regarding the loading of the external modules.
> >
> > So my assumption is that when the device gets detected at boot, usbhid
> > gets loaded by the kernel event, which in turns attempts to call
> > __request_module, but the modprobe can't be fulfilled because it's
> > already waiting for the initial usbhid modprobe to finish.
> >
> > Still don't know how to solve that, but I thought I should share.
>
> Hmm, we may be hitting the scenario described in the big comment
> around line 3500 of kernel/module.c.

Well, we are not locking during do_init_module(), but in waiting for
the completion of request_module(). So as I read the trace, we wait
for userspace to call/terminate modprobe.

>
> But I'm not sure that is what is happening here.
>
> Maybe you can put a WARN_ON(1) in request_module and look at the
> backtrace ?  That may help to figure out what is going on; or
> alternatively it might help to find some way to detect this and
> if it happens skip the request_module...

Ftrace is much easier to deal with:
---
/sys/kernel/debug/tracing # cat trace
# tracer: function
#
# entries-in-buffer/entries-written: 4/4   #P:4
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
        modprobe-23236 [003] ....  9191.880917: __request_module
<-hid_add_device
        modprobe-23236 [003] ....  9191.880937: <stack trace>
 => 0xffffffffc0851061
 => __request_module
 => hid_add_device
 => usbhid_probe
 => usb_probe_interface
 => really_probe
 => driver_probe_device
 => device_driver_attach
 => __driver_attach
 => bus_for_each_dev
 => bus_add_driver
 => driver_register
 => usb_register_driver
 => hid_init
 => do_one_initcall
 => do_init_module
 => load_module
 => __do_sys_finit_module
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
        modprobe-23236 [003] ....  9191.892765: __request_module
<-hid_add_device
        modprobe-23236 [003] ....  9191.892784: <stack trace>
 => 0xffffffffc0851061
 => __request_module
 => hid_add_device
 => usbhid_probe
 => usb_probe_interface
 => really_probe
 => driver_probe_device
 => device_driver_attach
 => __driver_attach
 => bus_for_each_dev
 => bus_add_driver
 => driver_register
 => usb_register_driver
 => hid_init
 => do_one_initcall
 => do_init_module
 => load_module
 => __do_sys_finit_module
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
---

This is what happen with the logitech receiver plugged in and while
modprobing usbhid. The modprobe command hangs, and I took the trace
here.
If I hit Ctrl-C, the modprobe loading continue properly.

There is nothing special here in the stack trace, except that there
are 2 calls to request_module here (one for the touchscreen I guess
and one for the logitech receiver).

I have attached the call graph of the same sequence:
wait_for_completion_killable() seems to be the culprit, we are waiting
for userspace to notify it has done calling modprobe.

My idea would be to defer any call to hid_add_device() into a
workqueue and see if that unlocks the situation.

Cheers,
Benjamin

--0000000000000038b4058a7e93ce
Content-Type: text/plain; charset="US-ASCII"; name="function_graph.txt"
Content-Disposition: attachment; filename="function_graph.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jwhrxht70>
X-Attachment-Id: f_jwhrxht70

L3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZyAjIGNhdCB0cmFjZQojIHRyYWNlcjogZnVuY3Rpb25f
Z3JhcGgKIwojIENQVSAgRFVSQVRJT04gICAgICAgICAgICAgICAgICBGVU5DVElPTiBDQUxMUwoj
IHwgICAgIHwgICB8ICAgICAgICAgICAgICAgICAgICAgfCAgIHwgICB8ICAgfAogMCkgICAgICAg
ICAgICAgICB8ICBfX3JlcXVlc3RfbW9kdWxlKCkgewogMCkgICAwLjI1NiB1cyAgICB8ICAgIGN1
cnJlbnRfaXNfYXN5bmMoKTsKIDApICAgICAgICAgICAgICAgfCAgICBzZWN1cml0eV9rZXJuZWxf
bW9kdWxlX3JlcXVlc3QoKSB7CiAwKSAgIDAuMzA3IHVzICAgIHwgICAgICBpbnRlZ3JpdHlfa2Vy
bmVsX21vZHVsZV9yZXF1ZXN0KCk7CiAwKSAgIDAuNjI1IHVzICAgIHwgICAgfQogMCkgICAgICAg
ICAgICAgICB8ICAgIGttZW1fY2FjaGVfYWxsb2NfdHJhY2UoKSB7CiAwKSAgICAgICAgICAgICAg
IHwgICAgICBfY29uZF9yZXNjaGVkKCkgewogMCkgICAwLjEyMyB1cyAgICB8ICAgICAgICByY3Vf
YWxsX3FzKCk7CiAwKSAgIDAuMzU1IHVzICAgIHwgICAgICB9CiAwKSAgIDAuMTIyIHVzICAgIHwg
ICAgICBzaG91bGRfZmFpbHNsYWIoKTsKIDApICAgICAgICAgICAgICAgfCAgICAgIF9jb25kX3Jl
c2NoZWQoKSB7CiAwKSAgIDAuMTIwIHVzICAgIHwgICAgICAgIHJjdV9hbGxfcXMoKTsKIDApICAg
MC4zNTUgdXMgICAgfCAgICAgIH0KIDApICAgMC4xMjAgdXMgICAgfCAgICAgIG1lbWNnX2ttZW1f
cHV0X2NhY2hlKCk7CiAwKSAgIDEuNTYzIHVzICAgIHwgICAgfQogMCkgICAgICAgICAgICAgICB8
ICAgIGtzdHJkdXAoKSB7CiAwKSAgICAgICAgICAgICAgIHwgICAgICBfX2ttYWxsb2NfdHJhY2tf
Y2FsbGVyKCkgewogMCkgICAwLjExNSB1cyAgICB8ICAgICAgICBrbWFsbG9jX3NsYWIoKTsKIDAp
ICAgICAgICAgICAgICAgfCAgICAgICAgX2NvbmRfcmVzY2hlZCgpIHsKIDApICAgMC4xMTggdXMg
ICAgfCAgICAgICAgICByY3VfYWxsX3FzKCk7CiAwKSAgIDAuMzQ4IHVzICAgIHwgICAgICAgIH0K
IDApICAgMC4xMTkgdXMgICAgfCAgICAgICAgc2hvdWxkX2ZhaWxzbGFiKCk7CiAwKSAgICAgICAg
ICAgICAgIHwgICAgICAgIF9jb25kX3Jlc2NoZWQoKSB7CiAwKSAgIDAuMTE1IHVzICAgIHwgICAg
ICAgICAgcmN1X2FsbF9xcygpOwogMCkgICAwLjM0NSB1cyAgICB8ICAgICAgICB9CiAwKSAgIDAu
MTE5IHVzICAgIHwgICAgICAgIG1lbWNnX2ttZW1fcHV0X2NhY2hlKCk7CiAwKSAgIDEuNzU3IHVz
ICAgIHwgICAgICB9CiAwKSAgIDIuMDQwIHVzICAgIHwgICAgfQogMCkgICAgICAgICAgICAgICB8
ICAgIGNhbGxfdXNlcm1vZGVoZWxwZXJfc2V0dXAoKSB7CiAwKSAgICAgICAgICAgICAgIHwgICAg
ICBrbWVtX2NhY2hlX2FsbG9jX3RyYWNlKCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAgICBf
Y29uZF9yZXNjaGVkKCkgewogMCkgICAwLjExNiB1cyAgICB8ICAgICAgICAgIHJjdV9hbGxfcXMo
KTsKIDApICAgMC4zNDUgdXMgICAgfCAgICAgICAgfQogMCkgICAwLjExNyB1cyAgICB8ICAgICAg
ICBzaG91bGRfZmFpbHNsYWIoKTsKIDApICAgICAgICAgICAgICAgfCAgICAgICAgX2NvbmRfcmVz
Y2hlZCgpIHsKIDApICAgMC4xMTggdXMgICAgfCAgICAgICAgICByY3VfYWxsX3FzKCk7CiAwKSAg
IDAuMzQ3IHVzICAgIHwgICAgICAgIH0KIDApICAgMC4xMjMgdXMgICAgfCAgICAgICAgbWVtY2df
a21lbV9wdXRfY2FjaGUoKTsKIDApICAgMS43OTIgdXMgICAgfCAgICAgIH0KIDApICAgMi4wMjMg
dXMgICAgfCAgICB9CiAwKSAgICAgICAgICAgICAgIHwgICAgY2FsbF91c2VybW9kZWhlbHBlcl9l
eGVjKCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAgcXVldWVfd29ya19vbigpIHsKIDApICAg
ICAgICAgICAgICAgfCAgICAgICAgX19xdWV1ZV93b3JrKCkgewogMCkgICAwLjEyNiB1cyAgICB8
ICAgICAgICAgIGdldF93b3JrX3Bvb2woKTsKIDApICAgMC4xODMgdXMgICAgfCAgICAgICAgICBf
cmF3X3NwaW5fbG9jaygpOwogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgIGluc2VydF93b3Jr
KCkgewogMCkgICAwLjEyMSB1cyAgICB8ICAgICAgICAgICAgZ2V0X3B3cS5pc3JhLjAoKTsKIDAp
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgIHdha2VfdXBfcHJvY2VzcygpIHsKIDApICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgdHJ5X3RvX3dha2VfdXAoKSB7CiAwKSAgIDAuMjI3IHVz
ICAgIHwgICAgICAgICAgICAgICAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSgpOwogMCkgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgIHNlbGVjdF90YXNrX3JxX2ZhaXIoKSB7CiAwKSAgIDAu
MTMzIHVzICAgIHwgICAgICAgICAgICAgICAgICBhdmFpbGFibGVfaWRsZV9jcHUoKTsKIDApICAg
MC4xNjYgdXMgICAgfCAgICAgICAgICAgICAgICAgIHVwZGF0ZV9jZnNfcnFfaF9sb2FkKCk7CiAw
KSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICBzZWxlY3RfaWRsZV9zaWJsaW5nKCkg
ewogMCkgICAwLjEzNyB1cyAgICB8ICAgICAgICAgICAgICAgICAgICBhdmFpbGFibGVfaWRsZV9j
cHUoKTsKIDApICAgMC4zNzEgdXMgICAgfCAgICAgICAgICAgICAgICAgIH0KIDApICAgMS4yOTkg
dXMgICAgfCAgICAgICAgICAgICAgICB9CiAwKSAgIDAuMTMzIHVzICAgIHwgICAgICAgICAgICAg
ICAgX3Jhd19zcGluX2xvY2soKTsKIDApICAgMC4xNDggdXMgICAgfCAgICAgICAgICAgICAgICB1
cGRhdGVfcnFfY2xvY2soKTsKIDApICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICB0dHd1
X2RvX2FjdGl2YXRlKCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgYWN0
aXZhdGVfdGFzaygpIHsKIDApICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgZW5x
dWV1ZV90YXNrX2ZhaXIoKSB7CiAwKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgZW5xdWV1ZV9lbnRpdHkoKSB7CiAwKSAgIDAuMTIzIHVzICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICB1cGRhdGVfY3VycigpOwogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgX191cGRhdGVfbG9hZF9hdmdfc2UoKSB7CiAwKSAgIDAuMTE4IHVzICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fYWNjdW11bGF0ZV9wZWx0X3NlZ21lbnRzKCk7CiAwKSAg
IDAuNDIwIHVzICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB9CiAwKSAgIDAuMTI1IHVzICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICBfX3VwZGF0ZV9sb2FkX2F2Z19jZnNfcnEoKTsKIDAp
ICAgMC4xMjIgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHVwZGF0ZV9jZnNfZ3JvdXAo
KTsKIDApICAgMC4xMzggdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIGFjY291bnRfZW50
aXR5X2VucXVldWUoKTsKIDApICAgMC4xMjAgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
IHBsYWNlX2VudGl0eSgpOwogMCkgICAwLjExOSB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgX19lbnF1ZXVlX2VudGl0eSgpOwogMCkgICAyLjE0NiB1cyAgICB8ICAgICAgICAgICAgICAg
ICAgICAgIH0KIDApICAgMC4xMTUgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICBocnRpY2tf
dXBkYXRlKCk7CiAwKSAgIDIuNjI0IHVzICAgIHwgICAgICAgICAgICAgICAgICAgIH0KIDApICAg
Mi44OTAgdXMgICAgfCAgICAgICAgICAgICAgICAgIH0KIDApICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgIHR0d3VfZG9fd2FrZXVwKCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICBjaGVja19wcmVlbXB0X2N1cnIoKSB7CiAwKSAgIDAuMTMwIHVzICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgcmVzY2hlZF9jdXJyKCk7CiAwKSAgIDAuNDE3IHVzICAgIHwg
ICAgICAgICAgICAgICAgICAgIH0KIDApICAgMS4wMzQgdXMgICAgfCAgICAgICAgICAgICAgICAg
IH0KIDApICAgNC4yNjkgdXMgICAgfCAgICAgICAgICAgICAgICB9CiAwKSAgIDAuNDEwIHVzICAg
IHwgICAgICAgICAgICAgICAgX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCk7CiAwKSAgIDcu
NDY2IHVzICAgIHwgICAgICAgICAgICAgIH0KIDApICAgNy43MDIgdXMgICAgfCAgICAgICAgICAg
IH0KIDApICAgOC4xNjQgdXMgICAgfCAgICAgICAgICB9CiAwKSAgIDkuMDc5IHVzICAgIHwgICAg
ICAgIH0KIDApICAgOS4zNzAgdXMgICAgfCAgICAgIH0KIDApICAgICAgICAgICAgICAgfCAgICAg
IHdhaXRfZm9yX2NvbXBsZXRpb25fa2lsbGFibGUoKSB7CiAwKSAgICAgICAgICAgICAgIHwgICAg
ICAgIF9jb25kX3Jlc2NoZWQoKSB7CiAwKSAgIDAuMTE4IHVzICAgIHwgICAgICAgICAgcmN1X2Fs
bF9xcygpOwogMCkgICAwLjM2NSB1cyAgICB8ICAgICAgICB9CiAwKSAgIDAuMTIyIHVzICAgIHwg
ICAgICAgIF9yYXdfc3Bpbl9sb2NrX2lycSgpOwogMCkgICAgICAgICAgICAgICB8ICAgICAgICBz
Y2hlZHVsZV90aW1lb3V0KCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgIHNjaGVkdWxl
KCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgICAgcmN1X25vdGVfY29udGV4dF9zd2l0
Y2goKSB7CiAwKSAgIDAuMTQ3IHVzICAgIHwgICAgICAgICAgICAgIHJjdV9xcygpOwogMCkgICAw
LjM4NCB1cyAgICB8ICAgICAgICAgICAgfQogMCkgICAwLjEyNCB1cyAgICB8ICAgICAgICAgICAg
X3Jhd19zcGluX2xvY2soKTsKIDApICAgMC4xNDQgdXMgICAgfCAgICAgICAgICAgIHVwZGF0ZV9y
cV9jbG9jaygpOwogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgICAgZGVhY3RpdmF0ZV90YXNr
KCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBkZXF1ZXVlX3Rhc2tfZmFpcigp
IHsKIDApICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICBkZXF1ZXVlX2VudGl0eSgpIHsK
IDApICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHVwZGF0ZV9jdXJyKCkgewogMCkg
ICAwLjEyMSB1cyAgICB8ICAgICAgICAgICAgICAgICAgICB1cGRhdGVfbWluX3ZydW50aW1lKCk7
CiAwKSAgIDAuMTMyIHVzICAgIHwgICAgICAgICAgICAgICAgICAgIGNwdWFjY3RfY2hhcmdlKCk7
CiAwKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgIF9fY2dyb3VwX2FjY291bnRf
Y3B1dGltZSgpIHsKIDApICAgMC4xMjQgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICBjZ3Jv
dXBfcnN0YXRfdXBkYXRlZCgpOwogMCkgICAwLjM1NCB1cyAgICB8ICAgICAgICAgICAgICAgICAg
ICB9CiAwKSAgIDEuMDg4IHVzICAgIHwgICAgICAgICAgICAgICAgICB9CiAwKSAgIDAuMTI3IHVz
ICAgIHwgICAgICAgICAgICAgICAgICBfX3VwZGF0ZV9sb2FkX2F2Z19zZSgpOwogMCkgICAwLjEz
NiB1cyAgICB8ICAgICAgICAgICAgICAgICAgX191cGRhdGVfbG9hZF9hdmdfY2ZzX3JxKCk7CiAw
KSAgIDAuMTE4IHVzICAgIHwgICAgICAgICAgICAgICAgICBjbGVhcl9idWRkaWVzKCk7CiAwKSAg
IDAuMTI0IHVzICAgIHwgICAgICAgICAgICAgICAgICBhY2NvdW50X2VudGl0eV9kZXF1ZXVlKCk7
CiAwKSAgIDAuMTIwIHVzICAgIHwgICAgICAgICAgICAgICAgICB1cGRhdGVfY2ZzX2dyb3VwKCk7
CiAwKSAgIDAuMTI4IHVzICAgIHwgICAgICAgICAgICAgICAgICB1cGRhdGVfbWluX3ZydW50aW1l
KCk7CiAwKSAgIDIuNzgwIHVzICAgIHwgICAgICAgICAgICAgICAgfQogMCkgICAwLjExNCB1cyAg
ICB8ICAgICAgICAgICAgICAgIGhydGlja191cGRhdGUoKTsKIDApICAgMy4yNDIgdXMgICAgfCAg
ICAgICAgICAgICAgfQogMCkgICAzLjUwMyB1cyAgICB8ICAgICAgICAgICAgfQogMCkgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgcGlja19uZXh0X3Rhc2tfZmFpcigpIHsKIDApICAgMC4xMjEg
dXMgICAgfCAgICAgICAgICAgICAgX19tc2Vjc190b19qaWZmaWVzKCk7CiAwKSAgIDAuMzg5IHVz
ICAgIHwgICAgICAgICAgICB9CiAwKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICBwaWNrX25l
eHRfdGFza19pZGxlKCkgewogMCkgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBwdXRfcHJl
dl90YXNrX2ZhaXIoKSB7CiAwKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgcHV0X3By
ZXZfZW50aXR5KCkgewogMCkgICAwLjEyMiB1cyAgICB8ICAgICAgICAgICAgICAgICAgY2hlY2tf
Y2ZzX3JxX3J1bnRpbWUoKTsKIDApICAgMC4zNTUgdXMgICAgfCAgICAgICAgICAgICAgICB9CiAw
KSAgIDAuNTgxIHVzICAgIHwgICAgICAgICAgICAgIH0KIDApICAgMC4xMjMgdXMgICAgfCAgICAg
ICAgICAgICAgX191cGRhdGVfaWRsZV9jb3JlKCk7CiAwKSAgIDEuMDU1IHVzICAgIHwgICAgICAg
ICAgICB9CiAwKSAgIDAuMTE4IHVzICAgIHwgICAgICAgICAgICBlbnRlcl9sYXp5X3RsYigpOwog
MikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgZmluaXNoX3Rhc2tfc3dpdGNoKCkgewogMikg
ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBfX21tZHJvcCgpIHsKIDIpICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICBwZ2RfZnJlZSgpIHsKIDIpICAgMC4yNDggdXMgICAgfCAgICAg
ICAgICAgICAgICAgIF9yYXdfc3Bpbl9sb2NrKCk7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICBmcmVlX3BhZ2VzKCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICBmcmVlX3BhZ2VzLnBhcnQuMCgpIHsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICBfX2ZyZWVfcGFnZXMoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICBfX2ZyZWVfcGFnZXNfb2soKSB7CiAyKSAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZyZWVfb25lX3BhZ2UoKSB7CiAyKSAgIDAuMjEzIHVz
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgX3Jhd19zcGluX2xvY2soKTsKIDIpICAg
MC4yMTkgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX21vZF96b25lX3BhZ2Vf
c3RhdGUoKTsKIDIpICAgMS4xMDIgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgfQog
MikgICAxLjgzOSB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfQogMikgICAyLjMzNyB1
cyAgICB8ICAgICAgICAgICAgICAgICAgICAgIH0KIDIpICAgMi42NzIgdXMgICAgfCAgICAgICAg
ICAgICAgICAgICAgfQogMikgICAyLjk4NiB1cyAgICB8ICAgICAgICAgICAgICAgICAgfQogMikg
ICA0LjA0NCB1cyAgICB8ICAgICAgICAgICAgICAgIH0KIDIpICAgMC4yMTggdXMgICAgfCAgICAg
ICAgICAgICAgICBkZXN0cm95X2NvbnRleHRfbGR0KCk7CiAyKSAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAga21lbV9jYWNoZV9mcmVlKCkgewogMikgICAwLjQxNiB1cyAgICB8ICAgICAg
ICAgICAgICAgICAgX19fY2FjaGVfZnJlZSgpOwogMikgICAxLjA1MSB1cyAgICB8ICAgICAgICAg
ICAgICAgIH0KIDIpICAgNi4yMzQgdXMgICAgfCAgICAgICAgICAgICAgfQogMikgICA4LjU0MiB1
cyAgICB8ICAgICAgICAgICAgfQogMikgKiAxMzMwOC40OSB1cyB8ICAgICAgICAgIH0gLyogc2No
ZWR1bGUgKi8KIDIpICogMTMzMDguODUgdXMgfCAgICAgICAgfSAvKiBzY2hlZHVsZV90aW1lb3V0
ICovCiAyKSAgIDAuMjM1IHVzICAgIHwgICAgICAgIF9yYXdfc3Bpbl9sb2NrX2lycSgpOwogMikg
KiAxMzMxMC40NyB1cyB8ICAgICAgfSAvKiB3YWl0X2Zvcl9jb21wbGV0aW9uX2tpbGxhYmxlICov
CiAyKSAgICAgICAgICAgICAgIHwgICAgICBmcmVlX21vZHByb2JlX2FyZ3YoKSB7CiAyKSAgICAg
ICAgICAgICAgIHwgICAgICAgIGtmcmVlKCkgewogMikgICAwLjIxMyB1cyAgICB8ICAgICAgICAg
IF9fX2NhY2hlX2ZyZWUoKTsKIDIpICAgMC42NTcgdXMgICAgfCAgICAgICAgfQogMikgICAgICAg
ICAgICAgICB8ICAgICAgICBrZnJlZSgpIHsKIDIpICAgMC4xNTMgdXMgICAgfCAgICAgICAgICBf
X19jYWNoZV9mcmVlKCk7CiAyKSAgIDAuNTU3IHVzICAgIHwgICAgICAgIH0KIDIpICAgMS43MzIg
dXMgICAgfCAgICAgIH0KIDIpICAgICAgICAgICAgICAgfCAgICAgIGtmcmVlKCkgewogMikgICAw
LjIwNyB1cyAgICB8ICAgICAgICBfX19jYWNoZV9mcmVlKCk7CiAyKSAgIDAuNzM0IHVzICAgIHwg
ICAgICB9CiAyKSAgICAgICAgICAgICAgIHwgICAgICBfX3dha2VfdXAoKSB7CiAyKSAgICAgICAg
ICAgICAgIHwgICAgICAgIF9fd2FrZV91cF9jb21tb25fbG9jaygpIHsKIDIpICAgMC4yNjUgdXMg
ICAgfCAgICAgICAgICBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKCk7CiAyKSAgIDAuMTk5IHVzICAg
IHwgICAgICAgICAgX193YWtlX3VwX2NvbW1vbigpOwogMikgICAwLjIxNCB1cyAgICB8ICAgICAg
ICAgIF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgpOwogMikgICAxLjMzMyB1cyAgICB8ICAg
ICAgICB9CiAyKSAgIDEuNjQ4IHVzICAgIHwgICAgICB9CiAyKSAqIDEzMzI1LjUxIHVzIHwgICAg
fSAvKiBjYWxsX3VzZXJtb2RlaGVscGVyX2V4ZWMgKi8KIDIpICAgICAgICAgICAgICAgfCAgICBf
X3dha2VfdXAoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICBfX3dha2VfdXBfY29tbW9uX2xv
Y2soKSB7CiAyKSAgIDAuMTk1IHVzICAgIHwgICAgICAgIF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUo
KTsKIDIpICAgMC4yMDAgdXMgICAgfCAgICAgICAgX193YWtlX3VwX2NvbW1vbigpOwogMikgICAw
LjE4OSB1cyAgICB8ICAgICAgICBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoKTsKIDIpICAg
MS4yNzQgdXMgICAgfCAgICAgIH0KIDIpICAgMS42MjkgdXMgICAgfCAgICB9CiAyKSAqIDEzMzM3
LjM3IHVzIHwgIH0gLyogX19yZXF1ZXN0X21vZHVsZSAqLwogMikgICAgICAgICAgICAgICB8ICBf
X3JlcXVlc3RfbW9kdWxlKCkgewogMikgICAwLjI3OSB1cyAgICB8ICAgIGN1cnJlbnRfaXNfYXN5
bmMoKTsKIDIpICAgICAgICAgICAgICAgfCAgICBzZWN1cml0eV9rZXJuZWxfbW9kdWxlX3JlcXVl
c3QoKSB7CiAyKSAgIDAuMzEwIHVzICAgIHwgICAgICBpbnRlZ3JpdHlfa2VybmVsX21vZHVsZV9y
ZXF1ZXN0KCk7CiAyKSAgIDAuNzk5IHVzICAgIHwgICAgfQogMikgICAgICAgICAgICAgICB8ICAg
IGttZW1fY2FjaGVfYWxsb2NfdHJhY2UoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICBfY29u
ZF9yZXNjaGVkKCkgewogMikgICAwLjIwOSB1cyAgICB8ICAgICAgICByY3VfYWxsX3FzKCk7CiAy
KSAgIDAuNTk4IHVzICAgIHwgICAgICB9CiAyKSAgIDAuMjA4IHVzICAgIHwgICAgICBzaG91bGRf
ZmFpbHNsYWIoKTsKIDIpICAgICAgICAgICAgICAgfCAgICAgIF9jb25kX3Jlc2NoZWQoKSB7CiAy
KSAgIDAuMjAyIHVzICAgIHwgICAgICAgIHJjdV9hbGxfcXMoKTsKIDIpICAgMC41OTcgdXMgICAg
fCAgICAgIH0KIDIpICAgMC4yMDYgdXMgICAgfCAgICAgIG1lbWNnX2ttZW1fcHV0X2NhY2hlKCk7
CiAyKSAgIDIuNTk2IHVzICAgIHwgICAgfQogMikgICAgICAgICAgICAgICB8ICAgIGtzdHJkdXAo
KSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICBfX2ttYWxsb2NfdHJhY2tfY2FsbGVyKCkgewog
MikgICAwLjIwOSB1cyAgICB8ICAgICAgICBrbWFsbG9jX3NsYWIoKTsKIDIpICAgICAgICAgICAg
ICAgfCAgICAgICAgX2NvbmRfcmVzY2hlZCgpIHsKIDIpICAgMC4yMDAgdXMgICAgfCAgICAgICAg
ICByY3VfYWxsX3FzKCk7CiAyKSAgIDAuNTk4IHVzICAgIHwgICAgICAgIH0KIDIpICAgMC4zOTkg
dXMgICAgfCAgICAgICAgc2hvdWxkX2ZhaWxzbGFiKCk7CiAyKSAgICAgICAgICAgICAgIHwgICAg
ICAgIF9jb25kX3Jlc2NoZWQoKSB7CiAyKSAgIDAuMTc5IHVzICAgIHwgICAgICAgICAgcmN1X2Fs
bF9xcygpOwogMikgICAwLjQ5MSB1cyAgICB8ICAgICAgICB9CiAyKSAgIDAuMTc0IHVzICAgIHwg
ICAgICAgIG1lbWNnX2ttZW1fcHV0X2NhY2hlKCk7CiAyKSAgIDMuMDA0IHVzICAgIHwgICAgICB9
CiAyKSAgIDMuNDI0IHVzICAgIHwgICAgfQogMikgICAgICAgICAgICAgICB8ICAgIGNhbGxfdXNl
cm1vZGVoZWxwZXJfc2V0dXAoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICBrbWVtX2NhY2hl
X2FsbG9jX3RyYWNlKCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICBfY29uZF9yZXNjaGVk
KCkgewogMikgICAwLjE3MSB1cyAgICB8ICAgICAgICAgIHJjdV9hbGxfcXMoKTsKIDIpICAgMC44
MTYgdXMgICAgfCAgICAgICAgfQogMikgICAwLjE3MyB1cyAgICB8ICAgICAgICBzaG91bGRfZmFp
bHNsYWIoKTsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAgX2NvbmRfcmVzY2hlZCgpIHsKIDIp
ICAgMC4xODggdXMgICAgfCAgICAgICAgICByY3VfYWxsX3FzKCk7CiAyKSAgIDAuNTQ0IHVzICAg
IHwgICAgICAgIH0KIDIpICAgMC4yMDUgdXMgICAgfCAgICAgICAgbWVtY2dfa21lbV9wdXRfY2Fj
aGUoKTsKIDIpICAgMi43MjggdXMgICAgfCAgICAgIH0KIDIpICAgMy4xMDAgdXMgICAgfCAgICB9
CiAyKSAgICAgICAgICAgICAgIHwgICAgY2FsbF91c2VybW9kZWhlbHBlcl9leGVjKCkgewogMikg
ICAgICAgICAgICAgICB8ICAgICAgcXVldWVfd29ya19vbigpIHsKIDIpICAgICAgICAgICAgICAg
fCAgICAgICAgX19xdWV1ZV93b3JrKCkgewogMikgICAwLjIxMyB1cyAgICB8ICAgICAgICAgIGdl
dF93b3JrX3Bvb2woKTsKIDIpICAgMC4yMDYgdXMgICAgfCAgICAgICAgICBfcmF3X3NwaW5fbG9j
aygpOwogMikgICAgICAgICAgICAgICB8ICAgICAgICAgIGluc2VydF93b3JrKCkgewogMikgICAw
LjE5NCB1cyAgICB8ICAgICAgICAgICAgZ2V0X3B3cS5pc3JhLjAoKTsKIDIpICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgIHdha2VfdXBfcHJvY2VzcygpIHsKIDIpICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgdHJ5X3RvX3dha2VfdXAoKSB7CiAyKSAgIDAuMjQ4IHVzICAgIHwgICAgICAg
ICAgICAgICAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSgpOwogMikgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgICAgIHNlbGVjdF90YXNrX3JxX2ZhaXIoKSB7CiAyKSAgIDAuMjA1IHVzICAgIHwg
ICAgICAgICAgICAgICAgICBhdmFpbGFibGVfaWRsZV9jcHUoKTsKIDIpICAgMC4yNTIgdXMgICAg
fCAgICAgICAgICAgICAgICAgIHVwZGF0ZV9jZnNfcnFfaF9sb2FkKCk7CiAyKSAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICBzZWxlY3RfaWRsZV9zaWJsaW5nKCkgewogMikgICAwLjI3
NyB1cyAgICB8ICAgICAgICAgICAgICAgICAgICBhdmFpbGFibGVfaWRsZV9jcHUoKTsKIDIpICAg
MC42NjYgdXMgICAgfCAgICAgICAgICAgICAgICAgIH0KIDIpICAgMi4wNzQgdXMgICAgfCAgICAg
ICAgICAgICAgICB9CiAyKSAgIDAuMjEzIHVzICAgIHwgICAgICAgICAgICAgICAgX3Jhd19zcGlu
X2xvY2soKTsKIDIpICAgMC4yNDAgdXMgICAgfCAgICAgICAgICAgICAgICB1cGRhdGVfcnFfY2xv
Y2soKTsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICB0dHd1X2RvX2FjdGl2YXRl
KCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgYWN0aXZhdGVfdGFzaygp
IHsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgZW5xdWV1ZV90YXNrX2Zh
aXIoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgZW5xdWV1ZV9l
bnRpdHkoKSB7CiAyKSAgIDAuMjA5IHVzICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB1cGRh
dGVfY3VycigpOwogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgX191
cGRhdGVfbG9hZF9hdmdfc2UoKSB7CiAyKSAgIDAuMTk4IHVzICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgIF9fYWNjdW11bGF0ZV9wZWx0X3NlZ21lbnRzKCk7CiAyKSAgIDAuNzE1IHVzICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICB9CiAyKSAgIDAuMjIxIHVzICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICBfX3VwZGF0ZV9sb2FkX2F2Z19jZnNfcnEoKTsKIDIpICAgMC4yMDUgdXMg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHVwZGF0ZV9jZnNfZ3JvdXAoKTsKIDIpICAgMC4y
NzQgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIGFjY291bnRfZW50aXR5X2VucXVldWUo
KTsKIDIpICAgMC4yMDkgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHBsYWNlX2VudGl0
eSgpOwogMikgICAwLjIxMSB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgX19lbnF1ZXVl
X2VudGl0eSgpOwogMikgICAzLjcxOCB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAgIH0KIDIp
ICAgMC4yMDggdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICBocnRpY2tfdXBkYXRlKCk7CiAy
KSAgIDQuNTY4IHVzICAgIHwgICAgICAgICAgICAgICAgICAgIH0KIDIpICAgNS4wMDUgdXMgICAg
fCAgICAgICAgICAgICAgICAgIH0KIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
IHR0d3VfZG9fd2FrZXVwKCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICBjaGVja19wcmVlbXB0X2N1cnIoKSB7CiAyKSAgIDAuMjIyIHVzICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgcmVzY2hlZF9jdXJyKCk7CiAyKSAgIDAuNzAwIHVzICAgIHwgICAgICAgICAgICAg
ICAgICAgIH0KIDIpICAgMS40NzMgdXMgICAgfCAgICAgICAgICAgICAgICAgIH0KIDIpICAgNy4w
OTggdXMgICAgfCAgICAgICAgICAgICAgICB9CiAyKSAgIDAuMjE4IHVzICAgIHwgICAgICAgICAg
ICAgICAgX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCk7CiAyKSArIDExLjYwNSB1cyAgIHwg
ICAgICAgICAgICAgIH0KIDIpICsgMTEuOTQ3IHVzICAgfCAgICAgICAgICAgIH0KIDIpICsgMTIu
NzMwIHVzICAgfCAgICAgICAgICB9CiAyKSArIDE0LjA5MSB1cyAgIHwgICAgICAgIH0KIDIpICsg
MTQuNTI3IHVzICAgfCAgICAgIH0KIDIpICAgICAgICAgICAgICAgfCAgICAgIHdhaXRfZm9yX2Nv
bXBsZXRpb25fa2lsbGFibGUoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAgIF9jb25kX3Jl
c2NoZWQoKSB7CiAyKSAgIDAuMjEwIHVzICAgIHwgICAgICAgICAgcmN1X2FsbF9xcygpOwogMikg
ICAwLjYzNiB1cyAgICB8ICAgICAgICB9CiAyKSAgIDAuMjQxIHVzICAgIHwgICAgICAgIF9yYXdf
c3Bpbl9sb2NrX2lycSgpOwogMikgICAgICAgICAgICAgICB8ICAgICAgICBzY2hlZHVsZV90aW1l
b3V0KCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICAgIHNjaGVkdWxlKCkgewogMikgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgcmN1X25vdGVfY29udGV4dF9zd2l0Y2goKSB7CiAyKSAg
IDAuMjE3IHVzICAgIHwgICAgICAgICAgICAgIHJjdV9xcygpOwogMikgICAwLjYxOCB1cyAgICB8
ICAgICAgICAgICAgfQogMikgICAwLjIwMCB1cyAgICB8ICAgICAgICAgICAgX3Jhd19zcGluX2xv
Y2soKTsKIDIpICAgMC4yMTMgdXMgICAgfCAgICAgICAgICAgIHVwZGF0ZV9ycV9jbG9jaygpOwog
MikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgZGVhY3RpdmF0ZV90YXNrKCkgewogMikgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICBkZXF1ZXVlX3Rhc2tfZmFpcigpIHsKIDIpICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgICBkZXF1ZXVlX2VudGl0eSgpIHsKIDIpICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgIHVwZGF0ZV9jdXJyKCkgewogMikgICAwLjE5NiB1cyAg
ICB8ICAgICAgICAgICAgICAgICAgICB1cGRhdGVfbWluX3ZydW50aW1lKCk7CiAyKSAgIDAuMjM5
IHVzICAgIHwgICAgICAgICAgICAgICAgICAgIGNwdWFjY3RfY2hhcmdlKCk7CiAyKSAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgIF9fY2dyb3VwX2FjY291bnRfY3B1dGltZSgpIHsK
IDIpICAgMC4yMDIgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICBjZ3JvdXBfcnN0YXRfdXBk
YXRlZCgpOwogMikgICAwLjYzOCB1cyAgICB8ICAgICAgICAgICAgICAgICAgICB9CiAyKSAgIDEu
OTQ2IHVzICAgIHwgICAgICAgICAgICAgICAgICB9CiAyKSAgIDAuMjEwIHVzICAgIHwgICAgICAg
ICAgICAgICAgICBfX3VwZGF0ZV9sb2FkX2F2Z19zZSgpOwogMikgICAwLjIxMyB1cyAgICB8ICAg
ICAgICAgICAgICAgICAgX191cGRhdGVfbG9hZF9hdmdfY2ZzX3JxKCk7CiAyKSAgIDAuMjAwIHVz
ICAgIHwgICAgICAgICAgICAgICAgICBjbGVhcl9idWRkaWVzKCk7CiAyKSAgIDAuMjEyIHVzICAg
IHwgICAgICAgICAgICAgICAgICBhY2NvdW50X2VudGl0eV9kZXF1ZXVlKCk7CiAyKSAgIDAuMjAz
IHVzICAgIHwgICAgICAgICAgICAgICAgICB1cGRhdGVfY2ZzX2dyb3VwKCk7CiAyKSAgIDAuMjA3
IHVzICAgIHwgICAgICAgICAgICAgICAgICB1cGRhdGVfbWluX3ZydW50aW1lKCk7CiAyKSAgIDUu
MDI5IHVzICAgIHwgICAgICAgICAgICAgICAgfQogMikgICAwLjE5NCB1cyAgICB8ICAgICAgICAg
ICAgICAgIGhydGlja191cGRhdGUoKTsKIDIpICAgNS43OTMgdXMgICAgfCAgICAgICAgICAgICAg
fQogMikgICA2LjIwNSB1cyAgICB8ICAgICAgICAgICAgfQogMikgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgcGlja19uZXh0X3Rhc2tfZmFpcigpIHsKIDIpICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgdXBkYXRlX2Jsb2NrZWRfYXZlcmFnZXMoKSB7CiAyKSAgIDAuMTQ5IHVzICAgIHwg
ICAgICAgICAgICAgICAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSgpOwogMikgICAwLjIwNSB1cyAg
ICB8ICAgICAgICAgICAgICAgIHVwZGF0ZV9ycV9jbG9jaygpOwogMikgICAwLjE2NyB1cyAgICB8
ICAgICAgICAgICAgICAgIF9fdXBkYXRlX2xvYWRfYXZnX2Nmc19ycSgpOwogMikgICAwLjIwNiB1
cyAgICB8ICAgICAgICAgICAgICAgIHVwZGF0ZV9ydF9ycV9sb2FkX2F2ZygpOwogMikgICAwLjE4
NCB1cyAgICB8ICAgICAgICAgICAgICAgIHVwZGF0ZV9kbF9ycV9sb2FkX2F2ZygpOwogMikgICAw
LjE4MyB1cyAgICB8ICAgICAgICAgICAgICAgIF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgp
OwogMikgICAyLjUxMCB1cyAgICB8ICAgICAgICAgICAgICB9CiAyKSAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgIGxvYWRfYmFsYW5jZSgpIHsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICBmaW5kX2J1c2llc3RfZ3JvdXAoKSB7CiAyKSAgIDAuMTcyIHVzICAgIHwgICAgICAg
ICAgICAgICAgICB1cGRhdGVfbm9oel9zdGF0cygpOwogMikgICAwLjE3NiB1cyAgICB8ICAgICAg
ICAgICAgICAgICAgaWRsZV9jcHUoKTsKIDIpICAgMC4yMDcgdXMgICAgfCAgICAgICAgICAgICAg
ICAgIHVwZGF0ZV9ub2h6X3N0YXRzKCk7CiAyKSAgIDEuODE4IHVzICAgIHwgICAgICAgICAgICAg
ICAgfQogMikgICAyLjMzOSB1cyAgICB8ICAgICAgICAgICAgICB9CiAyKSAgIDAuMTcxIHVzICAg
IHwgICAgICAgICAgICAgIF9fbXNlY3NfdG9famlmZmllcygpOwogMikgICAgICAgICAgICAgICB8
ICAgICAgICAgICAgICBsb2FkX2JhbGFuY2UoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgZmluZF9idXNpZXN0X2dyb3VwKCkgewogMikgICAwLjIxMSB1cyAgICB8ICAgICAg
ICAgICAgICAgICAgdXBkYXRlX25vaHpfc3RhdHMoKTsKIDIpICAgMC4yMDMgdXMgICAgfCAgICAg
ICAgICAgICAgICAgIHVwZGF0ZV9ub2h6X3N0YXRzKCk7CiAyKSAgIDAuMTkwIHVzICAgIHwgICAg
ICAgICAgICAgICAgICBpZGxlX2NwdSgpOwogMikgICAwLjIxNiB1cyAgICB8ICAgICAgICAgICAg
ICAgICAgdXBkYXRlX25vaHpfc3RhdHMoKTsKIDIpICAgMC4yMjIgdXMgICAgfCAgICAgICAgICAg
ICAgICAgIHVwZGF0ZV9ub2h6X3N0YXRzKCk7CiAyKSAgIDIuNzExIHVzICAgIHwgICAgICAgICAg
ICAgICAgfQogMikgICAwLjIyOCB1cyAgICB8ICAgICAgICAgICAgICAgIF9yYXdfc3Bpbl9sb2Nr
X2lycXNhdmUoKTsKIDIpICAgMC4yNjIgdXMgICAgfCAgICAgICAgICAgICAgICB1cGRhdGVfcnFf
Y2xvY2soKTsKIDIpICAgMC4yMzMgdXMgICAgfCAgICAgICAgICAgICAgICBjYW5fbWlncmF0ZV90
YXNrKCk7CiAyKSAgIDAuMzIyIHVzICAgIHwgICAgICAgICAgICAgICAgY2FuX21pZ3JhdGVfdGFz
aygpOwogMikgICAwLjIyMiB1cyAgICB8ICAgICAgICAgICAgICAgIHVwZGF0ZV9jZnNfcnFfaF9s
b2FkKCk7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgZGVhY3RpdmF0ZV90YXNr
KCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgZGVxdWV1ZV90YXNrX2Zh
aXIoKSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgIGRlcXVldWVfZW50
aXR5KCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHVwZGF0ZV9j
dXJyKCkgewogMikgICAwLjIwOSB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgdXBkYXRl
X21pbl92cnVudGltZSgpOwogMikgICAwLjI1OSB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgY3B1YWNjdF9jaGFyZ2UoKTsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgIF9fY2dyb3VwX2FjY291bnRfY3B1dGltZSgpIHsKIDIpICAgMC4xOTMgdXMgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgY2dyb3VwX3JzdGF0X3VwZGF0ZWQoKTsKIDIpICAgMC43
MzggdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIH0KIDIpICAgMi4wMjIgdXMgICAgfCAg
ICAgICAgICAgICAgICAgICAgICB9CiAyKSAgIDAuMjIzIHVzICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgX191cGRhdGVfbG9hZF9hdmdfc2UoKTsKIDIpICAgMC4yMTMgdXMgICAgfCAgICAgICAg
ICAgICAgICAgICAgICBfX3VwZGF0ZV9sb2FkX2F2Z19jZnNfcnEoKTsKIDIpICAgMC4yMDIgdXMg
ICAgfCAgICAgICAgICAgICAgICAgICAgICBjbGVhcl9idWRkaWVzKCk7CiAyKSAgIDAuMjE1IHVz
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgYWNjb3VudF9lbnRpdHlfZGVxdWV1ZSgpOwogMikg
ICAwLjIwNCB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAgIHVwZGF0ZV9jZnNfZ3JvdXAoKTsK
IDIpICAgMC4yMDIgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICB1cGRhdGVfbWluX3ZydW50
aW1lKCk7CiAyKSAgIDQuODkxIHVzICAgIHwgICAgICAgICAgICAgICAgICAgIH0KIDIpICAgMC4y
MDUgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgaHJ0aWNrX3VwZGF0ZSgpOwogMikgICA1Ljcx
MSB1cyAgICB8ICAgICAgICAgICAgICAgICAgfQogMikgICA2LjE0MyB1cyAgICB8ICAgICAgICAg
ICAgICAgIH0KIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICBzZXRfdGFza19jcHUo
KSB7CiAyKSAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICBtaWdyYXRlX3Rhc2tfcnFf
ZmFpcigpIHsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgZGV0YWNoX2Vu
dGl0eV9jZnNfcnEoKSB7CiAyKSAgIDAuMjE1IHVzICAgIHwgICAgICAgICAgICAgICAgICAgICAg
X191cGRhdGVfbG9hZF9hdmdfc2UoKTsKIDIpICAgMC4yMDQgdXMgICAgfCAgICAgICAgICAgICAg
ICAgICAgICBfX3VwZGF0ZV9sb2FkX2F2Z19jZnNfcnEoKTsKIDIpICAgMC4yMTkgdXMgICAgfCAg
ICAgICAgICAgICAgICAgICAgICBwcm9wYWdhdGVfZW50aXR5X2Nmc19ycS5pc3JhLjAoKTsKIDIp
ICAgMS40MzMgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgfQogMikgICAxLjgxNCB1cyAgICB8
ICAgICAgICAgICAgICAgICAgfQogMikgICAwLjE5NSB1cyAgICB8ICAgICAgICAgICAgICAgICAg
c2V0X3Rhc2tfcnFfZmFpcigpOwogMikgICAyLjY2NCB1cyAgICB8ICAgICAgICAgICAgICAgIH0K
IDIpICAgMC4yMDIgdXMgICAgfCAgICAgICAgICAgICAgICBfcmF3X3NwaW5fbG9jaygpOwogMikg
ICAwLjIxOSB1cyAgICB8ICAgICAgICAgICAgICAgIHVwZGF0ZV9ycV9jbG9jaygpOwogMikgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgIGF0dGFjaF90YXNrKCkgewogMikgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgYWN0aXZhdGVfdGFzaygpIHsKIDIpICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgZW5xdWV1ZV90YXNrX2ZhaXIoKSB7CiAyKSAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgZW5xdWV1ZV9lbnRpdHkoKSB7CiAyKSAgICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB1cGRhdGVfY3VycigpIHsKIDIpICAg
MC4yMjUgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgdXBkYXRlX21pbl92cnVudGlt
ZSgpOwogMikgICAwLjIwMiB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVhY2N0
X2NoYXJnZSgpOwogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBf
X2Nncm91cF9hY2NvdW50X2NwdXRpbWUoKSB7CiAyKSAgIDAuMTk2IHVzICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY2dyb3VwX3JzdGF0X3VwZGF0ZWQoKTsKIDIpICAgMC41NjkgdXMg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgfQogMikgICAyLjEyMCB1cyAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgfQogMikgICAwLjIwOCB1cyAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgX191cGRhdGVfbG9hZF9hdmdfY2ZzX3JxKCk7CiAyKSAgIDAuMjE5IHVzICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICBhdHRhY2hfZW50aXR5X2xvYWRfYXZnKCk7CiAyKSAgIDAuMjAz
IHVzICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB1cGRhdGVfY2ZzX2dyb3VwKCk7CiAyKSAg
IDAuMTg0IHVzICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBhY2NvdW50X2VudGl0eV9lbnF1
ZXVlKCk7CiAyKSAgIDAuMjE3IHVzICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBfX2VucXVl
dWVfZW50aXR5KCk7CiAyKSAgIDQuNjc4IHVzICAgIHwgICAgICAgICAgICAgICAgICAgICAgfQog
MikgICAwLjE3NyB1cyAgICB8ICAgICAgICAgICAgICAgICAgICAgIGhydGlja191cGRhdGUoKTsK
IDIpICAgNS40MDggdXMgICAgfCAgICAgICAgICAgICAgICAgICAgfQogMikgICA1Ljc5NSB1cyAg
ICB8ICAgICAgICAgICAgICAgICAgfQogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgY2hlY2tfcHJlZW1wdF9jdXJyKCkgewogMikgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICBjaGVja19wcmVlbXB0X3dha2V1cCgpIHsKIDIpICAgMC4yMDUgdXMgICAgfCAgICAg
ICAgICAgICAgICAgICAgICB1cGRhdGVfY3VycigpOwogMikgICAwLjIwMSB1cyAgICB8ICAgICAg
ICAgICAgICAgICAgICAgIHdha2V1cF9wcmVlbXB0X2VudGl0eS5pc3JhLjAoKTsKIDIpICAgMC45
NzAgdXMgICAgfCAgICAgICAgICAgICAgICAgICAgfQogMikgICAxLjM1OSB1cyAgICB8ICAgICAg
ICAgICAgICAgICAgfQogMikgICA3LjY4OCB1cyAgICB8ICAgICAgICAgICAgICAgIH0KIDIpICsg
MjMuNTExIHVzICAgfCAgICAgICAgICAgICAgfQogMikgICAwLjIwMSB1cyAgICB8ICAgICAgICAg
ICAgICBfX21zZWNzX3RvX2ppZmZpZXMoKTsKIDIpICAgMC4yMDUgdXMgICAgfCAgICAgICAgICAg
ICAgX3Jhd19zcGluX2xvY2soKTsKIDIpICAgMC4xOTcgdXMgICAgfCAgICAgICAgICAgICAgY2hl
Y2tfY2ZzX3JxX3J1bnRpbWUoKTsKIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgcGlj
a19uZXh0X2VudGl0eSgpIHsKIDIpICAgMC4xOTggdXMgICAgfCAgICAgICAgICAgICAgICBjbGVh
cl9idWRkaWVzKCk7CiAyKSAgIDAuNjAwIHVzICAgIHwgICAgICAgICAgICAgIH0KIDIpICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgcHV0X3ByZXZfZW50aXR5KCkgewogMikgICAwLjE4OCB1
cyAgICB8ICAgICAgICAgICAgICAgIGNoZWNrX2Nmc19ycV9ydW50aW1lKCk7CiAyKSAgIDAuNTgz
IHVzICAgIHwgICAgICAgICAgICAgIH0KIDIpICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
c2V0X25leHRfZW50aXR5KCkgewogMikgICAwLjIwOSB1cyAgICB8ICAgICAgICAgICAgICAgIF9f
dXBkYXRlX2xvYWRfYXZnX3NlKCk7CiAyKSAgIDAuMjE1IHVzICAgIHwgICAgICAgICAgICAgICAg
X191cGRhdGVfbG9hZF9hdmdfY2ZzX3JxKCk7CiAyKSAgIDEuMDUzIHVzICAgIHwgICAgICAgICAg
ICAgIH0KIDIpICsgMzMuNzA0IHVzICAgfCAgICAgICAgICAgIH0KIDIpICAgICAgICAgICAgICAg
fCAgICAgICAgICAgIHN3aXRjaF9tbV9pcnFzX29mZigpIHsKIDIpICAgMC42MDcgdXMgICAgfCAg
ICAgICAgICAgICAgbG9hZF9uZXdfbW1fY3IzKCk7CiAyKSAgIDIuNzk4IHVzICAgIHwgICAgICAg
ICAgICB9CiAzKSAgIDUuMTUwIHVzICAgIHwgICAgICAgICAgICBmaW5pc2hfdGFza19zd2l0Y2go
KTsKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkN0cmwtQyBoaXQsIG5vdGljZSB0aGUgZGVsYXkK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAogMykgJCA1NDU2ODM4MiB1cyB8ICAgICAgICAgIH0g
Lyogc2NoZWR1bGUgKi8KIDMpICQgNTQ1NjgzODMgdXMgfCAgICAgICAgfSAvKiBzY2hlZHVsZV90
aW1lb3V0ICovCiAzKSAgIDEuMDExIHVzICAgIHwgICAgICAgIF9yYXdfc3Bpbl9sb2NrX2lycSgp
OwogMykgJCA1NDU2ODM4OCB1cyB8ICAgICAgfSAvKiB3YWl0X2Zvcl9jb21wbGV0aW9uX2tpbGxh
YmxlICovCiAzKSAgICAgICAgICAgICAgIHwgICAgICBfX3dha2VfdXAoKSB7CiAzKSAgICAgICAg
ICAgICAgIHwgICAgICAgIF9fd2FrZV91cF9jb21tb25fbG9jaygpIHsKIDMpICAgMC45MTEgdXMg
ICAgfCAgICAgICAgICBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKCk7CiAzKSAgIDEuMDE1IHVzICAg
IHwgICAgICAgICAgX193YWtlX3VwX2NvbW1vbigpOwogMykgICAwLjk1OCB1cyAgICB8ICAgICAg
ICAgIF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgpOwogMykgICA2LjE4NiB1cyAgICB8ICAg
ICAgICB9CiAzKSAgIDcuNjUwIHVzICAgIHwgICAgICB9CiAzKSAkIDU0NTY4NDE0IHVzIHwgICAg
fSAvKiBjYWxsX3VzZXJtb2RlaGVscGVyX2V4ZWMgKi8KIDMpICAgICAgICAgICAgICAgfCAgICBf
X3dha2VfdXAoKSB7CiAzKSAgICAgICAgICAgICAgIHwgICAgICBfX3dha2VfdXBfY29tbW9uX2xv
Y2soKSB7CiAzKSAgIDAuNzIwIHVzICAgIHwgICAgICAgIF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUo
KTsKIDMpICAgMC44MjYgdXMgICAgfCAgICAgICAgX193YWtlX3VwX2NvbW1vbigpOwogMykgICAw
Ljg1MCB1cyAgICB8ICAgICAgICBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoKTsKIDMpICAg
NS42NTUgdXMgICAgfCAgICAgIH0KIDMpICAgNy4zMDkgdXMgICAgfCAgICB9CiAzKSAkIDU0NTY4
NDM3IHVzIHwgIH0gLyogX19yZXF1ZXN0X21vZHVsZSAqLwo=
--0000000000000038b4058a7e93ce--
