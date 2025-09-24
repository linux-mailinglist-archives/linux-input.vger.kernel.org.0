Return-Path: <linux-input+bounces-15027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12569B986EC
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 08:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20F94C11A7
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 06:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7834D24728F;
	Wed, 24 Sep 2025 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCzLnuvd"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D7DF72
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758696555; cv=none; b=KUUSpo8LM/PcUZYGFGeC/xZqZ9glT+dRQ8wZZYgA6xJY6M2jxzUR8949fYiX1SzkNTIZ6NsTsyFoLRIi/vedgO6wtkVqc4ncXHg8NRpXWMxiCiBoWvSg7v36/AybvnRBD7K4QakMJIUFTzSDYbv+Fngkx8U4CDJ46iJGSEc++d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758696555; c=relaxed/simple;
	bh=j1rkPtI+mxfQMoYjMdVfulSU2cd+VMUnx/n8t7/I2Lw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R5bdTElYCjMv2LmDZzZHUDm8N4AIYs+TxneDMJ5AFy3jvGYGhxjZB9CqINoel9CMusdi4rsCnGeOiKhAmVIOW++YNEHaeGHBs6xHpczLMFagoFZhdbQOxbRvgnexfpcX5O02XnzsdEKZk0+A7ExqI3GqKiOTGSM8JscviKyRMSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCzLnuvd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iKVp027912
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 06:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3GoFlgJ5g0Dx0YykwX8eXzYBSwZlV7r9oQF
	h6hFuZis=; b=fCzLnuvdfhX/Y1kvY/wP9rhKbgoKquM84HF80101eMAv5+LVSrq
	NSsJG8gPrQjLTeIQOPTuLKpSS9vitjc6jfHJ+SXhz7LANrvgKPPpYsH1JYn8kTk3
	bEPJOpeJvxvtMq+5DBMuJAsGxd9yxFfaXAClAJyGf826xgCEDxNM+NApwOEFxWBR
	mIdCKDpVwe713Mp1+iC3+gbUfmLDV7n/AqSWw1VdaXOo8MJ7r/0wDsuQ961Tddid
	V4y5CntEIYmouZ127oQYuy/8FzNQFSGV98h5CcoOea58WhYpuv+WdDiq7ew5rihS
	xvEwrKVscfK+Rv/ynqW1yUQeMv3Ymp5Pnlg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnumk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 06:49:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55153c5ef2so4147059a12.0
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 23:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758696551; x=1759301351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GoFlgJ5g0Dx0YykwX8eXzYBSwZlV7r9oQFh6hFuZis=;
        b=IEm4qYQ2PZZ9o4EU6MNOzpUpuoAWpZ0WfNJTK2C9kBURmD/ANOSthgm+4lu3swuSCD
         i6ouwfiNvKX8I9gyUzulspMU28H+wIWPoTwYSQlYhlc0VdowEjuM5y42/hMlLmfnlgnV
         xTsBY9PxlwYu5srX7rQw1d/reAVM5c8Ubzhnms8sYqTqwP07zmDNkStR+ZvwnfLxTiTZ
         zbh24E4Zbmx4F9gd+kENW/NVtjiBuTYMLx+YYhRJb7C0WEhxIhV/xObuxKaBs5U3neee
         29wBhPBIhn0aMT+P8yccU/WOkuxJt63F6rFyPsEEjJL1Q2iAb4oaBeiTbFPEK5v4GzLc
         UIfw==
X-Gm-Message-State: AOJu0Yzzaj7wePVjv2PIKgW3PxplEoPSP4ApQMzcQaZEFTFlLOAIstPe
	AWHeXzxKWxPXoYqtzXvpL+wj6+bdMZHB2PyUxwBhWbK/aj0E0eTE6pKOFt1Pj8A59OgejoA25of
	Z6FaZZIWGwXZI4NP6dW4hjJKq8VzWA61m8fv0sPO70J8vp8RD+xbMa/g4e+0K7PNGFRopeBWEOA
	==
X-Gm-Gg: ASbGnctX5We1w5EgXCx7p5V1Id2lX0rydp9D1z8x3H7fdIxlrH0tIjx2YunFM8LOh1v
	zOLC7MWr6Q5d+vonWFKug+C2dfGB43VtbfDnPuGLuCQOfOu/3I7uyJroMJSENBfI8pWHNB5vNK/
	lzWhDDFBdi4gYlEGrwvWVPNw6Eh9v9qak5EBDhrZi0/Dn1gPOxhNVKXEoRM3sU3Iyh7jFtRD1/v
	gj48bTH40ZeW0LW9N+dnuQR1xLzMaRM6La4jzRzIImFxF6tBLlP5NHYJqqsU+cIyzj0xBfE2DVU
	p5t/eMaZP7pmVui+ocujDoNFA/OlKHS5pCBFtguLH3FAU2FDVnjZQ3ImjKeZ
X-Received: by 2002:a05:6a20:2446:b0:24a:8315:7f3 with SMTP id adf61e73a8af0-2cff159a557mr7392900637.58.1758696551193;
        Tue, 23 Sep 2025 23:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnMJ9uAg1E/SfcqCIjWcL+nCjzCzowENgefXLM/l70qoWKFxb7sR5qB27rRKVXFwchm1fu7Q==
X-Received: by 2002:a05:6a20:2446:b0:24a:8315:7f3 with SMTP id adf61e73a8af0-2cff159a557mr7392856637.58.1758696550441;
        Tue, 23 Sep 2025 23:49:10 -0700 (PDT)
Received: from hu-wliu8-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm16283356a12.54.2025.09.23.23.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 23:49:10 -0700 (PDT)
From: Wei <wei.liu@oss.qualcomm.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        gatien.chevallier@foss.st.com, linus.walleij@linaro.org,
        namcao@linutronix.de, zhiqiang.tu@oss.qualcomm.com
Subject: [PATCH] Input: gpio-keys - fix misleading GPIO number
Date: Wed, 24 Sep 2025 12:19:05 +0530
Message-Id: <20250924064905.276174-1-wei.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d39468 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rTggg8t9TnRoL7-QV3gA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 1Lli_p1DWH6RQCYO_79E5nx2pafG_vpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX7Y2qxpap8oCn
 atH8ru8ED16/9efQoqf3SccZGy4ht1lWh6mnxhTYrcp7DfC3U4odfxpxkN3I4M0lexwjl1JjGdr
 Y8GrWDJT06nair1YFvIJWzpM4itWU7P5l4SRzRjjXvHLk5msb6x3Ftd8B5M32Pn8VJyfG4nM0/o
 dvrkyvhjRbpBc6QvHOLcqjx/Vs4TnqTUivIJnaIfhkMTAFIpv7kOsOSlAZfjraO9tI6gfm2igC5
 ssJ0VjMjTCqPjc4B6ZuYCJyCteVQvvy0roReb9SeiKEZtvG2TCq245htLaZgMwFLgR8CQupW58r
 /jR0Fe58Cd5qLdbwRSkmviNZi0i702XVdvsQw5UvX7aATbS2CSUALaKzVd1Kd+3ra0k2PQutDJZ
 mYxh6qAX
X-Proofpoint-GUID: 1Lli_p1DWH6RQCYO_79E5nx2pafG_vpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Wei Liu <wei.liu@oss.qualcomm.com>

The error log prints button->gpio, which is unset and default to 0
in non-legacy configurations, leading to misleading messages.

Use desc_to_gpio() to report the actual global GPIO number.

Signed-off-by: Wei Liu <wei.liu@oss.qualcomm.com>
---
 drivers/input/keyboard/gpio_keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f9db86da0818..243295a3ea1d 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -584,7 +584,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 				error = irq;
 				dev_err_probe(dev, error,
 					      "Unable to get irq number for GPIO %d\n",
-					      button->gpio);
+					      desc_to_gpio(bdata->gpiod));
 				return error;
 			}
 			bdata->irq = irq;
-- 
2.34.1


