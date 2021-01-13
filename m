Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514802F4704
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 10:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbhAMJBU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 04:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbhAMJBU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 04:01:20 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA67C061575;
        Wed, 13 Jan 2021 01:00:39 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id v126so893492qkd.11;
        Wed, 13 Jan 2021 01:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pbIjM7Y2l1QZG495FHuBObshGZMrXbccqmIZVjHdFFY=;
        b=hbnoG52Fys9E2+Ad9ZZ027ZjhIAoLnyG42xdppfQ3gUSAahiq71f+njlW5c8pawrHF
         no2oGIFoZiM/1K5kWxlW1kn6jIaQ/v4m0YGaA4H2cnobysRSmkEsxJNoXzX5oEotFpQy
         S5OlsZ1A0k157geOjY0wW3xvdgvksKao8QANhNbT4b1shlfQC2OIQJBSPYUPIAipOzN6
         NDkfEHm7adLHT0TedcIvzbTWJTkhaPDqFnraKZy2fqpn2f3bxyQKuALVJIf0YMottcVa
         idan2jiwyQGOC3FKd3ZSioS7zSEfPij9sPlwqawBL9zIk27y1GTUwzLG68zMtUnKF9sf
         opdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbIjM7Y2l1QZG495FHuBObshGZMrXbccqmIZVjHdFFY=;
        b=moxsgeO10B0ZwIH+vYs49/TUkTpm8az4G7hihjwm4GjJEt0Zwv8Z0YqiCeUWC/ab4e
         /EtOB0SjvIYVf+w4o8nMzrGGVoKkcnXqAz5w75sRrW8iIPdktvZkB0CPFFIyzOEQ2IsH
         EwOvmmStD3RHVKi4g8skHsLVZblkYoo7sG3isZJOmIUNTw9sWVLQaa/jYuMayqmyyort
         t6eO6aaUloWzQtVo9rHcFN4IOqNjPbTZRmCGvymLmbjnqkSvsdTY7iaiMhst+kuojEvM
         h/0eHN+fyfKfo18k3ebquqJFdHKLfYTUfS8dKbDiN+fVRZ5LwrUxDUFZKAYRRWJi9aqA
         f5lA==
X-Gm-Message-State: AOAM531JBVFjf0jpxPjeNMcO0pihrzkzUtzqpeA9OV8uEfImpqMThgNa
        gUKERUTO4CYU/wtU4z1ZY/s+B9OhZ9ZFOd8eZSGhEanIxuQ=
X-Google-Smtp-Source: ABdhPJwMJe+FCIqZLrOZSfzPVTml5CBTjec9zWLucfYDdoJxMHqxs+HusUGQjyg8xb3jZqVxHLgZURsaadYLTZ1tjo4=
X-Received: by 2002:a37:a893:: with SMTP id r141mr930119qke.459.1610528439051;
 Wed, 13 Jan 2021 01:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20210112230310.GA149342@jelly>
In-Reply-To: <20210112230310.GA149342@jelly>
From:   Benjamin Tissoires <benjamin.tissoires@gmail.com>
Date:   Wed, 13 Jan 2021 10:00:27 +0100
Message-ID: <CAN+gG=ER7LndA9facg-EB-0VBdBBkpac+nYu+eOo7wDW6G6fBw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: input: define ABS_PRESSURE/ABS_MT_PRESSURE
 resolution as grams
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Ping Cheng <pinglinux@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 13, 2021 at 12:03 AM Peter Hutterer
<peter.hutterer@who-t.net> wrote:
>
> ABS_PRESSURE and ABS_MT_PRESSURE on touch devices usually represent
> contact size (as a finger flattens with higher pressure the contact size
> increases) and userspace translates the kernel pressure value back into
> contact size. For example, libinput has pressure thresholds when a touch is
> considered a palm (palm == large contact area -> high pressure). The values
> themselves are on an arbitrary scale and device-specific.
>
> On pressurepads however, the pressure axis may represent the real physical
> pressure. Pressurepads are touchpads without a hinge but an actual pressure
> sensor underneath the device instead, for example the Lenovo Yoga 9i.
>
> A high-enough pressure is converted to a button click by the firmware.
> Microsoft does not require a pressure axis to be present, see [1], so as seen
> from userspace most pressurepads are identical to clickpads - one button and
> INPUT_PROP_BUTTONPAD set.
>
> However, pressurepads that export the pressure axis break userspace because
> that axis no longer represents contact size, resulting in inconsistent touch
> tracking, e.g. [2]. Userspace needs to know when a pressure axis represents
> real pressure and the best way to do so is to define what the resolution
> field means. Userspace can then treat data with a pressure resolution as
> true pressure.
>
> This patch documents that the pressure resolution is in units/gram. This
> allows for fine-grained detail and tops out at roughly ~2000t, enough for the
> devices we're dealing with. Grams is not a scientific pressure unit but the
> alternative is:
> - Pascal: defined as force per area and area is unreliable on many devices and
>   seems like the wrong option here anyway, especially for devices with a
>   single pressure sensor only.
> - Newton: defined as mass * distance/acceleration and for the purposes of a
>   pressure axis, the distance is tricky to interpret and we get the data to
>   calculate acceleration from event timestamps anyway.
>
> For the purposes of touch devices and digitizers, grams seems the best choice
> and the easiest to interpret.
>
> Bonus side effect: we can use the existing hwdb infrastructure in userspace to
> fix devices that advertise false pressure.
>
> [1] https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-precision-touchpad-required-hid-top-level-collections#windows-precision-touchpad-input-reports
> [2] https://gitlab.freedesktop.org/libinput/libinput/-/issues/562
>
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

FWIW, and because I was involved in the initial discussion:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

> ---
>  Documentation/input/event-codes.rst          | 15 +++++++++++++++
>  Documentation/input/multi-touch-protocol.rst |  4 ++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index b24b5343f5eb..3118fc1c1e26 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -236,6 +236,21 @@ A few EV_ABS codes have special meanings:
>    - Used to describe multitouch input events. Please see
>      multi-touch-protocol.txt for details.
>
> +* ABS_PRESSURE/ABS_MT_PRESSURE:
> +
> +   - For touch devices, many devices converted contact size into pressure.
> +     A finger flattens with pressure, causing a larger contact area and thus
> +     pressure and contact size are directly related. This is not the case
> +     for other devices, for example digitizers and touchpads with a true
> +     pressure sensor ("pressure pads").
> +
> +     A device should set the resolution of the axis to indicate whether the
> +     pressure is in measurable units. If the resolution is zero, the
> +     pressure data is in arbitrary units. If the resolution is nonzero, the
> +     pressure data is in units/gram. For example, a value of 10 with a
> +     resolution of 1 represents 10 gram, a value of 10 with a resolution on
> +     1000 represents 10 microgram.
> +
>  EV_SW
>  -----
>
> diff --git a/Documentation/input/multi-touch-protocol.rst b/Documentation/input/multi-touch-protocol.rst
> index 307fe22d9668..21c1e6a22888 100644
> --- a/Documentation/input/multi-touch-protocol.rst
> +++ b/Documentation/input/multi-touch-protocol.rst
> @@ -260,6 +260,10 @@ ABS_MT_PRESSURE
>      of TOUCH and WIDTH for pressure-based devices or any device with a spatial
>      signal intensity distribution.
>
> +    If the resolution is zero, the pressure data is in arbitrary units.
> +    If the resolution is nonzero, the pressure data is in units/gram. See
> +    :ref:`input-event-codes` for details.
> +
>  ABS_MT_DISTANCE
>      The distance, in surface units, between the contact and the surface. Zero
>      distance means the contact is touching the surface. A positive number means
> --
> 2.29.2
>
