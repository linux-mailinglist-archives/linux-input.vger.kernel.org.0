Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D2C2E9815
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 16:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbhADPJQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 10:09:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:53150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbhADPJQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 Jan 2021 10:09:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 408CF207BC;
        Mon,  4 Jan 2021 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609772915;
        bh=ADgFBORng5EeWh4BZrW3f16meIsiMHG9J2nkp3c/SzA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=JaRPK4sd4126qPCu8Rp4g/ArC33O03oNCXVdpU0QUQxrnye/eQeLAodkEZBOTsicg
         ZSHzauD6bsefSRoOvgB4DHju+a1RT1kBsmYrlhynEvIyc6YzOJomwS0sEKga3dygGv
         7V5R5p0C2iIi3ad720lGD27SxEqtYaO8F1hSfQmX6aMwSSDM6F6gInZkkiaLQGC2hr
         vkSXRYVNWy9Qz+fHL9yFjD1q0eV5+uF8r4G4h5iiJK7kBbN+S4fd0TtFUYimuDZh4I
         cMFN9zHiNhl7qVi9UGcgJIaThRjmNmhQ98wUg8BZcyrsJ1dgY02kHsMXR2UBW/fgSE
         brpRMfdg/hQJg==
Date:   Mon, 4 Jan 2021 16:08:32 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: sfh: fix address space confusion
In-Reply-To: <20210103135418.3645344-1-arnd@kernel.org>
Message-ID: <nycvar.YFH.7.76.2101041608141.13752@cbobk.fhfr.pm>
References: <20210103135418.3645344-1-arnd@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 3 Jan 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new driver uses a phys_addr_t to store a DMA address,
> which does not work when the two are different size:
> 
> drivers/hid/amd-sfh-hid/amd_sfh_client.c:157:11: error: incompatible pointer types passing 'phys_addr_t *' (aka 'unsigned int *') to parameter of type 'dma_addr_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
>                                                                   &cl_data->sensor_phys_addr[i],
>                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dma-mapping.h:393:15: note: passing argument to parameter 'dma_handle' here
>                 dma_addr_t *dma_handle, gfp_t gfp)
>                             ^
> 
> Change both the type and the variable name to dma_addr for consistency.
> 
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Good catch; queued for 5.11, thanks.

-- 
Jiri Kosina
SUSE Labs

