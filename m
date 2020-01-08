Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D223133DF6
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 10:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgAHJLd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 04:11:33 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:65224 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727386AbgAHJLd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Jan 2020 04:11:33 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00897hBs009968;
        Wed, 8 Jan 2020 10:11:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2cU/4JR4XYcXyOTK9ys4Wvfgw0cmENpuoxKs1hQNqko=;
 b=kbZqzA5V7hRgjfMNEVlKj9K5O6xYEBfL7WOK7lWlc8BBDJ9GZABE3zV+YgS2HQFYTG7f
 oBd6hQMS+oFfwi+TYpo59m1KjaNzRS1dErCh4vVsTtwHdPWNbp01OwJvYCc5Q85dvwar
 mNF4YNrt9JZSlO1uWgTt5y0eOXH477wOGaXr/TLvHiO118b5coNqvXU66fOwZbJPOOaE
 TStsmSRwu6960CGXDok/Z8nuLSiDfoUdwH+/FJaOYhVBHvbYAC0ebX6UEsmeiNpajoGc
 57NTjKvTGPTYgB4BPZaLdNSXnfCL3I142AcOJcfp28h3mLe5bDS2SzaV30dXAIn94XCh gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakm5jxkc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Jan 2020 10:11:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E81FF100039;
        Wed,  8 Jan 2020 10:11:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B727622088E;
        Wed,  8 Jan 2020 10:11:20 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 8 Jan 2020 10:11:20
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <hadess@hadess.net>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yannick.fertre@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v2 0/2] Convert touchscreen bindings to json-schema
Date:   Wed, 8 Jan 2020 10:11:16 +0100
Message-ID: <20200108091118.5130-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-08_01:2020-01-08,2020-01-08 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series convert Goodix touchscreen used on STM32 boards to json-schema.
Before converting goodix bindings itself it add a schema for common
touchscreen properties.

version 2:
- remove old definition in touchscreen.txt
- add type for all properties
- add dependencies between properties 
- enumerate goodix's I2C adresses
- add description for irq-gpio property
- reference the common properties used by goodix

Benjamin Gaignard (2):
  dt-bindings: touchscreen: Add touchscreen schema
  dt-bindings: touchscreen: Convert Goodix touchscreen to json-schema

 .../bindings/input/touchscreen/goodix.txt          | 50 -------------
 .../bindings/input/touchscreen/goodix.yaml         | 78 ++++++++++++++++++++
 .../bindings/input/touchscreen/touchscreen.txt     | 40 +----------
 .../bindings/input/touchscreen/touchscreen.yaml    | 83 ++++++++++++++++++++++
 4 files changed, 162 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

-- 
2.15.0

