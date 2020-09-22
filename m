Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF353273E67
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 11:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgIVJU0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 05:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbgIVJU0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 05:20:26 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C6BB2075E;
        Tue, 22 Sep 2020 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600766425;
        bh=0MfcHhXtP8JiNN9/AMI9Jl5Lclh6cKs+ndIWK/DvBLw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=C51WulBYUHQyklzgLrWfYXJCRFSi2+CwVQOZu4ev9wKB+OOYqxWv2QBnnuAhkj4mk
         N78COOMMRsiZOl4KM06Q0hqhrpypmA+ImqWKq8z5b/uueDdFKLqpAJbyZRC5W4qeZy
         pRltxqynA+jAKJk/lU2z6N3UEhPTs6lVVrVNQ6Ts=
Date:   Tue, 22 Sep 2020 11:20:22 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: alps: clean up indentation issue
In-Reply-To: <20200920141716.32919-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.2009221119570.3336@cbobk.fhfr.pm>
References: <20200920141716.32919-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 20 Sep 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an if statement that is indented too deeply, fix
> this by removing the extraneous tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
> index a9c2de95c5e2..3feaece13ade 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -526,7 +526,7 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
>  
>  	ret = u1_read_write_register(hdev, ADDRESS_U1_NUM_SENS_Y,
>  			&sen_line_num_y, 0, true);
> -		if (ret < 0) {
> +	if (ret < 0) {
>  		dev_err(&hdev->dev, "failed U1_NUM_SENS_Y (%d)\n", ret);

I am usually not taking whitespace fixes, but this one actually really 
does improve code readability, so I am taking this one. Thanks,

-- 
Jiri Kosina
SUSE Labs

