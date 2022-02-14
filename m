Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158144B4DC2
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 12:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350754AbiBNLSY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 06:18:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350683AbiBNLST (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 06:18:19 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949E76621C
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 02:51:32 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id v186so44859116ybg.1
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 02:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vyeYByMRpVU/XRGOFtq8XMKN4CgDOHBVWw4xOUTOtzw=;
        b=8UaODhyxSrEv0hI7aoNkKuLOFigm9SR/NHNewWl+cjryzHcWmWMehf4Qrh9CH5lznZ
         HUKnJPhouleF1tjvupHN1WSBF+T0PSIIHkuBuuiW2Q0l6oM2UOOLserLQKAlQEUME2tP
         XWVDgSbCakEWKnen+WAVpekWEVhgtCCiE08ctzgne790OPPAqu1nyLoPhUISG0dBeXu/
         buh4JiVrykpaF5sqCfeL8mrTlXUISVRHggCuwkkGgDNuTS6YCZjKo+YANb3Jjw4R9tGT
         VjqXAUk4djPGqWu9P8ibwn0HO/YamDPsrH6ww2AUvN8CaD/gLVF2dN2rH+dc0Rj0AVk6
         QYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vyeYByMRpVU/XRGOFtq8XMKN4CgDOHBVWw4xOUTOtzw=;
        b=fOt7ZjqLF+6nmVbUl42ZJI+zhiB25yVeey1y+GWFcMa9RGcHWmDPhhkAhQ9YSFpa+1
         urZoLtXwmqrp/GRjzXQJoDXh/XRHzR/mBHmAEGgfo9SF3dEb1cUeXFIJWVrpvZh2Nfnk
         +nMuRfnp16AV1TeERLsVhJO145R3OHQUG/gaV2uvqzVO/6CBpj9M6xpQ7DUK8mRb+fGt
         SlCCW5/jT1H5yFV/Qq/lWSAQ5AaiVxZCsOZoJ8c+BwM/mhFTVN0VRVYDI4jI5Z/xA9lV
         8ayc7GkXPWSi1ezyc3h7uZhu8uxUgWeBy4prKkBP5CnRyZfCIcJC13dHenK7DW9cb2nB
         7pDg==
X-Gm-Message-State: AOAM532u4dDurIjr+e9qQrG7Poxz5RzteJjsA2v5bDh7PtE+IFGu69v0
        vYsnx0U0+WK6aHDrvVTxvgEAAg0SLAlClz0ex3XvDQ==
X-Google-Smtp-Source: ABdhPJz65wAWgmDcevvXbiyb9n9bHBEXwvoWzyP7xR+KSbVzdziTFrmNqtkK9thjMo1YAbxr3tcYGPUwwu234V3+pZo=
X-Received: by 2002:a81:a411:: with SMTP id b17mr13281647ywh.236.1644835891763;
 Mon, 14 Feb 2022 02:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20220126161832.3193805-1-benjamin.tissoires@redhat.com> <CAB4aORW_b+6=a-fXCL-MJoM9uNvjeYL01W85Rb=6rMP-Nm11QQ@mail.gmail.com>
In-Reply-To: <CAB4aORW_b+6=a-fXCL-MJoM9uNvjeYL01W85Rb=6rMP-Nm11QQ@mail.gmail.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Mon, 14 Feb 2022 11:51:19 +0100
Message-ID: <CAB4aORU51aZc7BHdTfrXanYVvFG4wxQRqfsrs6mdttYCB+LY8A@mail.gmail.com>
Subject: Re: [PATCH 00/12] HID: fix for generic input processing
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Ahelenia_Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 8, 2022 at 8:19 PM Angela Czubak <acz@semihalf.com> wrote:
>
> Hi Benjamin,
>
> On Wed, Jan 26, 2022 at 5:18 PM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi,
> >
> > This is a followup of the discussion we had between Wacom and
> > the maintainers, and a followup of those 2 patch series:
> >
> > https://lore.kernel.org/r/20211022232837.18988-1-ping.cheng@wacom.com/
> > https://lore.kernel.org/r/2ca91ac7cf92e3048a236db3cd519f04e12c1e61.1615224800.git.nabijaczleweli@nabijaczleweli.xyz/
> >
> > It took me a while to get it right, but I finally can submit the
> > series:
> >
> > - the first 8 patches are some cleanup in the hid-input.c and
> >   hid-core.c code. They also create a list of input fields that
> >   is then used to process the event, in the priority we think
> >   is good.
> >
> >   For instance, on multitouch devices, it is better to have
> >   Contact Count before processing all touches, and in each
> >   touch, having Contact ID first is better. This series doesn't
> >   cover hid-multitouch, but I have a series on top of this one that
> >   does cover it.
> >
> >   Anyway, in our case, here, we need to process Invert before
> >   In Range for tablets so we can make a decision whether the user
> >   has the intend to erase or not.
> >
> > - patch 9 enforces the invert usage before In Range as mentioned
> >   above
> >
> > - patch 10 is the actual bulk of processing that should fix the
> >   generic tablet handling. Now that we have a reliable ordering
> >   of the fields, we can compute the state of the tool in a reliable
> >   way, and be kinder to userspace by not sending to it 2 tools at
> >   the same time.
> >
> >   This patch has been extensively tested by hid-tools with the new
> >   MR I submitted that add tests for tablets [0].
> >
> > - patch 11 is a nice to have that I need for my second series regarding
> >   hid-multitouch. It is not mandatory with that series, but given
> >   that it changes the format of the priorities in hid-input.c I thought
> >   it would be best to send it as part of this series.
> >
> >   Note that now we are tagging the *reports* and the individual fields
> >   when they are part of a multitouch collection, which should help
> >   the drivers that implement this processing (hid-multitouch and wacom).
> >
> > - last, patch 12 is an attempt at fixing the documentation regarding
> >   BTN_TOOL_* (requested by Peter).
> >
> >   Dmitry, feel free to take this one through your tree if you prefer
> >   to do so (and if you are happy with it), otherwise we can take it
> >   through the hid tree.
> >
> > As mentioned above, I have a followup series not entirely tidied up
> > that implements the processing of Win8 mutltiouch devices in
> > hid-input.c.
> > There are several benefits for that: we should be able to drop the
> > multitouch code in wacom.ko, we can simplify part of hid-multitouch,
> > and we will be able to quirk a particular device in a separate module,
> > without touching at the generic code (in hid-multitouch or hid-input).
> >
> > Anyway, I am missing a few bits for that so that's coming in later.
> >
>
> Is there any timeline for the followup series? I am wondering how that
> would affect haptic support implementation.

Hi Benjamin,

just pinging in hope of receiving some answer :)
I am thinking of preparing another version of haptic support patches
(https://lore.kernel.org/all/20220114183152.1691659-1-acz@semihalf.com/T/)
and if I could already start remodelling them based on your changes so that
it is actually a haptic hid driver and not and API that would be great :)
I am simply wondering when multitouch driver is going to be expressed simply
by your changes.

>
> > Cheers,
> > Benjamin
> >
> >
> > [0] https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/127
> >
> > Benjamin Tissoires (12):
> >   HID: core: statically allocate read buffers
> >   HID: core: de-duplicate some code in hid_input_field()
> >   HID: core: split data fetching from processing in hid_input_field()
> >   HID: input: tag touchscreens as such if the physical is not there
> >   HID: input: rework spaghetti code with switch statements
> >   HID: input: move up out-of-range processing of input values
> >   HID: compute an ordered list of input fields to process
> >   HID: core: for input reports, process the usages by priority list
> >   HID: input: enforce Invert usage to be processed before InRange
> >   HID: input: remove the need for HID_QUIRK_INVERT
> >   HID: input: accommodate priorities for slotted devices
> >   Input: docs: add more details on the use of BTN_TOOL
> >
> >  Documentation/input/event-codes.rst |   5 +-
> >  drivers/hid/hid-core.c              | 280 ++++++++++++++++++++---
> >  drivers/hid/hid-input.c             | 330 ++++++++++++++++++++++------
> >  include/linux/hid.h                 |  23 +-
> >  4 files changed, 533 insertions(+), 105 deletions(-)
> >
> > --
> > 2.33.1
> >
>
> Does this patch series introduce the leaf driver support you mentioned
> in the haptic review?
