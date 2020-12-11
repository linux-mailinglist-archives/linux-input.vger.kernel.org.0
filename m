Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D582D81FB
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 23:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387557AbgLKWZX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 17:25:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406869AbgLKWZA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 17:25:00 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66987C0613CF
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:24:20 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id n18so3368184ual.9
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2V8dumQLCLei/K5kEH4vmBIhKgYMCFjP1IFYUdsRXw=;
        b=hHr6gb5C1YqPu9zJ5xn9DuTY8kyysHrXSzd9pPvtBy8ek9JPhNVA3vpBxyJOnOGuBO
         fK5kC8xmZW2Srv3S16gduqPPo2gjZH9/u4Tj14EDvoLuwEYyIt2umThUSorHUXh2ilfk
         jN4vWQS3MaCTO/lffelYl5BPmd30OUujLJkfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2V8dumQLCLei/K5kEH4vmBIhKgYMCFjP1IFYUdsRXw=;
        b=XfG1Y86ViEFn9jhg1dRw97afK6wdRFee9+z5a3HpmV+FfoATx7ZZRcX4yG+xGLlgk5
         HbjTc23H/godrk1U31T/UFnw4XTNxqx6rdrzcVs9nMcSVnKrCNUpbyxbEWYD/6M7YIFx
         6IbYRz2THZ3mMZnpf0PmYwBieO2k2P7a3HRlBWiGGn6nJLAHQDAYI8S/teTPtUuhJpNq
         2+uOPstqWON6QfItYgs80w8ywX9pTx7rKIh+f4Qw+yWGl4gGUfxzS0mAe9YfY9IRKdjK
         8AqkUyYCcL0LQ86OflLnEUsGuN+xNXquUD/R+DY5KQR1sU+SrPJIuLFu64dFn8tftQw0
         QPyw==
X-Gm-Message-State: AOAM530OCO00ICbnqGhPmsk7Zvw1UiYPyF5SuaJZhJKJJLQ4GVbUIP5/
        j1kbMKWWcafrT4yexDOJgDlXkpwb/304SA==
X-Google-Smtp-Source: ABdhPJy5WCUg5n4wIol3TaH5RQqv/BIKDCqPvl8o9zlgyJP+JI5mK8f91oxkioR1i/ae04RmExiwwA==
X-Received: by 2002:ab0:1c0a:: with SMTP id a10mr14605997uaj.89.1607725459455;
        Fri, 11 Dec 2020 14:24:19 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id u16sm1101903vsc.23.2020.12.11.14.24.17
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 14:24:18 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id t19so3378184uaq.1
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:24:17 -0800 (PST)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr14809978uaa.104.1607725457245;
 Fri, 11 Dec 2020 14:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20201211092956.v7.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <202012120310.liZcXbuL-lkp@intel.com>
In-Reply-To: <202012120310.liZcXbuL-lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 11 Dec 2020 14:24:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHe7E1xMGLxv99deOHVO2oH0LUsPMvwchxL5r6sQ_V6Q@mail.gmail.com>
Message-ID: <CAD=FV=WHe7E1xMGLxv99deOHVO2oH0LUsPMvwchxL5r6sQ_V6Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 separate modules
To:     kernel test robot <lkp@intel.com>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kbuild-all@lists.01.org, Hans de Goede <hdegoede@redhat.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Dec 11, 2020 at 11:25 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on hid/for-next]
> [also build test WARNING on next-20201211]
> [cannot apply to jikos-trivial/for-next v5.10-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/HID-i2c-hid-Reorganize-to-allow-supporting-goodix-gt7375p/20201212-014239
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/5a371169c8cc2abb463e32db3a3fe60ea34efc87
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Douglas-Anderson/HID-i2c-hid-Reorganize-to-allow-supporting-goodix-gt7375p/20201212-014239
>         git checkout 5a371169c8cc2abb463e32db3a3fe60ea34efc87
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/hid/i2c-hid/i2c-hid-core.c:1050:5: warning: no previous prototype for 'i2c_hid_core_suspend' [-Wmissing-prototypes]
>     1050 | int i2c_hid_core_suspend(struct device *dev)
>          |     ^~~~~~~~~~~~~~~~~~~~
> >> drivers/hid/i2c-hid/i2c-hid-core.c:1084:5: warning: no previous prototype for 'i2c_hid_core_resume' [-Wmissing-prototypes]
>     1084 | int i2c_hid_core_resume(struct device *dev)
>          |     ^~~~~~~~~~~~~~~~~~~

Yup, that's definitely true.  At the risk of a little extra spam, I'll
spin a quick v8 making these static so it's ready to land.  I guess I
missed doing that when we stopped exporting them and my compiler
doesn't yell about this.

-Doug
