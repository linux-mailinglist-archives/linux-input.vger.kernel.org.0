Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F320330B4D
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhCHKer (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:34:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:37368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230141AbhCHKeW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:34:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C79EE651A0;
        Mon,  8 Mar 2021 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615199662;
        bh=il5gjKv5nFrmXLaqBOsBHP0tYcf64xT7wsvxbySe+Ys=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pxCQ3idglu1Twhu90qaVVIJwbZ8YIazmslSyOVxRAO1CWrWESm3zIqtaDZVnMt8qa
         RUsIAOfDV1oyNY3voqDP4XSfR8U51B3dsIPS/e95br6GxKEHg09a+O2iO3n+MopwnB
         kJ2SngXhKxbjFUnC+Necs1LsD4GR52pzpEsC0Yq1YZzoVeBM3RUoL4bM95ooK0CsV9
         4W2y4w74fFu6Y8qOFFvu3UqvsO3O1yMAPN+j/640Rgd8ys1Om3SuJsm7C0pnt/0nIe
         8fwk7pqQnQl1G1dcpCI7iCICeybr9255VyoQsyBhi46FbwJXbP8f4aZKj0C1AynAeu
         xxwivenn3tpHQ==
Date:   Mon, 8 Mar 2021 11:34:18 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: hid-alps: fix error return code in
 alps_input_configured()
In-Reply-To: <20210304131957.7089-1-baijiaju1990@gmail.com>
Message-ID: <nycvar.YFH.7.76.2103081134130.12405@cbobk.fhfr.pm>
References: <20210304131957.7089-1-baijiaju1990@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 4 Mar 2021, Jia-Ju Bai wrote:

> When input_register_device() fails, no error return code is assigned.
> To fix this bug, ret is assigned with -ENOENT as error return code.
> 
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/hid/hid-alps.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
> index 3feaece13ade..6b665931147d 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -761,6 +761,7 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  
>  		if (input_register_device(data->input2)) {
>  			input_free_device(input2);
> +			ret = -ENOENT;
>  			goto exit;
>  		}
>  	}

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

