Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5D95A1173
	for <lists+linux-input@lfdr.de>; Thu, 25 Aug 2022 15:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242307AbiHYNFG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 09:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242215AbiHYNEh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 09:04:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAC9B5A70
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 06:03:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 618E0B82924
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 13:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108DBC433D7;
        Thu, 25 Aug 2022 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661432606;
        bh=DIsbazvVd34Z6eLma5OzBdFh25MK+sWF7hyCrEZEFuo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SiPDm8VTCGwpJUtI6hihMqzAaXGeSKifUaXRKt+T45PApIUhaqOlHW5BDv8FNFoJm
         id6kNUpexibP1Pd7Vxn6Em7caAognpbx3aM7mXccqRiZei9YpTu2tKCTKtvDHEh9Ft
         b6P6KvAIPU20w5lNejcMadCSWxiYYyE9gFesLZvb9LY2ZTCh+q4Icug497p5FduTG8
         X7YHN4iYE5Ryp9PTB0QwQy8iqAPCpCX5KdRp4AxHXO+u6tWHjXqmEPGqHv/1T+W+UG
         U76wD19P+RImzQ5G0TUl6qrUyRBhMUedEHYRd6cpCfUGJ5XQSvhh04mGUBcTZsoSjJ
         xdye8Cj75zzNw==
Date:   Thu, 25 Aug 2022 15:03:22 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Even Xu <even.xu@intel.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Meteor Lake PCI device ID
In-Reply-To: <1661217059-22227-1-git-send-email-even.xu@intel.com>
Message-ID: <nycvar.YFH.7.76.2208251503170.19850@cbobk.fhfr.pm>
References: <1661217059-22227-1-git-send-email-even.xu@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 23 Aug 2022, Even Xu wrote:

> Add device ID of Meteor Lake P into ishtp support list.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> index e600dbf..fc108f1 100644
> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> @@ -32,6 +32,7 @@
>  #define ADL_P_DEVICE_ID		0x51FC
>  #define ADL_N_DEVICE_ID		0x54FC
>  #define RPL_S_DEVICE_ID		0x7A78
> +#define MTL_P_DEVICE_ID		0x7E45
>  
>  #define	REVISION_ID_CHT_A0	0x6
>  #define	REVISION_ID_CHT_Ax_SI	0x0
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index 2c67ec1..7120b30 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -43,6 +43,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_P_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_N_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, MTL_P_DEVICE_ID)},
>  	{0, }

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

