Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7B8251336
	for <lists+linux-input@lfdr.de>; Tue, 25 Aug 2020 09:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgHYHbt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Aug 2020 03:31:49 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47530 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729194AbgHYHbt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Aug 2020 03:31:49 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07P7U0dS011173;
        Tue, 25 Aug 2020 07:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=PvR618y3occtMaXXpEZj9xY/6rI5rWksmpkzYbPEAEA=;
 b=uExF6f5h2WYO9UTcuF07I5vPP2YUprSKE87WzWl38QJ9qBBILqjzRgQCOu4vY+030tcQ
 f6l6I4KTBSVHVl53SwCoVSCU7bdRB8MD05Dw+L2+57orqkKmzkaC2V4r/QRqHhX8v1E3
 x9KeKsHIw9MjXD2AMaQzAMS/6yZBiXkzjaSJLPOqertrjKIOpTc29uvrf63jlLNP4QjR
 76vTg7yBCHoQ5E3ZoKYy1SNkvibBcOG/2prxYCn4a6JUY0NugAlHdGZHWTCcaJbopfLu
 aUmrR80J+/h/JJqciYFGUuQ2D6AgsAOiOHGyFwsFDwj3RKq8mLALYsjCsZX9PzqECOUe aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 333dbrrr4h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 07:31:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07P7QArF030239;
        Tue, 25 Aug 2020 07:29:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 333ru6u2mg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 07:29:14 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07P7TASV013136;
        Tue, 25 Aug 2020 07:29:11 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 Aug 2020 00:29:10 -0700
Date:   Tue, 25 Aug 2020 10:29:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Walter Harms <wharms@bfs.de>
Cc:     Stefan Achatz <erazor_de@users.sourceforge.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
Message-ID: <20200825072903.GQ1793@kadam>
References: <1597819984.4101.16.camel@web.de>
 <20200824085735.GA208317@mwanda>
 <ab4625b2b2ea41dd83ff9e192a027f41@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab4625b2b2ea41dd83ff9e192a027f41@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250056
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 24, 2020 at 03:35:16PM +0000, Walter Harms wrote:
> hello Dan, 
> 
> i notice that you can shorten the line to:
> (line above checks for count==sizeof(struct kone_settings))
> 
> difference = memcmp(settings, &kone->settings, count);
> 
> nothing special just to shorten the line and make use of count.
> 
> and just to save one indent level and because its  readabel nicely:
>     if ( ! difference ) 
>           goto unlock;
> 
> hope that helps

Yeah.  I wrote that version and I wanted to send it, but then I decided
not to change the style too much.  I definitely agree with you, but I
figured I would keep the patch less intrusive.

regards,
dan carpenter

