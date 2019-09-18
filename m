Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8C6B6235
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2019 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbfIRL03 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Sep 2019 07:26:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40423 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfIRL03 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Sep 2019 07:26:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so4228455pfb.7
        for <linux-input@vger.kernel.org>; Wed, 18 Sep 2019 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GEKDbhzwNhpOBR6dELM5ZLkIekkSqfOIMrHIJk1k/V0=;
        b=agcxYxEbPyxWq2pBrk006+27U5Xoh85acDeVMUH5z9Zi2Yv5CfEnPXpUFAYRMCeKXY
         kb/TnliN0XwWkNMfvn54EUu0OVnJuqlPQpzsfLEnDEwnnpzrgJUe+yUBqUA5i10oYROg
         vD4qAyXqC0EOCpXZfllRkyx6f/LAYJJl4mSF3yM2nBQJNF9dDD0/i+FYSMIWHc7+uAiz
         0tJuoDxwPf5IWZ3sojDRmILrmqVY6mOOpq7JA1UiD31fR9gHccTokozsg3TehMZfQ5nN
         dpzzMTHhZ8nJi5TruO/tQahI04h4PssBJrZuN4bTgGTpb8Vvjn78u3+N337VdsmXmQib
         CWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GEKDbhzwNhpOBR6dELM5ZLkIekkSqfOIMrHIJk1k/V0=;
        b=ttNqBQfkJMfOsH2QE9dD6VR0ivnJc0MvZj5CWvFl+qXcRLIQp1p0nouWetiYIO4A2C
         MR6/xXXAerzIUehtccWfhZn2ROZG+C+wA2nZSL1regMqW+Cm7ZnCVRtvo6ToCn3K+gAm
         uL9fPxiOuHIYrfq3Utq5Qbm3unGgEMXYqe3wLM9mGY9UlxLwgu0fAGiGvdZmX00sIPMD
         iDB62aLSFGnqSIguB8oGR5J9grGzAQ4ptvRpdVvMh2byL7+2L/DVpEeUwzRVyOofPhiw
         oQ4xzarxtDzBC0dUeVI+E0ja3cyg0e0lgzKt4UBVDbfBayc6ySJlBUdQbNrLr9saDh0D
         1FjA==
X-Gm-Message-State: APjAAAVgFrqWT2kyg92SJk7AIq1O/yxVCBp25e5khs2HdYG67JIkAC3n
        bZtt+KkO3GeFu1qYsI5tWTiyJbV19K+EZW4Vwedmlw==
X-Google-Smtp-Source: APXvYqwYAv+hSySRkpTsC5JgvSWSS21M81RsY0zta+P6vdFIbrT8Kb6VbysxQ7uG06t7MGvURGAjaippiHqiexnoL7I=
X-Received: by 2002:a63:c442:: with SMTP id m2mr3520643pgg.286.1568805986413;
 Wed, 18 Sep 2019 04:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000cd1def0592ab9697@google.com> <Pine.LNX.4.44L0.1909171423360.1590-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909171423360.1590-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 18 Sep 2019 13:26:15 +0200
Message-ID: <CAAeHK+xJgJoR9rODcRH74knaRKmEq+DDVarNNwDMT_Vtg+gV2Q@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in ga_probe
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: multipart/mixed; boundary="0000000000008b82dd0592d21ba8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000008b82dd0592d21ba8
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 17, 2019 at 8:24 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 16 Sep 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14045831600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> > dashboard link: https://syzkaller.appspot.com/bug?extid=403741a091bf41d4ae79
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c1e62d600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166a3a95600000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com
> >
> > usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor,
> > different from the interface descriptor's value: 9
> > usb 1-1: New USB device found, idVendor=0e8f, idProduct=0012, bcdDevice=
> > 0.00
> > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > usb 1-1: config 0 descriptor??
> > greenasia 0003:0E8F:0012.0001: unknown main item tag 0x0
> > greenasia 0003:0E8F:0012.0001: hidraw0: USB HID v0.00 Device [HID
> > 0e8f:0012] on usb-dummy_hcd.0-1/input0
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in set_bit
> > include/asm-generic/bitops-instrumented.h:28 [inline]
> > BUG: KASAN: slab-out-of-bounds in gaff_init drivers/hid/hid-gaff.c:97
> > [inline]
> > BUG: KASAN: slab-out-of-bounds in ga_probe+0x1fd/0x6f0
> > drivers/hid/hid-gaff.c:146
> > Write of size 8 at addr ffff8881d9acafc0 by task kworker/1:1/78
> >
> > CPU: 1 PID: 78 Comm: kworker/1:1 Not tainted 5.3.0-rc7+ #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   print_address_description+0x6a/0x32c mm/kasan/report.c:351
> >   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
> >   kasan_report+0xe/0x12 mm/kasan/common.c:618
> >   check_memory_region_inline mm/kasan/generic.c:185 [inline]
> >   check_memory_region+0x128/0x190 mm/kasan/generic.c:192
> >   set_bit include/asm-generic/bitops-instrumented.h:28 [inline]
> >   gaff_init drivers/hid/hid-gaff.c:97 [inline]
> >   ga_probe+0x1fd/0x6f0 drivers/hid/hid-gaff.c:146
> >   hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
> >   really_probe+0x281/0x6d0 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
> >   __device_attach_driver+0x
> >
> >
> > ---
> > This bug is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this bug report. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > syzbot can test patches for this bug, for details see:
> > https://goo.gl/tpsmEJ#testing-patches
>
> The driver assumes that the device contains an input.
>
> Alan Stern
>
> https://github.com/google/kasan.git f0df5c1b

You've forgotten "syz test" here :)

#syz test: https://github.com/google/kasan.git f0df5c1b

>
>  drivers/hid/hid-gaff.c |   12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> Index: usb-devel/drivers/hid/hid-gaff.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-gaff.c
> +++ usb-devel/drivers/hid/hid-gaff.c
> @@ -64,14 +64,20 @@ static int gaff_init(struct hid_device *
>  {
>         struct gaff_device *gaff;
>         struct hid_report *report;
> -       struct hid_input *hidinput = list_entry(hid->inputs.next,
> -                                               struct hid_input, list);
> +       struct hid_input *hidinput;
>         struct list_head *report_list =
>                         &hid->report_enum[HID_OUTPUT_REPORT].report_list;
>         struct list_head *report_ptr = report_list;
> -       struct input_dev *dev = hidinput->input;
> +       struct input_dev *dev;
>         int error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput = list_entry(hid->inputs.next, struct hid_input, list);
> +       dev = hidinput->input;
> +
>         if (list_empty(report_list)) {
>                 hid_err(hid, "no output reports found\n");
>                 return -ENODEV;
>

--0000000000008b82dd0592d21ba8
Content-Type: text/x-patch; charset="US-ASCII"; name="hid-gaff.patch"
Content-Disposition: attachment; filename="hid-gaff.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k0p6kf7m0>
X-Attachment-Id: f_k0p6kf7m0

SW5kZXg6IHVzYi1kZXZlbC9kcml2ZXJzL2hpZC9oaWQtZ2FmZi5jCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIHVz
Yi1kZXZlbC5vcmlnL2RyaXZlcnMvaGlkL2hpZC1nYWZmLmMKKysrIHVzYi1kZXZlbC9kcml2ZXJz
L2hpZC9oaWQtZ2FmZi5jCkBAIC02NCwxNCArNjQsMjAgQEAgc3RhdGljIGludCBnYWZmX2luaXQo
c3RydWN0IGhpZF9kZXZpY2UgKgogewogCXN0cnVjdCBnYWZmX2RldmljZSAqZ2FmZjsKIAlzdHJ1
Y3QgaGlkX3JlcG9ydCAqcmVwb3J0OwotCXN0cnVjdCBoaWRfaW5wdXQgKmhpZGlucHV0ID0gbGlz
dF9lbnRyeShoaWQtPmlucHV0cy5uZXh0LAotCQkJCQkJc3RydWN0IGhpZF9pbnB1dCwgbGlzdCk7
CisJc3RydWN0IGhpZF9pbnB1dCAqaGlkaW5wdXQ7CiAJc3RydWN0IGxpc3RfaGVhZCAqcmVwb3J0
X2xpc3QgPQogCQkJJmhpZC0+cmVwb3J0X2VudW1bSElEX09VVFBVVF9SRVBPUlRdLnJlcG9ydF9s
aXN0OwogCXN0cnVjdCBsaXN0X2hlYWQgKnJlcG9ydF9wdHIgPSByZXBvcnRfbGlzdDsKLQlzdHJ1
Y3QgaW5wdXRfZGV2ICpkZXYgPSBoaWRpbnB1dC0+aW5wdXQ7CisJc3RydWN0IGlucHV0X2RldiAq
ZGV2OwogCWludCBlcnJvcjsKIAorCWlmIChsaXN0X2VtcHR5KCZoaWQtPmlucHV0cykpIHsKKwkJ
aGlkX2VycihoaWQsICJubyBpbnB1dHMgZm91bmRcbiIpOworCQlyZXR1cm4gLUVOT0RFVjsKKwl9
CisJaGlkaW5wdXQgPSBsaXN0X2VudHJ5KGhpZC0+aW5wdXRzLm5leHQsIHN0cnVjdCBoaWRfaW5w
dXQsIGxpc3QpOworCWRldiA9IGhpZGlucHV0LT5pbnB1dDsKKwogCWlmIChsaXN0X2VtcHR5KHJl
cG9ydF9saXN0KSkgewogCQloaWRfZXJyKGhpZCwgIm5vIG91dHB1dCByZXBvcnRzIGZvdW5kXG4i
KTsKIAkJcmV0dXJuIC1FTk9ERVY7Cg==
--0000000000008b82dd0592d21ba8--
