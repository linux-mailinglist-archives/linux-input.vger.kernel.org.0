Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BF81ED501
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 19:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgFCRbg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 13:31:36 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42194 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgFCRbf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 13:31:35 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053HQTYh137126;
        Wed, 3 Jun 2020 17:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=cKww5NHtHr8O110UaceecEv8mEyi1P/1b4jOpriRUjE=;
 b=q8M7JXqFPoaXUUz9NirHXeQ9git6VbNCS4uELEwFpAzVG+Hc4CMiLg1LQ18zobgrWpbh
 XLG/4yNEG54+NuquElAM/BGwBGkjnX5dY/spCbbENzFPsnIIrfHnK317OjVx5c6C/pVj
 awMEwS1COS75IxLKUOmQOKGQ9OKM/q4FDOvvjSMzASa34soOkfYuFP6c2mSso6IUnKxx
 8bU6V8faBoTjnfCn4zjeEPLvgtEuZCv4YPruYfrQjSN9Wz734UJKCH/XuKeoqrA0hCU5
 gO8Uyoq1D4KR9m/LeHeiserkA2lxklWjULYZ2/42PE/KB3MZnVT/HhEx7Wcw4/IVQjf2 GQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 31bfemagnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 03 Jun 2020 17:31:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053HRTS4077935;
        Wed, 3 Jun 2020 17:31:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 31c12r722g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Jun 2020 17:31:33 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 053HVWFL010730;
        Wed, 3 Jun 2020 17:31:32 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 03 Jun 2020 10:31:32 -0700
Date:   Wed, 3 Jun 2020 20:31:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] input: ims-pcu: return error code rather than -ENOMEM
Message-ID: <20200603173125.GN30374@kadam>
References: <20200603152151.139337-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603152151.139337-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030135
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 03, 2020 at 04:21:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the assignment of -ENOMEM to error is redudant because error
> is not being read and -ENOMEM is being hard coded as an error return.
> Fix this by returning the error code in variable 'error'; this also
> allows the error code from a failed call to input_register_device to
> be preserved and returned to the caller rather than just returning
> a possibly inappropriate -ENOMEM.
> 
> Kudos to Dan Carpenter for the suggestion of an improved fix.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

