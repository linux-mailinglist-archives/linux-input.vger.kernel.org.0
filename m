Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85CCB17A65F
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 14:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgCEN3u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 08:29:50 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:38450 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgCEN3u (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 08:29:50 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 025DTZJU142167;
        Thu, 5 Mar 2020 13:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=kQZF8mt3je26TVHWHBg0ACWv3oE6PtGwqyzyfEjsppM=;
 b=Vpb8WWf7rsVvSubbRu9kq1q5foSqt3ZwDrFmx+RrZiDTDpWPQG44C9bo4JtSbh55oail
 DpLy6IBvkHsWOVkbp4FpPLVYbL8rnw9D1vXqsUYC6m6jUxDTOuv67DMu0QQvwEZdjDVY
 CAUGOz3usCY3gHNvNrFA4bPXegm1xoGRQ9MnAJ1EG6AOQ09R9MU0Ep++kMaBzrfdcAfr
 D1A0oZZ1gzQ6rIe2+u6TGpBvrVpWmQFFiQSLhxUUn0RK+ACaJ5gRV51+9LDHtRFuuk/v
 UAHsO4yah4TygUrm49yl5VMMbprWVaOZCIOeY6gq4Tih9IdkfWgpxE/pX10DtepYRXWi 5Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2yghn3gw46-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Mar 2020 13:29:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 025DR8w7150179;
        Thu, 5 Mar 2020 13:29:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2yg1pakebx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Mar 2020 13:29:19 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 025DTH86012877;
        Thu, 5 Mar 2020 13:29:18 GMT
Received: from kadam (/41.210.146.162)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Mar 2020 05:29:16 -0800
Date:   Thu, 5 Mar 2020 16:29:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.torokhov@gmail.com, lars@metafoo.de
Subject: Re: [PATCH v4 3/4] Input: adp5589: unify ret & error variables
Message-ID: <20200305132908.GI4118@kadam>
References: <20200305131405.6598-1-alexandru.ardelean@analog.com>
 <20200305131405.6598-3-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305131405.6598-3-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9550 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9550 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003050086
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 05, 2020 at 03:14:04PM +0200, Alexandru Ardelean wrote:
> Both variables are used mostly in the same way in the probe function.
> Having both means that we need to copy 'ret' to 'error' before exiting, so
> just use 'ret' everywhere.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---

Looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

