Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B78B76181
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 11:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfGZJGr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 05:06:47 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:18574 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725815AbfGZJGr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 05:06:47 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6Q901AN006003;
        Fri, 26 Jul 2019 04:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=yCdlKcUvwHv3Ow3tYdzgUhwXtv26pm/Mvpcsdawejhk=;
 b=XF3e3qGffloXD1JUaWFG3tK3o1qOQQIY3pys5uHnxi0tgNUA+7V5yqAEVCiXQrbQu05q
 EKQJpUGac1Hk4Km808SwgMNPEJO08LMQdp+yoHRs+vwZskc8C5qPg/zxBuh3frohwAhZ
 uDLd2YF/GApVovjtAekfuU7V9orNN0h0LRg+Dimg65eeys9JudfGZRc0PiCWI9T2PInX
 ci3925kZmV+RdoOTD7HqjqSRRZnGMOFH1ZkNINcfxKMzQvGiW7edye/P0LlooOokl8Pu
 S7OwvYLAHUZmJNapWaWWc/0GoYOBL338lCkttP4fjqk+uxFb5gJjX8FNMzOKPC8Cx606 /Q== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2tx61s51t5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 26 Jul 2019 04:06:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 26 Jul
 2019 10:06:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 26 Jul 2019 10:06:26 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C8E145;
        Fri, 26 Jul 2019 10:06:26 +0100 (BST)
Date:   Fri, 26 Jul 2019 10:06:26 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
CC:     <dmitry.torokhov@gmail.com>, <gregkh@linuxfoundation.org>,
        <tglx@linutronix.de>, <allison@lohutok.net>,
        <rdunlap@infradead.org>, <patches@opensource.cirrus.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] input: touchscreen: wm97xx-core: Fix possible
 null-pointer dereferences in wm97xx_ts_input_open()
Message-ID: <20190726090626.GA54126@ediswmail.ad.cirrus.com>
References: <20190726084816.8487-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190726084816.8487-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=913 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1907260116
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 26, 2019 at 04:48:16PM +0800, Jia-Ju Bai wrote:
> In wm97xx_ts_input_open(), there is an if statement on line 507 to check
> whether wm->mach_ops is NULL:
>     if (wm->mach_ops && wm->mach_ops->acc_enabled)
> 
> When wm->mach_ops is NULL, it is used on line 521:
>     wm97xx_init_pen_irq(wm);
>         BUG_ON(!wm->mach_ops->irq_enable);
>         BUG_ON(!wm->mach_ops->irq_gpio);
>         wm97xx_reg_write(..., reg & ~(wm->mach_ops->irq_gpio))
> 
> Thus, possible null-pointer dereferences may occur.
> 
> To fix these bugs, wm->mach_ops is checked before calling
> wm97xx_init_pen_irq().
> 
> These bugs found by a static analysis tool STCheck written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/input/touchscreen/wm97xx-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
> index 0a174bd82915..f7bd0726a577 100644
> --- a/drivers/input/touchscreen/wm97xx-core.c
> +++ b/drivers/input/touchscreen/wm97xx-core.c
> @@ -517,7 +517,7 @@ static int wm97xx_ts_input_open(struct input_dev *idev)
>  	wm->ts_reader_interval = wm->ts_reader_min_interval;
>  
>  	wm->pen_is_down = 0;
> -	if (wm->pen_irq)
> +	if (wm->pen_irq && wm->mach_ops)
>  		wm97xx_init_pen_irq(wm);
>  	else
>  		dev_err(wm->dev, "No IRQ specified\n");

This doesn't quite feel like the right fix as it would print an
error message saying "No IRQ specified", in the case the IRQ is
specified but the mach_ops have not been set.

I would suggest either extending the existing BUG_ON or adding a
new check in wm97xx_init_pen_irq.

Thanks,
Charles

> -- 
> 2.17.0
> 
