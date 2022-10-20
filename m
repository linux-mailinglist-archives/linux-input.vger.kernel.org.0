Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92ED605F2E
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 13:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbiJTLpY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 07:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbiJTLpV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 07:45:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679A19835B
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 04:45:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19BB1B82619
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 11:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD02C433C1;
        Thu, 20 Oct 2022 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666266316;
        bh=jGIUj9zOSvagOVqRiMZbz0oHCLG5CxlSqr0raqhprJo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=iXMLub5m+Zi2vSwJ9Bt/9/DIOwrLVCRBDGSoyK3r6fOKfOTgr00bx95wusfGRHuX6
         qhtQhk71JE9o/X11rBz31kLLtaxBJXWbnBwJQk51UMzonAGi3Aknx0tPdonIP5yb52
         yaPiggiO3keRyvus/i2RidV7Gtniqffsam8AZFP12Eh2QlHo/f5gu9cA1BpJAkd98w
         02j0jsumLnpVWprTqgLf1zpzDeBCIG8Hnf3wPIRXRb+jvfCVYVkydol8LjClzpdsW3
         iR7YFQMGLjpQ7lV6+tOFwV8ii83SaAWI/Cjhf1RtJY0qps4x2p0fvaRgCP/hRz40Mj
         kpECWEGl1H/Xw==
Date:   Thu, 20 Oct 2022 13:45:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [hid:for-6.2/mcp2221 3/3] drivers/hid/hid-mcp2221.c:734:18:
 warning: unused variable 'tmp'
In-Reply-To: <202210190525.Jv9beXlq-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2210201344200.29912@cbobk.fhfr.pm>
References: <202210190525.Jv9beXlq-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 Oct 2022, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.2/mcp2221
> head:   960f9df7c620ecb6030aff1d9a6c3d67598b8290
> commit: 960f9df7c620ecb6030aff1d9a6c3d67598b8290 [3/3] HID: mcp2221: add ADC/DAC support via iio subsystem
> config: i386-randconfig-a014
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=960f9df7c620ecb6030aff1d9a6c3d67598b8290
>         git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>         git fetch --no-tags hid for-6.2/mcp2221
>         git checkout 960f9df7c620ecb6030aff1d9a6c3d67598b8290
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/hid/hid-mcp2221.c: In function 'mcp2221_raw_event':
> >> drivers/hid/hid-mcp2221.c:734:18: warning: unused variable 'tmp' [-Wunused-variable]
>      734 |         u8 *buf, tmp;
>          |                  ^~~

Matt, I have fixed this one in the tree now by moving the declaration into 
the conditional block.

Could you please look into the other one that sparse reported regarding 
casting to __le16?

Thanks,

-- 
Jiri Kosina
SUSE Labs

