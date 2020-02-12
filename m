Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D2115AABC
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 15:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgBLOHC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 09:07:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:57794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727665AbgBLOHC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 09:07:02 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8337E206DB;
        Wed, 12 Feb 2020 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581516421;
        bh=DE/PWcipu9urcWj6QB0zTb3Uew8AUACC1GbS9BoKcNU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DuryYLNXryIvLOQ1XH9lLRWjMYDUox3/nMyQHoOMii5WGMM4PTOoCmaa850S+AnM7
         LFqrS/jqQPvXIQngmI9/XAK+oZVkjkLBFUky6M2WLTCRKeBGtmNr1PJYr+/NBWV6/4
         bsv5Hn/IBu7uXw40AvGTC92bt4cq37jYEnBI+5ZM=
Date:   Wed, 12 Feb 2020 15:06:58 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     benjamin.tissoires@redhat.com, masaki.ota@jp.alps.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: alps: Fix an error handling path in
 'alps_input_configured()'
In-Reply-To: <20191204033525.10871-1-christophe.jaillet@wanadoo.fr>
Message-ID: <nycvar.YFH.7.76.2002121506510.3144@cbobk.fhfr.pm>
References: <20191204033525.10871-1-christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 4 Dec 2019, Christophe JAILLET wrote:

> They are issues:
>    - if 'input_allocate_device()' fails and return NULL, there is no need
>      to free anything and 'input_free_device()' call is a no-op. It can
>      be axed.
>    - 'ret' is known to be 0 at this point, so we must set it to a
>      meaningful value before returning
> 
> Fixes: 2562756dde55 ("HID: add Alps I2C HID Touchpad-Stick support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/hid-alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
> index ae79a7c66737..fa704153cb00 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -730,7 +730,7 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	if (data->has_sp) {
>  		input2 = input_allocate_device();
>  		if (!input2) {
> -			input_free_device(input2);
> +			ret = -ENOMEM;
>  			goto exit;
>  		}

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

