Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2FD413AD8C
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 16:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgANPYe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 10:24:34 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:48794 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgANPYe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 10:24:34 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00EFI8i2021302;
        Tue, 14 Jan 2020 15:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=RvfBr+qkTO6i+FWGePDqotfMAgPzZt3oVbFipG709cg=;
 b=M9vmOQbCfgyh9QkHt/OnD//WJxFj6hT9WNauKWuBYfGBLqvW8QK0PeIFm/UCpl1muIeT
 0bR3NwCUZsluwsmNY4YZpzS9G/+w+6mluYLKUCYQMbSpJX96HHrmQCFDfcF3Q4x+Ep2S
 EUoY+YVJMmSnz5zhyaQshC2ieW+DC55q0qekKQDkhWtOEYDpIFCJfY4huo3qK/fw0c1H
 NtMhL4B41ljf6YrMYwZ+vw0mazxnLeURiyMwyIHgZOB+NQb1EcCUj9DlXS7ZBtVM7snF
 3V1G+Pr5T1QOqrYzA8q3C/MKhk9R5wW4GVVK5JnsqKTpKn1SzkrQ2f+XfGg0gI7s9P7z dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xf74s6mp8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 15:24:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00EFJI6C017581;
        Tue, 14 Jan 2020 15:24:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2xh8es8fgq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 15:24:25 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00EFOOkl003786;
        Tue, 14 Jan 2020 15:24:24 GMT
Received: from kadam (/10.175.194.72)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Jan 2020 07:24:23 -0800
Date:   Tue, 14 Jan 2020 18:24:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     syzbot <syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Write in hiddev_disconnect
Message-ID: <20200114152414.GC3719@kadam>
References: <0000000000004a11c1059c193a54@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000004a11c1059c193a54@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=824
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=888 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001140132
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I'm trying to take a stab at diagnosing these bugs.  (But I'm seldom
smart enough to actually fix anything).  These hiddev_disconnect() bugs
are a race condition:

devel/drivers/hid/usbhid/hiddev.c
   924  void hiddev_disconnect(struct hid_device *hid)
   925  {
   926          struct hiddev *hiddev = hid->hiddev;
   927          struct usbhid_device *usbhid = hid->driver_data;
   928  
   929          usb_deregister_dev(usbhid->intf, &hiddev_class);
   930  
   931          mutex_lock(&hiddev->existancelock);
   932          hiddev->exist = 0;
                ^^^^^^^^^^^^^^^^^^
We set "exist = 0;"

   933  
   934          if (hiddev->open) {
   935                  mutex_unlock(&hiddev->existancelock);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Then we drop the lock.

   936                  hid_hw_close(hiddev->hid);
   937                  wake_up_interruptible(&hiddev->wait);
                                               ^^^^^^
The other thread frees hiddev and it crashes here.

   938          } else {
   939                  mutex_unlock(&hiddev->existancelock);
   940                  kfree(hiddev);
   941          }
   942  }

The other thread is doing:

drivers/hid/usbhid/hiddev.c
   216  static int hiddev_release(struct inode * inode, struct file * file)
   217  {
   218          struct hiddev_list *list = file->private_data;
   219          unsigned long flags;
   220  
   221          spin_lock_irqsave(&list->hiddev->list_lock, flags);
   222          list_del(&list->node);
   223          spin_unlock_irqrestore(&list->hiddev->list_lock, flags);
   224  
   225          mutex_lock(&list->hiddev->existancelock);
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
Takes the lock.

   226          if (!--list->hiddev->open) {
                     ^^^^^^^^^^^^^^^^^^^^
Decrements open.

   227                  if (list->hiddev->exist) {
                            ^^^^^^^^^^^^^^^^^^^
This is false.

   228                          hid_hw_close(list->hiddev->hid);
   229                          hid_hw_power(list->hiddev->hid, PM_HINT_NORMAL);
   230                  } else {
   231                          mutex_unlock(&list->hiddev->existancelock);
   232                          kfree(list->hiddev);
                                      ^^^^^^^^^^^^
Freed here.

   233                          vfree(list);
   234                          return 0;
   235                  }
   236          }
   237  
   238          mutex_unlock(&list->hiddev->existancelock);
   239          vfree(list);
   240  
   241          return 0;
   242  }

I'm not sure what the fix should be though.

regards,
dan carpenter

