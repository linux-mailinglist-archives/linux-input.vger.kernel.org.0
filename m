Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4E1373B2A
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhEEM1v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:27:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:59676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231129AbhEEM1s (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:27:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72BE1613B3;
        Wed,  5 May 2021 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217611;
        bh=YL7D4o7kDUatxUlkVQK7lpg7yBylqK7Icu1EuQsksM0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=iToY3lL0hRaSsi7NkW1PYxuRNLCT7cc9E8r8AdVH574Z2d9DDm/+k5C8uRQVjvdKD
         h6on9jJRLx0yhiBkQNF07zjvs6V5gO8h9mH7nZaW7KDhtya7E+H5RMUw5IP7mgmA5B
         1rfukrRHUXnR/q9gPkzE6x9noxe7Z6DAweMllFeNNCWO7fulRAj9PoFFAsh1pAYWvb
         juytEMSxgmmrNvfvmhKNeJoURWOP9MnXK3fFodPmIr6e+0gkpkTdzmS5XsmeSRcQNS
         WHQKPXLspNLiD2P6HerPqs6eFn44SmCqgO9Ecmc4+5BxX89B3oroKtjheUWJC4eLPx
         sv4+C49pNwbxQ==
Date:   Wed, 5 May 2021 14:26:47 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
cc:     Dario Pagani <dario.pagani.146@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] HID: thrustmaster: fix return value check in
 thrustmaster_probe()
In-Reply-To: <20210402094041.3424285-1-weiyongjun1@huawei.com>
Message-ID: <nycvar.YFH.7.76.2105051426390.28378@cbobk.fhfr.pm>
References: <20210402094041.3424285-1-weiyongjun1@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2 Apr 2021, Wei Yongjun wrote:

> Fix the return value check which testing the wrong variable
> in thrustmaster_probe().
> 
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/hid/hid-thrustmaster.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index bfcd08759ba0..fada3536f60e 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -311,7 +311,7 @@ static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_i
>  	}
>  
>  	tm_wheel->change_request = kzalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
> -	if (!tm_wheel->model_request) {
> +	if (!tm_wheel->change_request) {
>  		ret = -ENOMEM;

Good catch, applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

