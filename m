Return-Path: <linux-input+bounces-3832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18708CEFBF
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 17:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C8992819F9
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 15:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F7D84D22;
	Sat, 25 May 2024 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="adle0Gsj"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE9D2A1C5;
	Sat, 25 May 2024 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716650300; cv=none; b=rPU66UqeX2OB5Y2bb1TAuEHv9CcgH3kzkbTZkmvZ2FC2HvsEVw+wjkAxKSf6XeCtpd+cZSgXppW5MnR4O0Twq177CNw8H1W1v/g8hEmf75TsQNmgn01Z0Ai2K+jqh7EhDlMIV4aKBiSElkQV5OVOEcjNPLlyc39b3MhJ2K7y/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716650300; c=relaxed/simple;
	bh=A2r6FbG81D5mxfhRoz0Z9e9YHez4v1VMdUI+h4NR59I=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Lo+NiCiQrJIyGDfdSjcxK6sX12d5I35JSUyZ+fQusAlmiA2K+pa3/zvjD1VP8EuLvxpiCYXh18apYnxw6qGHWmWMx1y/wEp+doZIaRfcg37hBUDWZ4ZST327bg8jIoPJSd5pQveYRfG5VqmENZZwwqZ/Zc3OVNUhhimH5D4Z0ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=adle0Gsj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44PEg4VA030415;
	Sat, 25 May 2024 15:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j+qAzrEMlU3CeUTkqPGMIA
	iBwXxYQxXY59CzDhdLVSE=; b=adle0GsjiZGOHBOyBpa5I5DgZSFojMLzo7eKHM
	rgo3koVQUNSkIJVNUE5BsEJXsCe+0GT9bO32DIZHmperxRfEkmsBMrkKKqyUu1EN
	OJU+VlNSu+gS/hK8M4R1P7fPJiUSJj12p2qWypQZlJJE+sFxF510Sq+2Q1IOcg8z
	5kvEqeRS5OM0/2hZOpXqQ7gnLkldezBmNJFZuA4oF/GQxdEFvhVc3JQCoHmrvMW0
	uhuqfmth6WNI7Ygt+YJJVB0VL4szTCSyySvOc/1gXzHzM46MblbbXHPqmXA6THkH
	xSzMhcV76MUOSKF1a15DTD7iN/NJhyQ3naKXmX9VfbFnw8mA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2mrgdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 15:18:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44PFHxQ1010178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 15:17:59 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 25 May
 2024 08:17:58 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] HID: intel-ish-hid: fix some 'make W=1' warnings
Date: Sat, 25 May 2024 08:17:40 -0700
Message-ID: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQBUmYC/x3M0Q6CMAyF4VchvbbJWJwEX8UYskFxjTJJOxRDe
 Henl19yzr+BkjApnKsNhF6s/EwF9aGCPvp0I+ShGKyxR+Osw/uArDHP3dtz7oR0mQhbN5rataf
 QNBbKdRYaef1nL9fi4JUwiE99/MUenJYVJ6+ZBOdPmcK+fwEFRb+XiwAAAA==
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina
	<jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, kernel test robot <lkp@intel.com>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wdYIqwV-JDwLB1QYva_M16VEiMaNM7Bg
X-Proofpoint-ORIG-GUID: wdYIqwV-JDwLB1QYva_M16VEiMaNM7Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-25_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=591 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405250124

Clean up some 'make W=1' warnings

---
Jeff Johnson (2):
      HID: intel-ish-hid: fix ishtp_wait_resume() kernel-doc
      HID: intel-ish-hid: add MODULE_DESCRIPTION()

 drivers/hid/intel-ish-hid/ishtp/bus.c | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 07506d1011521a4a0deec1c69721c7405c40049b
change-id: 20240525-kd-ishtp_wait_resume-95f01596b772


