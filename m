Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFF72B005F
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 08:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgKLHi1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 02:38:27 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:29776 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbgKLHi1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 02:38:27 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AC7bt51023845;
        Thu, 12 Nov 2020 02:38:26 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34nsc989cg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 02:38:26 -0500
Received: from SCSQMBX11.ad.analog.com (SCSQMBX11.ad.analog.com [10.77.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0AC7cO5i018443
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 12 Nov 2020 02:38:25 -0500
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 23:38:23 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 23:38:23 -0800
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0AC7cLL4024474;
        Thu, 12 Nov 2020 02:38:21 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 0/5] Input: adp5589: cleanup and use device-managed functions
Date:   Thu, 12 Nov 2020 09:43:03 +0200
Message-ID: <20201112074308.71351-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_02:2020-11-10,2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=858 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120045
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change-set does a cleanup of the driver to use device-managed
functions. The error & exit paths are simplified, and some potential
leaks should be removed.

Changelog v1 -> v2:
* https://lore.kernel.org/linux-input/20201111084833.40995-1-alexandru.ardelean@analog.com/T/#t
* dropped patch: 'Input: adp5589: use a single variable for error in probe'
* for patch 'Input: adp5589: use devm_add_action_or_reset() for register clear'
  moved devm_add_action_or_reset() right after switch statement;
  using 'error' variable to check for error condition

Alexandru Ardelean (5):
  Input: adp5589: use devm_kzalloc() to allocate the kpad object
  Input: adp5589: use device-managed function in adp5589_keypad_add()
  Input: adp5589: remove setup/teardown hooks for gpios
  Input: adp5589: use devm_gpiochip_add_data() for gpios
  Input: adp5589: use devm_add_action_or_reset() for register clear

 drivers/input/keyboard/adp5589-keys.c | 120 ++++++--------------------
 include/linux/input/adp5589.h         |   7 --
 2 files changed, 27 insertions(+), 100 deletions(-)

-- 
2.17.1

