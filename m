Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C98227961
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 09:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgGUHQz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 03:16:55 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:54228 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUHQy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 03:16:54 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L7CQZv153369;
        Tue, 21 Jul 2020 07:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=AT8MPX1I7JDGF5HyAbGwZsBOaJxJlWlbPtr2s+bQvXI=;
 b=j3+hqm0Hct2HUZjcrInvEK3Go5+dEl952yCfPrFY+14OMhtvvyYJps9H5hRVfvWdr6RM
 95mhMIC8q3WO3a6vyw76+NLfDBvRbr/npenLimFLByMOTtd7AZzf3rYpMMSLtzBPe1Ec
 VAdnuXc0SuGoi5JFdcDZnfmGNGulxLNyYi+Fl2/pJMloycxyEEHDkHIGhlSWZ22E9taL
 nlxtocn7MJLe62gjw+Fp3mEPRXgVVaHR87aIADY/ykGH4dWqxxx9dIIefCeGOvlbTFJD
 kg6ggW2RbcsFVCTGUbTYuUrt384dtlE2ZgYCwnjzxCJUHxMGstyBGHVEV7yYwJw5Zs9d iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 32brgrb85p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 07:16:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L7D09F152262;
        Tue, 21 Jul 2020 07:16:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 32dufdh135-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jul 2020 07:16:46 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06L7Gijb015107;
        Tue, 21 Jul 2020 07:16:45 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 21 Jul 2020 07:16:44 +0000
Date:   Tue, 21 Jul 2020 10:16:37 +0300
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
Message-ID: <20200721071637.GK2571@kadam>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam>
 <20200720121257.GJ2571@kadam>
 <20200720191656.GA3366@PWN>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720191656.GA3366@PWN>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210049
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210049
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For some reason the reply-to header on your email is bogus:

Reply-To: 20200720121257.GJ2571@kadam

"kadam" is a system on my home network.

On Mon, Jul 20, 2020 at 03:16:56PM -0400, Peilin Ye wrote:
> I made some mistakes in the previous e-mail. Please ignore that. There
> are a lot of things going on...Sorry for that.
> 
> On Mon, Jul 20, 2020 at 03:12:57PM +0300, Dan Carpenter wrote:
> > So another option would be to just add HIDIOCGUSAGE and HIDIOCSUSAGE to
> > the earlier check.  That risks breaking userspace.  Another option is to
> > just add a check like you did earlier to the HIDIOCGUSAGE case.
> > Probably just do option #2 and resend.
> 
> Sure, I will just add the same check to the HIDIOCGUSAGE case for the
> time being. Thank you for the detailed explanation.
> 
> Here's what I found after digging a bit further though:
> 
> hid_open_report() calls different functions in order to process
> different type of items:
> 
> drivers/hid/hid-core.c:1193:
> 
>         static int (*dispatch_type[])(struct hid_parser *parser,
>                                       struct hid_item *item) = {
>                 hid_parser_main,
>                 hid_parser_global,
>                 hid_parser_local,
>                 hid_parser_reserved
>         };
> 
> In this case, hid_parser_main() calls hid_add_field(), which in turn
> calls hid_register_field(), which allocates the `field` object as you
> mentioned:
> 
> drivers/hid/hid-core.c:102:
> 
>         field = kzalloc((sizeof(struct hid_field) +
>                          usages * sizeof(struct hid_usage) +
>                          values * sizeof(unsigned)), GFP_KERNEL);

Yeah.  And in the caller it does:

drivers/hid/hid-core.c
   297          if (!parser->local.usage_index) /* Ignore padding fields */
   298                  return 0;
   299  
   300          usages = max_t(unsigned, parser->local.usage_index,
                ^^^^^^^^^^^^^^
   301                                   parser->global.report_count);
   302  
   303          field = hid_register_field(report, usages, parser->global.report_count);
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
So ->usages is always greater or equal to ->global.report_count.

   304          if (!field)
   305                  return 0;
   306  
   307          field->physical = hid_lookup_collection(parser, HID_COLLECTION_PHYSICAL);

> 
> Here, `values` equals to `global.report_count`. See how it is being
> called:
> 
> drivers/hid/hid-core.c:303:
> 
>         field = hid_register_field(report, usages, parser->global.report_count);
> 
> In hid_open_report(), `global.report_count` can be set by calling
> hid_parser_global().
> 
> However, the syzkaller reproducer made hid_open_report() to call
> hid_parser_main() __before__ `global.report_count` is properly set. It's
> zero. So hid_register_field() allocated `field` with `values` equals to
> zero - No room for value[] at all. I believe this caused the bug.

I don't know if zero is valid or not.  I suspect it is valid.  We have
no reason to think that it's invalid.

regards,
dan carpenter

