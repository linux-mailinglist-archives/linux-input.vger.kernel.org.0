Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7DABAC6A6
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2019 14:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405939AbfIGMlu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Sep 2019 08:41:50 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43667 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731870AbfIGMlt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Sep 2019 08:41:49 -0400
Received: by mail-qt1-f196.google.com with SMTP id l22so10479908qtp.10
        for <linux-input@vger.kernel.org>; Sat, 07 Sep 2019 05:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nnRrWKgjX++JBBqAhcwbf5AxHYcVnkDKUfX2dAX144w=;
        b=V/kgTKMZl+Ypg5vjfSlKYD4GlV7OOlwKSmZMr73yoXSsCt2Nf76MMjJuMxpYf33ZnL
         Sj7+/qCVBySSRtTO017R65PH2JRUndz+DLnscqGALSvhuWikuDESYjtupYrVNG7OZ6X4
         mFKerYFTtDo+Xjyst2FHwCwO4Yz+ZlNQLpzI/nK0SoQsaYcM1paUG4AZ4WqUH4GT8TNw
         +n4aLhidfMil3PU4j3BYOf24ePnlDCEIiD/dFa8L/D60Nm9KYrbX3TsKYeWOHFSvx7c2
         mhplIq4TR/8qq3qkfZf8CD2liZyzdjVthsDtYSDjy+lraAKkI86Bvi6jv0s/8ANDiz+k
         fV5g==
X-Gm-Message-State: APjAAAWvOt6Cnpq8ZtlthePbai1NFR/qwU4IePXik6RedziFs61y02h+
        lz6Oj2sJrUGXXsUyv7kzjzKpAUCdMjK7dfkpm4E=
X-Google-Smtp-Source: APXvYqzI/ZErU0XBgJyQgnzQ+gPqUDXiZ/h616SzLKHLDSf+5OswQ89XVxh90C1GdtHI5okfO4sdcXCR1ojFiAH03uM=
X-Received: by 2002:ad4:4529:: with SMTP id l9mr4130948qvu.45.1567860108535;
 Sat, 07 Sep 2019 05:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <201909071756.9uCG4IvK%lkp@intel.com>
In-Reply-To: <201909071756.9uCG4IvK%lkp@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 7 Sep 2019 14:41:32 +0200
Message-ID: <CAK8P3a3AtpcpAkwMgLwWTJO7yaHKAk5d5eBnYZk3TM4AWyiCgQ@mail.gmail.com>
Subject: Re: [input:next 2311/2342] arch/arm/mach-w90x900/dev.c:38:10: fatal
 error: linux/platform_data/keypad-w90p910.h: No such file or directory
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 7, 2019 at 11:17 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/dtor/input.git next
> head:   410f25de467ee94c1a577c6ee7370c37b376c17c
> commit: 060157e1dbc133075a2e20786d6ff6d4b41909f9 [2311/2342] Input: remove w90x900 keyboard driver
> config: arm-nuc960_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 060157e1dbc133075a2e20786d6ff6d4b41909f9
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/arm/mach-w90x900/dev.c:38:10: fatal error: linux/platform_data/keypad-w90p910.h: No such file or directory
>     #include <linux/platform_data/keypad-w90p910.h>
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
> vim +38 arch/arm/mach-w90x900/dev.c

Ah, right: this happens when we remove the driver before the platform.
As both are queued for 5.4, I'm not worried about it at all.

Dmitry: if you'd rather avoid having this in your tree, I can instead merge
it through the arm/soc branch on top of the removal of the platform code.

        Arnd
