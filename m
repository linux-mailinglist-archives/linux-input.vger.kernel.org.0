Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 337026602C2
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 16:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjAFPHu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Jan 2023 10:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235566AbjAFPHb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Jan 2023 10:07:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2708B75D
        for <linux-input@vger.kernel.org>; Fri,  6 Jan 2023 07:07:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7EE6B81D96
        for <linux-input@vger.kernel.org>; Fri,  6 Jan 2023 15:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B3AC433F0;
        Fri,  6 Jan 2023 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673017619;
        bh=atUxbB9cNv8eC2HJIkEm37NDy/kfwhLMGII1b/RG53E=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=RS4Ne7Azoz2HxnbupP4b11iEJMZLBnUO4fFTAvcKNWKW+43AF4KAt6Qh5lsZHKjbP
         4OkuAkktbcQGp9Yh6MNEq3icitA6PkzjLUvGAyWvCysUKP+/G0oewZcVe2d8bk8L+J
         1Je8AIMGuqBLf1UZK17mzJ6gMgtBtwC6KV8gNIW25jfSyJAxAXcJZ3gtTwpJIQArSs
         Lu0M/O8fDLtS0lr/6Q9uvDG3gEeC578UpXH/fxjqYzFhbjVoUdkkZvIVW+YSGk3U//
         iHUn+SmZzpayZWDRnXWoA+8qSfOanDEwcuev7SJzNUrJKxmPYzXN5IspIkNOj4f3jo
         +J1K1dnwc6A3g==
Date:   Fri, 6 Jan 2023 16:06:59 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] HID: amd_sfh: Fix warning unwind goto
In-Reply-To: <20230102163042.1743830-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2301061606470.1734@cbobk.fhfr.pm>
References: <20230102163042.1743830-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2 Jan 2023, Basavaraj Natikar wrote:

> Return directly instead of using existing goto will not cleanup
> previously allocated resources. Hence replace return with goto
> to fix warning unwind goto which cleanups previously allocated
> resources.
> 
> Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c      | 2 +-
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> index ab125f79408f..1fb0f7105fb2 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> @@ -282,7 +282,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
>  		}
>  		rc = mp2_ops->get_rep_desc(cl_idx, cl_data->report_descr[i]);
>  		if (rc)
> -			return rc;
> +			goto cleanup;
>  		mp2_ops->start(privdata, info);
>  		status = amd_sfh_wait_for_response
>  				(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index 4da2f9f62aba..a1d6e08fab7d 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -160,7 +160,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>  		}
>  		rc = mp2_ops->get_rep_desc(cl_idx, cl_data->report_descr[i]);
>  		if (rc)
> -			return rc;
> +			goto cleanup;
>  
>  		writel(0, privdata->mmio + AMD_P2C_MSG(0));

Applied to for-6.2/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs

