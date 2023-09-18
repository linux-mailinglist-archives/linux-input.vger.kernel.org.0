Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2E97A4ECA
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 18:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbjIRQ06 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 12:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjIRQ0Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 12:26:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DAB282B6
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 09:23:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F21C32790;
        Mon, 18 Sep 2023 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695049012;
        bh=WKGWHb1Vh96ODXTNy0Zl5+bJzD4Fzpb2K5ivYA5ViKQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=J6N7XqZNGcFcpAkSFHUpQX3vc/UzjR7ijmMA27YL53wHpdavY9H0e/LTPORSYQ2e7
         qSc/S1yFFoRYUdm5bv/egDVBH/E97pPNtCfjNZRJmh0P7GpgTNggeDIq6ncM1g3hcT
         smR1HQr1zWFIlhGIP0bS9FEzjwC4IcuL1R8SPZdE+h6GYAwIlcvUSxF2Htx5/8kZ0p
         vRxShHiUfeRRKTMVGSeSqaNC/2xwIWLKavIdwCoBqp+ekXiEDDFLKbjgEJpaN93CAZ
         0UnDe/xms5Kvxb2Q6imiwbnYc76iWkklRE3Jrxpyq1mSzMnslxbSNaR9Ohs5BkV2/s
         lhc9NJYtMXWHA==
Date:   Mon, 18 Sep 2023 16:56:49 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rahul Rameshbabu <rrameshbabu@nvidia.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nvidia-shield: Select POWER_SUPPLY Kconfig option
In-Reply-To: <20230917151850.62505-1-rrameshbabu@nvidia.com>
Message-ID: <nycvar.YFH.7.76.2309181656130.14216@cbobk.fhfr.pm>
References: <20230917151850.62505-1-rrameshbabu@nvidia.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 17 Sep 2023, Rahul Rameshbabu wrote:

> Battery information reported by the driver depends on the power supply 
> subsystem. Select the required subsystem when the HID_NVIDIA_SHIELD 
> Kconfig option is enabled.
> 
> Fixes: 3ab196f88237 ("HID: nvidia-shield: Add battery support for Thunderstrike")
> Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
> ---
>  drivers/hid/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index e11c1c803676..dc227f477601 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -792,6 +792,7 @@ config HID_NVIDIA_SHIELD
>  	tristate "NVIDIA SHIELD devices"
>  	depends on USB_HID
>  	depends on BT_HIDP
> +	select POWER_SUPPLY

Is there a reason not to do it the standard way using 'depends on', and 
not vice versa?

Thanks,

-- 
Jiri Kosina
SUSE Labs

