Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC94768B42
	for <lists+linux-input@lfdr.de>; Mon, 31 Jul 2023 07:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjGaFiJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jul 2023 01:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjGaFiF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jul 2023 01:38:05 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF551706;
        Sun, 30 Jul 2023 22:37:55 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36V2i1ae020809;
        Mon, 31 Jul 2023 05:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=j1m1iVoDv+RAAKG7xoBKTJN3izlDX4RXutXbv64sR2U=;
 b=E7QA04wGY+P4cy5I+ssyk/kgydB4Rh3hwnkO+6V6roXkhIkrzGcNHO7gyi4CMZ7V1+Of
 FvKzmi2w/MkjSn4CwXmMqmdx45W/btvvDL7t5CZZycUj0d8ahmoA34Muh7EvtlP9hQOF
 4eVbSqQ3N0bQOSNrQtM8sHsFixVYxQsuV0G4VnhcEL/WXL0KXxuqmITC5MZO/85G3JMH
 dnZY/CJFbOjUmb0wezt7sletaE+8pNldaeUrMGzq+wxb+jNk+PVVFlUA8CejqPYSPHLk
 hRvq64pPM+VhWNe5jx0RZuPFwfWtuiNN6aEwmWeJfmsKeSEfHAz4bD3ZLo/qou/M61WD HA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4uat2psj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 05:37:51 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36V5bo41014068
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 05:37:50 GMT
Received: from fenglinw2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sun, 30 Jul 2023 22:37:46 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>,
        <quic_fenglinw@quicinc.com>, <quic_kamalw@quicinc.com>,
        <jestar@qti.qualcomm.com>
Subject: [PATCH v4 2/3] dt-bindings: input: qcom,pm8xxx-vib: add new SPMI vibrator module
Date:   Mon, 31 Jul 2023 13:37:07 +0800
Message-ID: <20230731053712.2220898-3-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731053712.2220898-1-quic_fenglinw@quicinc.com>
References: <20230731053712.2220898-1-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zc17qifmR0Wp9d3ROZ9ze16mOmEj72YB
X-Proofpoint-GUID: Zc17qifmR0Wp9d3ROZ9ze16mOmEj72YB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add compatible string 'qcom,spmi-vib-gen2' to support vibrator module
inside PMI632, PMI7250B, PM7325B, PM7550BA.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 .../bindings/input/qcom,pm8xxx-vib.yaml          | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
index c8832cd0d7da..4a2319fc1e3f 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
@@ -11,10 +11,18 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8058-vib
-      - qcom,pm8916-vib
-      - qcom,pm8921-vib
+    oneOf:
+      - enum:
+          - qcom,pm8058-vib
+          - qcom,pm8916-vib
+          - qcom,pm8921-vib
+      - items:
+          - enum:
+              - qcom,pmi632-vib
+              - qcom,pm7250b-vib
+              - qcom,pm7325b-vib
+              - qcom,pm7550b-vib
+          - const: qcom,spmi-vib-gen2
 
   reg:
     maxItems: 1
-- 
2.25.1

