Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD44748F2D6
	for <lists+linux-input@lfdr.de>; Sat, 15 Jan 2022 00:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiANXJk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 18:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiANXJk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 18:09:40 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEACC061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 15:09:39 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id x22so34900521lfd.10
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 15:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nJcYrW1BzDTS3hAvukSNP/dUwd9d+rpzUo6aQUPhYv8=;
        b=CeXVQutWHpcalaCzYVV6a7KhlM1FYTPICKu75ygT3YFv1kzKm972ErmTtavV7svgc1
         mNbd6pnzsM5BDZOuu8wJlQqflQqAN/brBZczrDDyLb2JOXQecWb581ULEz5bd7PTEO64
         Au13AwrAwP9Ee2rAV9Uny2dxWweIKgAjlsz/1mSD+ZvPKmZ+w4w/iyyj7Szt/Dfj1Xhm
         J1rRAd7rgKdLgaw94qAHugtuZ0kw1Zh4eLAPxXk1Bh2qE1PGsFiW87aNKJcp5Slh5f6Y
         VVet8cv7BaM9YmsdwtdR9zHLZExxO/rpC+a3y/azErxEU6Nm9P3GLIjdXp/1YVgh2oFB
         hxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nJcYrW1BzDTS3hAvukSNP/dUwd9d+rpzUo6aQUPhYv8=;
        b=lHx4uziQWEn0L1rwulv1fOh5swCErG7NUh56bB/PkTnMXKqqJqvXMVlq/A6n/Aq3Ln
         xnPEDaRGaBFIYIbjgxjCeIRrxz8LcwQhpdS1ZHPbynC8bvp/+iEdtMfQOXO25ftFYde/
         hEphI8FtGtTaYf5urWWPWBVTGi8m3SROha8lh5ukpqyFDF5xWru97o0vcDipnnmST4YB
         rgYNxcFqBQ5tT/VCyo+IStc9kF7n3wcRG3QBv72ApVGP7/tmdrEGY6a1RbPfsEsSJT9d
         MRQgbPSI01hupuhqqCUYNe3vv2XHJloG0bj36J1a2lBJq4/Z/OSBxTQNoQwQ6PMO8aBm
         /+6w==
X-Gm-Message-State: AOAM530X4dbW+SZhFFKbZrT2tB8R6W4yzgTH1eGY9Kv7fs4p4UP2n+/N
        OFCM/cbHHikszBHX+rFtnkt8frVgxj8rBcwVFhJzEH/1
X-Google-Smtp-Source: ABdhPJzH42M7eu2WbEeOiePoK85mcjw0RakO01ph5T38eW9H0/NDowXSkPeWwHTmBQmf8df9zk279XdDSsO2Wh6PhLY=
X-Received: by 2002:a2e:a361:: with SMTP id i1mr8366154ljn.392.1642201778012;
 Fri, 14 Jan 2022 15:09:38 -0800 (PST)
MIME-Version: 1.0
References: <7bc98e92-bebc-e765-8d40-75f9a932f392@gmail.com>
In-Reply-To: <7bc98e92-bebc-e765-8d40-75f9a932f392@gmail.com>
From:   Alex Henrie <alexhenrie24@gmail.com>
Date:   Fri, 14 Jan 2022 16:09:26 -0700
Message-ID: <CAMMLpeSeoXSz2fTA_gYP+4=Sw_ckxkHw3BK57c6HurODxzqsZQ@mail.gmail.com>
Subject: Re: About the Apple tilde key quirk
To:     Markus Wageringel <markus.wageringel@gmail.com>
Cc:     jkosina@suse.cz,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 14, 2022 at 2:37 PM Markus Wageringel
<markus.wageringel@gmail.com> wrote:
>
> Hi Alex,
>
> regarding the changes around commit [1] that made it into kernel 5.16, I
> hope you do not mind if I message you directly, as I am not sure where
> else to bring this up.
>
> Apparently, the default behavior (when the iso_layout flag is not
> configured explicitly) has flipped for my keyboard.
>
>      $ lsusb | grep Keyboard
>      Bus 001 Device 004: ID 05ac:0246 Apple, Inc. Internal
> Keyboard/Trackpad (ISO)
>      $ cat /sys/bus/hid/devices/0003\:05AC\:0246.000{2,3}/country
>      0d
>      00
>
> As my keyboard is rather old (internal German keyboard of MacBookPro8,1
> 2011), maybe nothing needs to be done about this, so feel free to ignore
> this email. After all, one gets the correct behavior by explicitly
> setting `iso_layout=1` now, which used to be the default.
>
> Kind regards,
> Markus
>
> [1]
> https://github.com/torvalds/linux/commit/d58cf34a594d34de1a6843f576f82fae40adc0c2

Hi Markus,

Thank you for reporting this to me. Unfortunately, I didn't have any
foreign MacBooks to test, so I had no way of knowing if any of their
keyboards had the quirk. But based on your report, I think it's safe
to say that the quirk is present on the "Wellspring 5" and later
models. I will send a patch to fix them up.

Do you have any other MacBooks that you could test (especially super old ones)?

-Alex
