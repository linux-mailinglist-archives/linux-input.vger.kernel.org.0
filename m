Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F072EA085
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 00:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbhADXMM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 18:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbhADXMM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 18:12:12 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0D3C061794
        for <linux-input@vger.kernel.org>; Mon,  4 Jan 2021 15:11:31 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id b24so27694006otj.0
        for <linux-input@vger.kernel.org>; Mon, 04 Jan 2021 15:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEWGfdV8Yj5a/4AFisJXqWYzLURVQ8ThVGoTlvlWYCM=;
        b=BJY4huj1LdwJ5sWUg9sXExNo9KfO6MpSVjQOHGNyROMlWv5ZVEF9cIP/OjwEyBUVTm
         OaLzCfktucm1gfZCIAhwi9Shv3etzneUnK5ue3ShHLMSgQ2UiMSgGb/HAsdTUep3xnpc
         DXnuJq5TN15dYMHAFQw4XWhm4T6nBQeAz497g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LEWGfdV8Yj5a/4AFisJXqWYzLURVQ8ThVGoTlvlWYCM=;
        b=doQKIc46htPxELixNHNPIcPnkvL6JD6ObtLS+/EhjcUmLDTfejbqHCAbVN7TDbIBla
         KAEq6SM3aPIo3fa+HQot0xcsPa+XN+J8hXdTv5QueQxKrfINi8fjUIQlJpcjhTmBaTwR
         ZhkCT8/SFjaj387xxGHWOyNwUGhdPkqAygOGU6D4dDsRA+qBqp2x9gZX8rKJlStUj7AY
         G8dtpasxKbs+z/qEJ+vaqc1RhBouvx8P8qfVvhHdGiEvBYE4JqEdkUT33iU9aq2y99vT
         AF0HcJwVmtGqexwFhhYy1va8siDZ0qzg+WkwZgar8rqRW2MFvq3MkHHhfD9ssWkovnNV
         S4/Q==
X-Gm-Message-State: AOAM532ssPj+65Q99oJjfQp6Y1EcvjFKAiMwpYZrR5nEq7gZ7SsxwZVo
        SeeOl4pB13u29zooEN3jKI1s5cGmPv+PZR+lzVLjsuosIao=
X-Google-Smtp-Source: ABdhPJw5tl7zCiPZxTDgdfPfW9BUkfOUbTolKemN444MyrlP6Ak/Pr7AllDebmmWVbyq4b2B16UN+AxU7KGXAo97C1w=
X-Received: by 2002:a25:1104:: with SMTP id 4mr87231388ybr.476.1609801397150;
 Mon, 04 Jan 2021 15:03:17 -0800 (PST)
MIME-Version: 1.0
References: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <X+rKPhJrQaykPxri@google.com> <CA+cxXh=HH-UAt747OYRwaaABdJpT8r=TvrYcFah7PQ1vHqYutg@mail.gmail.com>
 <X/Df0uuclk1ZNOps@google.com> <CA+cxXhnY_TpnA1iR8XJ87xNeNsi2Ba89+VJEPtB7wJ-=8O=4ag@mail.gmail.com>
 <CA+cxXhkdZ2ifyCG=p3Fbxwnzu-8z3Q1jNzaBQ=MMfeJ3vqkfhw@mail.gmail.com> <X/JJvUobb7DtgFyC@google.com>
In-Reply-To: <X/JJvUobb7DtgFyC@google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Mon, 4 Jan 2021 15:03:06 -0800
Message-ID: <CA+cxXhmUs0PaoQL+PbfoSLxD10zTbwC3wefr==7FCt0iOfRDOQ@mail.gmail.com>
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

On Sun, Jan 3, 2021 at 2:48 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Philip,
>
> On Sat, Jan 02, 2021 at 10:11:21PM -0800, Philip Chen wrote:
> > Hi Dmitry,
> >
> > I have one more question below.
> > Could you take a look?
> >
> > On Sat, Jan 2, 2021 at 8:53 PM Philip Chen <philipchen@chromium.org> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > I see.
> > > I'll update these patch sets shortly based on your suggestion.
> > > Thanks.
> > >
> > > On Sat, Jan 2, 2021 at 1:04 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > On Sat, Jan 02, 2021 at 11:39:34AM -0800, Philip Chen wrote:
> > > > > Hi Dmitry,
> > > > >
> > > > > Thanks for reviewing my patch over the holiday season.
> > > > > Please check my CIL.
> > > > >
> > > > > On Mon, Dec 28, 2020 at 10:18 PM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > >
> > > > > > Hi Philip,
> > > > > >
> > > > > > On Mon, Dec 21, 2020 at 05:47:57PM -0800, Philip Chen wrote:
> > > > > > > This patch adds a new property `google,custom-keyb-top-row` to the
> > > > > > > device tree for the custom keyboard top row design.
> > > > > >
> > > > > > Why don't we use the property we have for the same purpose in atkbd.c?
> > > > > > I.e. function-row-physmap?
> > > > > >
> > > > > Because this property serves a different purpose than function-row-physmap.
> > > > > `function-row-physmap` basically links the scancode to the physical
> > > > > position in the top row.
> > > > > `google,custom-keyb-top-row` aims at specifying the board-specific
> > > > > keyboard top row design associated with the action codes.
> > > > >
> > > > > In x86 path, the board-specific keyboard top row design associated
> > > > > with the action codes is exposed from coreboot to kernel through
> > > > > "linux,keymap" acpi table.
> > > > > When coreboot generates this acpi table, it asks EC to provide this
> > > > > information, since we add the board-specific top-row-design in EC
> > > > > codebase.
> > > > > (E.g. https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/board/jinlon/board.c#396)
> > > > >
> > > > > In ARM, we don't plan to involve EC in the vivaldi support stack.
> > > > > So `google,custom-keyb-top-row` DT property is our replacement for the
> > > > > board-specific top-row-design in x86 EC codebase.
> > > >
> > > > I disagree with this decision. We already have "linux,keymap" property
> > > > that is supposed to hold accurate keymap for the device in question,
> > > > there should be no need to introduce yet another property to adjust the
> > > > keymap to reflect the reality. If a device uses "non classic" ChromeOS
> > > > top row it should not be using the default keymap from
> > > > arch/arm/boot/dts/cros-ec-keyboard.dtsi but supply its own. You can
> > > > consider splitting the keymap into generic lower portion and the top row
> > > > and moving them into an .h file so they can be easily reused.
> > > >
> > > > >
> > > > > > Also, instead of specifying keycodes in this array we should use
> > > > > > combination of row and column identifying keys, like this:
> > > > > >
> > > > > >         function-row-physmap = <
> > > > > >                 MATRIX_KEY(0x00, 0x02, KEY_F1),
> > > > > >                 MATRIX_KEY(0x03, 0x02, KEY_F2),
> > > > > >                 ...
> > > > > >         >;
> > > > >
> > > > > This mapping between row/column to function keycode is fixed for all
> > > > > Chrome OS devices.
> > > >
> > > > *for now* The mapping for the rest of the keyboard has also stayed
> > > > static, but we still did not hardcode this information in the driver but
> > > > rather used DT property to pass it into the kernel.
> > > >
> > > > > So we don't really need to host this information in DT.
> > > > > Instead, I plan to hardcode this information in cros_ec_keyb.c.
> > > > > (Please see the array "top_row_key_pos[]" in my next patch: "[2/3]
> > > > > Input: cros_ec_keyb - Support custom top-row keys".)
> > > > >
> > > > > The only thing that could make the function-row-physmap file different
> > > > > among boards is the number of top row keys.
> > Given the reason above, can we just add `num-top-row-keys` property
> > instead of the whole `function-row-physmap`?
> > I think this is the only thing cros_ec_keyb needs to know to generate
> > the board-specific function-row-physmap file for the userspace.
>
> This would mean that we need to hard-code the knowledge of the scan
> matrix in the driver and will not allow us to "skip" any keys in the top
> row. Given that we did not hard-code the keymap I do not see why we
> would want to do it differently with the top row. function-row-physmap
> provides greatest flexibility and I do not see any downsides.

OK. I updated in v2.
PTAL.
Thanks.

>
> Thanks.
>
> --
> Dmitry
