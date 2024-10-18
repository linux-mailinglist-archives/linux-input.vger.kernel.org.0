Return-Path: <linux-input+bounces-7515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E25CA9A3192
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 02:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A591728471E
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 00:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12DB2F46;
	Fri, 18 Oct 2024 00:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RX9Ouqrq"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FC72F29;
	Fri, 18 Oct 2024 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729210062; cv=none; b=p+/22HvTwi3Hx0KLc+zs8ht6bcT86kE7MVQMYX800nvkfIXh7yBgJdSaimAi0NoGznWDIMkOGGF8Ar4yIS8yTfQtHY5Cu3Hb3ewfn81TPiK96FuGUz+XDOfhDaNj9siM4CJ4y1JvQaT5WkoD+1kaoinXl/SpMs7i+mBHTUEWEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729210062; c=relaxed/simple;
	bh=D9ULUqk+TbUqMTKGR0bFo25YiiZ2cs6nBE1a1b8WqFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YdYec5faevHtXowN9MxcrRc4Umqg616XfKG4Vn9DjkHEh6oqBy2/8tdvgMT73kUkTs8UPK/WwVCUYdy6f73qp3dmhtOkyXVney8BgyovzFS6dzxQdhkPU2f6UrMPKt+FPtCBg6gyluFW55Ae07dhSDFA51EZIXCu0zFLH7+Ekfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RX9Ouqrq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HDcuMX016699;
	Fri, 18 Oct 2024 00:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxBavpTgL71vWYYy2sA8sf5j3chQYVV9GD147SGaeIE=; b=RX9Ouqrq4NFVay6j
	q4ttG0ZDVQRxiFHqWMz1ETLYdt9a14mSskOsu4TE50T7xoN7Yz1fi1sDfPZMXDCw
	Nid3g40KR97d0eIZ6brHzq3xJa0t7AKSCcSoS1FsTDUta85y2SVt5RKKQm0XC+UZ
	ftQLUofQozfcyUcqlpajRTWKzTMpeConXTyXCrqh/KO8LjdXl+5S0psOcWaD3SwG
	eOo+yjKkMRzwm4hTVhc4CuOPc0GaEqSVtAgn1QRp3uyc4I+1HGARPsbBQgpR7NKS
	e8ZqYMKHlVOTbVP2mGtD6UeD4JYw2esaE4AGL3vN9Ffk9mC3fy0oma7dgzZ3FTyN
	IRBG3A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6pdcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 00:07:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I07EUv021198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 00:07:14 GMT
Received: from [10.71.112.85] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 17:07:13 -0700
Message-ID: <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
Date: Thu, 17 Oct 2024 17:07:12 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation IMOD
 for secondary interrupters
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
 <2024101747-defog-squiggly-ef54@gregkh>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2024101747-defog-squiggly-ef54@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IbNrRGE8x9UV4v1k3a1frmTMQ3tDVf0N
X-Proofpoint-ORIG-GUID: IbNrRGE8x9UV4v1k3a1frmTMQ3tDVf0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=607
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170163

Hi Greg,

On 10/16/2024 11:40 PM, Greg KH wrote:
> On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Allow creators of xHCI secondary interrupters to specify the interrupt
>> moderation interval value in nanoseconds when creating the interrupter.
>>
>> If not sure what value to use then use the xhci driver default
>> xhci->imod_interval
>>
>> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>>  drivers/usb/host/xhci-mem.c | 8 +++++++-
>>  drivers/usb/host/xhci.c     | 4 ++--
>>  drivers/usb/host/xhci.h     | 5 ++++-
>>  3 files changed, 13 insertions(+), 4 deletions(-)
> This is already in 6.12-rc1, which makes me confused as to what tree you
> made this series against.

Sorry, I didn't fetch the latest changes from usb-next.  In this case, should I rebase and resbumit?

Thanks

Wesley Cheng

> thanks,
>
> greg k-h

