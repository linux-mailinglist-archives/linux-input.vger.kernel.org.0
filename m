Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97189132727
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 14:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgAGNJb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 08:09:31 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:59908 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728068AbgAGNJL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 08:09:11 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007D315O029953;
        Tue, 7 Jan 2020 14:09:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2+5EdBtXPI+Jvepo+w/i3cRQX8riz6EwR4XXKmacQ6Y=;
 b=gpWMaS9gGngeW7AKup6/R402dCZAjV32SPjezpy/wdVUpgjHQKQndqqRn5MFdRjupAjQ
 HIty22LtdAMnZK2elzAnMMm1E+msScFyWy+ldhoPxC+J4p3H3kDHN7wMVlpO0m9Abg6A
 To2jFo1KgCpwM5ms+N/O5v5ulzzCdJY7RQyPY80RPbcwy1iAeg2we81Gw+fNx6vEO9fs
 PQnimH3RW5hvccDkk3UiDO3q+eaAQA71YhBSkGj8m7n9oc1i7eQHBbYiU7kvwvzpLIGa
 VxZRfoCUmUSk1simJB0nbfKd1Z/034wL6YGTOXeUN52gSj7HRK1TC3OaIY5r9Kt7Dsdz Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2xakvb6ctd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 14:09:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 974A110002A;
        Tue,  7 Jan 2020 14:09:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D2372AD9EB;
        Tue,  7 Jan 2020 14:09:05 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Jan 2020 14:09:05
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yannick.fertre@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 0/2] Convert Goodix touchscreen to json-schema
Date:   Tue, 7 Jan 2020 14:09:01 +0100
Message-ID: <20200107130903.14421-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series convert Goodix touchscreen used on STM32 boards to json-schema.
Before converting goodix bindings itself it add a schema for common
touchscreen properties.

Benjamin Gaignard (2):
  dt-bindings: touchscreen: Add touchscreen schema
  dt-bindings: touchscreen: Convert Goodix touchscreen to json-schema

 .../bindings/input/touchscreen/goodix.txt          | 50 ----------------
 .../bindings/input/touchscreen/goodix.yaml         | 69 ++++++++++++++++++++++
 .../bindings/input/touchscreen/touchscreen.yaml    | 63 ++++++++++++++++++++
 3 files changed, 132 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

-- 
2.15.0

