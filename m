Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048BE580237
	for <lists+linux-input@lfdr.de>; Mon, 25 Jul 2022 17:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiGYPuf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jul 2022 11:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235643AbiGYPue (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jul 2022 11:50:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD21DF4C
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 08:50:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EDE33612D4
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 15:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202CEC341C6;
        Mon, 25 Jul 2022 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658764232;
        bh=D9dhLgcvlkSt5mAiDGeZBv4/Gt2UhN9tC5tPFfSuU20=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Qp2nWbpFZkSAVOn6B0reAB9kxdRdZoIDcLK9K+SOUTmiOlimkZXeCanmHxmmE7hGl
         6uylBttSL/cN6YurtlouVw2U12eLYFGcLVPUGTIzMYFrA7Tnjz4whA/+CqakzXHPlI
         4Q5minvOJMRQUcaJRLbWvke2Q/te7vGvpA5j3/czLAyqRI9nm7qf0mAxkuFgVFRCm1
         fZvylOUSveuhNmUF4pf+z3GAAJLXbayZa0eL3Axn27Qel+wkuMezQ++X8Hs2r7maIi
         Proo5pAV5whUR+E3pqYgumtvuNquK1AjFNBlt5BiEUpIAlVDUuen3SJGhKRCiH00uJ
         YDIOdJw2xTvVA==
Date:   Mon, 25 Jul 2022 17:50:28 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <bnatikar@amd.com>
cc:     kernel test robot <lkp@intel.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        kbuild-all@lists.01.org, linux-input@vger.kernel.org
Subject: Re: [hid:for-next 11/27] drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9:
 error: implicit declaration of function 'writeq'; did you mean 'writeb'?
In-Reply-To: <56582f45-270a-907c-15e3-e5495b5f19ff@amd.com>
Message-ID: <nycvar.YFH.7.76.2207251749530.19850@cbobk.fhfr.pm>
References: <202207250836.cwfTgngV-lkp@intel.com> <nycvar.YFH.7.76.2207251139160.19850@cbobk.fhfr.pm> <56582f45-270a-907c-15e3-e5495b5f19ff@amd.com>
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

On Mon, 25 Jul 2022, Basavaraj Natikar wrote:

> >> tree:   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fhid%2Fhid.git&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2FPabO720i7GSUkRHzNtWpUpKo2vzoDskyg5D%2BPcfv5g%3D&amp;reserved=0 for-next
> >> head:   9c9914cc509bccd7b134d33594e19b9411c12d4b
> >> commit: 93ce5e0231d79189be4d9e5f9295807b18941419 [11/27] HID: amd_sfh: Implement SFH1.1 functionality
> >> config: arc-allyesconfig (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20220725%2F202207250836.cwfTgngV-lkp%40intel.com%2Fconfig&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=wUiF3lD%2BzugnBwoIbc%2Frmv%2FQgbZxTfb%2FuMjvjUzsOp0%3D&amp;reserved=0)
> >> compiler: arceb-elf-gcc (GCC) 12.1.0
> >> reproduce (this is a W=1 build):
> >>         wget https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=pcU0nQ%2Fc7FAKNP0Gej8VG%2BfHmb1g3ZSkXrZdHJk%2F6D4%3D&amp;reserved=0 -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         # https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fhid%2Fhid.git%2Fcommit%2F%3Fid%3D93ce5e0231d79189be4d9e5f9295807b18941419&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=8mdjArHzn%2BTYn9Cypx3GUO3PakmUi9wLMtjVsCnZYbQ%3D&amp;reserved=0
> >>         git remote add hid https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fhid%2Fhid.git&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2FPabO720i7GSUkRHzNtWpUpKo2vzoDskyg5D%2BPcfv5g%3D&amp;reserved=0
> >>         git fetch --no-tags hid for-next
> >>         git checkout 93ce5e0231d79189be4d9e5f9295807b18941419
> 
> HEAD position is 93ce5e0231d7 HID: amd_sfh: Implement SFH1.1 functionality
> build issue on non-64 build is present in Re: [PATCH 00/11] Fixes and implementation of AMD SFH 1.1 functionality
> - Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207211344360.19850@cbobk.fhfr.pm/> 
> above git checkout 93ce5e0231d79189be4d9e5f9295807b18941419 leads to Re: [PATCH 00/11] Fixes and implementation of AMD SFH 1.1 functionality
> - Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207211344360.19850@cbobk.fhfr.pm/>
> 
> Already fixed for all builds with patches Re: [PATCH for-next 0/2] Fixes to amd_sfh driver - Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207232011090.19850@cbobk.fhfr.pm/>
> HEAD position is 5d4d0f156575 HID: amd_sfh: Handle condition of "no sensors"
> 
> >>         # save the config file
> >>         mkdir build_dir && cp config build_dir/.config
> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
> >>
> >> If you fix the issue, kindly add following tag where applicable
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> Note: the hid/for-next HEAD 9c9914cc509bccd7b134d33594e19b9411c12d4b builds fine.
> 
> Yes correct builds fine since issue is fixed in Re: [PATCH for-next 0/2] Fixes to amd_sfh driver - Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207232011090.19850@cbobk.fhfr.pm/>
> since HEAD-9c9914cc509bccd7b134d33594e19b9411c12d4b is after build fixed HEAD position 5d4d0f156575
> HID: amd_sfh: Handle condition of "no sensors"

Ah, right, seems like 0day bot decided to test some ancient version of the 
tree, and this report can be dismissed.

Thanks,

-- 
Jiri Kosina
SUSE Labs

