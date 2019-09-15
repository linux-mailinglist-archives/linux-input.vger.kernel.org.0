Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF1EB328A
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 01:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbfIOXIt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 19:08:49 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35571 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbfIOXIs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 19:08:48 -0400
Received: by mail-vs1-f65.google.com with SMTP id b11so22136732vsq.2
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 16:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XGwJWEoBVLgCgPnFrSO+Mkko2Qqj3tkT3fnMXtDkXGw=;
        b=grJokz+pQ3/WrRms7Snf5kpfBQ9l0jII7flIMDnweRtBKEvDuTXMHnaHoJAh7BADKB
         ghDfbrw5EB4Ky4AeyfnFg0CpjW7MWi7OPWdLX0t8Lsmk5CmLOCcRvczuWXi6sa9FrJVd
         Hsgvyxcy34X0gVMFsWMFyGjP/mULRxs4zrecVzkcdjuKEdTPhL4WX+RPShTEROvpYb2u
         GZkhkJIG9/vxK8NrbxLCYovrqFeZ9xOR58PLcXD16UvPdh0+7mZq1D3oJRMxN6fBMksc
         9TsTMk+VfKjc/JT3uxLMeEqqxL2umWn5seDoy9IZacbaekvl7QeYMCuAl4hcPjYaNODH
         a53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XGwJWEoBVLgCgPnFrSO+Mkko2Qqj3tkT3fnMXtDkXGw=;
        b=F9QwVD87zMaopXy9lllVLHtB1zubUX3BvaE4N0RbqcbadwklXjlHJcQsScyn6u/i4Q
         7o0deAbUeqLwSkkRHsMlsBLCV5woZ5GJFCNFThnPyk2RZVPH9QvH7YB4l5RWjCUd0I08
         iEh2sjcnDNDcZAGhmsBT8tLhfz+7Qkanz2BW7ZplSpm09SnxZKyi68hoI11O6HG/VlOj
         EvmBW4JeaS3nuOG8udrtY/NV/gU3Fkl+r64lS0XEeUyzaK0uvoyO3BnpGAAFeYLT26sg
         wM30ta7tpgy5iyQHThhIlVvHCT8AdrBtUX+jpkqvsDFRpc7XEnW2hDRNMKR2RU3oZO8m
         9NLg==
X-Gm-Message-State: APjAAAUcYMt0NdH+yPyVS2sfo/R9mMtxiECNP4mxI/KaWEEMkkjNoJO8
        zoFRgeEWG95Bt/k4ZrJEly+EtPLsY4u6ms9A0Ec=
X-Google-Smtp-Source: APXvYqwMnIWzLqWJQvLvMCKpDZjajNGNCCqb+3hNDXnKjQf4HfJejh+4dyFxl9YQnnfggH3IuKDH8NACSxR/3zsAKnk=
X-Received: by 2002:a67:fa86:: with SMTP id f6mr5518117vsq.78.1568588927727;
 Sun, 15 Sep 2019 16:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190603060644.10338-1-djogorchock@gmail.com> <20190912110809.GA6648@google.com>
In-Reply-To: <20190912110809.GA6648@google.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Sun, 15 Sep 2019 18:08:36 -0500
Message-ID: <CAEVj2t=oPXPxAhvuUPV4m3gMRmcqCFBtN4-hceu-9dE4ipyuAQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] HID: joycon
To:     Siarhei Vishniakou <svv@google.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Siarhei,

Thank you for the feedback. I'm about to submit a revised patchset
that addresses most of your points along with some other improvements.
I'll be sure to CC you on it. See inline below for my response:

On Thu, Sep 12, 2019 at 6:08 AM Siarhei Vishniakou <svv@google.com> wrote:
>
> Hi,
>
> Thanks for the patchset. Some questions and comments on the driver:
>
> 1. In the rumble patch, there are some functions that are only used if
> CONFIG_JOYCON_FF is enabled. Otherwise, the compiler complains about
> unused functions. Could you guard these with #ifdef?
>
Fixed in v6

> 2. Inside hid-ids, most of the defines use tabs, but the current patch
> uses spaces. Could you change to use tabs?
>
Fixed in v6

> 3. Currently, the driver quits and prints an error if it is not able to
> read the calibration data. That means, if the device is being simulated
> using /dev/uhid, it is necessary to also properly respond to these
> low-level requests for flash memory reading. This is doable, but is a
> lot of work. Any way to allow the driver to continue to function even if
> calibration data is missing? Maybe just print a warning that the sticks
> won't function well?
>
Added default calibration for v6

> 4. The word "synchronous" is mispelled
>
Fixed

> 5. Currently, in this driver, the DPAD presses generate key events.
> However, most of the other drivers for today's popular controllers, like
> DS4 and xbox, produce axis events for these. Is it possible to use axis
> in this driver, in order to make it easier for applications to handle
> these?
>
The left joy-con controller uses four individual buttons rather than a
classic dpad, so I think using the up/down/left/right keys is
appropriate. The pro controller does have an actual dpad, but the
inputs are reported identically to the left joy-con, and I wanted the
driver to report them the same way to userspace (also keeps the driver
code cleaner).

> 6. There is currently a compiler error in joycon_rumble_amplitudes.
> The last (max) amplitude is not a compile-time constant. Suggest to
> revise as follows:
> static const u16 joycon_max_rumble_amp = 1003;
> ...
> static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
> ...
> { 0xc8, 0x0072, joycon_max_rumble_amp }
> };
>
Fixed in v6. I'm not sure why gcc wasn't complaining about this for
me. The people working on the android port to the nintendo switch were
getting the same error, and everything I've read online implies it is
not considered a compile time constant in C. Maybe newer gccs are more
flexible in ignoring the standard in this case.

> 7. In hid-joycon.c, there are currently a lot of defines for different
> commands, such as JC_INPUT_BUTTON_EVENT. My personal preference is to
> use const u8 for these for type safety.
>
>
Switched the vast majority of the defines to static const uX types in v6.


-- 
Daniel Ogorchock
