Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF015BB297
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2019 13:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387534AbfIWLEi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Sep 2019 07:04:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387507AbfIWLEh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Sep 2019 07:04:37 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E626F206C2;
        Mon, 23 Sep 2019 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569236677;
        bh=RWSP+mHskHHabLmX2TMnaMLMsT33LtCtWHhyFpnJaPs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QNqtprZ79WNy0WIKjIRsE/RkDoZkytgibq1/T5JiFgpSSKHu2Q2Zb9ttYkBtfTWlN
         Q5Xn6TSVHT07TzQ9CRMtfzcJgWR8wnnK50++niILHddlm/3rJgDNwzaKxooyvZpU8s
         Wyecb5L9p/yyqWdQvVmLGOrT/ZHgvyc5GljcRTDs=
Date:   Mon, 23 Sep 2019 13:04:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: core: clean up indentation issue
In-Reply-To: <20190922115054.10880-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.1909231303180.1459@cbobk.fhfr.pm>
References: <20190922115054.10880-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 22 Sep 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an if statement that is indented by one extra space,
> fix this by removing the extraneous space.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 3eaee2c37931..9469c382a182 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2329,10 +2329,10 @@ int hid_add_device(struct hid_device *hdev)
>  	/*
>  	 * Check for the mandatory transport channel.
>  	 */
> -	 if (!hdev->ll_driver->raw_request) {
> +	if (!hdev->ll_driver->raw_request) {
>  		hid_err(hdev, "transport driver missing .raw_request()\n");
>  		return -EINVAL;
> -	 }
> +	}

Let's not pollute git blame and wait for an ocasion when we need to touch 
the code for some more valid reason.

Thanks,

-- 
Jiri Kosina
SUSE Labs

