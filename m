Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B004D2DBF7E
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 12:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgLPLdX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 06:33:23 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:51536 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbgLPLdW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 06:33:22 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGBUXRa051279;
        Wed, 16 Dec 2020 11:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=uMvmk4hYYtTYJvJwsw1nfeuWKq7IosOmWnEU6ihm3Cs=;
 b=SF1694fiRH6uBdPX8GmsABO9gQJsSTWK5/SXjOWoZqcEvkjAuSlYQxoAH+ZVrlwM6y37
 GxcxP5mdSiCdub4Teu5LhGkbPEC/aHAGD8T2XmY4/h0kglPmybN3R8uZAYw0H4bIVDzf
 DqYxAyNVM8xVgNFTl2mYRVWKL3vujMigaWuiFJEJJrsc3h/caMFAlt+hbKQXQZmFX+zt
 /SjqHP2fNfd7cxK47izYNbAZ83EosuOnON86Md7jKnzR5yKHP6yxAS9cmv1lSRoUYQ0p
 I03hVZ4rNWcyk8i8VdDWs6BdE7KcnqPm/mTN87s1EoxBn8lliBshe7SCLuwsU+WeMr3/ ew== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 35cn9rfnwj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Dec 2020 11:32:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BGBVAhk020284;
        Wed, 16 Dec 2020 11:32:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 35e6jskc4c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Dec 2020 11:32:37 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BGBWa3E021170;
        Wed, 16 Dec 2020 11:32:36 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 16 Dec 2020 03:32:35 -0800
Date:   Wed, 16 Dec 2020 14:32:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Roy Im <roy.im.opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] Input: da7280 - delete a stray tab
Message-ID: <20201216113228.GK2809@kadam>
References: <X9nGNJjFi9AaBBwX@mwanda>
 <AM6PR10MB1926E4EA344C24F76881E89B85C50@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR10MB1926E4EA344C24F76881E89B85C50@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160074
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 16, 2020 at 10:51:23AM +0000, Roy Im wrote:
> On Wednesday, December 16, 2020 5:33 PM, Dan Carpenter wrote: 
> 
> > This line is indented one tab too far.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> 
> Thanks for the patch but it is already fixed by Dmitry as below.
> ---
> An "if" testing for error condition has accidentally been dropped from the code.
> 		error = device_property_read_string(dev, gpi_str3, &str);
> +		if (!error)
>  			haptics->gpi_ctl[i].polarity =
>  				da7280_haptic_of_gpi_pol_str(dev, str);
> 

Huh...  Well, at least the kbuild bot discovered this using the Smatch
warning for inconsistent indenting so that's nice.

https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/IB3H2KDL2HZ5WGNAER7TLCJQHZJH7S7E/

This is one of the first real bugs that that indenting has found, maybe
if Smatch had used some more of the context clues the warning could have
been made better.

Presumably W=1 and some of the other analysis tools would have warned
about the unused "error = " assignment if we had waited another day.

regards,
dan carpenter

