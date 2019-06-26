Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329265679D
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 13:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZLai (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 07:30:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbfFZLai (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 07:30:38 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62F2F2080C;
        Wed, 26 Jun 2019 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561548637;
        bh=IyyGpso1X5gle4WQRU9GdLUPeT3m5fBMyrBGyr9C6gk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PiPDtI2OuuaPpkDUqx+anN7P66FPlZc1PnIAXtJs0K2LOkf/PnXlF88k7tIpYXj1X
         Y1ItyHkg5+6WnwsdjdhiKmTtsfUNp/ckDbNQDDQ+uEPsjA30JwibnbMhjHfka3Kqef
         ni1hHBY+eQbctexEeLK69WWOayBkge91dy0J7iD0=
Date:   Wed, 26 Jun 2019 13:30:33 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] intel-ish-hid: Fix a use after free in
 load_fw_from_host()
In-Reply-To: <20190626101041.GE3242@mwanda>
Message-ID: <nycvar.YFH.7.76.1906261330270.27227@cbobk.fhfr.pm>
References: <20190626101041.GE3242@mwanda>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 26 Jun 2019, Dan Carpenter wrote:

> We have to print the filename first before we can kfree it.
> 
> Fixes: 91b228107da3 ("HID: intel-ish-hid: ISH firmware loader client driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> index 22ba21457035..aa2dbed30fc3 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> @@ -816,9 +816,9 @@ static int load_fw_from_host(struct ishtp_cl_data *client_data)
>  		goto end_err_fw_release;
>  
>  	release_firmware(fw);
> -	kfree(filename);
>  	dev_info(cl_data_to_dev(client_data), "ISH firmware %s loaded\n",
>  		 filename);
> +	kfree(filename);
>  	return 0;

Applied, thanks Dan.

-- 
Jiri Kosina
SUSE Labs

