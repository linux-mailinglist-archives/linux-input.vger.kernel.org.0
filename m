Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E651079FD
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 22:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfKVVbm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 16:31:42 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35179 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfKVVbm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 16:31:42 -0500
Received: by mail-pl1-f196.google.com with SMTP id s10so3640453plp.2
        for <linux-input@vger.kernel.org>; Fri, 22 Nov 2019 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HbJjs9npQivb+peN/P+/x5LBE//DdoQclSZUko6OYFA=;
        b=RFawcsOwCqAQEn5boyIcXR16Ki/HBDzNNs0+cfhfK/kOpeyl3s8AHaiARmdz+ZidjB
         tJ2SwyEjjvDTYo3b8eRbD4+idgXO6jzJhsyQsU1N9jFOBUKU/ICLSLcrNrwVSAG26FRt
         mgbyxJR2ijBrYIlmXhPJo5cnY7XAXQ2RV9AGiTEH0Ie5M7qcw0YKVIywOI+Y1qNXGqUD
         vjmWo0N4xOcDGJEox/RXx1+0KyCIDwXccWf5MjxA9sNtL6+MUWVe9cZxWK76dKG76+wX
         rEezAue56G/PQbfE7FrX69tJh7oZX4SgtzibTF05UKvBRhgEORQef9S4SFRKg6WHZIa9
         2JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HbJjs9npQivb+peN/P+/x5LBE//DdoQclSZUko6OYFA=;
        b=XQ/tgB0J5TRUsMLKGK1um46JIms3AUWMhbE+oVIbyN1Piz5tkGIvByd7C84aMovBhZ
         fjtYmPrCQ51P3hH30JpmxKX8VkPrCJGiGS8SK5Saq++ljMzNAfeaolnQwExkyQkfj6gQ
         sool3roqaUnPw+EefCmcqfYmr6VXe/cBAesGukJiJ3sjpCk1jaRfJsprCgg6CYHpjVPT
         GHuvRVITNbyI3IRlzXGnZcCRiVE7HwF6bNSPRZDAfgezCWuix3nv2uRgnpWsAsjAx2fL
         fGX/hb5mVZG/3l0LuXgR9zg1QoKBhT+kU9+qT1uovddLPak1eFrVDZFJ+i6dD4nJWapN
         dGGw==
X-Gm-Message-State: APjAAAXAo1+KbgoBAPHmj6K1HPnqzMECUwzaAdKxuQjuMLMxDDJl5bQI
        qmzc7qszUgeej5fgfni0ZMPyNor7dlh/1loe8VUtyg==
X-Google-Smtp-Source: APXvYqwp9oirAfneUwU+SoycQWx2Iqme1ayHmlDX0a5gLCpzGo05spCaML0qO0qityULcE1WRKI5UM8d92l2Uk+Stzw=
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr16075888plp.336.1574458300970;
 Fri, 22 Nov 2019 13:31:40 -0800 (PST)
MIME-Version: 1.0
References: <000000000000109c040597dc5843@google.com> <Pine.LNX.4.44L0.1911221150350.1511-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1911221150350.1511-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Sat, 23 Nov 2019 06:31:30 +0900
Message-ID: <CAAeHK+xQo8S8mmMgrOHOwC3iOnZJOZvYNaAei-tMrJA36R6OMQ@mail.gmail.com>
Subject: Re: INFO: rcu detected stall in hub_event
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Nov 23, 2019 at 1:51 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 21 Nov 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    46178223 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15a05836e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
> > dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1061395ae00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13653d1ce00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
> >
> > rcu: INFO: rcu_sched self-detected stall on CPU
>
> > RIP: 0010:hid_apply_multiplier drivers/hid/hid-core.c:1058 [inline]
> > RIP: 0010:hid_setup_resolution_multiplier+0x33b/0x990
> > drivers/hid/hid-core.c:1114

I'm not sure, but the stack trace reminds me of this issue, so this
report might be related:

https://groups.google.com/d/msg/syzkaller-bugs/X0zVbh8aFEM/NsPcshjxBgAJ

>
> Diagnostic patch.
>
> #syz test: https://github.com/google/kasan.git 46178223
>
>  drivers/hid/hid-core.c |   17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> Index: usb-devel/drivers/hid/hid-core.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-core.c
> +++ usb-devel/drivers/hid/hid-core.c
> @@ -1055,8 +1055,13 @@ static void hid_apply_multiplier(struct
>          */
>         multiplier_collection = &hid->collection[multiplier->usage->collection_index];
>         while (multiplier_collection->parent_idx != -1 &&
> -              multiplier_collection->type != HID_COLLECTION_LOGICAL)
> +              multiplier_collection->type != HID_COLLECTION_LOGICAL) {
> +               hid_info(hid, "collection %d %px parent %d\n",
> +       multiplier_collection - hid->collection, multiplier_collection,
> +       multiplier_collection->parent_idx);
>                 multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
> +       }
> +       hid_info(hid, "Got collection\n");
>
>         effective_multiplier = hid_calculate_multiplier(hid, multiplier);
>
> @@ -1069,6 +1074,7 @@ static void hid_apply_multiplier(struct
>                                                       effective_multiplier);
>                 }
>         }
> +       hid_info(hid, "Applied multiplier\n");
>  }
>
>  /*
> @@ -1103,16 +1109,23 @@ void hid_setup_resolution_multiplier(str
>
>         rep_enum = &hid->report_enum[HID_FEATURE_REPORT];
>         list_for_each_entry(rep, &rep_enum->report_list, list) {
> +               hid_info(hid, "Start report %px maxfield %d\n",
> +       rep, rep->maxfield);
>                 for (i = 0; i < rep->maxfield; i++) {
>                         /* Ignore if report count is out of bounds. */
>                         if (rep->field[i]->report_count < 1)
>                                 continue;
>
> +                       hid_info(hid, "Field %d %px maxusage %d\n",
> +       i, rep->field[i], rep->field[i]->maxusage);
>                         for (j = 0; j < rep->field[i]->maxusage; j++) {
>                                 usage = &rep->field[i]->usage[j];
> -                               if (usage->hid == HID_GD_RESOLUTION_MULTIPLIER)
> +                               if (usage->hid == HID_GD_RESOLUTION_MULTIPLIER) {
> +                                       hid_info(hid, "Usage %d %px\n",
> +       j, usage);
>                                         hid_apply_multiplier(hid,
>                                                              rep->field[i]);
> +                               }
>                         }
>                 }
>         }
>
