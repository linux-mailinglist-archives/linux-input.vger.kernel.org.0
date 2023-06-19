Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685A6735DC5
	for <lists+linux-input@lfdr.de>; Mon, 19 Jun 2023 21:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbjFSTJb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jun 2023 15:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbjFSTJa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jun 2023 15:09:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE969C
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 12:09:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2494660E84
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 19:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766B3C433C9;
        Mon, 19 Jun 2023 19:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687201768;
        bh=DDnxEXvye1gXhzYIspl5V/UAkbDEL+C0mSI4OiNfww0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XPOcXpD64UMLrdL6BAbF0niSZS+i5cGJZhN9bJ6LmJ/Cnu/MeUbYVEHv6OmDAEHP/
         mER5oDav5/h9cKBftX1RmAkQbeMZ9TfyTeMTNuSiCOoH8EegNdxeZ/NqIHtomYsGKA
         zhDRxkvN3tr/jhqJ/pD71+slyasCXp0glrUVfwN7AxHvl1V6ItKUEIUgGQPxICl62f
         o7TqP+nP0SQ/qD0rdpCwQ1ybM/HqwfICg23DkBMI2nP3FDhBsnMTrAtSIiSumJq+xz
         +WDn7h4tvl6lqpSh2RIQX0fVNT/Ne0FpsOo04/Q8wuFZ+AwH7hptbxvDtuhO54yI9K
         SLYeoZ6Wp718g==
Date:   Mon, 19 Jun 2023 21:09:24 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Even Xu <even.xu@intel.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Arrow Lake PCI device ID
In-Reply-To: <1686788801-23388-1-git-send-email-even.xu@intel.com>
Message-ID: <nycvar.YFH.7.76.2306192108410.5716@cbobk.fhfr.pm>
References: <1686788801-23388-1-git-send-email-even.xu@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 15 Jun 2023, Even Xu wrote:

> Add device ID of Arrow Lake-H into ishtp support list.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> index fc108f1..e99f3a3 100644
> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> @@ -33,6 +33,7 @@
>  #define ADL_N_DEVICE_ID		0x54FC
>  #define RPL_S_DEVICE_ID		0x7A78
>  #define MTL_P_DEVICE_ID		0x7E45
> +#define ARL_H_DEVICE_ID		0x7745
>  
>  #define	REVISION_ID_CHT_A0	0x6
>  #define	REVISION_ID_CHT_Ax_SI	0x0
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index 7120b30..55cb250 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -44,6 +44,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_N_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, MTL_P_DEVICE_ID)},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_H_DEVICE_ID)},
>  	{0, }
>  };

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

