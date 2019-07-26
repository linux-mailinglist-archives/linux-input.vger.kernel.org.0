Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE72F76398
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 12:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfGZKdV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 06:33:21 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:47188 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbfGZKdU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 06:33:20 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x6QATkM6022536;
        Fri, 26 Jul 2019 05:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=efZFnW5lzkbmhOQo8URSwv2VRRH5b1wiAs28rX/8rXI=;
 b=SlRUOX1qE8MOoZl5sN7q7+tN1MU5FJBFTOuHNCUM6Gy9I2Aijiwdl2VA913hBwdkKJos
 ZbHNXFzNaBZT0jBz97F1xYu0TOmlpnPz/vtB/mcv2v0+cLpcYOzE3HPvkjA1s7HdmcHK
 keNmALSMPJhDRlsnfO9PvprRQqeurtwzUXye0D7zypvSS9UxwuhsilDsvDd9D4LZbY/y
 cdmAAgGlFObSwGamngxIPo11pnFHywxj+NLO/+P71CzwAAmeZ2sdi9koUx4wYzgzuRqf
 K/wjd1NFijfJtcGPkN3GCwDzydA3DT4+kKwla0by8JdmizzKpf0y5Ko1s8tafBr1BTNM Gg== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tx61nmr0v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 26 Jul 2019 05:33:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 26 Jul
 2019 11:33:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 26 Jul 2019 11:33:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ADBD62DD;
        Fri, 26 Jul 2019 11:33:07 +0100 (BST)
Date:   Fri, 26 Jul 2019 11:33:07 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
CC:     <dmitry.torokhov@gmail.com>, <allison@lohutok.net>,
        <gregkh@linuxfoundation.org>, <tglx@linutronix.de>,
        <rdunlap@infradead.org>, <patches@opensource.cirrus.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] input: touchscreen: wm97xx-core: Fix possible
 null-pointer dereferences in wm97xx_ts_input_open()
Message-ID: <20190726103307.GC54126@ediswmail.ad.cirrus.com>
References: <20190726102326.9266-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190726102326.9266-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=733 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907260135
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 26, 2019 at 06:23:26PM +0800, Jia-Ju Bai wrote:
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
> v3:
> * Print a message if wm->mach_ops is NULL in wm97xx_init_pen_irq().
>   Thank Charles for helpful advice.
> 
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
