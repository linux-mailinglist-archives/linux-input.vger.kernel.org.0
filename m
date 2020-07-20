Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3809D225E36
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 14:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgGTMNQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 08:13:16 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:53768 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgGTMNP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 08:13:15 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KC6NxC057775;
        Mon, 20 Jul 2020 12:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=0+ix7ZEm4VFAuwo6OlsOeoc/om4TtnCdHwDbQ5/UpYY=;
 b=XJlNiMDM/cpQljikRcQE0OX4lCB2ryAb5aSUcb70TjOXv4g1LQkX6X2FjTSGUsfjtT62
 DGG7SQvmjzRhdHIV5UT5OtdzreW7vsCogJA2v16KYwAFzRxh0lCpKF3hct8t4ndoIdOt
 4o0LE0LMkFrygh7pO/6kBl+xbuFPQMA+wnAOGmpPFQw8CRrADU8ItZdFcFc0JrZjzuqc
 laHkJF9cMrfp4kguC2LxN+K/hoi5WMERGt8pVIY89Owv3BXaUfTV4XQa3zVd501Al6y+
 lwt9F3d9BAvoQ+6yqQ2NuMP4Zl7UbI7NRnUGeuU3NWl0WfTCOtcmsGzdGQplCKPxB/bv gg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 32brgr6hpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 12:13:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KC8AOE032829;
        Mon, 20 Jul 2020 12:13:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 32d9wb3jw5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jul 2020 12:13:06 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06KCD4JR009291;
        Mon, 20 Jul 2020 12:13:05 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 20 Jul 2020 12:13:04 +0000
Date:   Mon, 20 Jul 2020 15:12:57 +0300
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
Message-ID: <20200720121257.GJ2571@kadam>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720115400.GI2549@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=983 mlxscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=992
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200084
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The problem is there is another bug on the lines before...

drivers/hid/usbhid/hiddev.c
   475          default:
   476                  if (cmd != HIDIOCGUSAGE &&
   477                      cmd != HIDIOCGUSAGES &&
   478                      uref->report_type == HID_REPORT_TYPE_INPUT)
   479                          goto inval;
   480  
   481                  if (uref->report_id == HID_REPORT_ID_UNKNOWN) {
   482                          field = hiddev_lookup_usage(hid, uref);

This code is obviously buggy because syzkaller triggers an Oops and it's
pretty complicated to review (meaning that you have to jump around to a
lot of different places instead of just reading it from top to bottom
as static analysis would).

The user controlls "uref->report_id".  If hiddev_lookup_usage() finds
something we know that uref->usage_index is a valid offset into the
field->usage[] array but it might be too large for the field->value[]
array.

   483                          if (field == NULL)
   484                                  goto inval;
   485                  } else {
   486                          rinfo.report_type = uref->report_type;
   487                          rinfo.report_id = uref->report_id;
   488                          if ((report = hiddev_lookup_report(hid, &rinfo)) == NULL)
   489                                  goto inval;
   490  
   491                          if (uref->field_index >= report->maxfield)
   492                                  goto inval;
   493                          uref->field_index = array_index_nospec(uref->field_index,
   494                                                                 report->maxfield);
   495  
   496                          field = report->field[uref->field_index];
   497  
   498                          if (cmd == HIDIOCGCOLLECTIONINDEX) {
   499                                  if (uref->usage_index >= field->maxusage)
   500                                          goto inval;
   501                                  uref->usage_index =
   502                                          array_index_nospec(uref->usage_index,
   503                                                             field->maxusage);
   504                          } else if (uref->usage_index >= field->report_count)
   505                                  goto inval;
   506                  }
   507  
   508                  if (cmd == HIDIOCGUSAGES || cmd == HIDIOCSUSAGES) {
   509                          if (uref_multi->num_values > HID_MAX_MULTI_USAGES ||
   510                              uref->usage_index + uref_multi->num_values >
   511                              field->report_count)
   512                                  goto inval;
   513  
   514                          uref->usage_index =
   515                                  array_index_nospec(uref->usage_index,
   516                                                     field->report_count -
   517                                                     uref_multi->num_values);

We check that it is a valid offset into the ->value[] array for these
two ioctl cmds.

   518                  }
   519  
   520                  switch (cmd) {
   521                  case HIDIOCGUSAGE:
   522                          uref->value = field->value[uref->usage_index];
                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Not checked.

   523                          if (copy_to_user(user_arg, uref, sizeof(*uref)))
   524                                  goto fault;
   525                          goto goodreturn;
   526  
   527                  case HIDIOCSUSAGE:
   528                          field->value[uref->usage_index] = uref->value;
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This one you fixed.

   529                          goto goodreturn;
   530  
   531                  case HIDIOCGCOLLECTIONINDEX:
   532                          i = field->usage[uref->usage_index].collection_index;
   533                          kfree(uref_multi);
   534                          return i;
   535                  case HIDIOCGUSAGES:
   536                          for (i = 0; i < uref_multi->num_values; i++)
   537                                  uref_multi->values[i] =
   538                                      field->value[uref->usage_index + i];

fine.

   539                          if (copy_to_user(user_arg, uref_multi,
   540                                           sizeof(*uref_multi)))
   541                                  goto fault;
   542                          goto goodreturn;
   543                  case HIDIOCSUSAGES:
   544                          for (i = 0; i < uref_multi->num_values; i++)
   545                                  field->value[uref->usage_index + i] =

also fine.

   546                                      uref_multi->values[i];
   547                          goto goodreturn;
   548                  }
   549  
   550  goodreturn:
   551                  kfree(uref_multi);
   552                  return 0;
   553  fault:
   554                  kfree(uref_multi);
   555                  return -EFAULT;
   556  inval:
   557                  kfree(uref_multi);
   558                  return -EINVAL;
   559          }
   560  }

So another option would be to just add HIDIOCGUSAGE and HIDIOCSUSAGE to
the earlier check.  That risks breaking userspace.  Another option is to
just add a check like you did earlier to the HIDIOCGUSAGE case.
Probably just do option #2 and resend.

regards,
dan carpenter
