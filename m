Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094B14184F6
	for <lists+linux-input@lfdr.de>; Sun, 26 Sep 2021 00:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhIYW16 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Sep 2021 18:27:58 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:34638
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230024AbhIYW16 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Sep 2021 18:27:58 -0400
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A524D40CE5;
        Sat, 25 Sep 2021 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632608781;
        bh=kghkwBWuSi2KeCYfmmsja7Y4UgI7JLFaNj84dsKEBzU=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=otU+XFmriqtjTLbCIIUykHXeBxBMA+b9iWperMJeM58rCVZBo7DVgKL/+BP6gVjcV
         rbhzBIV4SKCtNeXnzXmJjrf6NCRQv9UL+oDRj51LhT0ZBsc3FLMFALQ2d0psFLU3/o
         n+oSmGpI/QPTZUcTdLUUGwpDbKmWJYaaEbrBKBAULgzCBQoWq0nWqGmzIawMahRYsl
         zISa2tNkI3gaBLtpGpgF8/Sdox5BiPkNgeb4++V46kP15yDCd4I3DdmNJG/iLf0JcJ
         3U8E/jkDZGg4YOQLK03sJ4XltlxmzcD1gg7I09s/JJ8ka1DglV4ICr0KUvZNUo327d
         BZpnWUV0i1iDw==
Subject: NAK: [PATCH] HID: thrustmaster: Initialized pointer twi with NULL
 rather than 0
From:   Colin Ian King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210925222216.182099-1-colin.king@canonical.com>
Message-ID: <f8e8c609-ac7f-2b6a-b8bf-57a53fadfa1d@canonical.com>
Date:   Sat, 25 Sep 2021 23:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210925222216.182099-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25/09/2021 23:22, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointers should be initialized with NULL rather than 0. Fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-thrustmaster.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index d44550aa8805..aa874f075bf9 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -205,7 +205,7 @@ static void thrustmaster_model_handler(struct urb *urb)
>  	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
>  	uint16_t model = 0;
>  	int i, ret;
> -	const struct tm_wheel_info *twi = 0;
> +	const struct tm_wheel_info *twi = NULL;
>  
>  	if (urb->status) {
>  		hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
> 

NACK, I spotted another pointer than needs the same change, will send a V2.
