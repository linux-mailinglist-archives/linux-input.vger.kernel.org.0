Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B23765173F7
	for <lists+linux-input@lfdr.de>; Mon,  2 May 2022 18:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354878AbiEBQQm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 May 2022 12:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346095AbiEBQQl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 May 2022 12:16:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEC5BC93
        for <linux-input@vger.kernel.org>; Mon,  2 May 2022 09:13:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2FBD61296
        for <linux-input@vger.kernel.org>; Mon,  2 May 2022 16:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C422C385AC;
        Mon,  2 May 2022 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651507991;
        bh=JZXiTjp2nZoUeQLFyk/etfp/xO0bupP46m6Ig16wE4M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=uzYGYXfzQuKJqqXLbTMe/U4KQ6G8oymnirJ1L3lX1rEFCZxbeusc1FkWV5w2ur0Pu
         wnFml5U2xMd0aHOTFMj+c2BydaM3niaLwKJeZLb9uXM4GF+7HcEg++dolj1u6z7n66
         rN32fnWKxIBENOursdNu1EwHdbayUAMwTLO4QtaqV3462iIodz1flH9I8ItPE26INh
         ROonfFO1IjiVI1nn+iIs3ns+X6eOkBH0mbiQTE3qmulA6YwfcyL/bDh6bhg138Zubs
         xN//s2zVqwRooiCcdXiqaxxXXGX/0D+I7aYGnYXoa6XsLKxsCEigY/UbmSoNZGw87d
         e9muuuzDi7Nzg==
Date:   Mon, 2 May 2022 18:12:59 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     kernel test robot <lkp@intel.com>
cc:     Joshua-Dickens <Joshua@joshua-dickens.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [hid:for-5.19/wacom 1/2] drivers/hid/wacom_wac.c:2411:42: warning:
 format specifies type 'unsigned short' but the argument has type 'int'
In-Reply-To: <202204212217.M2efI2Po-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2205021812120.28985@cbobk.fhfr.pm>
References: <202204212217.M2efI2Po-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 21 Apr 2022, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.19/wacom
> head:   6ff1cae2e30a79265bcce85f617663c480936ab0
> commit: 6d09085b38e5ace0001cf4f3cdbd4bf247533b61 [1/2] HID: wacom: Adding Support for new usages
> config: riscv-randconfig-r026-20220420 (https://download.01.org/0day-ci/archive/20220421/202204212217.M2efI2Po-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=6d09085b38e5ace0001cf4f3cdbd4bf247533b61
>         git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>         git fetch --no-tags hid for-5.19/wacom
>         git checkout 6d09085b38e5ace0001cf4f3cdbd4bf247533b61
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/hid/ kernel/

Joshua,

could you please send a fixup patch to get the types right? This got 
introduced by 6d09085b38e5a ("HID: wacom: Adding Support for new usages")

Thanks,

-- 
Jiri Kosina
SUSE Labs

