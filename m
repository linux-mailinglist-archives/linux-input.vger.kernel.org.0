Return-Path: <linux-input+bounces-9307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C867A14601
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A7803A98A1
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F431F3FC3;
	Thu, 16 Jan 2025 23:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jq1IuRCO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE9D2459D7;
	Thu, 16 Jan 2025 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070147; cv=none; b=UDn2XKej4Qa/Yz1bn3ZgSmi9JY3rg/oL1QIMJS84E37+q7oXucbTdsYkiDY5LzjFxQ/ksQDhdqk6JQ2feq9pWkFGVxyLIyDF4FIdOtJ8zDCJ/IWrIR1ymS4QyvvOGNCQicH3yVq5bPX8llQi0+PTejUFswGIUHGbkWS4aCUcjuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070147; c=relaxed/simple;
	bh=iAzTbU6tIDBeRuGzeRSfA/tuioEBA3yhbKe6u7zPTP8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9sdAuZomLtTmxiA+nUAEKkdJynAzDIWi8lzpbTvY5yGtUjMkjtVh90lzHH5wo8voukArPafi8hk3fL6rnZAz+UuCKVgEzOIQXn6Ie3XI7iU4fFNdaDuuswn8vZN0Z3gh+7OgIYBjQnGvlc3cK4PNDQKZ7PWPhvjY9uRrnon+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jq1IuRCO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDrbtJ031338;
	Thu, 16 Jan 2025 23:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhvroKIUl/yiXBVl3kYsncn6dx79c3y2N2LJ9uw82bA=; b=jq1IuRCOpZ2e4DZg
	WCinaJy2E78CsXa7gX0Lp2jtWL+/eLhN+hlRaFqjYGBwrg7hFvnlyALehzYslm5w
	a1Z8uiVi2Z4S8guePT263zn6NQe7DVOqfvlNb+fS+8Vm/euDXbeeu2YP+ScCptxI
	E1vsYNTO3g20K7PM3XM7io0l04NRwGdPmpzw90hewMB4I7Qd3mz76wMB76nV8MQK
	ybLorJErtRSwlg1o1CgEB5rhyI+qpmleZKmHR6dOSyj0TEMD1Ae0OCQKRCvUBs/z
	bI6YdnunD8LqvubUBDWqM+B83TdTyN8bsRwmg0B+ZoBF5YwrVw9oL6MEm+61UNhA
	2AwRuw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473d7h8kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GNSlAl031841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:47 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 15:28:46 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v33 21/31] ASoC: dt-bindings: Update example for enabling USB offload on SM8250
Date: Thu, 16 Jan 2025 15:28:14 -0800
Message-ID: <20250116232824.3748438-22-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R2bmr0Y3Gvo5KPvNJt0lbCLWxYFcb_pf
X-Proofpoint-GUID: R2bmr0Y3Gvo5KPvNJt0lbCLWxYFcb_pf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160173

Add an example on enabling of USB offload for the Q6DSP.  The routing can
be done by the mixer, which can pass the multimedia stream to the USB
backend.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index b9e33a7429b0..4e208cb7f6c6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -190,4 +190,19 @@ examples:
                 sound-dai = <&vamacro 0>;
             };
         };
+
+        usb-dai-link {
+            link-name = "USB Playback";
+            cpu {
+                sound-dai = <&q6afedai USB_RX>;
+            };
+
+            codec {
+                sound-dai = <&usbdai USB_RX>;
+            };
+
+            platform {
+                sound-dai = <&q6routing>;
+            };
+        };
     };

