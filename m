Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F07B175832
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 11:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgCBKSm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 05:18:42 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46848 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727267AbgCBKSm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 05:18:42 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022AHOdU029111;
        Mon, 2 Mar 2020 11:18:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=sQGS3ajcizRpXz7eztz3fMHKRX1ok8Cx3ATqa3t8sXI=;
 b=ly1l1LrfmdW+OA8JjznUO/o8/hrhHzc8ZE1lYr+bUD0ZbxNLB8bH8vsDmC2sV5HO8FgH
 4gM0FO13G6HTzpMSinxFUGe0S8TsPsuwlbZnjRfRUo6BL6I6mId0juive/qBoBXNUrkO
 rtbzHbR2BT8YK5ghnPD1EpE/035ubzQf9YSwudleXKhqGp3EHiqKPTxMuAM5S6BSP1dB
 XrbyfKOrJMizyQuD88IOszjxAA6YQ39yNig774CbYT0XA+pNa5kl4CYI+DOIxfEvz5T2
 lcz93ysZ3/a7iFP0DmljDLUBrVoFZWaLd3z3lpQxeTw6nJv5adsLNtiCBW2Ux5+9ZHYi zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yffqpjqar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 11:18:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B46A100038;
        Mon,  2 Mar 2020 11:18:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 688A32B62F4;
        Mon,  2 Mar 2020 11:18:30 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Mar 2020 11:18:29
 +0100
From:   Yannick Fertre <yannick.fertre@st.com>
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: touchscreen: goodix: support of gt9147
Date:   Mon, 2 Mar 2020 11:18:27 +0100
Message-ID: <1583144308-3781-2-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583144308-3781-1-git-send-email-yannick.fertre@st.com>
References: <1583144308-3781-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_03:2020-02-28,2020-03-02 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for it by adding compatible.
The chip data on GT9147 is similar to GT912, like
- config data register has 0x8047 address
- config data register max len is 240
- config data checksum has 8-bit

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index d7c3262..9f65d67 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -21,6 +21,7 @@ properties:
       - goodix,gt911
       - goodix,gt9110
       - goodix,gt912
+      - goodix,gt9147
       - goodix,gt927
       - goodix,gt9271
       - goodix,gt928
-- 
2.7.4

