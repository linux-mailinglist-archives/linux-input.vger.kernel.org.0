Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63CAF76291
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 11:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfGZJ2e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 05:28:34 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:15766 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725978AbfGZJ2d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 05:28:33 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6Q9NkuS026201;
        Fri, 26 Jul 2019 04:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=PukIIV6EOsNKE66DWOqgfgFs5Yv2tpDoxcH85uQmCxI=;
 b=jVGn3UklaJHuibO6vsfgUbnjvc+oAzHMsqW0/6T3EbsjfO+PBbAjU6NUXIR1DKbO/bYx
 DZyMd10WNHM5Ku/1ToYneNI2bBsiw9t7I5q3ouzf+NjA+DYkIaprS/ZL+azhBKC7MiQV
 rMwG35vKGBmsKB6rZMt9YTOlPNF3ws/Si02woVUxc2eueZC9bNFYU6W8JZg4jxhELgoU
 hl/zaX++L8qq8zt52KwUsfIQdmxBFczIzXF4dDNA6KzlLQ1OlHSW2eyNNUfemAuchQbB
 tRQeIPHb3nh26JAodYFYe2COTSV6COkxaaKgHDMbmpi6fdtYMNd4+egzDetvc6ORJDLU JQ== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tx61nmnpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 26 Jul 2019 04:28:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 26 Jul
 2019 10:28:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 26 Jul 2019 10:28:17 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B1ADF2C5;
        Fri, 26 Jul 2019 10:28:17 +0100 (BST)
Date:   Fri, 26 Jul 2019 10:28:17 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
CC:     <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>,
        <gregkh@linuxfoundation.org>, <allison@lohutok.net>,
        <rdunlap@infradead.org>, <patches@opensource.cirrus.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] input: touchscreen: wm97xx-core: Fix possible
 null-pointer dereferences in wm97xx_ts_input_open()
Message-ID: <20190726092817.GB54126@ediswmail.ad.cirrus.com>
References: <20190726091436.8866-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190726091436.8866-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=939 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907260121
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 26, 2019 at 05:14:36PM +0800, Jia-Ju Bai wrote:
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
> To fix these bugs, wm->mach_ops is checked at the beginning of 
> wm97xx_init_pen_irq().
> 
> These bugs found by a static analysis tool STCheck written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
> v2:
> * Add a new check of wm->mach_ops in wm97xx_init_pen_irq().
>   Thank Charles for helpful advice.
> 
> ---
>  drivers/input/touchscreen/wm97xx-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
> index 0a174bd82915..50b016abf492 100644
> --- a/drivers/input/touchscreen/wm97xx-core.c
> +++ b/drivers/input/touchscreen/wm97xx-core.c
> @@ -374,6 +374,9 @@ static int wm97xx_init_pen_irq(struct wm97xx *wm)
>  {
>  	u16 reg;
>  
> +	if (!wm->mach_ops)
> +		return -EINVAL;
> +

Probably worth adding an printk in here too, the calling function
doesn't check the return value of this function so otherwise
there will be no indication this failed.

Thanks,
Charles

>  	/* If an interrupt is supplied an IRQ enable operation must also be
>  	 * provided. */
>  	BUG_ON(!wm->mach_ops->irq_enable);
> -- 
> 2.17.0
> 
