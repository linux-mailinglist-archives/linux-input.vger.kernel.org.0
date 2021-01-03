Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27E42E8EB6
	for <lists+linux-input@lfdr.de>; Sun,  3 Jan 2021 23:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbhACWtN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 17:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbhACWtN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 17:49:13 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA25C061573;
        Sun,  3 Jan 2021 14:48:33 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id i5so17592492pgo.1;
        Sun, 03 Jan 2021 14:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t0zu2rRiEVfRsaF3pV2UiBvQuBiFNssfwxgn5PC1iG4=;
        b=E5ga9ng/7cLpzhS9xKIdS8M5Hl+oy53UodMpPe1r2iC3o7RAHJAa87ip72YSSfxoJk
         +Yl2h7SnGDSrPXo8LJLaIlM/TlZl0aS43bqdZ/DgGXRM5aTbWfnm8KYKYanpcKMAgrC6
         2oywl3mEYkoz/s/0KDRip1gu09Wg3/mI2zMTfBOfr2IgN9fouRv/uvpih6/eJp6K/Op+
         us8H4YryuNRwqrPYTeRlwLlMJdqQc1E66StDQQ90ZeHHYGNsmx/vsAbmbllyH4xEbsRo
         0lwH+XxMV3ByJa7pndXl7bY0g69iNY5nO2fRVX0jc+jpeQ6R6yFlVxyqNOk0laEAdwIN
         rvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t0zu2rRiEVfRsaF3pV2UiBvQuBiFNssfwxgn5PC1iG4=;
        b=e8a5IRkSDh0GOokibL4xHsXxHxP2yNADZ/jJdqq+El4jdW6BCRFsI7b8tleXLWnzSh
         vAbOUy5XZ9jXSm4hKHmaHAuqjE+QItn7Ds0zH6uVg+fsnhEfjLGZg1Kz4yMu+Rjb/S7z
         bZfXLN7psa7jxx3fTrOBxZHGfMWzp120Sc/o1hln+EcKaAT81ym3SLjXRtit2XBW8Io4
         Jq9EnMz6+9UddLfxFtd+omn0rA+ZQmx7q+zRZcNMSIo/OsrcFCJzy5JWpI2hnkvHeH9J
         j0qc7f8A2xfmDz73jicfU0/HvZ44PnRI5pxlxIwKlMxtlUQ1whMnAD4PoaH5LaLbyWhM
         PrHA==
X-Gm-Message-State: AOAM53336Csbi8EXTijyTs7FZD/5Iunj2VY4P/ndQdpH0WtgETKyjjKm
        vT0cFVD7mLgkoGsH8Gx68HM=
X-Google-Smtp-Source: ABdhPJxWGBkwsAPpmUmNUo0go5BQh4HaA87kiku/T8uLxrcKGUD3dpMkiV0I0qGchgQuTuP3ixGy/Q==
X-Received: by 2002:a62:644c:0:b029:1a1:f568:d2d9 with SMTP id y73-20020a62644c0000b02901a1f568d2d9mr64670051pfb.64.1609714112574;
        Sun, 03 Jan 2021 14:48:32 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b12sm24511144pgr.9.2021.01.03.14.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 14:48:31 -0800 (PST)
Date:   Sun, 3 Jan 2021 14:48:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Philip Chen <philipchen@chromium.org>
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
Subject: Re: [PATCH 1/3] dt-bindings: input: cros-ec-keyb: Add a new property
Message-ID: <X/JJvUobb7DtgFyC@google.com>
References: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <X+rKPhJrQaykPxri@google.com>
 <CA+cxXh=HH-UAt747OYRwaaABdJpT8r=TvrYcFah7PQ1vHqYutg@mail.gmail.com>
 <X/Df0uuclk1ZNOps@google.com>
 <CA+cxXhnY_TpnA1iR8XJ87xNeNsi2Ba89+VJEPtB7wJ-=8O=4ag@mail.gmail.com>
 <CA+cxXhkdZ2ifyCG=p3Fbxwnzu-8z3Q1jNzaBQ=MMfeJ3vqkfhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+cxXhkdZ2ifyCG=p3Fbxwnzu-8z3Q1jNzaBQ=MMfeJ3vqkfhw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Philip,

On Sat, Jan 02, 2021 at 10:11:21PM -0800, Philip Chen wrote:
> Hi Dmitry,
> 
> I have one more question below.
> Could you take a look?
> 
> On Sat, Jan 2, 2021 at 8:53 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Hi Dmitry,
> >
> > I see.
> > I'll update these patch sets shortly based on your suggestion.
> > Thanks.
> >
> > On Sat, Jan 2, 2021 at 1:04 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Sat, Jan 02, 2021 at 11:39:34AM -0800, Philip Chen wrote:
> > > > Hi Dmitry,
> > > >
> > > > Thanks for reviewing my patch over the holiday season.
> > > > Please check my CIL.
> > > >
> > > > On Mon, Dec 28, 2020 at 10:18 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > >
> > > > > Hi Philip,
> > > > >
> > > > > On Mon, Dec 21, 2020 at 05:47:57PM -0800, Philip Chen wrote:
> > > > > > This patch adds a new property `google,custom-keyb-top-row` to the
> > > > > > device tree for the custom keyboard top row design.
> > > > >
> > > > > Why don't we use the property we have for the same purpose in atkbd.c?
> > > > > I.e. function-row-physmap?
> > > > >
> > > > Because this property serves a different purpose than function-row-physmap.
> > > > `function-row-physmap` basically links the scancode to the physical
> > > > position in the top row.
> > > > `google,custom-keyb-top-row` aims at specifying the board-specific
> > > > keyboard top row design associated with the action codes.
> > > >
> > > > In x86 path, the board-specific keyboard top row design associated
> > > > with the action codes is exposed from coreboot to kernel through
> > > > "linux,keymap" acpi table.
> > > > When coreboot generates this acpi table, it asks EC to provide this
> > > > information, since we add the board-specific top-row-design in EC
> > > > codebase.
> > > > (E.g. https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/board/jinlon/board.c#396)
> > > >
> > > > In ARM, we don't plan to involve EC in the vivaldi support stack.
> > > > So `google,custom-keyb-top-row` DT property is our replacement for the
> > > > board-specific top-row-design in x86 EC codebase.
> > >
> > > I disagree with this decision. We already have "linux,keymap" property
> > > that is supposed to hold accurate keymap for the device in question,
> > > there should be no need to introduce yet another property to adjust the
> > > keymap to reflect the reality. If a device uses "non classic" ChromeOS
> > > top row it should not be using the default keymap from
> > > arch/arm/boot/dts/cros-ec-keyboard.dtsi but supply its own. You can
> > > consider splitting the keymap into generic lower portion and the top row
> > > and moving them into an .h file so they can be easily reused.
> > >
> > > >
> > > > > Also, instead of specifying keycodes in this array we should use
> > > > > combination of row and column identifying keys, like this:
> > > > >
> > > > >         function-row-physmap = <
> > > > >                 MATRIX_KEY(0x00, 0x02, KEY_F1),
> > > > >                 MATRIX_KEY(0x03, 0x02, KEY_F2),
> > > > >                 ...
> > > > >         >;
> > > >
> > > > This mapping between row/column to function keycode is fixed for all
> > > > Chrome OS devices.
> > >
> > > *for now* The mapping for the rest of the keyboard has also stayed
> > > static, but we still did not hardcode this information in the driver but
> > > rather used DT property to pass it into the kernel.
> > >
> > > > So we don't really need to host this information in DT.
> > > > Instead, I plan to hardcode this information in cros_ec_keyb.c.
> > > > (Please see the array "top_row_key_pos[]" in my next patch: "[2/3]
> > > > Input: cros_ec_keyb - Support custom top-row keys".)
> > > >
> > > > The only thing that could make the function-row-physmap file different
> > > > among boards is the number of top row keys.
> Given the reason above, can we just add `num-top-row-keys` property
> instead of the whole `function-row-physmap`?
> I think this is the only thing cros_ec_keyb needs to know to generate
> the board-specific function-row-physmap file for the userspace.

This would mean that we need to hard-code the knowledge of the scan
matrix in the driver and will not allow us to "skip" any keys in the top
row. Given that we did not hard-code the keymap I do not see why we
would want to do it differently with the top row. function-row-physmap
provides greatest flexibility and I do not see any downsides.

Thanks.

-- 
Dmitry
