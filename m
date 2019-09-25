Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A540BDD6A
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2019 13:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405026AbfIYLsQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Sep 2019 07:48:16 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:48598 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfIYLsP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Sep 2019 07:48:15 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PBi755080513;
        Wed, 25 Sep 2019 11:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=En+GWXSSx/J0j26GZXr1vS3Ft9wlXq8kmPy5Bn5hjUw=;
 b=UHKtFVs8HpEr1n+gmtREaQHTUqe/2D3FrcIXPPQab2SFQs2THafN27jz3O8MhAUho7y4
 GW7FYWuAFZVrqi0sLTjahrXOeah81nit0yu8/69IcSxBqfzFGDVOnESoBfQMHv31jbpK
 AOiB1Pc148/ne8o3TEAaBKiYGKpDVcArdeATvY+Sn56LNODHFcmAxUoK95msWMzYeLud
 0I5Oqv90iNhjluO/aEavKrPdx2rAIDEhZdrYzpF2MUE3EEIjlNdUz1oocVp6HB9YtOeV
 8KDGHIQkSx8bSoNZ8x0kfnpk3Bb1fhmnwHFuAS2gxaSGe5CQex/6pr+9E8Pnr/fR0PRh pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2v5btq44r0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Sep 2019 11:47:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PBhtRY160333;
        Wed, 25 Sep 2019 11:47:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2v82q9cf81-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Sep 2019 11:47:56 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8PBlt0J023007;
        Wed, 25 Sep 2019 11:47:55 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 25 Sep 2019 04:47:54 -0700
Date:   Wed, 25 Sep 2019 14:47:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Colin King <colin.king@canonical.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: core: clean up indentation issue
Message-ID: <20190925114741.GD27389@kadam>
References: <20190922115054.10880-1-colin.king@canonical.com>
 <nycvar.YFH.7.76.1909231303180.1459@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.1909231303180.1459@cbobk.fhfr.pm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909250120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909250121
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 23, 2019 at 01:04:13PM +0200, Jiri Kosina wrote:
> On Sun, 22 Sep 2019, Colin King wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is an if statement that is indented by one extra space,
> > fix this by removing the extraneous space.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/hid/hid-core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 3eaee2c37931..9469c382a182 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -2329,10 +2329,10 @@ int hid_add_device(struct hid_device *hdev)
> >  	/*
> >  	 * Check for the mandatory transport channel.
> >  	 */
> > -	 if (!hdev->ll_driver->raw_request) {
> > +	if (!hdev->ll_driver->raw_request) {
> >  		hid_err(hdev, "transport driver missing .raw_request()\n");
> >  		return -EINVAL;
> > -	 }
> > +	}
> 
> Let's not pollute git blame and wait for an ocasion when we need to touch 
> the code for some more valid reason.

Just use `git blame -w`.

This probably came from a Smatch warning.  Smatch warns very seldom
warns about style issues, but in this case the indenting is legitimately
bad.

regards,
dan carpenter

