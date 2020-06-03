Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEBE1ED1C0
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 16:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgFCOKH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 10:10:07 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38216 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCOKG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 10:10:06 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053E8Y41164644;
        Wed, 3 Jun 2020 14:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=WZ3n66zvi6zNBFVJdXdKnvrQSPpR0iVYMp8nrrXpTFs=;
 b=ApQBgkyf4WBZ8sRDB4JDSo2ss8a7qxBrc6HwAIviWcbTOopAB/EFsMcVeQdHFHwZHW1n
 PVp1MJHtGd9L3jfLGSJqvsDKN5IkXKMfg6gUU1Qe9k71r9SnUEDX0cUAT+t0bq148k6O
 UrcMu6Kk1oSbnPeTOpkDUzxocTVNpTpFvJDkcSZ99L2aQwYH8Q8bclUykoNuf+8gqvyR
 tj7F4B2DNdl614qRaqvkz5PZoeaV8xlE0ZH64BDZ0o4uCwCdyXZ0szK9mcLY7Ycywqc2
 mrfRL9qtxSXWA7dK+A78/I82C1mQ9LBbTmBLh2THH8mQ7FnQ4G+I2qDEs6ctFP5hw5LY oA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 31bewr1jg1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 03 Jun 2020 14:10:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053E82MN082764;
        Wed, 3 Jun 2020 14:10:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 31c25s7saq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Jun 2020 14:10:01 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 053EA014028443;
        Wed, 3 Jun 2020 14:10:00 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 03 Jun 2020 07:09:59 -0700
Date:   Wed, 3 Jun 2020 17:09:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: ims-pcu: remove redundant assignment to variable
 'error'
Message-ID: <20200603140953.GL30374@kadam>
References: <20200603135102.130436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603135102.130436-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=2 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=2 impostorscore=0 cotscore=-2147483648
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006030112
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 03, 2020 at 02:51:02PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable error is being initialized with a value that is
> never read and the -ENOMEM error return is being returned anyhow
> by the error exit path to label err_free_mem.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/input/misc/ims-pcu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
> index d8dbfc030d0f..4ba68aa3d281 100644
> --- a/drivers/input/misc/ims-pcu.c
> +++ b/drivers/input/misc/ims-pcu.c
> @@ -292,7 +292,6 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
>  	if (!gamepad || !input) {
>  		dev_err(pcu->dev,
>  			"Not enough memory for gamepad device\n");
> -		error = -ENOMEM;
>  		goto err_free_mem;

It would be better to change the return instead.

regards,
dan carpenter

