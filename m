Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C529124C29
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 16:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbfLRPuN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 10:50:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24665 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726960AbfLRPuN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 10:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576684211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TSBYzL3RvwtpaWRXze2pPZqSb38MjVmyVZC3bc6sEik=;
        b=K5p5xDrjzwOI+dq2kf+2u9l0n2n3mRh04aiCGOz3g/bUcHAFk7Sjl6RW5w/RcPBhIbiI2P
        QGLDj6x41/Ne3QOZF+aD2XM3Tov8abmvsTCqdrLqX8Z4PddFqg8qgyZLhNH85H/zauzd6Q
        8B6v/xIs8MjES6dBuhck/C38f94vUvU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-t6GfH21nP0ODZ2L1n9LTsA-1; Wed, 18 Dec 2019 10:50:08 -0500
X-MC-Unique: t6GfH21nP0ODZ2L1n9LTsA-1
Received: by mail-qk1-f197.google.com with SMTP id s9so1559080qkg.21
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 07:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TSBYzL3RvwtpaWRXze2pPZqSb38MjVmyVZC3bc6sEik=;
        b=BkIiJmwbtF95puqGUgNSd8Gx5qVf3d0Q7Ycpb2BcLbMO2MjmbOXoEh9Tnb9uoe9dLd
         6p83XlH6qtD5zt28KiA+7MUaAedZKO08JpWlE5jCPcFzlnlRF9FktrfE13PJYeTVOr4/
         p1E4guH2gd14bdBxvL5wyAgUDqJbR3I84rM0aK6mdIxHjdo5gtQMCWA1aobwUxmx7wl/
         FG5jLtxbZJGTBZ5OguHdumrN4suJPLga4xLPhmiL8O44fvL6oweC3g46arp5gEB2C8w9
         k5hsLwN3Iu/gC7DnMmoEk+1lrsLslYWjG9GUTo+VLDl726vQhEu3j7NWCUTczTZMS0kN
         An/g==
X-Gm-Message-State: APjAAAUdAsbvZBy9m3B+2yenve18TNUKNYMZ3d1guLQRp1XpZFjlXHM7
        7R2Kve7VDVviteEF3R3gQ7h6aY3O6FePGq4RBlpDIa7zDEViz2O+z21HRUWzM5Pt0yFB0h+Un4c
        GiJIbUnEBzEPk7r8AQy+QkTuiOULEic3yHiEIF28=
X-Received: by 2002:ad4:43c4:: with SMTP id o4mr2969071qvs.101.1576684207556;
        Wed, 18 Dec 2019 07:50:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwL3AIVYpfTBgHpMz7x9eLQxybCBM1cNKRjEYz6tWakShna5PjExsgap3j5RTv8+91Vbu47QONGylUi0McygWM=
X-Received: by 2002:ad4:43c4:: with SMTP id o4mr2969056qvs.101.1576684207299;
 Wed, 18 Dec 2019 07:50:07 -0800 (PST)
MIME-Version: 1.0
References: <_0snBXtGhwWiRLYmuVIeDLYkvksMVMxiBv1lW_bTTaFpcVN45l6yCU5gWZ_5oJr8SQOZA6qCZSkVskkEX0ZePpboYtDYRsTdVg3xfcwmw6M=@protonmail.com>
 <haSzI6CpbhKWB-YGuSryCNj3sW6YXUkBlN1LZyy6pyoYPUD-Z7DwCkoRnVY-1iHX3FlxpsydH2YF_effQsePpDZnTp7937mNgvLVPjneUYY=@protonmail.com>
 <CAO-hwJJWwu3O1_qCdhEZ_yzd366x9JDvWFXpqb7=60LrDNWbxQ@mail.gmail.com>
In-Reply-To: <CAO-hwJJWwu3O1_qCdhEZ_yzd366x9JDvWFXpqb7=60LrDNWbxQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Dec 2019 16:49:56 +0100
Message-ID: <CAO-hwJKa2LU=wDXVMT3=5EChCC3vmuN9zd6m=gPnSR9La+9LVw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Logitech HID++ Bluetooth LE support
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 18, 2019 at 3:44 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Mazin,
>
> On Sun, Nov 24, 2019 at 10:05 PM Mazin Rezk <mnrzk@protonmail.com> wrote:
> >
> > On Sunday, October 27, 2019 1:44 PM, Mazin Rezk <mnrzk@protonmail.com> wrote:
> >
> > > This series allows hid-logitech-hidpp to support Bluetooth LE HID++
> > > devices. Only the MX Master (b012 and b01e) is added right now but more
> > > HID++ Bluetooth LE devices can be added once they are tested.
> > >
> > > Changes since [v7]:
> > > - Squashed "HID: logitech-hidpp: Support MX Master (b012, b01e)
> > > over Bluetooth" into "HID: logitech-hidpp: Support translations
> > > from short to long reports"
> > >
> > > Changes since [v6]:
> > >
> > > - Based patch on "HID: logitech-hidpp: rework device validation"
> > >
> > > - Removed the need for additional quirks
> > >
> > > Changes since [v5]:
> > >
> > > - Fixed bug where added quirks would overflow an unsigned long
> > >
> > > - Changed the reserved quirk class bits from 0..20 to 0..15
> > >
> > > Changes since [v4]:
> > >
> > > - Omitted "HID: logitech: Add feature 0x0001: FeatureSet"
> > >
> > > - Stored WirelessDeviceStatus feature index in hidpp_device
> > >
> > > - Made Bluetooth quirk class alias quirks instead of vice versa
> > >
> > > - Omitted non-tested devices
> > >
> > > Changes since [v3]:
> > >
> > > - Renamed hidpp20_featureset_get_feature to
> > > hidpp20_featureset_get_feature_id.
> > >
> > > - Re-ordered hidpp20_featureset_get_count and
> > > hidpp20_featureset_get_feature_id based on their command IDs.
> > >
> > > - Made feature_count initialize to 0 before running
> > > hidpp20_get_features.
> > >
> > > Changes since [v2]:
> > >
> > > - Split up the single patch into a series
> > >
> > > Changes since [v1]:
> > >
> > > - Added WirelessDeviceStatus support
> > >
> > > [v7] https://lore.kernel.org/lkml/t5LOL-A4W7aknqQdC-3TavitC94BY_Ra1qyxCZMh_nprrDNSl4UF-jYpWtaDSU-0oQ5xzRyAo9o_mvSnA78bib_p6I3ePSJnTrp3Eb0X_yg=@protonmail.com
> > > [v6] https://lore.kernel.org/lkml/ggKipcQplIlTFmoP3hPnrQ-7_5-C0PKGd5feFymts3uenIBA8zOwz47YmKheD34H1rpkguDAGdx5YbS9UqpwfjT5Ir0Lji941liLVp--QtQ=@protonmail.com
> > > [v5] https://lore.kernel.org/lkml/Mbf4goGxXZTfWwWtQQUke_rNf8kezpNOS9DVEVHf6RnnmjS1oRtMOJf4r14WfCC6GRYVs7gi0uZcIJ18Va2OJowzSbyMUGwLrl6I5fjW48o=@protonmail.com
> > > [v4] https://lore.kernel.org/lkml/uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com
> > > [v3] https://lore.kernel.org/lkml/l7xYjnA9EGfZe03FsrFhnH2aMq8qS8plWhHVvOtY_l4ShZ1NV6HA6hn9aI-jAzbLYUGFCIQCIKkx9z42Uoj4-AZDwBfRcAecYIn-0ZA5upE=@protonmail.com
> > > [v2] https://www.spinics.net/lists/linux-input/msg63467.html
> > > [v1] https://www.spinics.net/lists/linux-input/msg63317.html
> > >
> > > Mazin Rezk (2):
> > > HID: logitech-hidpp: Support translations from short to long reports
> > > HID: logitech-hidpp: Support WirelessDeviceStatus connect events
> > >
> > > drivers/hid/hid-logitech-hidpp.c | 69 +++++++++++++++++++++++++++-----
> > > 1 file changed, 59 insertions(+), 10 deletions(-)
> > >
> > > ---
> > > 2.23.0
> >
> > I recently saw "HID: logitech-hidpp: Silence intermittent
> > get_battery_capacity errors" get applied into the kernel, would I need to
> > rebase this patch on top of https://patchwork.kernel.org/patch/11243871/
>
> No worries, your series still applies cleanly (git magic).
>
> I am in the process of doing some final tests for this series, and I
> plan to merge it for 5.6. Sorry we missed 5.5.

And done.

Applied to for-5.6/logitech, sorry for the delay.

Cheers,
Benjamin

>
> Cheers,
> Benjamin
>
> >
> > Thanks,
> > Mazin
> >

