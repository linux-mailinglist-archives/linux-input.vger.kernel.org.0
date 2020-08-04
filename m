Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8763C23B4BC
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 07:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgHDF7U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 01:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgHDF7T (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Aug 2020 01:59:19 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A276DC06174A
        for <linux-input@vger.kernel.org>; Mon,  3 Aug 2020 22:59:18 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id p25so20482117vsg.4
        for <linux-input@vger.kernel.org>; Mon, 03 Aug 2020 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bFeEA0oWmLInXS/ReQtw2VIvoqn991kkM5jd7Axus7E=;
        b=h8vGSA0/L+O+kwzbM0Yu+wClkDSDLlEgWu8u8VlnmHdfDLr2Q0WqoJVM9EYVShtzaV
         cizo6UNCQf759y+Ig2BHtQEV/abV/3iuevgL97MBqwuRR66G4sv1l4pjMEBlNkD8FIWp
         BVY036lxwAXj219oeSyQZ9oXmyePSc8/TeX2G/e4ryFMRdmHGRpL8hlgXbISNKr9cCEc
         I0tKZWlo6UKROe3vu5jd83uuVvX/aSgVzpD8iZfSt6AqFRbVx7hEz/Kxg5Y7pNo1QrHv
         PlnTvRBNlx1vbtuWC2BBZBZ7myhwzVVO1EAetjo+bxPC235NcJtSZvrHy8sWJOq29cml
         VNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bFeEA0oWmLInXS/ReQtw2VIvoqn991kkM5jd7Axus7E=;
        b=qw4vW5lmdZZAdMszOumUOcCauWHzAtE5AsXu1NFykoWkCCyz4yKOnZp4DjL6rNQ/le
         1idB/WBcFCWKHU8+N1nZkRTDfYPSd9G5Ych/467DubvzJMb2i1feLjn8Qo+2Oky4XnlH
         6OzfgdXB1jGLlIoDsabGGjdEABwj9tFWAN/U7hnhMrUy5ZI7c7RhwO4Oeyaa0xowJRYa
         hBSK7/gZRnsOakfzeBAFt5xYopSpI8ezG3Jc5EMk5I+yt/u/sUuQgAlppmcUhWaLFWXj
         USwwBR1U6lIAVe1TQvDaXl4lar2QVLtRSEUmuG1UusYMrHfaD5CU+ijc1TvlNKPi3VO4
         3mHw==
X-Gm-Message-State: AOAM530hu33jHdTn0W5P3Yp5q7cpFA+/HyvsCb+kcpnmWchhASVLMEQt
        efhWJW7nWWxc9xkvXK2yWqfdaAt2AlHCMxYD/2A=
X-Google-Smtp-Source: ABdhPJxUh+qdynIhmivcm6cH+igeF+VYysRiJkv7iKgtyu89eXHlSl2ob1A0lbAX4pWEAtQzlHZBPV+gW5+q5cbS6x8=
X-Received: by 2002:a67:fc8c:: with SMTP id x12mr14359723vsp.88.1596520757871;
 Mon, 03 Aug 2020 22:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200317032928.546172-1-djogorchock@gmail.com>
 <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
 <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
 <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
 <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
 <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
 <CAEVj2tnXNF0BCSdH46DmNRtxPRO7oHkjdmvJuCmiRz4t4pFWuA@mail.gmail.com>
 <292d45aa-cd32-3348-ce32-965281a52b20@valvesoftware.com> <CAEVj2t=Az1G6X9Kj050aXVetW+PX==LgoEM9C3ES886NsYygcw@mail.gmail.com>
 <BY5PR13MB382682A947A8FB72720AA718984F0@BY5PR13MB3826.namprd13.prod.outlook.com>
In-Reply-To: <BY5PR13MB382682A947A8FB72720AA718984F0@BY5PR13MB3826.namprd13.prod.outlook.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Tue, 4 Aug 2020 00:59:06 -0500
Message-ID: <CAEVj2tmHmVqXWtH5uq1zUcuZ01ECaGwRaUbW1eLfQ2kgYnFV0A@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] HID: nintendo
To:     "Colenbrander, Roderick" <Roderick.Colenbrander@sony.com>
Cc:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Bastien Nocera <hadess@hadess.net>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Siarhei Vishniakou <svv@google.com>,
        "s.jegen@gmail.com" <s.jegen@gmail.com>,
        Carl Mueller <carmueller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for the input Roderick.

> In hid-sony we are not doing anything like hid-steam is doing (no virtual=
 extra hidraw device).
>
> I just don't know how I feel about mixing of evdev and hidraw. It just me=
ans userspace drivers are doing things behind the back of the real driver (=
unless you add a virtual hidraw driver like hid-steam). For Sony devices I'=
m not a big fan as our devices are very complex. Our devices tend to use a =
single output report (same report id) for rumble, audio and other types of =
data. When we will expose audio properly, a user space application doing hi=
draw will mess up audio streams and other behavior (e.g. power settings are=
 also in the same hid report).
>
> I don't know a good way yet. Has the usage of EVIOCGRAB been explored? If=
 I recall it was intended to claim exclusive access to a device at least fo=
r input. It is a way of avoiding of some of the issues for simpler devices.
>

I've had some success using EVIOCGRAB in joycond:
https://github.com/DanielOgorchock/joycond/blob/3969af9dcdc2b8199716ec08220=
df5d9ef7cfc6a/include/phys_ctlr.h#L46
It takes sole-control of the individual joy-con evdevs so it can
re-expose them as a combined uinput device without having the original
devices usable by other applications.

I forgot to note that using the joy-cons (wirelessly or using the
charging grip) with steam seems to work fine. I think steam is just
using the evdev in that case. That leads me to suspect steam would
work fine with the pro controller evdev itself if the matching rules
it uses internally are altered to check the evdev's version number as
well (which hid-nintendo alters for distinction).

I guess the downside to using hid-nintendo as-is with steam is lack of
gyro/accel support compared to steam's hidraw driver. Maybe it's best
for me to finish up the gyro patch before getting this driver merged
in that case. Several people have been successfully using the
in-progress patch with the dolphin emulator. I need to clean things up
with it though based on some of Roderick's previous feedback.

Thanks,
Daniel
