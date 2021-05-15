Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3A7381A99
	for <lists+linux-input@lfdr.de>; Sat, 15 May 2021 20:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234500AbhEOSvo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 May 2021 14:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhEOSvm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 May 2021 14:51:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A950C061573;
        Sat, 15 May 2021 11:50:26 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y14so212146wrm.13;
        Sat, 15 May 2021 11:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UqGQdh+bPJvloimRNTGNhKmXUwcr12DEEsrVJsHUCe4=;
        b=qUo1hhDci/ForXuvlI0uU9L5ThD3/njwhIWkIo4n6GAfTJAwMW+PSd68rwNnyRIQXL
         LiBLQodkO44orCwAFIIZ/HQZt1oXlBPb7lGWIRbUYOCHQAdm/7BHHYCtEkVObwILlbuF
         sFzdfk5rzDMXneczgVwbVbc3dHbZcmfEAmXgSn7scScaoSrzkA+GuDSZ3IrdTEdBXtFU
         4SyCmWoEMhN+drxGWwzYWea+3Tb2cQ+yzYbazRUDa0IP0lUWDg0GN3wP7n6CGe6qUkF3
         rJgeKb2sSmfOuNFExC1MOvxD2Q0uML/fbP7nFG3Jy7g04AgEgdC6Y3STKl1hKdpe23Jf
         R0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UqGQdh+bPJvloimRNTGNhKmXUwcr12DEEsrVJsHUCe4=;
        b=SBHggv/jK5GVmKCzkS0NNLGzsVm9QxwT2RVU5KnOhUav2gWlZVotH00v8KROwrxdAB
         hzmGvQX7YJ9WsjbQCj8YSg/x6xUgtpvzXSRdDvVBAiNGo4m5ppcU57rYdGQ6YiJKAXbu
         GVgj/JUnRmI+Mtc1w6GHnKiQW8MFwZ6TLKMs/Aty33/rd49h1Kyj2iTlMP02YtJaexM5
         qKiRT896gh3HGDOo5bH9UTJLuybcIqW+ogOhN+aa+tkzxFDm6FM1Aj87mryuctl3Yjsw
         Q1EuBVsox78jTcKQ8NhmpvtVfflAVhF9vBCvfLw+JdGlt4rnuCXcMpYMybfqsx/k0nX2
         raaw==
X-Gm-Message-State: AOAM533Qbjv6BKEgQPbPY7LQh+2trNnIAKjqSRiSUrk7AcMJwRs4Sol8
        R72PemMoFjlhnqKDBuzLN1k=
X-Google-Smtp-Source: ABdhPJxIw0NrgcjvTaB5zp+hoXtzXyDQVZmMsSRlnUWacqwpAy+BjvY/FAa2p6YILc4d3h1uIdyAQw==
X-Received: by 2002:adf:bc46:: with SMTP id a6mr27684256wrh.232.1621104623932;
        Sat, 15 May 2021 11:50:23 -0700 (PDT)
Received: from elementary-os.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id c65sm1999507wme.47.2021.05.15.11.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 11:50:23 -0700 (PDT)
Date:   Sat, 15 May 2021 20:50:21 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     jose.exposito89@gmail.com
Cc:     jikos@kernel.org, kbuild-all@lists.01.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] HID: magicmouse: Magic Trackpad 2 USB battery
 capacity
Message-ID: <20210515185021.GA177131@elementary-os.localdomain>
References: <20210511182023.730524-3-jose.exposito89@gmail.com>
 <202105121712.MGWeLu1Q-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202105121712.MGWeLu1Q-lkp@intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 12, 2021 at 05:39:31PM +0800, kernel test robot wrote:
> Hi "José,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on hid/for-next]
> [also build test ERROR on v5.13-rc1 next-20210511]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/HID-magicmouse-register-power-supply/20210512-022327
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> config: s390-randconfig-r002-20210512 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/701f395a5566b6d2fd3a78389983237668902998
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jos-Exp-sito/HID-magicmouse-register-power-supply/20210512-022327
>         git checkout 701f395a5566b6d2fd3a78389983237668902998
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=s390 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
>    cistpl.c:(.text+0x3a2): undefined reference to `ioremap'
>    s390-linux-ld: cistpl.c:(.text+0x3dc): undefined reference to `iounmap'
>    s390-linux-ld: cistpl.c:(.text+0x404): undefined reference to `iounmap'
>    s390-linux-ld: cistpl.c:(.text+0x416): undefined reference to `ioremap'
>    s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
>    cistpl.c:(.text+0xe16): undefined reference to `iounmap'
>    s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_remove':
>    hid-magicmouse.c:(.text+0xd2c): undefined reference to `usb_kill_urb'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0xd48): undefined reference to `usb_free_coherent'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0xd54): undefined reference to `usb_free_urb'
>    s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_battery_usb_urb_complete':
>    hid-magicmouse.c:(.text+0xe12): undefined reference to `usb_submit_urb'
>    s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_probe':
>    hid-magicmouse.c:(.text+0x1194): undefined reference to `usb_alloc_urb'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0x121a): undefined reference to `usb_alloc_coherent'
>    s390-linux-ld: hid-magicmouse.c:(.text+0x1422): undefined reference to `usb_free_coherent'
>    s390-linux-ld: hid-magicmouse.c:(.text+0x142e): undefined reference to `usb_free_urb'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0x1462): undefined reference to `usb_submit_urb'
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Hi all,

I'm a little bit confused about the build errors reported by Intel's test bot and I'd really appreciate human input.
This is the first patch I submit, so apologies in advance if I missed a basic step.

I compiled and tested every patch before submission and they all compiled and worked on this tree:
git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git

After receiving this email, I followed the instructions attached to build it and indeed it failed.
However, I reverted my changes and the kernel still didn't compile.

Is this something I need to fix?

Thank you very much in advance,
José Expósito
