Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED29614A6F8
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 16:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgA0PMm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 10:12:42 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47210 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbgA0PMm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 10:12:42 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RF9eHL000915;
        Mon, 27 Jan 2020 15:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=fHfyRYxqrv2GKnEybOSy0pNXaorqVF+m3LA7NpU4Y+A=;
 b=TxBbi15sPi/V6nRfn13IAtcIKgCb0WeWBlfmPsoGYlIHQ4pw6eVE7EJsopSxiO4H8WjH
 tX1XpwmJgGqmH+88IZ/Amkc4UTW3e2HEFN3HtsBjJBrwvJfnCHkH1TTCyatnMspBQRn2
 SHrufJwDShOtNuC3ARyrhNftW7TudNhQbre0gkCZyC+5TV7LtdaSi69UuKvcmWYHeflP
 rpJJKoQV0TiVJdIhjDRLmxeacksq+pC4HDtqIixtNcXYM0EZevENMX+2mCai65OFz0k8
 hvkUbdfYvYRIJgnB/pQhKX1kxHPiyWajR/5TfV+DXBmIZGZVcHSuHAdNjo2GDHgcDKR1 TA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xrd3tyxqr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jan 2020 15:12:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RFBfPG131063;
        Mon, 27 Jan 2020 15:12:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2xrytq7aym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jan 2020 15:12:03 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00RFBi2v003902;
        Mon, 27 Jan 2020 15:11:44 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jan 2020 07:11:43 -0800
Date:   Mon, 27 Jan 2020 18:11:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     syzkaller <syzkaller@googlegroups.com>,
        Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+106b378813251e52fc5e@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in hiddev_disconnect
Message-ID: <20200127151135.GM1870@kadam>
References: <0000000000004dbaf2059c193a36@google.com>
 <20200126024957.11392-1-hdanton@sina.com>
 <20200127092850.GX1847@kadam>
 <CACT4Y+ag59G4p=DO3Dg7jnFt3wQb=dtjzBujADtGHKn-97O8_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ag59G4p=DO3Dg7jnFt3wQb=dtjzBujADtGHKn-97O8_g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=612
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=675 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270127
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

One possible option would be to list the similar bugs at the start of
the bug report.

See also:

	KASAN: use-after-free Write in hiddev_disconnect
	https://syzkaller.appspot.com/bug?extid=784ccb935f9900cc7c9e

Then we could just copy and paste to the "#syz dup:" command.  The
bitmap_port_list() stuff was reported something like 15 times so it was
really complicated to track.  Hopefully if it were easier to mark things
as duplicate that would help.

regards,
dan carpenter


