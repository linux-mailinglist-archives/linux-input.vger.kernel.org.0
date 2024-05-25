Return-Path: <linux-input+bounces-3833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED28CEFC3
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 17:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4CE81C20A46
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 15:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6358528D;
	Sat, 25 May 2024 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LI0D/8UF"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE04EB45;
	Sat, 25 May 2024 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716650300; cv=none; b=OxjJCbWaGLAreV/80i/9mrqUfAkidZUDcA5l+pe8FgOmxgPLbId9662ulP1gbVoJkCldzV4aOjdb02tTTPkBoEyo4iHIEchf4qN/A/N2FJjenTTZ+QcF4j7V3ZEWUaEPzzDQ2OTRM3+RqqgQsycB7yrA820ApPvvHzlVcM2U62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716650300; c=relaxed/simple;
	bh=7GWmKKcJ+5mtRipnp051mF1k19YX/MVXaBh2cg+3N48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PyoZvw5YUFH2ysQG/p3Rp3n3grwrU8ekAv7S5xMitdBwKGanbKYT6mCez/E2pKyCiFcA/SKdfWk8sdAGtjDDmEhJBqpvNT8/HNPx1bV0AaJyJazLG93BDK7NlKG/wwLXrjR7XJe8RfuGxHGAcqEgI1Tq35eXBynVRG65mFv3ozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LI0D/8UF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44PDNqGE023457;
	Sat, 25 May 2024 15:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoDoCXrrGjP4Dq4Apr/IETWJzT8dMisgvF5Uj8McL2c=; b=LI0D/8UFgW0gcvUp
	lo1IStZxPLLneProSzdcyVcBGVmA53eIFnJ5JR4sZ1vlpOtQySU8xbOPQ3ynf2db
	0fdCqobDrK4XbzzzvVxpHYjC3i+x+QKifo8HDhPXK8RmdT6CJC+h2tuDj9L2FfFX
	mDz0hDnK3oklWosF2RlAQONZzQMk0/emCJMWI3aEtoQi3yw7WQnQs+JecGozeI6x
	QiqoS6SltmV+y9GY9TuCGNp4u8Dz55P0Z5AmZ8bxhqk26QfaY6a0fA5tKMz77tDC
	U1PKlyz31NzAbnD9Sb+h0FqLeur8tk+JiUaJEFPBVln/fKNipIcEB+ZtCMSRiKAX
	Saz1VQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0q8gas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 15:18:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44PFHxQ2010178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 15:17:59 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 25 May
 2024 08:17:59 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 25 May 2024 08:17:41 -0700
Subject: [PATCH 1/2] HID: intel-ish-hid: fix ishtp_wait_resume() kernel-doc
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240525-kd-ishtp_wait_resume-v1-1-fec87a6f7916@quicinc.com>
References: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
In-Reply-To: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
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
X-Proofpoint-GUID: AHbSdyP64nX9haNgHsXaVN0ppmR4OMAe
X-Proofpoint-ORIG-GUID: AHbSdyP64nX9haNgHsXaVN0ppmR4OMAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-25_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=804 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405250124

Fix the 'make W=1' kernel-doc warning:

drivers/hid/intel-ish-hid/ishtp/bus.c:853: warning: Function parameter or struct member 'dev' not described in 'ishtp_wait_resume'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311060843.dXENYlGc-lkp@intel.com/
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index 03d5601ce807..f3042c4b8710 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -844,6 +844,7 @@ EXPORT_SYMBOL(ishtp_device);
 
 /**
  * ishtp_wait_resume() - Wait for IPC resume
+ * @dev: ishtp device
  *
  * Wait for IPC resume
  *

-- 
2.42.0


