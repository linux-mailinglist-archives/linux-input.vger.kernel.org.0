Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2C62E889B
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 22:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbhABVFD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 16:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbhABVFD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 16:05:03 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08CDC061573;
        Sat,  2 Jan 2021 13:04:22 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 30so11569161pgr.6;
        Sat, 02 Jan 2021 13:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=batTpJaMOL1FFI0uGtWA1DfsObBuHXQtfvMMJL5nuPY=;
        b=BlTP4nFqXWxo/gFNPnN/QvF9cqLiYKCC7FFH+1TzF5gx+fWXbhg54L0adxijxJaHF0
         rzYoKqe7tQPPSksA2yS8GDUajlgiQMUXdCCA44FSwLVbmFr4iLLPl62akZF60SZK6whW
         um4XM+W+RNaAQerGS+DSnY2O79SOPu5ayYRMRaqOMIDzFmKBa2k0CSqc8pt1VXY44JxZ
         FOc7zza3W5mfhqn4iOvuRTACBbr4aD3CMDECppp3LaKU0tsW2PCDsC9HAaJuKKZP68qk
         SzNnXIqwTlmx0YLD8AVmF/Yf9FpyEq8fr6BuPV26Zyaop4r8jioc6Ox/hhupTSW0zmlL
         TAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=batTpJaMOL1FFI0uGtWA1DfsObBuHXQtfvMMJL5nuPY=;
        b=YAnkoxkOjqCyDyFuCpG/YkIWKJJFdxsZTxwR+yuBXzKliK832SiSz4fUmkn/b9cbgB
         12zOM0zmpJFDBqopWkCor+vJKQEZ8qNfdZhhuYkIWXH9OImAI0c7p4CDoxBe6ee/RTAV
         NMtb16wU8qlvZ7+HXuBs02KFDAYHpkAITLd1ldu0Mru7s0ctL3sYfq1SHDj+tRmLf/zM
         K6Sg7oClWi8XoLvBTaIqRo8XMKGyf97gcPoI2Ps3y+vnEV8FSa0I0UE059mr+IRTxUQr
         /FSCqvcpr0RibYH6uLuVaWUSrave4K7AtiSrPCeiJCcP48qr2KScxD8k4+97hw/vWfD5
         OTFA==
X-Gm-Message-State: AOAM533Wzk/xaNgZQFa8StrZsRDiOtMsuGR6o5GrxOLZwoEI6YAVBRFp
        CgaQQ6NDDjQC3H3ZR5xs1LE=
X-Google-Smtp-Source: ABdhPJyvzklQDstje9V+YroXzhRkM4BKP1nWETe4FmdNgNo3J1MTHjRg4+eJCWEkcsFAE0Px7S9Hqg==
X-Received: by 2002:a63:5d3:: with SMTP id 202mr65071783pgf.286.1609621461908;
        Sat, 02 Jan 2021 13:04:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b22sm51049570pfo.163.2021.01.02.13.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 13:04:21 -0800 (PST)
Date:   Sat, 2 Jan 2021 13:04:18 -0800
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
Message-ID: <X/Df0uuclk1ZNOps@google.com>
References: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <X+rKPhJrQaykPxri@google.com>
 <CA+cxXh=HH-UAt747OYRwaaABdJpT8r=TvrYcFah7PQ1vHqYutg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+cxXh=HH-UAt747OYRwaaABdJpT8r=TvrYcFah7PQ1vHqYutg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 02, 2021 at 11:39:34AM -0800, Philip Chen wrote:
> Hi Dmitry,
> 
> Thanks for reviewing my patch over the holiday season.
> Please check my CIL.
> 
> On Mon, Dec 28, 2020 at 10:18 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Philip,
> >
> > On Mon, Dec 21, 2020 at 05:47:57PM -0800, Philip Chen wrote:
> > > This patch adds a new property `google,custom-keyb-top-row` to the
> > > device tree for the custom keyboard top row design.
> >
> > Why don't we use the property we have for the same purpose in atkbd.c?
> > I.e. function-row-physmap?
> >
> Because this property serves a different purpose than function-row-physmap.
> `function-row-physmap` basically links the scancode to the physical
> position in the top row.
> `google,custom-keyb-top-row` aims at specifying the board-specific
> keyboard top row design associated with the action codes.
> 
> In x86 path, the board-specific keyboard top row design associated
> with the action codes is exposed from coreboot to kernel through
> "linux,keymap" acpi table.
> When coreboot generates this acpi table, it asks EC to provide this
> information, since we add the board-specific top-row-design in EC
> codebase.
> (E.g. https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/board/jinlon/board.c#396)
> 
> In ARM, we don't plan to involve EC in the vivaldi support stack.
> So `google,custom-keyb-top-row` DT property is our replacement for the
> board-specific top-row-design in x86 EC codebase.

I disagree with this decision. We already have "linux,keymap" property
that is supposed to hold accurate keymap for the device in question,
there should be no need to introduce yet another property to adjust the
keymap to reflect the reality. If a device uses "non classic" ChromeOS
top row it should not be using the default keymap from
arch/arm/boot/dts/cros-ec-keyboard.dtsi but supply its own. You can
consider splitting the keymap into generic lower portion and the top row
and moving them into an .h file so they can be easily reused.

> 
> > Also, instead of specifying keycodes in this array we should use
> > combination of row and column identifying keys, like this:
> >
> >         function-row-physmap = <
> >                 MATRIX_KEY(0x00, 0x02, KEY_F1),
> >                 MATRIX_KEY(0x03, 0x02, KEY_F2),
> >                 ...
> >         >;
> 
> This mapping between row/column to function keycode is fixed for all
> Chrome OS devices.

*for now* The mapping for the rest of the keyboard has also stayed
static, but we still did not hardcode this information in the driver but
rather used DT property to pass it into the kernel.

> So we don't really need to host this information in DT.
> Instead, I plan to hardcode this information in cros_ec_keyb.c.
> (Please see the array "top_row_key_pos[]" in my next patch: "[2/3]
> Input: cros_ec_keyb - Support custom top-row keys".)
> 
> The only thing that could make the function-row-physmap file different
> among boards is the number of top row keys.
> But this information can be derived from the length of
> `google,custom-keyb-top-row`.
> So we don't need a separate DT property for it.

I am sorry, but I must insist. We need to have:

- accurate keymap in linux,keymap property
- a separate property describing location of top row keys in terms of
  rows and columns (whether we reuse MATRIX_KEY or define another macro
  I do not really care).

Thanks.

-- 
Dmitry
