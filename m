Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4776C7A08C
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 07:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfG3Fs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 01:48:57 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36326 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfG3Fs5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 01:48:57 -0400
Received: by mail-qt1-f195.google.com with SMTP id z4so61929388qtc.3
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2019 22:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ZRrxLFcJSx1mAaERX2WRz713PxEAVuzRSDIX8aGn1Lc=;
        b=bjgd4558oLSdTOIGYCnLAaMSPAoVYso1UwVqHCD0u29xH4DRf0uz1U04xlXv0XYLVh
         ej+09lbHMfyzdodbDMP6F3fErqo62XxFLmHClxWk/Pu6d7ZurQbu+XZv7qQ2ycp222W5
         8mB5kpX9FXi+p34it5sy3OUUnwt7A4LX3LuW/HJEq6hgDvk+plz1vgLSioiaPd0fPrFl
         y4T7L8OqAKyi/Oi7RTfg4lGMA78HaVNfp2ZTllA+cR3gBygF4Dh5PC3YrZecX8HpeU6q
         35pN8kb7qSvv6sdY4IBoMf2jDq7UgQrujxsSWoV3eddXYv9eajmWhw3yD7YECwGhVioI
         0WpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ZRrxLFcJSx1mAaERX2WRz713PxEAVuzRSDIX8aGn1Lc=;
        b=iEFAzsrSkG6iTtyeVIH3EplvfROdZkT7LA/+jpw2dE5D/HqQPxJvK6OHVb3dLuvF1m
         XEgrY/Jxk3y6s6EhMjNIHp/ZhfqjmaF4YCDyB2GV5HlkdrhlOke0n+ou96hROQw+DjiI
         NtlrY0WCbg9l8jRgM+GGi0jxeDtRXqUwsD98KrJyVBhgvPFMVdcW4u+k1ESm5KA3a/HE
         bsCbT9Jnh4wxAgzcaNRy6++ZUaRM5YZp2PWEmT0yKXVNjT4L9f0rBY2NwnKUDgwwIi31
         mn/998jAO+Y0M6y+jUsiJjP2Dru1labMMG3/3QUyzBdpKk7J9tXKeTcNSWLzUUXDGIDA
         g9mA==
X-Gm-Message-State: APjAAAXFNJJJaSTKglJ3PVAFjNGS+E2o58O/AYXBQwktuOJpQJ+QV4dB
        45fHbr9Aj25bbXq5dIovbCXH5UhTQ5A5BLaqykk=
X-Google-Smtp-Source: APXvYqwR4C1JvIgrEQdRCagjl9DZG/Q+7fY0ljhC+G9dzMKxONsqIJ9MldyKChCG1P6/lvSu65/mLWdCrJT+ZdXivmg=
X-Received: by 2002:ac8:19ac:: with SMTP id u41mr78227136qtj.46.1564465736308;
 Mon, 29 Jul 2019 22:48:56 -0700 (PDT)
MIME-Version: 1.0
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 29 Jul 2019 22:48:45 -0700
Message-ID: <CAEc3jaBX6jVCNCc=g-EvuO4Z2FPz0=QV0O0P0enr0woFx6drVA@mail.gmail.com>
Subject: 
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input <linux-input@vger.kernel.org>, svv@google.com,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Hanno Zulla <abos@hanno.de>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
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
just desktop Linux, but other platforms in particular Android.

Valve originally reported the issue on Ubuntu 18.04 using 4.15 kernel.
They can produce it about 1 in 3 times during Borderlands 2 in a
certain area with an automatic weapon which apparently generates many
rumble events. We managed to reproduce it ourselves on this kernel,
but not on 4.19 or newer kernels. We believe it got fixed or "hidden"
in newer kernels (will explain more). We suspect fftest can also
trigger the issue, haven't tried that just. The issue has likely been
around since 3.19 kernels, but nobody uncovered until now.

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
