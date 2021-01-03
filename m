Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69732E8B1A
	for <lists+linux-input@lfdr.de>; Sun,  3 Jan 2021 07:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbhACGMO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 01:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbhACGMN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 01:12:13 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65821C0613C1
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 22:11:33 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id y4so23015930ybn.3
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 22:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiHJnyrL5LIBAMIKXhUssKUqnF6E26od/cVwR56xkmI=;
        b=adVrHwa6nmw1oMwRWq1FMK19JXoFTxvKss4mEl8b7IRGnXqBYAKy9KvW6BXNELLwvy
         KqeAveILRKLXW2/cRNjYfL4G1Oc5l+F0hmNnugRbhZVFs/UKqbnKPaz4anHUUPXBVc5j
         FC6/JUD1/UD0Em8owZCnPYQP+EJmt3bq7grkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiHJnyrL5LIBAMIKXhUssKUqnF6E26od/cVwR56xkmI=;
        b=jhZhC2Nf2RR0XaF8LI8cDacTUcw1UIvpFCJxjCLA8CjaXSNFhk5Y9Z6ZUxuO/vSNMG
         H1h8sCE5UXkJKSr+L3E3ckPX5pCUE3QHyuoR+3aEFRRnYof37k34jJmtvba2GyMRWm/d
         NidEpvtD4N5FCoxplh08i6wyiqLNtnnUZEl1ERhqh5h4ES9Hd6/sJ08Ir9DFWQ/vy0Z5
         /3sMWpCXdPjjTeo/GorC6kSPgnRNlM92VJl/9h8CgcwmlUUFJlCMDSgtbDvsKQ9Vo6Ep
         KtgfscDBlEEfbRQmmHfVwM4OSGXJpu6Y0XjVHpAI5QYWgrfVYLtDUQpE7GxDYqkPgRcu
         qNpQ==
X-Gm-Message-State: AOAM530atyQ45sDX6i4mhKGLiwV0hJ8Yj8hYScBx26iWvTihW9qW/Mkf
        haH+SMHBBVBnKXc3uzWtjM5QtWobhoFtgSd1WirK0g==
X-Google-Smtp-Source: ABdhPJzumbBhRi3m/Qi0mBrAuPc2SESvVj4su3PM09VA3mthztfZIcCqoS3E1uJSMuDYL8YkSEv7pJcQwJLOp1N4IC4=
X-Received: by 2002:a25:348a:: with SMTP id b132mr100338042yba.378.1609654292626;
 Sat, 02 Jan 2021 22:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <X+rKPhJrQaykPxri@google.com> <CA+cxXh=HH-UAt747OYRwaaABdJpT8r=TvrYcFah7PQ1vHqYutg@mail.gmail.com>
 <X/Df0uuclk1ZNOps@google.com> <CA+cxXhnY_TpnA1iR8XJ87xNeNsi2Ba89+VJEPtB7wJ-=8O=4ag@mail.gmail.com>
In-Reply-To: <CA+cxXhnY_TpnA1iR8XJ87xNeNsi2Ba89+VJEPtB7wJ-=8O=4ag@mail.gmail.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Sat, 2 Jan 2021 22:11:21 -0800
Message-ID: <CA+cxXhkdZ2ifyCG=p3Fbxwnzu-8z3Q1jNzaBQ=MMfeJ3vqkfhw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: input: cros-ec-keyb: Add a new property
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rajat Jain <rajatja@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

I have one more question below.
Could you take a look?

On Sat, Jan 2, 2021 at 8:53 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Hi Dmitry,
>
> I see.
> I'll update these patch sets shortly based on your suggestion.
> Thanks.
>
> On Sat, Jan 2, 2021 at 1:04 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Sat, Jan 02, 2021 at 11:39:34AM -0800, Philip Chen wrote:
> > > Hi Dmitry,
> > >
> > > Thanks for reviewing my patch over the holiday season.
> > > Please check my CIL.
> > >
> > > On Mon, Dec 28, 2020 at 10:18 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > Hi Philip,
> > > >
> > > > On Mon, Dec 21, 2020 at 05:47:57PM -0800, Philip Chen wrote:
> > > > > This patch adds a new property `google,custom-keyb-top-row` to the
> > > > > device tree for the custom keyboard top row design.
> > > >
> > > > Why don't we use the property we have for the same purpose in atkbd.c?
> > > > I.e. function-row-physmap?
> > > >
> > > Because this property serves a different purpose than function-row-physmap.
> > > `function-row-physmap` basically links the scancode to the physical
> > > position in the top row.
> > > `google,custom-keyb-top-row` aims at specifying the board-specific
> > > keyboard top row design associated with the action codes.
> > >
> > > In x86 path, the board-specific keyboard top row design associated
> > > with the action codes is exposed from coreboot to kernel through
> > > "linux,keymap" acpi table.
> > > When coreboot generates this acpi table, it asks EC to provide this
> > > information, since we add the board-specific top-row-design in EC
> > > codebase.
> > > (E.g. https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/board/jinlon/board.c#396)
> > >
> > > In ARM, we don't plan to involve EC in the vivaldi support stack.
> > > So `google,custom-keyb-top-row` DT property is our replacement for the
> > > board-specific top-row-design in x86 EC codebase.
> >
> > I disagree with this decision. We already have "linux,keymap" property
> > that is supposed to hold accurate keymap for the device in question,
> > there should be no need to introduce yet another property to adjust the
> > keymap to reflect the reality. If a device uses "non classic" ChromeOS
> > top row it should not be using the default keymap from
> > arch/arm/boot/dts/cros-ec-keyboard.dtsi but supply its own. You can
> > consider splitting the keymap into generic lower portion and the top row
> > and moving them into an .h file so they can be easily reused.
> >
> > >
> > > > Also, instead of specifying keycodes in this array we should use
> > > > combination of row and column identifying keys, like this:
> > > >
> > > >         function-row-physmap = <
> > > >                 MATRIX_KEY(0x00, 0x02, KEY_F1),
> > > >                 MATRIX_KEY(0x03, 0x02, KEY_F2),
> > > >                 ...
> > > >         >;
> > >
> > > This mapping between row/column to function keycode is fixed for all
> > > Chrome OS devices.
> >
> > *for now* The mapping for the rest of the keyboard has also stayed
> > static, but we still did not hardcode this information in the driver but
> > rather used DT property to pass it into the kernel.
> >
> > > So we don't really need to host this information in DT.
> > > Instead, I plan to hardcode this information in cros_ec_keyb.c.
> > > (Please see the array "top_row_key_pos[]" in my next patch: "[2/3]
> > > Input: cros_ec_keyb - Support custom top-row keys".)
> > >
> > > The only thing that could make the function-row-physmap file different
> > > among boards is the number of top row keys.
Given the reason above, can we just add `num-top-row-keys` property
instead of the whole `function-row-physmap`?
I think this is the only thing cros_ec_keyb needs to know to generate
the board-specific function-row-physmap file for the userspace.

> > > But this information can be derived from the length of
> > > `google,custom-keyb-top-row`.
> > > So we don't need a separate DT property for it.
> >
> > I am sorry, but I must insist. We need to have:
> >
> > - accurate keymap in linux,keymap property
> > - a separate property describing location of top row keys in terms of
> >   rows and columns (whether we reuse MATRIX_KEY or define another macro
> >   I do not really care).
> >
> > Thanks.
> >
> > --
> > Dmitry
