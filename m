Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1078441902E
	for <lists+linux-input@lfdr.de>; Mon, 27 Sep 2021 09:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhI0HsY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 03:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233223AbhI0HsY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 03:48:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD7E860F6D;
        Mon, 27 Sep 2021 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632728806;
        bh=XUzV/De8wnF6mN1nxDVB2ndcBYGfZK4b+tAqMNHHUmM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=df+dBRksOZwh/z8UaQcmvUTPjdQ4l3K3sVtn7zc4w9xH2nKBYbfc1V43MFQdKBcQH
         5OdKTvfkCdpAOtsIfX9y51Ia+1ONW7BQ1TsfhRr/6KL6q4lCsC0z6OSB5yXiW/uiVU
         UltLDcnE/TPS+TbPFvid3IUfbpEIFfT5qM0aNoXpJR6re0xGWV6vKtxn+5R9kccRQN
         RlQ3utyyOKwcgroM2V2ZjXrLTJdbXPa+63S39VW4D487t7HJyJIL921UCobvkXPaXu
         F87IrHoTY2DnkWKcrw8kDXuRUEwFQiTjC/WgEym/wFulRkVhnUIZqxrdzGhNTdMuXt
         m7nDsWeDZYeYw==
Date:   Mon, 27 Sep 2021 09:46:43 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:AMD SENSOR FUSION HUB DRIVER" 
        <linux-input@vger.kernel.org>
Subject: Re: [PATCH 0/4] Fixes and updates to amd-sfh driver
In-Reply-To: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2109270945170.15944@cbobk.fhfr.pm>
References: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 23 Sep 2021, Basavaraj Natikar wrote:

> Changes include fix to NULL pointer dereference, remove pci_ wrappers,
> use dma_set_mask_and_coherent and copyright updates.
> 
> Basavaraj Natikar (4):
>   amd_sfh: Fix potential NULL pointer dereference
>   amd_sfh: Use dma_set_mask_and_coherent()

Thanks for the patches. My plan is to push the two above as 5.15 material 
(fixes), and queue the 2 below as 5.16 merge window material. Please 
holler if you disagree.

>   amd_sfh: switch from 'pci_' to 'dev_' API
>   amd_sfh: Update Copyright details

-- 
Jiri Kosina
SUSE Labs

