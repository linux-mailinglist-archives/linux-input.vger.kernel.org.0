Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7787D2C63B6
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 12:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgK0LOw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 06:14:52 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:60256 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729397AbgK0LOw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 06:14:52 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0ARB9Ebi001531;
        Fri, 27 Nov 2020 06:14:40 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 34y08vay1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Nov 2020 06:14:39 -0500
Received: from SCSQMBX11.ad.analog.com (SCSQMBX11.ad.analog.com [10.77.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 0ARBEc0g053818
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Fri, 27 Nov 2020 06:14:38 -0500
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 27 Nov
 2020 03:14:36 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Fri, 27 Nov 2020 03:14:36 -0800
Received: from saturn.ad.analog.com ([10.48.65.109])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0ARBETQO023930;
        Fri, 27 Nov 2020 06:14:34 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <lars@metafoo.de>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 4/4] dt-bindings: add ADP5585/ADP5589 entries to trivial-devices
Date:   Fri, 27 Nov 2020 13:14:20 +0200
Message-ID: <20201127111420.96500-4-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127111420.96500-1-alexandru.ardelean@analog.com>
References: <20201127111420.96500-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-27_05:2020-11-26,2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=918
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270069
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change adds the device-tree entries for the Analog Devices ADP5585 and
ADP5589 devices to the trivial devices list.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4ace8039840a..2ea43f8e6d59 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -30,6 +30,12 @@ properties:
           - ad,ad7414
             # ADM9240:  Complete System Hardware Monitor for uProcessor-Based Systems
           - ad,adm9240
+            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion
+          - adi,adp5585
+            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion with support for Row5
+          - adi,adp5585-02
+            # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
+          - adi,adp5589
             # +/-1C TDM Extended Temp Range I.C
           - adi,adt7461
             # +/-1C TDM Extended Temp Range I.C
-- 
2.27.0

