Return-Path: <linux-input+bounces-16056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB54C54B6C
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 23:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 163723A5FD9
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 22:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3F42C029C;
	Wed, 12 Nov 2025 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="txeB+liG"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A083C35CBB2;
	Wed, 12 Nov 2025 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762986430; cv=none; b=W6i3cjxwMmURmpPmC935wQZiSrccFt95Fxt3VcW2SdeqNj5rUgiB3QQTF8jdP/Q69KfK+x3mmkkRy/mcWOzRpdQyz+XOfZ++gtzsIq9dCujoju/wVUJsUgNn9PAK2Alj+TIUvmfpsE+j0s8LN7ZZF6/9PD/172ugri5nBguS7x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762986430; c=relaxed/simple;
	bh=AabDN43ezE3GV8RzY1PXvs7ghSgatcrk8Z3ZbOkIUdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MuUvxzrs0mVZgSH7PDEuUpHNcHEeadqZ5/+pmWabZgpyn8BcyylaF7qfLrhD+OIbG3FViW+xGkwgMQEOYMik81Vb791ZogTlPOXBCRcnuogCNDV7PKm5KR8rQe5d/ycDBWq5rz/DQgLJPmdG9lI9T38p4ANrkxYa7EPtsJrPxkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=txeB+liG; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACKWPGh2490438;
	Wed, 12 Nov 2025 17:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=ubtAnzLVB9storQ/KZhgdLsw3IP
	IQe2Kbjl7FlWhP90=; b=txeB+liGKT7P6bp9/hsXk/fUgIWXgn+bRe0JzhmsAMp
	QCZxI+RTuoCDLtXC/vCc19ET1wBIvO5AvrQ6D96tBpVgepmTuzqPIS1CX/mLbD3M
	+tBz+QnUrhqCIGJosC8Mbu79nZ1vtJsFVuHJQo0rRc3pZUiDOf7++XmxSYPdleqC
	9IJOoD3/JkDTEigw16DTDK+cpngewjde2LgPdedz1iw/9CA4WaL54ag5MNvWd0s4
	LGyL5mASsWdTuLHdRWhY0kZaOn5vm89ViaQh2uebXeLGZGeJ/VYpj90VKu17zncV
	kyxm3NWpFciyEK3K8j8rvpZ05UH8jCT7xcAhJZnmpgg==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4acpdkc2xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 17:27:06 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5ACMR5In031439
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Nov 2025 17:27:05 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 12 Nov
 2025 17:27:05 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 12 Nov 2025 17:27:05 -0500
Received: from HYB-DlYm71t3hSl.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5ACMQuCA002617;
	Wed, 12 Nov 2025 17:26:58 -0500
From: Jorge Marques <jorge.marques@analog.com>
Date: Wed, 12 Nov 2025 23:26:49 +0100
Subject: [PATCH] Input: adxl34x: Add warning on shared compatible with
 adxl345
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-input-adxl34x-v1-1-b7e21b3cea59@analog.com>
X-B4-Tracking: v=1; b=H4sIAKgJFWkC/z3MQQ6CMBCF4auQWTvGFgrCynsYFrUdsUlpsQUkI
 dzdBozL/yXvWyFSMBShyVYINJtovEvBThmol3QdodGpgV+4YIxxNG6YRpR6sXmxIKsrXomcuCo
 5pM8Q6GmW3bu3Rwd6T4kdjxF6ilHubJPt6CVnP06gtNZ//njvNc4MGSpdiqqoH/Jaq5t00vrur
 HwP7bZ9Aem6ya3BAAAA
X-Change-ID: 20251112-input-adxl34x-1972753e2c62
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jorge
 Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762986416; l=2613;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=AabDN43ezE3GV8RzY1PXvs7ghSgatcrk8Z3ZbOkIUdQ=;
 b=Kw3lSnw7KWRW7Tby5ue2tISHMiwHONG5qOIQ68uIhcIrYamUhr1oSZ0wWXRjDE+f0ZTlTkuvZ
 mnMS1/j07ndCQPebxWYwfwUwN1GIw/NX7O9JuIJwZ8BOrvK5nLSMSgj
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=691509ba cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=8h9VZS2awgx57zd0YUAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE4MSBTYWx0ZWRfX1UAFwXO4XrYx
 77c+IvEj4wDeqLnnqBV2Kq152/YbG6hpRWtx8UZMCPtBzx8Mn5iEtyEPZAETloUjB2rlMhSOIqU
 O178/KNOa+SJDp/UnDQ7IqX3i1c7wAZ8jro2jO+Ch4/euphwD2IZ4vez+XUhvvY4oIvMrrI91xB
 W0yP+41M+EBcFJ1l+6cPBrUYu3j3ZP5UMbcMUw73e2xJEOAj9CWqQqQPOtAKW/jMTI/UKm2WSy8
 8h0YghpMEp1Y8MzAiXtjWB0JrYot5gRWUt+cUmlgAUWxz01OZL6BYKaxJrhoL4Yp9+bgiso6GaQ
 xjEBebf36OsZKQfjcDTZQLFymckFY0mcnEJNeth+SaMJrEK7aqNlmFCnSRJ9zLbqSumCX8If13Y
 VDTz4stXGRj/nsxXb1Vk0ddNFCJz4w==
X-Proofpoint-GUID: g6R4f4Y_zYxN9ryqAn1oQ-JJmDLA_Ven
X-Proofpoint-ORIG-GUID: g6R4f4Y_zYxN9ryqAn1oQ-JJmDLA_Ven
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120181

INPUT_ADXL34X and ADXL345 share compatibles, previously it
wasn't possible to compile ADXL345 if INPUT_ADXL34X was enabled.
Changed to allow both as modules instead, then the user should blacklist
to block loading one, if his config selects both.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
There are two drivers for the compatible:

- adi,adxl345

* IIO:
  drivers/iio/accel/adxl345_core.c
  drivers/iio/accel/adxl345_spi.c
  drivers/iio/accel/adxl345_i2c.c
* Inputs:
  drivers/input/misc/adxl34x-spi.c
  drivers/input/misc/adxl34x-i2c.c

To disallows both being complied, the depends INPUT_ADXL34X=n
was added to ADXL345 symbols. However, it should be possible to compile
both as modules, then blacklist one of them in the /etc/modprobe.d/blacklist.conf
file.
So patch
https://lore.kernel.org/linux-iio/20251112-adxl345-allow-adxl34x-mod-v2-1-5b1561eae5a0@analog.com/T/#u
changes the rule to !(INPUT_ADXL34X) to allow both as modules, but still
disallow INPUT_ADXL34X to be built-in and ADXL345 as module.

Add warning to the input Kconfig to inform users.
---
 drivers/input/misc/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index cc2558630..df5c425c9 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -769,7 +769,9 @@ config INPUT_ADXL34X_I2C
 	  Say Y here if you have ADXL345/6 hooked to an I2C bus.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called adxl34x-i2c.
+	  module will be called adxl34x-i2c. ADXL345 share compatibles
+	  with this driver, choosing Y won't allow to select ADXL345.
+	  Do not add both modules to the kernel.
 
 config INPUT_ADXL34X_SPI
 	tristate "support SPI bus connection"
@@ -779,7 +781,9 @@ config INPUT_ADXL34X_SPI
 	  Say Y here if you have ADXL345/6 hooked to a SPI bus.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called adxl34x-spi.
+	  module will be called adxl34x-spi. ADXL345 share compatibles
+	  with this driver, choosing Y won't allow to select ADXL345.
+	  Do not add both modules to the kernel.
 
 config INPUT_IBM_PANEL
 	tristate "IBM Operation Panel driver"

---
base-commit: a311c777f2987e6ddba2d2dd2f82f2135d65f8aa
change-id: 20251112-input-adxl34x-1972753e2c62
prerequisite-message-id: 20251031-adxl345-allow-adxl34x-mod-v1-1-cd65749ba89c@analog.com
prerequisite-patch-id: ee005752c4daeb450e458f20d9de0ce7b24743ca

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


