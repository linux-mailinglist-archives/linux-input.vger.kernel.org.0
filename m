Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C143A14A0C4
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 10:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbgA0J3n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 04:29:43 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34940 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgA0J3n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 04:29:43 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00R9DDEP054968;
        Mon, 27 Jan 2020 09:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=dqtak0Ip1v1fu40eyS07aEJt+TSWkVxnjJJIK8PU5JU=;
 b=FehyzrEO2zhzN5U4IqRc/54MG6VUkpCZQxx5DJKM2lyXsufyEqZHzUOS7Q7JH7IcXeZp
 hP5NIOXHbi9UoNufThTJ5/vt3vRAd5OlBpFe3/86+dv0y4Y64hOCBZyGdPRfTRBfRuut
 Ds7nY0xZFvYbA13ZT5rBbuANyxTZFKyNhJIwLtw4Db+zYF0IvQTmyT09C27V/eOSG6Ke
 3YjWgfxu4NRmImfF5D4UptRorAZO0dDaqOvqi9knfYpaZO5MfUDFCHb6cRKjm1r4Zgey
 uUeJ9PSAFRQTNHz972N8q2UNshZ8jzvdB9BzpPcleSuOuzaNrFINkaDWYzHNMJBPk2Jf 5Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2xrdmq61kc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jan 2020 09:29:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00R9Dev7147737;
        Mon, 27 Jan 2020 09:29:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xry6rrt2a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jan 2020 09:29:05 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00R9T3fq014947;
        Mon, 27 Jan 2020 09:29:03 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jan 2020 01:29:02 -0800
Date:   Mon, 27 Jan 2020 12:28:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+106b378813251e52fc5e@syzkaller.appspotmail.com>,
        andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in hiddev_disconnect
Message-ID: <20200127092850.GX1847@kadam>
References: <0000000000004dbaf2059c193a36@google.com>
 <20200126024957.11392-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200126024957.11392-1-hdanton@sina.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9512 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=309
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9512 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=388 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270081
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I already fixed this bug in an earlier thread.

Syzbot always reports a use after free as two separate bugs, a read
after free and a write after free.  It's too much hassle to mark all
the duplicates.

regards,
dan carpenter


