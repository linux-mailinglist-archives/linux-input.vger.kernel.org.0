Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D026757FC9C
	for <lists+linux-input@lfdr.de>; Mon, 25 Jul 2022 11:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbiGYJkK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jul 2022 05:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbiGYJkI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jul 2022 05:40:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E4910F
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 02:40:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4DDCDB80E1A
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 09:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C60C341C6;
        Mon, 25 Jul 2022 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658742004;
        bh=Iyn6afQpJs/f5ZsGV2sBUgskGVYrQ6fL7EIZEv1c3II=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=K5JPEW2dA6MIfssX9BsDBjyljz9TJ1nrOAzWmB3tCZ11wD5GNk7MplAO1nUvVrO9A
         N37B2ySJapGkwAiQ9i7mdK/E79bRG6aETefnLxkKnKYVOhcY2QbLFF2iiHKmf4yUz7
         e2OORHuHQd6eIHdqMsZ5b8NAyhq/gzHxztpSasKSkubesOB7DAzBZ2mffXlPHWryYs
         8egt1hkfn2WnhDLznoFbIJ5Qlz0mVOhcvFbFxBMopEn3Ki9I8WHTBIkHUZk0/eme9Y
         j+RAEpDsyIR8KscEFgg8zMFv1KMQG7fWdoSk0p2ar5vvuJfwhy204xvNCi/NhcaRDa
         79QR+TmhKRT+A==
Date:   Mon, 25 Jul 2022 11:40:00 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     kernel test robot <lkp@intel.com>
cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        kbuild-all@lists.01.org, linux-input@vger.kernel.org
Subject: Re: [hid:for-next 11/27] drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9:
 error: implicit declaration of function 'writeq'; did you mean 'writeb'?
In-Reply-To: <202207250836.cwfTgngV-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2207251139160.19850@cbobk.fhfr.pm>
References: <202207250836.cwfTgngV-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 25 Jul 2022, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
> head:   9c9914cc509bccd7b134d33594e19b9411c12d4b
> commit: 93ce5e0231d79189be4d9e5f9295807b18941419 [11/27] HID: amd_sfh: Implement SFH1.1 functionality
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220725/202207250836.cwfTgngV-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=93ce5e0231d79189be4d9e5f9295807b18941419
>         git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>         git fetch --no-tags hid for-next
>         git checkout 93ce5e0231d79189be4d9e5f9295807b18941419
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Note: the hid/for-next HEAD 9c9914cc509bccd7b134d33594e19b9411c12d4b builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c: In function 'amd_stop_sensor':
> >> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
>       48 |         writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
>          |         ^~~~~~
>          |         writeb
>    cc1: some warnings being treated as errors
> 
> 
> vim +48 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> 
>     38	
>     39	static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
>     40	{
>     41		struct sfh_cmd_base cmd_base;
>     42	
>     43		cmd_base.ul = 0;
>     44		cmd_base.cmd.cmd_id = DISABLE_SENSOR;
>     45		cmd_base.cmd.intr_disable = 0;
>     46		cmd_base.cmd.sensor_id = sensor_idx;
>     47	
>   > 48		writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
>     49		writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
>     50	}
>     51	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

Basavaraj,

could you please fix that up so the we can have a fixed version in -next 
at least for a couple days before the merge window opens?

Thanks,

-- 
Jiri Kosina
SUSE Labs

