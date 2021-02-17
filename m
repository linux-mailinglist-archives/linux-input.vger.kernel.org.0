Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDCF31D68A
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 09:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhBQIZP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 03:25:15 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:32906 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbhBQIZO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 03:25:14 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H8OVHH070063;
        Wed, 17 Feb 2021 08:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=AZbkglHeCXvNHy1jr2qMYcnH4eZGOPmsHIGVL8PdGUM=;
 b=GRxe+rQL8bMfgESsyNhF4+MRANB7tQZlthTpsZRC5bIW5axGIciUxbMJcaNI6HIt7P5M
 0mOG4geuVywVufwFypC7Dxr7jEeY4J5G38/n1/6NE1ypkaGkTluuvcZrkB+rAKQCCKMW
 vuIZU1iBlWQ/BLu3TThL1SqopKTVTMVhW1xf/QQxp/sxqHv8M9Fd2chWuYQBHrjVyqEq
 cK9PI3oObmFDL/BxbrbG6+jm8PXeh8UZIM0D5856eQOe22pQGSH5O99dVomvntqu8V4O
 qU1bgRp2ZXNTD7e1HXbrEGZ2ldM+exiaUAQWmDIb7gqyhi/+S02MMN0NmoqZ7sGVDECe dw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 36p49b9mbx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 08:24:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H8K7Sc064239;
        Wed, 17 Feb 2021 08:24:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 36prpxuug0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 08:24:29 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11H8ORLD007669;
        Wed, 17 Feb 2021 08:24:27 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 17 Feb 2021 00:24:27 -0800
Date:   Wed, 17 Feb 2021 11:24:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Shaun Jackman <sjackman@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: elo - fix an error code in elo_connect()
Message-ID: <20210217082419.GK2222@kadam>
References: <YBKFd5CvDu+jVmfW@mwanda>
 <YCydi5tfV/l0NGHw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCydi5tfV/l0NGHw@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102170062
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102170063
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 16, 2021 at 08:37:31PM -0800, Dmitry Torokhov wrote:
> Hi Dan,
> 
> On Thu, Jan 28, 2021 at 12:35:51PM +0300, Dan Carpenter wrote:
> > If elo_setup_10() fails then this should return an error code instead
> > of success.
> 
> Thank you for the patch.
> 
> > 
> > Fixes: fae3006e4b42 ("Input: elo - add support for non-pressure-sensitive touchscreens")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/input/touchscreen/elo.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
> > index e0bacd34866a..4b2fb73da5e2 100644
> > --- a/drivers/input/touchscreen/elo.c
> > +++ b/drivers/input/touchscreen/elo.c
> > @@ -341,8 +341,10 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)
> >  	switch (elo->id) {
> >  
> >  	case 0: /* 10-byte protocol */
> > -		if (elo_setup_10(elo))
> > +		if (elo_setup_10(elo)) {
> > +			err = -EINVAL;
> 
> Ideally we'd propagate error from elo_setup_10() and underlying code,
> but we are not ready for it, as most serio code simply uses -1 for
> errors. However I think that -EIO would suit better here. Please let me
> know if you disagree, otherwise I'll fix it up on my side.
> 

-EIO is fine.  Thanks!

regards,
dan carpenter

