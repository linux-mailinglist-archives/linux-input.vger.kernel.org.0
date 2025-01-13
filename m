Return-Path: <linux-input+bounces-9210-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D1A0C5AA
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 00:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6676F1682EC
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 23:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1C91FA143;
	Mon, 13 Jan 2025 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dVy+aiEO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48D1D61A2;
	Mon, 13 Jan 2025 23:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736810896; cv=none; b=BuZFCWhjTL1PWzkngUBXs3vK9JWR7yNJgt1gH0GQp3qWqzYaF+B2PB7PRnYsTtXoV80UC54Cmh3YjIba4Hz9yyWzd4mYNm5jUFu/Xvd2h53ik6tzJ5toUAhI/8bSNvppY1RBszI8lzG64M6jHVw9MZa3EnE3+I7+oufJ6/d2obQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736810896; c=relaxed/simple;
	bh=qnML/MjmfWbEVuGNTbx209LYPz08WZNs1swxEtBqmrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OGWBmXXHdzZV8Ak2KnXJJWlbS6KFub95t+JVaGb6UVg9bgbFPCOpfEq7YvPsDvYnn8ow+67k/ibZHLGhAy2Fjf6gWpCdZ4lXdT2X3SWj2qEfjcCixzFkxztslJ4zr7pQGcwyLj4VkgYrpiiOZSUyofSKxJxC4WlVuL9o9aD46YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dVy+aiEO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHDiJe014953;
	Mon, 13 Jan 2025 23:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnML/MjmfWbEVuGNTbx209LYPz08WZNs1swxEtBqmrI=; b=dVy+aiEOCg6Whv5A
	CcKmWRzUUlilHFYXD+lL05q68lYC9GIYqjdgkWRmcUb5TO4//2dS79r6EKXIR+71
	LtRzOFU4PctsHgXDi/N7wdAJhuvF8lERSy8iiDdH8pi0NrOgqOWymiemLXp8YvYz
	Ph+VcsIsGt58ALEYomPFJECeRFnfDZboeqRdRmwXALFwnD53ruX82+/zLRUSoPRQ
	3PzNyIGl/8yvsBG0e02e9CY7vIfB0eSWBgdSU4B+IDvlFwRJQ2BgIxKJg+DICEIa
	bI+NKRPPUey4JPxn5YKTdPIYx463MwVnMexkpdCoSTUTak1t0eouT0nQ9EBKjAvk
	OcJDsw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44571yrrme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 23:28:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DNS2NJ011042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 23:28:02 GMT
Received: from [10.110.66.138] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 15:28:01 -0800
Message-ID: <060a6fb1-05a6-488a-aba2-64d7bc8693df@quicinc.com>
Date: Mon, 13 Jan 2025 15:28:00 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v32 02/32] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
 <20250108012213.1659364-3-quic_wcheng@quicinc.com>
 <b029c775-a0cf-4991-95b7-a02187c0863b@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <b029c775-a0cf-4991-95b7-a02187c0863b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: akqRraIlZUG8tlhrebYekkqcbiiDY1kA
X-Proofpoint-ORIG-GUID: akqRraIlZUG8tlhrebYekkqcbiiDY1kA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130184

Hi Mathias,

On 1/8/2025 6:10 AM, Mathias Nyman wrote:
> On 8.1.2025 3.21, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Introduce XHCI sec intr, which manages the USB endpoints being requested by
>> a client driver.  This is used for when client drivers are attempting to
>> offload USB endpoints to another entity for handling USB transfers.  XHCI
>> sec intr will allow for drivers to fetch the required information about the
>> transfer ring, so the user can submit transfers independently.  Expose the
>> required APIs for drivers to register and request for a USB endpoint and to
>> manage XHCI secondary interrupters.
>
> The "sec intr" above should also be renamed back to "sideband"
>
>

Sounds good, will do...


Thanks
Wesley Cheng


