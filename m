Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BF5225DDE
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 13:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgGTLyR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 07:54:17 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:59368 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728449AbgGTLyR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 07:54:17 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KBgE1W113693;
        Mon, 20 Jul 2020 11:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/YXYJgmTLLawI09r+e1//mSAR/9LYPumoks746wreuI=;
 b=EGDNMaDLd+galPObfcvba4RicKEZv8G9eN7N1NBumwkfvVN7uJ+yRjA0Fh8l7szyr6Do
 Azhg98EboiE3x6X3KmL25ZCG78NC0WfHCZKRLJc9/pyKR+jop8Fig/j0khw+2N0lrfBS
 iCkzwtqW+dC8tnhKBfJ9P4Dk7eNFchp0MoguJUW2+uDukzx3zRMol3xxbi4M6BB5Z9sh
 xOfdEoaQ52l2AgL1H2n03CQuiGUpZ4HhssbEZiZQVZlKMkCdZSGBCN85u4v5Cbz4H6HP
 /Tg3RVc5VIoO55h706SXCeq+BWhjf/olPX6HAPKWBBLfbWil+gJ0ouSZAY542GUdSPe1 uA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 32bpkaxnh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 11:54:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KBi7Gm143755;
        Mon, 20 Jul 2020 11:54:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 32d9wb2np4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jul 2020 11:54:09 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06KBs8fI012686;
        Mon, 20 Jul 2020 11:54:08 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 20 Jul 2020 04:54:08 -0700
Date:   Mon, 20 Jul 2020 14:54:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
Message-ID: <20200720115400.GI2549@kadam>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718231218.170730-1-yepeilin.cs@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200082
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 18, 2020 at 07:12:18PM -0400, Peilin Ye wrote:
> `uref->usage_index` is not always being properly checked, causing
> hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.
> 

Yeah.  This code is not obvious.  It doesn't come from the user directly
so we don't have to worry about nospec.  It comes from hiddev_lookup_usage()
where we set:

	uref->usage_index = j;

We know that j is less than field->maxusage but we do need to check
against field->report_count like your patch does...  The two arrays
are allocated in hid_register_field().

I don't know the code well enough to say how these arrays are used or
why the one is larger than the other so I can't give a proper
reviewed-by.  But the patch looks reasonable and doesn't introduce any
bugs which weren't there in the original code.

regards,
dan carpenter

