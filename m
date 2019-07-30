Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4DFA7B570
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 00:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387662AbfG3WDr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 18:03:47 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:61630 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfG3WDr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 18:03:47 -0400
Received: from 79.184.255.110.ipv4.supernova.orange.pl (79.184.255.110) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.275)
 id c1e3c96b81337b74; Wed, 31 Jul 2019 00:03:45 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 5.3 regression fix] HID: logitech-dj: Really fix return value of logi_dj_recv_query_hidpp_devices
Date:   Wed, 31 Jul 2019 00:03:45 +0200
Message-ID: <2839691.d4h10CChSD@kreacher>
In-Reply-To: <20190729155036.4094-1-hdegoede@redhat.com>
References: <20190729155036.4094-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Monday, July 29, 2019 5:50:36 PM CEST Hans de Goede wrote:
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

This helps here, thanks!

Tested-by: Rafael J. Wysocki <rjw@rjwysocki.net>

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
>  static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
> 




