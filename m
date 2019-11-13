Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC981FA70E
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 04:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfKMDLO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 22:11:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6651 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727100AbfKMDLO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 22:11:14 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B387B50DFB3DD744FFD1
        for <linux-input@vger.kernel.org>; Wed, 13 Nov 2019 11:11:09 +0800 (CST)
Received: from [127.0.0.1] (10.184.213.217) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 13 Nov 2019
 11:11:04 +0800
Subject: Re: [PATCH] Input: alps - Remove unnecessary unlikely
To:     <pali.rohar@gmail.com>, <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>
References: <1570869407-41262-1-git-send-email-zhengbin13@huawei.com>
From:   "zhengbin (A)" <zhengbin13@huawei.com>
Message-ID: <f9e1bf60-6936-4aea-090f-cc64a1fffa25@huawei.com>
Date:   Wed, 13 Nov 2019 11:11:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1570869407-41262-1-git-send-email-zhengbin13@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.184.213.217]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

ping

On 2019/10/12 16:36, zhengbin wrote:
> IS_ERR_OR_NULL already contains unlikely, there is no need
> for another one.
>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/input/mouse/alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 34700ed..ed16614 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
>  		/* On V2 devices the DualPoint Stick reports bare packets */
>  		dev = priv->dev2;
>  		dev2 = psmouse->dev;
> -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
> +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
>  		/* Register dev3 mouse if we received PS/2 packet first time */
>  		if (!IS_ERR(priv->dev3))
>  			psmouse_queue_work(psmouse, &priv->dev3_register_work,
> --
> 2.7.4
>
>
> .
>

