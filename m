Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500CF2E9824
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 16:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbhADPNf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 10:13:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:53598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbhADPNf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 Jan 2021 10:13:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C1A9207BC;
        Mon,  4 Jan 2021 15:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609773174;
        bh=y69n2uWL97se0ZNSzSAZ4xOBtGGeaTn9m/nFYsgbPuo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=TftuA15pdcB5H/azkWExQ7NeYgK0W2S/8tFpROZlj/qRrlTw9RE1bGJLMQf/C0y3m
         1ee5QGlvfntDnzI/z52yfJpvBufOVZS6TjZBljKNM+99hh5A7/rwHKYa8MPf7hBdsO
         /+Kg7itGq8zOS2R4f08AQpI2U2B3vcWllMduq+7ubh/7wiiAqeMt6sOqA0SwZCmNb1
         a+KL86e1JMWgetrNJ9LeDCKbBx7VZINmFxFkWjxq3zKmxLkXVXZVUQ3qh1R01D9dN0
         RauTPdm6/hwgmzm61/BVFdZOh5SPuSqXnVAJC4YBypS7FXYuDzV6kpogTX9ZJXj1f2
         VIksVt2bs1wsg==
Date:   Mon, 4 Jan 2021 16:12:51 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Zhang Lixu <lixu.zhang@intel.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.pandruvada@linux.intel.com, benjamin.tissoires@redhat.com
Subject: Re: [PATCH 0/2] hid: intel-ish-hid: ipc: enable OOB support for
 EHL
In-Reply-To: <20201216063640.4086068-1-lixu.zhang@intel.com>
Message-ID: <nycvar.YFH.7.76.2101041612290.13752@cbobk.fhfr.pm>
References: <20201216063640.4086068-1-lixu.zhang@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 16 Dec 2020, Zhang Lixu wrote:

> The EHL (Elkhart Lake) based platforms provide a OOB (Out of band)
> service, which allows wakup device when the system is in S5 (Soft-Off
> state). This OOB service can be enabled/disabled from BIOS settings.
> 
> These two patches is to enable this feature for EHL platform.
> 
> We have tested these patches on both ISH platforms and EHL platforms,
> it works fine.
> 
> Zhang Lixu (2):
>   hid: intel-ish-hid: ipc: finish power flow for EHL OOB
>   hid: intel-ish-hid: ipc: Address EHL Sx resume issues
> 
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
>  drivers/hid/intel-ish-hid/ipc/ipc.c     | 27 +++++++++++++
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 54 ++++++++++++++++++++++++-
>  3 files changed, 81 insertions(+), 1 deletion(-)

Srinivas, can I please get your Acked-by / Reviewed-by for this? Thanks,

-- 
Jiri Kosina
SUSE Labs

