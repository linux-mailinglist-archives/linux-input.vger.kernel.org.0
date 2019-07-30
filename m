Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3E67A091
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 07:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfG3Fu1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 01:50:27 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36453 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfG3Fu1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 01:50:27 -0400
Received: by mail-qk1-f193.google.com with SMTP id g18so45748425qkl.3
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2019 22:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=njDeEmEYzLCu9l9YoO7jozZWHOgCi3fHHh3QfX6CFOc=;
        b=taxN5OwQMgAeZ7sIdKr796wgkgyrmsLyZFnHAPNhgbajS9qft62aECFBWGYR0/XRzG
         esVg8sKd7m6GMZ/heAo3kO/9IUAHlZ/g3/FfBm2xtkucUVhS47XbsjoogWDeNSOWyQAb
         SqfYSzyOC78RPulhZHAxkJN3Gc/hz+eEJad/9TaJhOOAHOu3W5pYMx39wblK1lnxVZea
         KBxLvxL42ioAYHBgoNaq7GMpsBsuUSK2CI8ZjahXpUM+wgEZT6CeoOaM/3tZFp/PSlGL
         kufN4khY2r0rKjq6gJfMkV6SzKeljyekH4V2MkdPq2M8hHAl7HGi9UsRvI0aOq/D5/ah
         KZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=njDeEmEYzLCu9l9YoO7jozZWHOgCi3fHHh3QfX6CFOc=;
        b=BS71DzYfK4KS3BMTdrvjG0eDZWUu2okMU8BT2EzjaEMKxOYKDHUG/V+bd8AV8+TeN0
         eW2/9x+VG0YDgPS0Ry15nWBvuS6W4BigQebv9v9E7lFJrOpNvKmR9t0WcBXTIvVpkRYQ
         611Dmi596f9N+CXkx5HFCJmd98RHq9j9NKhsxRk8gvQm4baHL9LnHcy2Vc8VvdWkf1I6
         kD+hAUiWz5Bl8YDz6vXKjKNGKa4Vh8znil81Sz7vA/BzE6Eks772hs7RQY2A4Y3PdPOZ
         frpgobGVWNKzQ1ujDiqk3eUM/1xByDARu8X9worF1rx3OcJuYr60soFIu+CZgYFbkyyC
         deJw==
X-Gm-Message-State: APjAAAWW/enAGyyVgfN8mr2GB13n0/S4lwO81aLYifkQ3ik2IQ7GX3CV
        tBbyYxTPMYjGuviHser6DAg/me0T+mqUBZ3B718=
X-Google-Smtp-Source: APXvYqwp8hXqa2zgXgow+tsrnmJqee5RnDwoCb4Uk0C3AJi/RhR+QPotKN50zQbg7KWjsFzdEvNAKoTc6Pbj4fhC9Tk=
X-Received: by 2002:ae9:ea17:: with SMTP id f23mr55879628qkg.236.1564465826187;
 Mon, 29 Jul 2019 22:50:26 -0700 (PDT)
MIME-Version: 1.0
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 29 Jul 2019 22:50:15 -0700
Message-ID: <CAEc3jaC0yJF7oYs1TK_zcrQ6_Er5sSBD41feC8GEjpDsBs9iLA@mail.gmail.com>
Subject: hid-sony kernel crash
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input <linux-input@vger.kernel.org>, svv@google.com,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Hanno Zulla <abos@hanno.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin and Jiri,

Last week, Valve notified us of a kernel crash in hid-sony when
disconnecting a controller (DS4 or DS3) while rumble is ongoing. We
think we understand the failure mechanism, but there are a few gaps in
our understanding. We would like to confirm our understanding before
we prepare a patch. The issue is quite urgent for us as it affects not
just desktop Linux, but in particular Android.

Valve originally reported the issue on Ubuntu 18.04 using 4.15 kernel.
They can produce it about 1 in 3 times during Borderlands 2. We
managed to reproduce it ourselves on this kernel, but not on 4.19 or
newer kernels. We believe it got fixed or "hidden" in newer kernels
(will explain more). We suspect fftest can also trigger the issue,
haven't tried that just.

The hid-sony bug is a crash due to a NULL pointer exception in
"dualshock4_send_output_report", which accesses output_report_dmabuf.
The cause is likely a condition between
"dualshock4_send_output_report" (or "sixaxis_send_output_report") and
"sony_remove". The output_report call is used to queue work to the
controller e.g. for rumble or LEDs. It can be called in parallel with
"sony_remove" and what now seems AFTER "sony_remove" finishes (yikes).

The "sony_remove" call cleans up most of the device state, which is in
"struct sony_sc". However the "struct sony_sc" (allocated using
devm_kzalloc) will be around until the device object is finally
removed. We suspect the evdev nodes will also be around for some time
in the future. We are not sure on the timing on how long this takes,
but we suspect this can take sufficiently long for a new
"dualshock4_send_output_report" call to be triggered on a mostly
cleaned up device. Does this sound like a good explanation?

4.19 and newer kernels are not affected by the crash as Hanno moved
allocation of "output_report_dmabuf" to leverage the devm_kmalloc API.
The buffer is around until device destruction, so until after the
evdev nodes are gone.

We have 2 potential fixes in mind, but not sure what is best.

One option is to prevent "sony_schedule_work" from scheduling new
output reports. There are some existing variables for that e.g.
state_worker_initialized, which should be set to "0" e.g. by
"sony_cancel_work_sync". This might be something nice for us to do
anyway, but still leaves a "window".

The second option is maybe calling "input_ff_destroy" to remove FF
capability from "sony_remove". I know the input framework does it for
us as well, but apparently it does it "too late". On a sidenote, other
drivers might need to do the same if they are sensitive to this "time
window" race condition. Thoughts?

Thanks,
Roderick
