Return-Path: <linux-input+bounces-10067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB21BA36B8F
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 04:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F0E3B1B8F
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 03:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22371156C7B;
	Sat, 15 Feb 2025 03:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SWra07Jl"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3C1426C;
	Sat, 15 Feb 2025 03:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739588861; cv=none; b=GXrA4ipBpQXD8NAWB8OdvEB24Cuk2IxCyHtQtfvwMwrkUxA8QfkWhaG3rxx+uMw888a/0RrUw1rDBaAxNiMCLI2J0j4xY8dCstISnwnuhgjupmigaJauLrnGpxdf1ssD38PPa/YqImR+Hxax3at5nhH1A4uJIo/ZoOgx9sFruV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739588861; c=relaxed/simple;
	bh=BsEFd0nMBYcKbEwAaxPfqO35YA616+80GQv4XEcbPug=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l1iZd7mfxc85sSV5cXwlvrCFZ0AwFCvd65az76SDj4/tdVtZZQzebp3++EDFlMYrxFiWS4XIBG9nQUFV5biTKta1v8EjpwMuuQb61AiqOIBtHGMRYrN/56LL+4S4QJWPH8Hwr4/eV95JVgusSKhoUikrikT2ghokvX388PxPr2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SWra07Jl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51F0gJ0s015429;
	Sat, 15 Feb 2025 03:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3T2QF3jiYcbzXCw0nOvWdlOOTQQmzMO7KkVzoHdBAUY=; b=SWra07JlwWsjG3XG
	oK9YTASBwwKX9ysFequ8oYqL4Vz58P0r21/YkeaFX/yF9aDPo+WjeQx5VcOaJ8QE
	eBGUU84QoPxJxI/uD3VQrq4HIisjv4NLNaXEEKR/bHqC1x1eYB6kzdVfw1AQUx/M
	SroeA/zdv5Um5alcy00Yr5hQt2vCUz+CoO3g3H6Jojx8osfg9coNaCVp47/2J8Qy
	3zWx1uoEIrg3SY8GhkifZafBJ6fItakXkyvYEgcuefTxJCleWC5JCgeCanLLWqPy
	vjS3iied/ilz1lOtSAP5P5OHWYOAbts6gKX5qdveSv8ThBMHFRyPzZLgGcEdh0jZ
	eGcQKA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebndfdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 03:07:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F37LXk012049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 03:07:21 GMT
Received: from [10.71.115.190] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 19:07:20 -0800
Message-ID: <f5dfc875-d5bd-49d7-b998-6d25f59e849a@quicinc.com>
Date: Fri, 14 Feb 2025 19:07:15 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v34 00/31] Introduce QC USB SND audio offloading support
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
 <3b9447e2-4be8-479b-a418-5fd45369fb55@quicinc.com>
 <2025021413-favorable-manatee-6859@gregkh>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2025021413-favorable-manatee-6859@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G6IZ9o_1LHf3EbIqbqHfBBzEU7Uo4fx8
X-Proofpoint-ORIG-GUID: G6IZ9o_1LHf3EbIqbqHfBBzEU7Uo4fx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=779 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150025

Hi Greg,

On 2/14/2025 12:33 AM, Greg KH wrote:
> On Tue, Feb 11, 2025 at 12:35:23PM -0800, Wesley Cheng wrote:
>> Hi,
>>
>> On 1/21/2025 1:04 PM, Wesley Cheng wrote:
>>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
>>>
>>
>> Just seeing if we have any further feedback on this series? Thanks.
> 
> Given the lack of responses, and the huge number of iterations of this,
> I've applied it now to my usb-testing branch to give 0-day some better
> runs at it.  If it passes that in a few days, I'll move it to my
> usb-next branch for inclusion into linux-next and hopefully 6.15-rc1.
> 
> thanks for sticking with this!
> 

I saw that kernel test bot reported some sparse errors.  I had some issue with my config and looks like sparse wasn't actually scanning the files I added.  Will fix that and resubmit another rev that addresses any errors.  Apologies for not catching this beforehand.

Thanks
Wesley Cheng

