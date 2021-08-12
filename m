Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1ECB3EA962
	for <lists+linux-input@lfdr.de>; Thu, 12 Aug 2021 19:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235116AbhHLRXu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Aug 2021 13:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33203 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234975AbhHLRXt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Aug 2021 13:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628789003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WkCoI17msuhCQTnUzTIly0WApTgxrx9QFkEC7yj/ohI=;
        b=Tm43YacRugT/K/saGb2FKuyBbiTDVNoXHCPB52b3x27OKzOyKITVUEDPqzVrz6q3dXrv+p
        TYaHO6oOhr3QxBYb1Xq3X1YCsZsmv6Nqnol8NasRdyKoHC/Ymu1o1kw51ut+K5jD6vYKur
        6a1yTJSpq5IRXY8a0Xsid4QcCyAd+Is=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-Kof3DYZ-NfOtP8EcMlLnYA-1; Thu, 12 Aug 2021 13:23:22 -0400
X-MC-Unique: Kof3DYZ-NfOtP8EcMlLnYA-1
Received: by mail-pl1-f198.google.com with SMTP id j5-20020a170902da85b029012c4287ea54so4182067plx.22
        for <linux-input@vger.kernel.org>; Thu, 12 Aug 2021 10:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WkCoI17msuhCQTnUzTIly0WApTgxrx9QFkEC7yj/ohI=;
        b=pCx9UESck0E0UXBcCmfvHOzvkTG+R9ec/bpI6jO6D5b1gM06vYQB1prsLWGyvU9w++
         xfvKgR9RPZ7fVx+sTIOTd+jkr2PBviIcjGC7hX7fB1B+7FLGTrgvSxoULQNhMgvaRKGB
         H/51Ty3rOr1XP7cf0nSKCKQPpZo1VKb6XvWKouYxculpxd5KWvdP2eI8+jtAzKJhtPHx
         yDPo0UAxE93g6/We+4qhodpDLBDhtKEGGJagtB1UvcJCkjbCjzVyrZgJQnKJwAOtBPOm
         i+29K6vNgzJcr5EotLpSL+cc6kNOpmjBbFoiDmineS9kpb/p2wcPHaYmbCv3cgAniH5y
         KswQ==
X-Gm-Message-State: AOAM532RishrJKvr92WYHwxKKlZWxuxgwHO/E1ugzqGu0BSwcIFGsukZ
        Hhgs5tWcwa/NaS8fm1eyz3UX7AqQErqKDZvsZ5KfyMcGZ589WMlNMFxkFOEuSWTmCPmMzAU83uc
        FrGuSy54GyJVuhLdW6gyRMox5M92PWRKzPGTqH+U=
X-Received: by 2002:a17:902:aa43:b029:12d:242f:32eb with SMTP id c3-20020a170902aa43b029012d242f32ebmr4400630plr.66.1628789001052;
        Thu, 12 Aug 2021 10:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ6I7zYLpl662qrk24SmE+3SIHFHandRom0bvZxn6tZ7DpYGwfE5f37IfU5Otbc1F3h8Pgy1SLrEG2LFZ3kn0=
X-Received: by 2002:a17:902:aa43:b029:12d:242f:32eb with SMTP id
 c3-20020a170902aa43b029012d242f32ebmr4400616plr.66.1628789000812; Thu, 12 Aug
 2021 10:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com> <87lf56inxm.fsf@kernel.org>
In-Reply-To: <87lf56inxm.fsf@kernel.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 12 Aug 2021 19:23:09 +0200
Message-ID: <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        jeff.glaum@microsoft.com, Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 12, 2021 at 7:16 PM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi Benjamin,
>
> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
> > Hi Dmitry,
> >
> > On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
> >>
> >> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
> >> and presents itself as a HID device. This patch contains the changes needed
> >> for the driver to work as a module: HID Core affordances for SPI devices,
> >> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
> >> itself is being prepared for a submission in the near future.
> >>
> >> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
> >
> > Though I really appreciate seeing a microsoft.com submission, the
> > commit description makes me wonder if we should not postpone the
> > inclusion of this patch with the "submission in the near future".
> >
> > AFAIK, HID is not SPI aware. So basically, we are introducing dead
> > code in the upstream kernel if we take this patch.
>
> Right, unfortunately spec isn't public yet (albeit having products
> shipped using it and a driver available in a public tree somewhere I
> couldn't find).
>
> I _do_ have one question though:
>
> Is there a way to tell hid core that $this device wants hidraw? If we

Depending on what you want and can do I can think of several solutions:
- add a quirk for this device (either at boot time, either in
hid-quirks.c) There must be one that tells to only bind to hidraw
- provide an out of the tree driver that declares the BUS:VID:PID, and
start the HID device with HIDRAW only.


> remove the hid-microsoft changes, hid-generic will pick the device as
> expected, but this really needs hidraw. Any hints?

I am fine with the hid-microsoft changes, I just want them in a
separate commit. But I don't see why we would take only the first one
without the SPI transport and the hid-microsoft code...

Basically: not sure why you need hidraw for it.

Cheers,
Benjamin

>

