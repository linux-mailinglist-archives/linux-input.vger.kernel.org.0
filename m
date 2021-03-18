Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422BA340397
	for <lists+linux-input@lfdr.de>; Thu, 18 Mar 2021 11:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhCRKlC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Mar 2021 06:41:02 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:58246 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhCRKk3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Mar 2021 06:40:29 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IAdu87009745;
        Thu, 18 Mar 2021 10:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5DVcOLn5lqUIUNBk81HwZFo0fAPKVnwY1uVgfBgHmQ8=;
 b=MSDgV/SPl0Z6fR171t4/W7O7e12ht6BR+5xa+1zr5y8ViJqNCaLqYHNiGpTTs5vKVbPL
 8KyzID6eT8bthvqr4mDksrLBRmQMPKVzhfGbsuA/ilW1OL8dXco+O7KsoFc9N3mCi8CH
 28KtDqeWvuKUWae/JfXVjNhgvPVpwL/l1MNXQiNO/T4QljJizjwAwhL/HDyggz4nsH5C
 teGO7j09neho3i5UHcmsB/oVrbGbyEFsEGVSl5z5396K6iYOOUWOSJSRv8anZ5qiI3uk
 0shh1YJbf9HpBt9drpD0WJBQLzQIGykF4wQOjuvzOUiNUjDGWxHBMh3oDNZWuE5qwf/w sw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 378jwbq45v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 10:40:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IAdwm8176363;
        Thu, 18 Mar 2021 10:40:00 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 3797a3supy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 10:40:00 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12IAdxwX029373;
        Thu, 18 Mar 2021 10:39:59 GMT
Received: from mwanda (/10.175.214.245)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Mar 2021 03:39:59 -0700
Date:   Thu, 18 Mar 2021 13:39:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     michael.zaidman@gmail.com
Cc:     linux-input@vger.kernel.org
Subject: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <YFMt+VFuiZlCVFyP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180079
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180079
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Michael Zaidman,

The patch 6a82582d9fa4: "HID: ft260: add usb hid to i2c host bridge
driver" from Feb 19, 2021, leads to the following static checker
warning:

	drivers/hid/hid-ft260.c:1028 ft260_raw_event()
	error: 'xfer->length' from user is not capped properly

drivers/hid/hid-ft260.c
  1017  static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
  1018                             u8 *data, int size)
  1019  {
  1020          struct ft260_device *dev = hid_get_drvdata(hdev);
  1021          struct ft260_i2c_input_report *xfer = (void *)data;
  1022  
  1023          if (xfer->report >= FT260_I2C_REPORT_MIN &&
  1024              xfer->report <= FT260_I2C_REPORT_MAX) {
  1025                  ft260_dbg("i2c resp: rep %#02x len %d\n", xfer->report,
  1026                            xfer->length);
  1027  
  1028                  memcpy(&dev->read_buf[dev->read_idx], &xfer->data,
  1029                         xfer->length);

Do we need to check if "xfer->len <= dev->read_len"?

  1030                  dev->read_idx += xfer->length;
  1031  
  1032                  if (dev->read_idx == dev->read_len)
  1033                          complete(&dev->wait);
  1034  
  1035          } else {
  1036                  hid_err(hdev, "unknown report: %#02x\n", xfer->report);
  1037                  return 0;
  1038          }
  1039          return 1;
  1040  }

regards,
dan carpenter
