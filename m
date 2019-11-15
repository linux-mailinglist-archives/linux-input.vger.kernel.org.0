Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A88FDD53
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 13:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfKOMUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 07:20:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:53120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727196AbfKOMUd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 07:20:33 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EACE620740;
        Fri, 15 Nov 2019 12:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573820432;
        bh=TyM1iIX/py+lg8xnlUsnl1Ktj1Bv0w98SjBjsVImFJY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=f5s+aRT5RFtUhbdD9AxDBU6s33IpaDN3I+jqZ5HXiLVT/LHyjD+ZXFQ4UuY4EJnFa
         NFl7QXylIySsPNKBvnOcRjAvmK86e1KDQsPYdfu4/1QYQqchGC7rSdqXxuBvoiSzit
         2kiqT3qfPFhzq8E95RLedjNJItLyhWzcb5mv/+6g=
Date:   Fri, 15 Nov 2019 13:20:28 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     You-Sheng Yang <vicamo.yang@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hui Wang <hui.wang@canonical.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: remove orphaned member sleep_delay
In-Reply-To: <20191115053646.3107290-1-vicamo.yang@canonical.com>
Message-ID: <nycvar.YFH.7.76.1911151320220.1799@cbobk.fhfr.pm>
References: <20191115053646.3107290-1-vicamo.yang@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 Nov 2019, You-Sheng Yang wrote:

> This was introduced in commit 00b790ea545b ("HID: i2c-hid: Add a small
> delay after sleep command for Raydium touchpanel") which has been
> effectively reverted by commit 67b18dfb8cfc ("HID: i2c-hid: Remove
> runtime power management").
> 
> Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 04c088131e04..adfe344bc786 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -157,8 +157,6 @@ struct i2c_hid {
>  
>  	bool			irq_wake_enabled;
>  	struct mutex		reset_lock;
> -
> -	unsigned long		sleep_delay;
>  };

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

