Return-Path: <linux-input+bounces-15802-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8DC200A7
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 13:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B3983B6364
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2343191AC;
	Thu, 30 Oct 2025 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6RbXfU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCYJs8wD"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6491B2D0611
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827707; cv=none; b=JK29mmmETIXZor7xozY8oDBaGvbXqCiOXk8CGWziH3tv3/m+CZIo6Sx3xvigjE2Y4kQIiieLY4eZ50UcCYzILTgRk0zTsKCTNpRoqaT413HDj70rax1351B2iRA3HIuvFYM3VuM1Aq91HOYPmhEh7Nzo32ZzsvpalXknCq2fM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827707; c=relaxed/simple;
	bh=7RGhyi502KoWvsFNQGjszwvvFapTut6/+hdSexSVNZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tL+jvA9EDmNaqr0b902bMhNaXpBoeH9cTQJCN4Y7er+GEDSmRMU6xtwqksApL87EjiD2nAvR+nrO8C5fMCwKLekdmOcwcx0/Qug0J6EgJZS/6dLo57Sf8l9W1MbaF6BGqMtYuXpXhVg8CUpKXmqXJ8n6+byCxWFCK99wqELCspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6RbXfU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCYJs8wD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7htFc1655594
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 12:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1a83WxM45yVcvOFj1pAxfquPc/HEWlp0bdR
	ZFkri940=; b=P6RbXfU/326Dw93gO2HI6+2e6hHYdDDK9NBQ28PDPi9QvMFmeNJ
	rz+X6MkXQN3gjoQ6nrjc+MUykw0A6jhJWi9zvlMFw+VkDYZm5YUBHmqQb58Kd644
	BNXmhSzDxTXwOr7ir8O9QV5LJmlgLxhrw4kp/dThETzGIhjQnqScqK+k+b6CA/P/
	vxXv37yOJW5nzXbqxZoYy238P+4tufNI9IhruvdGtkltRVJTWHlMubI47oII4K2q
	mxvJrGTvKAffhKh0CwgvL5GMbmaiWWMLueAy9RCugGFh4p7L7r8dFpJ7je7FDp5i
	cY3A80hp3wqeBKGNjwhkPPN/8Xq/FxuUDaA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptta5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 12:35:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28c58e009d1so20604725ad.3
        for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761827703; x=1762432503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1a83WxM45yVcvOFj1pAxfquPc/HEWlp0bdRZFkri940=;
        b=eCYJs8wDjE0GgfmkCNs1lqzZyQf9EqiZ50TsIQaYgcXIGfYyT7p+JV3taITyvt5G6N
         ejNzlzJXyF9ja/79CWjwaT1jELzLZvx//esx8zeGUtpkAGD9TL0nh5eK82D2jHMI7tDR
         fAfIWbYJty6vXKVACDp5xbpchALTO8caZ62r/Tjl2zK97/xVb2/R8+HjnJOIDNjAnQvM
         l/+6dyWfJgLNsXb6NRR46KyIHFhsRio5ilBDZIJC1qafCdtLFEtHBpPqhKtecgWuvq5e
         bhHymWr6JbUzm0RZE6aq9u+bgzcxZPRWr7mvTvZTdbIwKzFZb6EG0FYrmNCTU6a1be8W
         KKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761827703; x=1762432503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1a83WxM45yVcvOFj1pAxfquPc/HEWlp0bdRZFkri940=;
        b=DZZITJWxS+4tnh7HekCed0T6p4pwx1DkpUclmfTpapa8iRbtD4LiC8soKzfRlVn3kS
         4L3MmwiEJM67WQf1iZ2Q2LaYqRvC7yRIe6qPMop70uQCNoOJULJiBKePquTPmn+oyI6c
         /aiD+69PwCsE1Am7vGSorAoLjcXxog6n90WLCQEXgIb2qpyaQGQ1HbOt+fpdnzOzmrfJ
         /nGwKtNf3jenJ+J+PZoUdU5yIBZkOjlfOjQ5MY0GDVVsJtxb5n1GrikUx2dJRbvm6DjX
         VLoyxuPg7YFUAhgIvGYC2Qw+U9Vu+MmJxgiq7SoEX3DHG2zEq7Uk2NvPu3+/LiDDmRcg
         SfWw==
X-Gm-Message-State: AOJu0YxeGfJE549SMGm9fyiDJVM76/+9K6SARZ8jptyG5Fsd6T48WIbN
	PXJHZzXHTZ3kTx6gjtsqTvUY3ghu73JDCNcFFT7YKNlhraY+xU1A8qt9cQfNVLzr2REr1pQVj/T
	JApSbFIqomNlrn11veYuPIFpzqzMp2O/TD6EewqqQ/R53XR/xxzE4gC3pPn94ODAPKw==
X-Gm-Gg: ASbGnctq7DeRPVWAtWYteEoZ06OdLcm99azl6xGzV/q8XvRvbaupJ8iz0/7BlcYa3G4
	V0HH3TRYGABBgGjiULeadZoeBP8eXAB13zhQtf+FzdhKhlYfUkDSEyREB0LBQ49AP/5siZKK7gK
	xbb0A5DMOMf3JdGH/gD8ddfbKM6U3k5WGzMpjyJIo2DR9TMgLRQNRSt4uxdzb7feMmJ/L0fJ4lj
	E+3L1p0J4FXQqRXOaKKJEs8Ic+RuyT1sOz+k9IY25wyYX1VuhEIQXnFixSMiuYrJRKnWyT74Y38
	oVAHVXn7eL9qNwczeG5M3E0pYIB1KLjSSMLOn3ZJ82LP2BJoTIlewgVKb55kzrBy3dVVgRwWdpy
	NrtGnxbCCAfjbwWT/KtZlaDHWGrghJPcu38PIkkpAZz+/Kta1ecgbT1of7JL0MK2gXg==
X-Received: by 2002:a17:902:c24c:b0:25b:a5fc:8664 with SMTP id d9443c01a7336-294def30f56mr58159395ad.51.1761827702842;
        Thu, 30 Oct 2025 05:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNGixP+si/DlsVvTgiQP9OzahR4n7X61dy4b6eOj9gfnOPjNvXX+09qONXVilXrQrSPbiRzw==
X-Received: by 2002:a17:902:c24c:b0:25b:a5fc:8664 with SMTP id d9443c01a7336-294def30f56mr58159075ad.51.1761827702220;
        Thu, 30 Oct 2025 05:35:02 -0700 (PDT)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0987fsm184384005ad.25.2025.10.30.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:35:01 -0700 (PDT)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: dmitry.torokhov@gmail.com, krzk@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH] input: elan_i2c: Add newline to sysfs attribute outputs
Date: Thu, 30 Oct 2025 20:34:58 +0800
Message-ID: <20251030123458.1760524-1-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwMiBTYWx0ZWRfX+S1jrWr70g4l
 1gT9htqpLsF37WyEtlzBQ55KV00GKdTgE6I5DTbBSOit9MuFc2SAUJW6HQkTt6sbgpE6Lx+o2/O
 fkjZ4Ren4yvwNBUOXveKHbsSaUHdESkNWCpIGI0rVybdJxW/XlYZzoVnPftEsGjlnPFVzzoJsCs
 LVMKU6FtRN2X7liJBLJfhYbM8oRJKywPqSj6g3vqbLjufcxGzojmZ1lk4M3TcCcktH989hiZ40y
 8+GelDvRV9X3KiNzL5GbLgieOvEyAj78F7O752zxLdo4EbxydEIvbsv8MJA6Akt2XKyIqfJ4kyx
 INV9Dlg4vpKrMW3C4DJLZdWy+299I4a9LmDegXQIBcDjIIeGRj9ZXFf8DYgwmbaCyQoElcb4oKj
 rXfhFat/SBirkyn/N8Hv+8nY1yyzIw==
X-Proofpoint-GUID: JI0sEGXETfz2ry5PwcQeVVAJYnRTcK8z
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=69035b77 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=I8k-m_L3aHpefXCHYswA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JI0sEGXETfz2ry5PwcQeVVAJYnRTcK8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300102

Append newline characters to sysfs_emit() outputs in func min_show() and
max_show(). This aligns with common kernel conventions and improves
readability for userspace tools that expect newline-terminated values.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/input/mouse/elan_i2c_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index fee1796da3d0..14b6cfd7a6de 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -861,7 +861,7 @@ static ssize_t min_show(struct device *dev,
 		if (!data->baseline_ready)
 			return -ENODATA;
 
-		return sysfs_emit(buf, "%d", data->min_baseline);
+		return sysfs_emit(buf, "%d\n", data->min_baseline);
 	}
 
 	return -EINTR;
@@ -877,7 +877,7 @@ static ssize_t max_show(struct device *dev,
 		if (!data->baseline_ready)
 			return -ENODATA;
 
-		return sysfs_emit(buf, "%d", data->max_baseline);
+		return sysfs_emit(buf, "%d\n", data->max_baseline);
 	}
 
 	return -EINTR;
-- 
2.43.0


