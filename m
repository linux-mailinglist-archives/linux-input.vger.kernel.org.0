Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C9538BDF7
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 07:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbhEUFsn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 01:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbhEUFsn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 01:48:43 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F87EC061574;
        Thu, 20 May 2021 22:47:20 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id b13so24561454ybk.4;
        Thu, 20 May 2021 22:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hFPiRDrNzp3HtDISlSQ0dvERMbGNvSvshrKNkxFFn1o=;
        b=tHClaGvxxf62T3d8IpJTqLH5I1U2ohjoPLoyKMK45m1wVsWqz5NLDsDt3NkCbi1EqV
         OWqwTHZcS3x0ApxHyuTxqUDJ1+ARHHDT4V1ZEbIaAqrqk/Hpcw7li+WReVgZCrC4LJlh
         /FJOP/QEqBhCMLsd0BcIt5/PcYBbx7NHPeBlCzWEK0DYaKsNrs5QTfe+Nxa50t9+oLnW
         IUyp671DIzXHbJoN/DIcugP98yROuGmIlC2aTN0e3677sN3ypB+a5wEws3s3BNA42ZF9
         XKvnCbKvbOwr44qNqfgkPs+9IKpwMxLs0B/RmAL5XxmSkjpVLuQdNhsu6tH/0eeb1wmM
         ccrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hFPiRDrNzp3HtDISlSQ0dvERMbGNvSvshrKNkxFFn1o=;
        b=WU1kXuwsndybccDIJNkyyXS4ZNn6fwJFBlKAL/5AiafRqbCQvwN+BqIK8aQSKPZEvu
         j0dQjHQwvUTnAdDAIgDHMZVXG08GWIgf9PX+fmv+r3dVXnscQT69T0kv1L4qzuF+/ZZR
         pxiMkzgBF0dv1B3BpM5Spk+Fg4PhzMsIawlMuq75b8W5jI3VcuM2aXWOXgWCdS/B0vEv
         XJqTW2iliAiVW/B6dle5LfUydsQZbRkkilVHHldG/5DGk76/gRTMKTYYiDAssF1hzaWC
         vu6TxQ8UUEUPIV/s+C0d44CHt7FWcCc0YvBv9olEylzzkPCNfjmpj7+bydyRNYPwMoy3
         P9ww==
X-Gm-Message-State: AOAM530BbvdRd+TdnUEET2SesYnzgEAnQi3xWdRX2c16joJkbhm5+ewl
        exeu43ohZ8rEIFwwYJaXJiuCQElO4A1HZU33YoQ=
X-Google-Smtp-Source: ABdhPJzf2lxxYZ2GQc+Z81M8QIzhHH4kA2d7YEP6cAjSx2X3T+sBjyKEFpdaAQvuhgG34knQ20kF7ugPTjxf4JXMA1c=
X-Received: by 2002:a25:6f89:: with SMTP id k131mr12420474ybc.491.1621576039683;
 Thu, 20 May 2021 22:47:19 -0700 (PDT)
MIME-Version: 1.0
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 20 May 2021 22:47:08 -0700
Message-ID: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com>
Subject: Naming of HID LED devices
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        marek.behun@nic.cz
Cc:     linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin and Marek,

Earlier this year during review of the hid-playstation driver there
was a discussion on the naming of LEDs exposed by HID drivers. Moving
forward the preference from the LED maintainers was to follow the
naming scheme "device:color:function" instead of the custom names used
so far by HID drivers.

I would like to get some guidance on the naming direction not just for
hid-playstation, but Daniel's hid-nintendo driver for which he posted
a new revision today has the same problem.

The original discussion was on "why not use the input device name?"
(e.g. input15). It was concluded that it wouldn't uniquely identify a
HID device among reasons.

One suggested approach by Benjamin was to use the sysfs unique name
with the bus, vid, pid.. but without ":" or ".":
> > > The unique ID of HID devices (in /sys/bus/hid/devices) is in the form
> > > `BUS:VID:PID.XXXX`. I understand the need to not have colons, so could
> > > we standardize LEDs on the HID subsystem to be named
> > > `hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a mapping
> > > between the LED and the sysfs, and would also allow users to quickly
> > > filter out the playstation ones.

Another approach mentioned was to invent some new ID and use a name like "hidN":
> > So you are saying that the fact that userspace cannot take the number
> > from "hidN" string and simply do a lookup /sys/bus/hid/devices/hidN is
> > the problem here.
> >
> > This is not a problem in my opinion, because userspace can simply
> > access the parent HID device via /sys/class/leds/hidN:color:func/parent.
>
> So in that case, there is no real point at keeping this ID in sync
> with anything else? I would be more willing to accept a patch in HID
> core that keeps this ID just for HID LEDs, instead of adding just an
> ID with no meaning to all HID devices.

I'm not sure which approach would be prefered. A "hidN" approach would
have little meaning perhaps, but looks pretty. While the
"hid-bus_vid_pid_xxxx" has a real meaning, but looks less nice. Unless
there is another approach as well.

Then there is the question on how to best generate these names. The
"hidN" approach could leverage the XXXX id an store it internally
(though it doesn't have a real meaning). If we only want to allocate
such an ID for devices with LEDs then some flag would need to be
passed back to hid-core. Not sure what the best way would be (almost a
call like hid_hw_start as part of connect_mask unless there is a
better way).

A hid-bus string is easier to create. Though even there is a question
on how to do it. It would be wasteful to store it for each hid_device.
It could be generated using a helper function out of
"dev_name(hdev->dev)", though personally I dislike any string
manipulation kernel side if it can be avoided. I would probably
suggest to store "XXXX" in each hid_device struct and have users (so
far would only be hid-nintendo and hid-playstation) generate the
strings themselves for now. Again also not nice unless a
"hid_device_name()" helper is desired then...

Thanks,
Roderick
