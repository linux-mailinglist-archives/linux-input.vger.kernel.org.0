Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BE0341E73
	for <lists+linux-input@lfdr.de>; Fri, 19 Mar 2021 14:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhCSNgC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 09:36:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229960AbhCSNfi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 09:35:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3299A64F59;
        Fri, 19 Mar 2021 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616160938;
        bh=rdAauLvYRy0zXr6edxHi/2TRmVoz5UVwiRNfbSfuNFI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=q6aNySWngoF6QDChe+q+GdrXF50Zploy1FAkwehAw8DkJ9Sht8dFnI10EtqfawnxM
         P6QpghwtbfytXWCooCwX/YP9mRFWZZ7RbxBnBilqkDtMN1HptsmrOBw84cuGBcYqD/
         ZXpyCJx67iW8meu2L+n3gI9qbqQXxlPpZHbNnHMo0xbHf/ds85m6wMoj2kFyYFvkhI
         QJdZMxxDNMznV5R0aPSQNpzQcXHWyeF0DWpxPNriAFEPzmOflKVzfu5zzi0JQ41GG0
         EMz1wVeOv2sXwjztc2CPll9PWzIY8u4rS4coq6w1krNSDHfgxNcIP1HYL2fnG8oHAN
         C8jgw9vyQd/cw==
Date:   Fri, 19 Mar 2021 14:35:35 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ye Xiang <xiang.ye@intel.com>
Subject: Re: [PATCH v2] HID: intel_ish-hid: HBM: Use connected standby state
 bit during suspend/resume
In-Reply-To: <20210316202334.655760-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2103191435260.12405@cbobk.fhfr.pm>
References: <20210316202334.655760-1-srinivas.pandruvada@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Mar 2021, Srinivas Pandruvada wrote:

> From: Ye Xiang <xiang.ye@intel.com>
> 
> The individual sensor drivers implemented in the ISH firmware needs
> capability to take special actions when there is a change in the system
> standby state. The ISH core firmware passes this notification to
> individual sensor drivers in response to the OS request via connected
> standby bit in the SYSTEM_STATE_STATUS command.
> 
> This change sets CONNECTED_STANDBY_STATE_BIT bit to 1 during suspend
> callback and clears during resume callback.
> 
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> [srinivas.pandruvada@linux.intel.com: changelog rewrite]
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> v2:
> 	changed changelog to be more clear
> 	Changed the name in the signed-off to match "From"
> 
>  drivers/hid/intel-ish-hid/ishtp/hbm.c | 6 +++---
>  drivers/hid/intel-ish-hid/ishtp/hbm.h | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

