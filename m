Return-Path: <linux-input+bounces-4057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC208FAA64
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA5D1C21941
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 06:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D001C695;
	Tue,  4 Jun 2024 06:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o5ocVEPq"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04933A5F;
	Tue,  4 Jun 2024 06:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717480873; cv=none; b=kINz3Xn1tKa2Eat9OFuS05/CfDStVrMaSvO9hvUqKxHrDwTWG4DVPmUB/GGdWFQbIUEt4kFOw0f9yYK+Q5wn+jeZIXqrHPK/NsgpmV+z3NME/Wb4diFgS0kOg81qFspZPOyG584CA4ejdUIRVKiXjhWsQtfrTr7LbWU/HSviHcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717480873; c=relaxed/simple;
	bh=Jd4fUlb0i7EadQ2VxIkjPkJAQ7Q9m454Ry4odrQcn3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=SfEA5PNcvLm2u7CPj2z7SGUjIqz+mSXQwIF8xXBX9vmPJr3BTofZldRK5p+bkSp4sElDYCsy09d9C+A7J8C05i+iuIIX3esD47miop/uN+RrecUqwC2prAzs3kwkmurfSZkiaq+LNjOTjC11yrqjB4MsM0lYh1a9hP7b2ac7PwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o5ocVEPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453K0tDG005301;
	Tue, 4 Jun 2024 06:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=51ZA9OiJpjlX0ruhcneVre
	O/iIJUTw0mzhQfZaG+KDA=; b=o5ocVEPqNyxdwR7hpCdb3JcV5OAxJyVGHVbuEc
	4SYSTBQnKhRLiMDc0YK57BzgT51IviK1Nd1ialbWU5LEehsaa71IdZrM5xOZZUBP
	zvL8Q29X8FPBDmIL/EnkG7bPQWVdpfIJYD0INa/DYFhd2qwwTsMWC4WSGvnV52Zn
	Q/5/wmCKm0Wbd9i8o/4sJ/ooh5xqsJdydJp+/rLDA+E7x/S/6gNTwFyUbwUc88/o
	W5CTUuerxdTw2V5e4x05eQhezQu3CxJx6FOJ9doccISmEjsDCfBKMkyUspVPSGhR
	kl6toRsh+mwYOB5SFY4fEu/i2qtBIn+N8sz+07RR3kUebGBw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5kp2my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 06:01:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454610HC003914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 06:01:00 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 23:01:00 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 3 Jun 2024 23:00:59 -0700
Subject: [PATCH] HID: logitech-hidpp: add missing MODULE_DESCRIPTION()
 macro
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240603-md-hid-logitech-hidpp-v1-1-060f06e4529f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJqtXmYC/x3MwQqDMAyA4VeRnBfoqgjbq4wdYprZgNbSuCGI7
 27d8Tv8/w4mRcXg2exQ5KemS6q43xrgSGkU1FAN3vnO9a7FOWDUgNMy6iocL+SM3j1Yeib2roX
 a5iIf3f7f17t6IBMcCiWO123S9N1wJlulwHGclIMc9oYAAAA=
To: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera
	<hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires
	<bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i3oyWRPZ8PX9b7siS9EgUDdGUjiZ2Eex
X-Proofpoint-ORIG-GUID: i3oyWRPZ8PX9b7siS9EgUDdGUjiZ2Eex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=934 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040047

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-hidpp.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hid/hid-logitech-hidpp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index b81d5bcc76a7..400d70e6dbe2 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -27,6 +27,7 @@
 #include "usbhid/usbhid.h"
 #include "hid-ids.h"
 
+MODULE_DESCRIPTION("Support for Logitech devices relying on the HID++ specification");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
 MODULE_AUTHOR("Nestor Lopez Casado <nlopezcasad@logitech.com>");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240603-md-hid-logitech-hidpp-209ce6cac203


