Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1D51F527
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 15:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfEONMU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 09:12:20 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1068 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727454AbfEONMT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 09:12:19 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4FDB6OK031810;
        Wed, 15 May 2019 15:12:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lvuSqMIYQB4SqeLsqz/zFiFWJBb395UBGK+DGWYS67Q=;
 b=FMPk09oy2925ne/C9OKRkyWxbDjb9FCfIqO9XPFCUJ7ib3NIfEDHdqSdRnfJOXvisL4X
 maLF3pNN4bEaGKutiEhOMfYPJjL6nh2huxxFAopMgHBBCRW/DwAa1hK66OVMoSPFoAG/
 klsCm/HTEirm95eey+NWYAaaS325MP1Nt9X5APosBJeaksgibGuVsHquf+LXQifpx0Zs
 /pVxP1z0KodPE/YOcJxpmYBYGVIcxYEr3NVazhokMqNQlDlLAhHqeVCj1pADnIKfMzSL
 lrnB9dV5qRyzxR8MQ1vVKHqEQ6ucP9MoBtRZjvUQ9nKLlwba15c3vXrEu6P155jQJCb4 Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sg0an6gjv-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 15 May 2019 15:12:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08D5534;
        Wed, 15 May 2019 13:12:06 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBFBA27F6;
        Wed, 15 May 2019 13:12:05 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May
 2019 15:12:05 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:12:05
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <rafael.j.wysocki@intel.com>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>, <hadess@hadess.net>,
        <frowand.list@gmail.com>, <m.felsch@pengutronix.de>,
        <agx@sigxcpu.org>, <arnd@arndb.de>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <broonie@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v2 4/5] Input: goodix: Document suspend-dependencies property
Date:   Wed, 15 May 2019 15:11:53 +0200
Message-ID: <20190515131154.18373-5-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190515131154.18373-1-benjamin.gaignard@st.com>
References: <20190515131154.18373-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-15_07:,,
 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Explain the purpose of suspend-dependencies property.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
index 8cf0b4d38a7e..5527952054d2 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
@@ -24,6 +24,8 @@ Optional properties:
  - touchscreen-size-x
  - touchscreen-size-y
  - touchscreen-swapped-x-y
+ - suspend-dependencies	: Phandle list of devices which have to be suspended
+			  after goodix device and resumed before it.
 
 The touchscreen-* properties are documented in touchscreen.txt in this
 directory.
-- 
2.15.0

