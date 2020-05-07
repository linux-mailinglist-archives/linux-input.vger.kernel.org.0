Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198F81C95B2
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 17:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgEGP5Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 11:57:16 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:12990 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727999AbgEGP5P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 11:57:15 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 047FrwXA010471;
        Thu, 7 May 2020 10:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=p/ahMeJsP1I0U4dHGegXC/mmB+l7j8dt/grWfY6l+uE=;
 b=IrhklOVrJVbyYa4e+8WdDXR1NCWKL9IxwRqKkOLKehw18bc0UOB/eA566audfSpXparc
 0AV0HxkTGDTBoO4L16TVxj+75Q9YXCT/zjX2M7uFVNH2jBqheDBWdVSV0o6ZHVWWTvaj
 U2OtUtm5n58RUsSgcCswgoMuit0iZUZt2QPAC8Hxqc5/0ojUueDbMnJKBmc9QxyaGU/A
 XgCOKYSCurU/9Pp7O9BaapUz9h3/M/VVGlTJPYvDVgl+P+Q5dRhCoX5I+6gS+NyQEFxb
 MuLgherRQded+Xt9bz24lFjR8jWy0z7OF5EAXN+nHH+t4s6KYE4MeFwv7/oO1OTPimEn hw== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 30s69397f9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 07 May 2020 10:57:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 7 May 2020
 16:57:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 7 May 2020 16:57:09 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7B9FE2C6;
        Thu,  7 May 2020 15:57:09 +0000 (UTC)
Date:   Thu, 7 May 2020 15:57:09 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <patches@opensource.cirrus.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: wm831x-ts - add missed input_unregister_device
Message-ID: <20200507155709.GA71940@ediswmail.ad.cirrus.com>
References: <20200507151259.792697-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200507151259.792697-1-hslester96@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=2
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070128
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 11:12:59PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in remove.
> Add the missed function call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/input/touchscreen/wm831x-ts.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/wm831x-ts.c b/drivers/input/touchscreen/wm831x-ts.c
> index 607d1aeb595d..db09dd473ada 100644
> --- a/drivers/input/touchscreen/wm831x-ts.c
> +++ b/drivers/input/touchscreen/wm831x-ts.c
> @@ -379,6 +379,7 @@ static int wm831x_ts_remove(struct platform_device *pdev)
>  {
>  	struct wm831x_ts *wm831x_ts = platform_get_drvdata(pdev);
>  
> +	input_unregister_device(wm831x_ts->input_dev);

Are you seeing specific issues caused by this being missing, if
so it would be good if you could elaborate on them? My understanding
is that since this driver uses devm_input_allocate_device
input_unregister_device will be handled automatically, see the
comments on input_register_device/devm_input_allocate_device.

Thanks,
Charles

>  	free_irq(wm831x_ts->pd_irq, wm831x_ts);
>  	free_irq(wm831x_ts->data_irq, wm831x_ts);
>  
> -- 
> 2.26.2
> 
