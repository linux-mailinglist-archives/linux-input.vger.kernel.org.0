Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D4322B1D4
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 16:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgGWOvi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jul 2020 10:51:38 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42206 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGWOvi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jul 2020 10:51:38 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06NEpOne183308;
        Thu, 23 Jul 2020 14:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UVrd0dvtpq4Ts0ES1WmJVk4CRHzFgNiih/Z08HeKfdc=;
 b=Ny+VE1/0UAr8PLABJpV7zTl/cnINTVy9DOxtSXKoFowavcD47xgA2M/Z7hraFY5ujCgR
 UZKI+TWGMBcl6eSm+cTM6EZNg+IEbaz90+tNvy8INq3TaVsUC/4bx+tVfVq0ppawe+Fz
 6rcojvz4Z34Tn+Au5sNnE4HdRVU5T5JF74H5y74p7n61P63ekBJ33GnHLXNbc+a6PSC/
 h/Q+/AdBPsULRCKgH6XetWoYp04hoQTwJ3LehFl8GhRpUiETZiJc9v7RPwvxy7M3c4LB
 D3HSrio1+XeR/HWnRFN1by39yTe+o2J82005h5IsGE2bWefgRk8eyvzoaksTl7YfwoGN 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 32bs1mstfx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 14:51:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06NEhB3h051179;
        Thu, 23 Jul 2020 14:51:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 32fb8gx3ex-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 23 Jul 2020 14:51:30 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06NEpSgX017197;
        Thu, 23 Jul 2020 14:51:29 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 23 Jul 2020 07:51:28 -0700
Date:   Thu, 23 Jul 2020 17:51:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
Message-ID: <20200723145121.GR2549@kadam>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720195209.4365-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720195209.4365-1-yepeilin.cs@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230111
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 20, 2020 at 03:52:09PM -0400, Peilin Ye wrote:
> `uref->usage_index` is not always being properly checked, causing
> hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.
> 
> Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>     - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
>       Dan Carpenter <dan.carpenter@oracle.com>)

Looks good to me.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

