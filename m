Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375B5342549
	for <lists+linux-input@lfdr.de>; Fri, 19 Mar 2021 19:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCSSvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 14:51:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:35934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229925AbhCSSu7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 14:50:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3286E6194A;
        Fri, 19 Mar 2021 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616179859;
        bh=08fDYzuPE2Em5h6uiSRHadwINX3ZsWCHWurx5XQI98E=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=sKHCKrkiWwmHmBOWp9vb9H7lgLAwyll/d+GED0+otAn+Vep0xHh+iiDWBFPP5KYwq
         3l18/qGJhcLFy2pkTICASjsK5JZOgpKOo3YhLqOtWz3BjdZwidJOC1ZjK2CLqZfsvO
         PPWmFAO52LBZnnSWjZySgyb4NDu5LWoAiYwJKyyHPm69dAUfgVunXMt29zbGMDt6z1
         V2byi2unwTO5QYO/GKFTflByF31xEPLQWWcfkCXU4ARJNoUPixT6JiMhIoX43pUgGJ
         gVhFPqIm5XilCHIvlnvamWZLI7o9US+hWIcewmHHZkeBO1lNFOcUiepCq73WoHRbpT
         EF9FHf3c95A5g==
Date:   Fri, 19 Mar 2021 19:50:56 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     kernel test robot <lkp@intel.com>
cc:     Dario Pagani <dario.pagani.146@gmail.com>, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Subject: Re: [hid:for-5.13/thrustmaster 1/1] ERROR: modpost: "usb_interrupt_msg"
 undefined!
In-Reply-To: <202103200225.blSNisHw-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2103191950390.12405@cbobk.fhfr.pm>
References: <202103200225.blSNisHw-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 20 Mar 2021, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.13/thrustmaster
> head:   c49c33637802a2c6957a78119eb8be3b055dd9e9
> commit: c49c33637802a2c6957a78119eb8be3b055dd9e9 [1/1] HID: support for initialization of some Thrustmaster wheels
> config: nds32-randconfig-r034-20210318 (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=c49c33637802a2c6957a78119eb8be3b055dd9e9
>         git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>         git fetch --no-tags hid for-5.13/thrustmaster
>         git checkout c49c33637802a2c6957a78119eb8be3b055dd9e9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nds32 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "usb_interrupt_msg" [drivers/hid/hid-thrustmaster.ko] undefined!
> >> ERROR: modpost: "usb_alloc_urb" [drivers/hid/hid-thrustmaster.ko] undefined!
> >> ERROR: modpost: "usb_submit_urb" [drivers/hid/hid-thrustmaster.ko] undefined!
> >> ERROR: modpost: "usb_free_urb" [drivers/hid/hid-thrustmaster.ko] undefined!
> >> ERROR: modpost: "usb_kill_urb" [drivers/hid/hid-thrustmaster.ko] undefined!

Fixed branch (with added Kconfig dependency) pushed out.

-- 
Jiri Kosina
SUSE Labs

