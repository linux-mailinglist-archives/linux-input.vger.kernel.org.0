Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A7157F0E9
	for <lists+linux-input@lfdr.de>; Sat, 23 Jul 2022 20:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbiGWSLY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jul 2022 14:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbiGWSLX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jul 2022 14:11:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289DF175B1;
        Sat, 23 Jul 2022 11:11:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA3A0B80AEF;
        Sat, 23 Jul 2022 18:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C39C341C0;
        Sat, 23 Jul 2022 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658599880;
        bh=m6Q3tnXorif4RYbPtHxva7FixZkqHCVu3tsT2DxQEag=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=kOX0SPHToIYYSY70q5LMQo9taF+GllCp4Vm91T1yOjXx2JOygVkZOKVo3B1RBPxxy
         8Q8t11Lu4qojKXeryd7q2NMYDqcg5WYdXM2qKZuZkCb3d2Wg1ShWoRtXZIimBawn9a
         bSPtkfhtHspq+V05nHemqGfRgYQR8+mXxtKk07Aac9s0Ipoq2wQLubIpTz8Jb6O41J
         EZe6vJ6sZltNn8ySHhUJo9kVSriZZmsakGwxUJ+S2rqWlkkYYhGgmLUICOhpe6sBnn
         xgmHGCIN3Kz9o5HC2D8hcNwvcHo9OItZ+ok9c8XHyK2rivGrxPuSiPnabzKBxxjp5v
         iQ/Zl5lf61xbw==
Date:   Sat, 23 Jul 2022 20:11:16 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, rdunlap@infradead.org,
        linux-input@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au
Subject: Re: [PATCH for-next 0/2] Fixes to amd_sfh driver 
In-Reply-To: <20220723061033.1377061-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2207232011090.19850@cbobk.fhfr.pm>
References: <20220723061033.1377061-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 23 Jul 2022, Basavaraj Natikar wrote:

> Changes includes to handle "no sensors" case and fix of implicit
> declaration error on i386.
> 
> Link: https://lore.kernel.org/all/92ed10f9-2c84-ad42-20d1-f8a101f78f08@infradead.org/
> '''
> From: Randy Dunlap <rdunlap@infradead.org>
> Changes since 20220721:
> 
> on i386:
> 
> ../drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c: In function ‘amd_stop_sensor’:
> ../drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit declaration of function ‘writeq’; did you mean ‘writel’? [-Werror=implicit-function-declaration]
>    48 |         writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
>       |         ^~~~~~
>       |         writel
> '''
> 
> Basavaraj Natikar (2):
>   HID: amd_sfh: Fix implicit declaration error on i386
>   HID: amd_sfh: Handle condition of "no sensors"
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c           | 2 ++
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 2 ++
>  2 files changed, 4 insertions(+)

Queued in hid.git, thanks.

-- 
Jiri Kosina
SUSE Labs

