Return-Path: <linux-input+bounces-8343-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF29E09B2
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 18:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BE8DB34C81
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 15:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD74A3D96D;
	Mon,  2 Dec 2024 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C4TYS1Us"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFEBBA53;
	Mon,  2 Dec 2024 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154398; cv=none; b=RlM74gcqgK0Chq2mvBMHpggr+MAiuI9QpsCzd8uzPnXu3buHTMFNRAdEXfQF6PVDPaCGYAUd2h93GZY579qJP1wplImiOJTuEEiRHiCnossnlsa15RE+cWjTaXSc4CZdTTzN+Xvf8tudqnRtVWXni+nsFX3tVDRe8Th68cjchDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154398; c=relaxed/simple;
	bh=KkbmJ/0wUFhwA7bjHSghg85dmdpPXJnyMoZLc288wGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Oiail1W7wPShDxHYb7qMv8NSrPdGZJBFn/DrqkJvW5U7Ql4LsOcxapxQN/hQNlzWwboTv2lzMWkfMKkSNm4ZGpc9d7VLrE6jysoanOAsLm5ndHvoc30Xpb5nkX8AaqmHp5fHXVq40uNAUMvV1KafaaKXjz4AoOvhP1icbPrkYHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C4TYS1Us; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28lSlB028149;
	Mon, 2 Dec 2024 15:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZqfzFnoinYb8hXvyVjaGDwr8pEj/sloniKe/f3uz+A=; b=C4TYS1Ustp1jxs60
	Wtgd9JIg1qGQJ7DehkReoJC65U4n8EpfxICVbODI2QT1lSzYwKSJQ5Qg2FQY1xnR
	W9pR5H4Y+2wYiTnelH/OyJ5tPLxaMM22ObQCGHVI8aOHYXxPsVScWVolPC/PweBd
	x7VNV1+Kvq4V6agMNJWwUVxEHNfevriJkiDGBjHAwGZN8/zeivADnBLJ4HKK4Q/L
	2kHE2XxH+29cvU2tHrd6U5KgmPF1QpOm5yDdHyfzMf43A72M2UiFMTdYIyDo1T6U
	7+Mi85ZjzNoi6dvjGqqSQRtK/ZLSMCqIviQJirzmnk8w9GU/llobpIA96/PYiRP0
	Ua75vQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mwgtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 15:46:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2Fk8K0029779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 15:46:08 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 07:46:07 -0800
Message-ID: <626c3135-9d8a-4e22-a3ad-6b637cbbd463@quicinc.com>
Date: Mon, 2 Dec 2024 07:46:07 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
To: <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>,
        Sven Peter
	<sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Dmitry
 Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>
CC: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Janne Grunau <j@jannau.net>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-2-76cc59bbf117@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241128-z2-v2-2-76cc59bbf117@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fkhK5wsaq_hXSjnF0-8oIRRhsx6pzl93
X-Proofpoint-GUID: fkhK5wsaq_hXSjnF0-8oIRRhsx6pzl93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=870 clxscore=1011 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020135

On 11/28/24 14:29, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
...
> +MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("apple/dfrmtfw-*.bin");


Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning when built with make W=1.

Please add the missing MODULE_DESCRIPTION()


