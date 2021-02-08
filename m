Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F75631364B
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 16:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhBHPI4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Feb 2021 10:08:56 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54436 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbhBHPHa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Feb 2021 10:07:30 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118F3T42009999;
        Mon, 8 Feb 2021 15:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=qkErgRPWmbD5fYUGygjT0j3rMadLZ7aMXhTabVACc10=;
 b=tCgIt9GDJM01QMd2841PQOOtw2KQdKDNyaPvaPUR1mga6FwiOn18pcPfaJOL3sMIaasj
 cKsLEZnZr48wzy+vZ18lqGEoY+qT28VUvdqhHYblYAi2Y8YcbjOHJ4oc2eTg2VIgvWoi
 Zv5hHlqs9JIFbgw38epRXP4ZE96RK2klYOegG7Gt96Z/cuogWMR4rsJRI9V2JMgE14A2
 Tj/7K744+ZNDhuXDtwY9Mf50G4PC0zPY5lDQKBoSVzgGTPD9wvGqDLJReiNWZNhHTzZd
 AWzIDJKckZHsFsfbgcx0+SquAXhNSr5/WgscDSeu7HJzlFwBikQpnfVbJ7IyaIZx8JD/ dA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 36hjhqm6we-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Feb 2021 15:06:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118F0drM014587;
        Mon, 8 Feb 2021 15:06:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 36j4vq0akb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Feb 2021 15:06:38 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 118F6JSH002661;
        Mon, 8 Feb 2021 15:06:19 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 08 Feb 2021 07:06:18 -0800
Date:   Mon, 8 Feb 2021 18:06:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: fix unintentional integer overflow on
 left shift
Message-ID: <20210208150610.GI2696@kadam>
References: <20210207232120.8885-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207232120.8885-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9888 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080103
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9888 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080103
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Feb 07, 2021 at 11:21:20PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the integer value 1 is evaluated using 32-bit rithmetic
> and then used in an expression that expects a 64-bit value, so
> there is potentially an integer overflow. Fix this by using th
> BIT_ULL macro to perform the shift and avoid the overflow.
> 
> Addresses-Coverity: ("Uninitentional integer overflow")
> Fixes: 534a7b8e10ec ("HID: Add full support for Logitech Unifying receivers")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 45e7e0bdd382..747f41be0603 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1035,7 +1035,7 @@ static void logi_dj_recv_forward_null_report(struct dj_receiver_dev *djrcv_dev,
>  	memset(reportbuffer, 0, sizeof(reportbuffer));
>  
>  	for (i = 0; i < NUMBER_OF_HID_REPORTS; i++) {
                        ^^^^^^^^^^^^^^^^^^^^^
This is 32, so it can't be undefined.

> -		if (djdev->reports_supported & (1 << i)) {
> +		if (djdev->reports_supported & BIT_ULL(i)) {
>  			reportbuffer[0] = i;
>  			if (hid_input_report(djdev->hdev,
>  					     HID_INPUT_REPORT,

regards,
dan carpenter
