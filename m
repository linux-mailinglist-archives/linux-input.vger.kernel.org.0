Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE85308215
	for <lists+linux-input@lfdr.de>; Fri, 29 Jan 2021 00:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbhA1Xpb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 18:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhA1Xpa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 18:45:30 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7A3C061573
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 15:44:49 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 224666173;
        Thu, 28 Jan 2021 23:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 224666173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611877417; bh=aM8jK69L2OObytiFwSPBUze10voMNgHvPClMSv8Seik=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Kj+PlQP46+U16dacGUjvC29DQZoQmKXSkuLgmhgw/o4i6nEp18N2uTmJPODZaL6K9
         NVFPZArNOjoguezxg3AEcRw90ch569uv6X0uimDvpgw86neZFRzHsu1pty+zSiDYCg
         ybaUZRbADpjN59S3fLLMvqVzbmN4Uj9IBtCuhc8/qJmtaeq861ea943iTyqyUfr0sp
         S1FfpL7frMtmLPO3h//dviMZL5Opm3XftshmAVlWTMXW0foIVbP1vxhtBKt40Vots1
         U6Fn1eJIP6MMmcpLncaq5M7yiyMhMlU6LyxTWHzESt2JekrojQ+L4DLIBruw5ALKhw
         eIAqrSJDV4x5Q==
Date:   Thu, 28 Jan 2021 16:43:36 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Ping Cheng <pinglinux@gmail.com>, linux-input@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: input: define
 ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams
Message-ID: <20210128164336.3be90423@lwn.net>
In-Reply-To: <20210112230310.GA149342@jelly>
References: <20210112230310.GA149342@jelly>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 13 Jan 2021 09:03:10 +1000
Peter Hutterer <peter.hutterer@who-t.net> wrote:

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
> ---
>  Documentation/input/event-codes.rst          | 15 +++++++++++++++
>  Documentation/input/multi-touch-protocol.rst |  4 ++++
>  2 files changed, 19 insertions(+)

It looks like nobody has picked this up, so I went ahead and applied it.

Thanks,

jon
