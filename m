Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3059C7A4C6E
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 17:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjIRPdL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 11:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjIRPci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 11:32:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A409199
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 08:30:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C661C3278D;
        Mon, 18 Sep 2023 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695048375;
        bh=efpxiNTLvuKpAD898vNDjY2BIUtuPdKc9cMxxACPosA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=jqjY7B/uFo3qZOM7QvPpvrEoV+SUAH1i3Rct+1qvv71HNp2VtXRFGuHK2xk6Eltn3
         wAq6tUACF43wzcSvyArjHUqxowoM3hyCDZGSYByX+oKK3t095bVvjv2gSfbh+wrA47
         QjaegQpxd9TNAOf9ODPdv/r+yw/tbWAPfCj8r9fGTgz1D/4MYzOaGoxh7U8O8I9yN7
         l5ckmgMItAL++FSff8VxDrhiM3EQore2PMWl2ZdzBhVWCYv4j+apvdPnqNzpSBxM+T
         QJ3GKE35RGK60ax4b6Jk/4YkjES7HUqr2AV3QMKxoD4/GQUFVrTaOgQTqj+hTyoLkp
         xr7wVxsFioAog==
Date:   Mon, 18 Sep 2023 16:46:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Even Xu <even.xu@intel.com>
cc:     linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Arrow Lake PCI device ID
In-Reply-To: <1694572419-10981-1-git-send-email-even.xu@intel.com>
Message-ID: <nycvar.YFH.7.76.2309181646040.14216@cbobk.fhfr.pm>
References: <1694572419-10981-1-git-send-email-even.xu@intel.com>
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

On Wed, 13 Sep 2023, Even Xu wrote:

> Add device ID of Arrow Lake-S into ishtp support list.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> ---
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> index e99f3a3..f89b300 100644
> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> @@ -34,6 +34,7 @@
>  #define RPL_S_DEVICE_ID		0x7A78
>  #define MTL_P_DEVICE_ID		0x7E45
>  #define ARL_H_DEVICE_ID		0x7745
> +#define ARL_S_DEVICE_ID		0x7F78
>  
>  #define	REVISION_ID_CHT_A0	0x6
>  #define	REVISION_ID_CHT_Ax_SI	0x0
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index 55cb250..ae3c6c1 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -45,6 +45,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, MTL_P_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_H_DEVICE_ID)},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_S_DEVICE_ID)},
>  	{0, }

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

