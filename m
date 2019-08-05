Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559DF81786
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 12:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfHEKvK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 06:51:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:35150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727868AbfHEKvK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 06:51:10 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3B0E20679;
        Mon,  5 Aug 2019 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565002269;
        bh=kUKcGBZSAUxtlbb9ZUEiOAsBSeEqNXc6IWfKOHjmNyk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=idybAcAa4ADIcwQj7o8EbMt3Jd2j26/sac32rJ3nhkksjhwF2aKkjT04+MTaoXFgB
         juTKDT/CRXPgtugCuuuGAT4qmqmZhdWYgfZ0D4GugG+MBbQ8rGqhQXL9QFh20J1BSv
         kMkqFgcnqKhLshj2mpgTyH4s8ZtZVkOvTfD+CFQc=
Date:   Mon, 5 Aug 2019 12:51:04 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH 5.3 regression fix] HID: logitech-dj: Really fix return
 value of logi_dj_recv_query_hidpp_devices
In-Reply-To: <20190729155036.4094-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1908051250300.5899@cbobk.fhfr.pm>
References: <20190729155036.4094-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 29 Jul 2019, Hans de Goede wrote:

> Commit dbcbabf7da92 ("HID: logitech-dj: fix return value of
> logi_dj_recv_query_hidpp_devices") made logi_dj_recv_query_hidpp_devices
> return the return value of hid_hw_raw_request instead of unconditionally
> returning 0.
> 
> But hid_hw_raw_request returns the report-size on a successful request
> (and a negative error-code on failure) where as the callers of
> logi_dj_recv_query_hidpp_devices expect a 0 return on success.
> 
> This commit fixes things so that either the negative error gets returned
> or 0 on success, fixing HID++ receivers such as the Logitech nano receivers
> no longer working.
> 
> Cc: YueHaibing <yuehaibing@huawei.com>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
> Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Reported-by: Rafael J. Wysocki <rjw@rjwysocki.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 6196217a7d93..b7c3edf21235 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1125,7 +1125,7 @@ static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
>  				    HID_REQ_SET_REPORT);
>  
>  	kfree(hidpp_report);
> -	return retval;
> +	return (retval < 0) ? retval : 0;
>  }
>  

Applied to for-5.3/upstream-fixes; I will be sending it to Linus in a 
couple days. Thanks,

-- 
Jiri Kosina
SUSE Labs

