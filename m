Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA9940C76E
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 16:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhIOO3o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 10:29:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233745AbhIOO3n (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 10:29:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84E77600D4;
        Wed, 15 Sep 2021 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631716104;
        bh=kfJU4DmlyzawdZyI9Kq1CSsGWjWckx9XpdmWINhLsw4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rS1hUC466pf4VPtpvb40ZWgqie8XarWbFM9gvM3mN+pbJ6hY2DWNMDSX5+5ku37Ir
         5r6FzxpqniNh6aoAJMMbbeGsPfKivBiP/4RxI/ec/CgJ4xANchPVw0nmm10hl9I8Zn
         CfJotfCkiPGIwXAJfnZt3nSi5GFKFeNfwNjdrguia/03xuJ4KaNb13W5ozF6Yd45Qy
         o+p0vlUWH+3o4w1cHf7a0flG4iCnvS3hqtu8SZFW+a8Se/KD7L+XtKnUlF9zzmf1ir
         Wla4DnciviQb3Bo3GA/WwO5LJS5a31PAllcRCeLcN/eCHS1Cw+loZjrEqajY8rcDp3
         BJCnIJlSjSl7A==
Date:   Wed, 15 Sep 2021 16:28:21 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     nehal-bakulchandra.shah@amd.com, basavaraj.natikar@amd.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: amd_sfh: switch from 'pci_' to 'dma_' API
In-Reply-To: <439924a3414563a6ccc26eddb75efba6f54521c4.1629663605.git.christophe.jaillet@wanadoo.fr>
Message-ID: <nycvar.YFH.7.76.2109151628040.15944@cbobk.fhfr.pm>
References: <439924a3414563a6ccc26eddb75efba6f54521c4.1629663605.git.christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 22 Aug 2021, Christophe JAILLET wrote:

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below.
> 
> It has been compile tested.
[ ... snip ... ]
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 8d68796aa905..fa313c75a8a0 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -229,9 +229,9 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  
>  	privdata->mmio = pcim_iomap_table(pdev)[2];
>  	pci_set_master(pdev);
> -	rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
> +	rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
>  	if (rc) {
> -		rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> +		rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
>  		return rc;
>  	}
>  

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

