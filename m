Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD1B227ADC
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 10:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgGUIjV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 04:39:21 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:51414 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbgGUIjV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 04:39:21 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L8YARF007293;
        Tue, 21 Jul 2020 08:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Mg9akq6EhlyLTWmbXWdukQXdXEJznAdIyvm0U7dWuLI=;
 b=n/Iv8WWwQTkj/i44UCE5quTksKTcR08ovDuFCn8PYlz+e2RrTOsQYbDAwAMkjpw/gGfl
 yuH7/gw7Eib2VPcVfF+MOZkIVqXsd+1sIWRDC9g4IDANZ7qixQ9Uulf/eyA+f3XVHvI9
 HtODD4aA9TNsOvnNu5IGsk1ppq58GN0LdmzBMUjeSZ0b/sztBcGivYIiaSwo6MNTAg+L
 QQ5Wk11bTi6eEUnn3APIWmjdWInP9fFc8afyacqirJ2gsiQtEDCCeTrb+ZtZV9embv5m
 wkfETI1yhFKf4YaMEZ8/evFwIeFEZ3UzWyfrwK6ozjRgmzU3zSRP3f7ZCJjGb1iSEcxG 9g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 32d6ksg27w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 08:39:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L8ZRfI099360;
        Tue, 21 Jul 2020 08:39:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 32dw02g4tv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jul 2020 08:39:12 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06L8dBKm010525;
        Tue, 21 Jul 2020 08:39:12 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 21 Jul 2020 08:39:11 +0000
Date:   Tue, 21 Jul 2020 11:39:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
Message-ID: <20200721083903.GM2571@kadam>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam>
 <20200720121257.GJ2571@kadam>
 <20200720191656.GA3366@PWN>
 <20200721071637.GK2571@kadam>
 <20200721082749.GB1659990@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721082749.GB1659990@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210059
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 21, 2020 at 10:27:49AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 21, 2020 at 10:16:37AM +0300, Dan Carpenter wrote:
> > For some reason the reply-to header on your email is bogus:
> > 
> > Reply-To: 20200720121257.GJ2571@kadam
> > 
> > "kadam" is a system on my home network.
> 
> That's your message-id :)

Ah...  It's a typo.  Peilin meant "In-Reply-to" but some how set both
the In-Reply-to and the Reply-to headers to the same thing.

regards,
dan carpenter
