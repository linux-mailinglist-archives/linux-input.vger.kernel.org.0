Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667B5307342
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 10:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhA1J6M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 04:58:12 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:57510 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbhA1J6I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 04:58:08 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9dFHg155756;
        Thu, 28 Jan 2021 09:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=y+ME6/3Vzy7kZAt04NfDBCEqHcLX2EPK0dEtFEr/H6s=;
 b=nf9WeKNDYPcjD42et1YxgO+yNj5NJfBvRHMcSyPKZn6BDW0h9cHlSaEM4GiJcPWoHbQk
 iDh52zURkRsFmYDgOaq+o3q503ou4hn8j3R/NqCC4m0Aa4wbTLEExg+mGh0GvNjScK9T
 mAFm6E/avpdo9gVGW9MYUiikx2QvAtKeA1Fxb2+lR2Ui0P5jwqXhIUbawmqgON0YzynR
 4s7e5aImkjyVdiKy55jlfvMbUj9G5rI8wv2v0cpC0OFLgqU8cz85RRa3JGjZUzMLxQSb
 1v2E6jpIUgignWSMY/Z0h3igf193LzAK4lejKPBUVUCsT4rIzaHmmrI4bl65X4C4z3Jh fQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 3689aaugpw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:57:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9eEHI038689;
        Thu, 28 Jan 2021 09:57:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 368wr03qur-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:57:19 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10S9vI5k021924;
        Thu, 28 Jan 2021 09:57:18 GMT
Received: from mwanda (/10.175.203.176)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 28 Jan 2021 01:57:17 -0800
Date:   Thu, 28 Jan 2021 12:57:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mirq-linux@rere.qmqm.pl
Cc:     linux-input@vger.kernel.org
Subject: [bug report] Input: elants_i2c - add support for eKTF3624
Message-ID: <YBKKePZ1VyZIbBCo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280049
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280049
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Michał Mirosław,

The patch 9517b95bdc46: "Input: elants_i2c - add support for
eKTF3624" from Jan 24, 2021, leads to the following static checker
warning:

	drivers/input/touchscreen/elants_i2c.c:966 elants_i2c_mt_event()
	warn: should this be a bitwise negate mask?

drivers/input/touchscreen/elants_i2c.c
   942          /* Note: all fingers have the same tool type */
   943          tool_type = buf[FW_POS_TOOL_TYPE] & BIT(0) ?
   944                          MT_TOOL_FINGER : MT_TOOL_PALM;
   945  
   946          for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
   947                  if (finger_state & 1) {
   948                          unsigned int x, y, p, w;
   949                          u8 *pos;
   950  
   951                          pos = &buf[FW_POS_XY + i * 3];
   952                          x = (((u16)pos[0] & 0xf0) << 4) | pos[1];
   953                          y = (((u16)pos[0] & 0x0f) << 8) | pos[2];
   954  
   955                          /*
   956                           * eKTF3624 may have use "old" touch-report format,
   957                           * depending on a device and TS firmware version.
   958                           * For example, ASUS Transformer devices use the "old"
   959                           * format, while ASUS Nexus 7 uses the "new" formant.
   960                           */
   961                          if (packet_size == PACKET_SIZE_OLD &&
   962                              ts->chip_id == EKTF3624) {
   963                                  w = buf[FW_POS_WIDTH + i / 2];
   964                                  w >>= 4 * (~i & 1);
   965                                  w |= w << 4;
   966                                  w |= !w;
                                        ^^^^^^^^

This code is just very puzzling.  I think it may actually be correct?
The boring and conventional way to write this would be to do it like so:

	if (!w)
		w = 1;

   967                                  p = w;
   968                          } else {
   969                                  p = buf[FW_POS_PRESSURE + i];
   970                                  w = buf[FW_POS_WIDTH + i];
   971                          }
   972  
   973                          dev_dbg(&ts->client->dev, "i=%d x=%d y=%d p=%d w=%d\n",
   974                                  i, x, y, p, w);
   975  
   976                          input_mt_slot(input, i);
   977                          input_mt_report_slot_state(input, tool_type, true);
   978                          touchscreen_report_pos(input, &ts->prop, x, y, true);

regards,
dan carpenter
