Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028912B03C1
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgKLLWi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:22:38 -0500
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:10258 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728060AbgKLLWf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:22:35 -0500
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0ACB7tBv025589;
        Thu, 12 Nov 2020 05:22:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=wwQcluCTkWHl+kz/6YmStjp8bfBF/WyDfzvVyfo0BxU=;
 b=LKeWINqY4YsQc4Yo++FxnWMKt3XBhO4kgEVMRU3dhjKM9t2GUBgG/8cT6aK+6787BqIh
 pP1SlttA8sptiXBngro+ZzdDrZpkIm1WRveiukYqVGqWzV8vDQFkE5wfNqAykmb3EkSM
 JyrqE7VsbirRLupN+XmWbRxohzYzFrR1BzZGc/hNXqzSk6ofoLxKvHquj1EL2B9XwPd3
 BHdH4KB33Sa9IqWP0Hn/YX1pTERgp24SPAI+Spge6gVmlKnWiwCmz+fS/PlXVXx1VT5W
 4LOEkx99UIRndXbWncAUGteSPhBSj7oHCsac/TjvZn6RWS7AjOk17WJcZBTXZe50VJl/ uQ== 
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
        by mx0b-001ae601.pphosted.com with ESMTP id 34rn3ch489-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 12 Nov 2020 05:22:13 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 12 Nov
 2020 11:22:12 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 12 Nov 2020 11:22:12 +0000
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.168])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E7FF92D1;
        Thu, 12 Nov 2020 11:22:11 +0000 (UTC)
Subject: Re: [PATCH 11/15] input: touchscreen: wm97xx-core: Provide missing
 description for 'status'
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lrg@slimlogic.co.uk>,
        Ian Molton <spyro@f2s.com>, Andrew Zabolotny <zap@homelink.ru>,
        Russell King <rmk@arm.linux.org.uk>,
        <patches@opensource.cirrus.com>, <linux-input@vger.kernel.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-12-lee.jones@linaro.org>
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <80d21cae-1031-5ce5-a08e-cc2ae9db391e@opensource.cirrus.com>
Date:   Thu, 12 Nov 2020 11:22:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201112110204.2083435-12-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=18 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120067
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/11/2020 11:02, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/input/touchscreen/wm97xx-core.c:204: warning: Function parameter or member 'status' not described in 'wm97xx_set_gpio'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Liam Girdwood <lrg@slimlogic.co.uk>
> Cc: Ian Molton <spyro@f2s.com>
> Cc: Andrew Zabolotny <zap@homelink.ru>
> Cc: Russell King <rmk@arm.linux.org.uk>
> Cc: patches@opensource.cirrus.com
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/input/touchscreen/wm97xx-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
> index 0a174bd829152..45ce89467c167 100644
> --- a/drivers/input/touchscreen/wm97xx-core.c
> +++ b/drivers/input/touchscreen/wm97xx-core.c
> @@ -194,7 +194,7 @@ EXPORT_SYMBOL_GPL(wm97xx_get_gpio);
>    * wm97xx_set_gpio - Set the status of a codec GPIO.
>    * @wm: wm97xx device.
>    * @gpio: gpio
> - *
> + * @status: status
>    *
>    * Set the status of a codec GPIO pin
>    */
> 

Acked-by: Richard Fitzgerald <rf@opensource.cirrus.com>
