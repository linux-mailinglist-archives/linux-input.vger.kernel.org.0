Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4066531F5F2
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 09:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBSIdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 03:33:24 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33430 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhBSIdV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 03:33:21 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J8T1ZW043449;
        Fri, 19 Feb 2021 08:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=tjcNLqtLu/b7aJEdrTuj+F8IAW+3ntodIDrfkGUdp1A=;
 b=KEAqLaGFQxvnneDFThteW0YJ0ylb15Jjw3eEQWi9trojfAatNgbm6FBfY0a/O3e0diPm
 KiSVyl6EyEQSDdNUwlCDNs3r40661kXj6bgkYqForRsx/F5WrXFsNHu9f4aAy3W9ouuf
 b5BRGZuUAwbexQyhr6Ir+OklBlng6WKAtTBEO5fod3KnRIuPY/GQr4TxQPpFIkyIvpXh
 vKKxGtFbfjyjJtQq7vipzqbLKhZd0sWRKLXYIOCP9rM2JS1x60VGkA9ITpxjm5SWbqRK
 Ap+b1XicMCPQOVXGaQRdg5MLKsXq10eyJBY6h1PK9xs4ilSn1PBVvZ5wQtIjP2vJtPKh xA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 36p66r8nda-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Feb 2021 08:32:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11J8Pk1S062140;
        Fri, 19 Feb 2021 08:32:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 36prhvcyt6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Feb 2021 08:32:26 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11J8WNvZ014607;
        Fri, 19 Feb 2021 08:32:23 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Feb 2021 00:32:22 -0800
Date:   Fri, 19 Feb 2021 11:32:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: joydev - prevent potential read overflow in ioctl
Message-ID: <20210219083215.GS2087@kadam>
References: <YCyzR8WvFRw4HWw6@mwanda>
 <YC8t2EHKRSF7DwmF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC8t2EHKRSF7DwmF@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190065
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9899 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102190065
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 18, 2021 at 07:17:44PM -0800, Dmitry Torokhov wrote:
> Hi Dan,
> 
> On Wed, Feb 17, 2021 at 09:10:15AM +0300, Dan Carpenter wrote:
> > The problem here is that "len" might be less than "joydev->nabs" so the
> > loops which verfy abspam[i] and keypam[] might read beyond the buffer.
> > 
> > Fixes: 999b874f4aa3 ("Input: joydev - validate axis/button maps before clobbering current ones")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thank you for the patch.
> 
> > ---
> >  drivers/input/joydev.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> > index a2b5fbba2d3b..750f4513fe20 100644
> > --- a/drivers/input/joydev.c
> > +++ b/drivers/input/joydev.c
> > @@ -456,7 +456,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
> >  	if (IS_ERR(abspam))
> >  		return PTR_ERR(abspam);
> >  
> > -	for (i = 0; i < joydev->nabs; i++) {
> > +	for (i = 0; i < len && i < joydev->nabs; i++) {
> >  		if (abspam[i] > ABS_MAX) {
> >  			retval = -EINVAL;
> >  			goto out;
> > @@ -487,7 +487,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
> >  	if (IS_ERR(keypam))
> >  		return PTR_ERR(keypam);
> >  
> > -	for (i = 0; i < joydev->nkey; i++) {
> > +	for (i = 0; i < (len / 2) && i < joydev->nkey; i++) {
> 
> 
> I think we also need to make sure that len is even. Do you mind if I add
> the check at the top of the function to return -EINVAL if it is odd?

Yes.  You are right.

Btw, thank you for fixing my patches, but feel free to just ask me to
resend if that's easier for you.

regards,
dan carpenter

