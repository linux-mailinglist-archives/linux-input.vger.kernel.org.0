Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7363CD3CC
	for <lists+linux-input@lfdr.de>; Mon, 19 Jul 2021 13:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbhGSKoW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jul 2021 06:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235905AbhGSKoU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jul 2021 06:44:20 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCD1C061574;
        Mon, 19 Jul 2021 03:35:59 -0700 (PDT)
Date:   Mon, 19 Jul 2021 13:24:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1626693897;
        bh=yzLETKdOH+GXTMHqntXOSgnP8jsRysvUGu+IjTrezqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QTfw+WZ5Gp0fxA2U7q3NvIAOPHoUwoCpvZB3dtczm3AZ7xYFFtmiUNV834OYITLqu
         QI/dhl8/S2y/s0Pu5fWRPHfroiRKvtEhHZ99dFZmJOQ+222ccmcMRqMpycLQZ/Uwgo
         O80kAy4d1hO4XwGPEKNVmj74lVLhew4klSvMPzSk=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Ben Chen <ben_chen@bizlinktech.com>
Cc:     linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: cmedia: add support for HS-100B mute button
Message-ID: <dded786c-e27e-4d78-999c-af99f3778c11@t-8ch.de>
References: <20210719110911.310701-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210719110911.310701-1-linux@weissschuh.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mo, 2021-07-19T13:09+0200, Thomas Weißschuh wrote:
> These chips report mute button events in bit 4 of their report without
> it being part of the report descriptor.
> Use a custom descriptor that maps this bit.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> v1: https://lore.kernel.org/linux-input/a769ae40-6d0c-47c4-803f-2c8dbc362f24@t-8ch.de/
> 
> v1 -> v2:
>  * Merged into the existing cmedia driver instead of creating a dedicated
>    driver.
> 
> v2: https://lore.kernel.org/linux-input/20210716160659.154779-1-linux@weissschuh.net/
> 
> v2 -> v3:
>  * Fixed cosmetic checkpatch warnings
>  * CC-ed Ben Chen who is the original author of hid-cmedia.c
> 
>  drivers/hid/Kconfig      |  5 +-
>  drivers/hid/hid-cmedia.c | 99 +++++++++++++++++++++++++++++++++++-----
>  drivers/hid/hid-ids.h    |  1 +
>  drivers/hid/hid-quirks.c |  1 +
>  4 files changed, 93 insertions(+), 13 deletions(-)
> 

FYI:
The Mail to Ben bounced, so we will probably have to do without his review.

Thomas
