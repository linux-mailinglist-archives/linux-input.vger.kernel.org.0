Return-Path: <linux-input+bounces-9081-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6816A06639
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 21:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AEBF3A72CC
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 20:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665D7202F67;
	Wed,  8 Jan 2025 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KY33ogob"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F1320126A;
	Wed,  8 Jan 2025 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736368425; cv=none; b=CL0As6fAk8kk6Z4BHPMv478DVb9cfxr/WzIrPrNZgDBWXiZNAwzo1M2j0K5FCBmr00LvQgb0SWs92w6Vw1Uy5pQYO5wwlEIO67JNkRNmg2eA18OBakHta6KElRkjPwOcy+JEWOjvIOYe48rUvJ5NOru+GfOLR/D0IqiWYC/5xpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736368425; c=relaxed/simple;
	bh=8lLqropqEcU0FdGW/MRNj8mjGkDzyxZe+T1gGsw1v2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oU4L83ChXxDbjo6pjpPoRc8OrYfL5VzrmREPMb54twNZH8hWXUGjpNR2vXVk84Vkgg6pWBwawty0ro6s+fIDPRnaomKgGRDTbSqT8jNzIxM8GSRwQPP+126piJd0s7Y83yVmFpXC/IFcfA5+XGZ+xRve6/YVX2sT9VHZZqEcXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KY33ogob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508EmENC028206;
	Wed, 8 Jan 2025 20:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lLqropqEcU0FdGW/MRNj8mjGkDzyxZe+T1gGsw1v2Y=; b=KY33ogoboEb81TD3
	e5T3gaIDmGuhY9HCW/RjaDIAShLEActXm+o1zcoZQHqMdmkY7JAztyBag4e2u7W/
	GhGqgkRsR5twyaUKpU5iRh2bFBstw/bMoyi0IG8JTGtIQvJk4ruTMpOwBwIFiTG7
	lpuYbq2EPT+Qt2aQgDlIkt4FtshLcCNafrZMRjpejG1NA35/2NziU9ZTzpkLm+jd
	I3+Wy5HumR7s3pwnv/djSL+8hcBtRDog/069/sAPbjtEiyOSpzIooYiEv6ml+eXp
	UJxrcIt/HXp2zO+NXD8i393k+j6AhohfYI9C8dNlmhyi8rSJ1BrQI8ERzRKiSyxT
	lldtzA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441uefru2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 20:33:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508KXGDK010892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 20:33:16 GMT
Received: from [10.71.114.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 12:33:15 -0800
Message-ID: <90f16650-933b-4ad8-8ee9-9d1b4aebecbf@quicinc.com>
Date: Wed, 8 Jan 2025 12:33:15 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v31 00/32] Introduce QC USB SND audio offloading support
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.dev>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241213235403.4109199-1-quic_wcheng@quicinc.com>
 <f5e5ef90-f9b2-4d0d-b127-b3f2490fbdc4@quicinc.com>
 <2025010713-stack-recycler-7f05@gregkh>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2025010713-stack-recycler-7f05@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XlEgttEZsXkM4jDaYJ-XUa9i8SmVuv6H
X-Proofpoint-GUID: XlEgttEZsXkM4jDaYJ-XUa9i8SmVuv6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 mlxlogscore=609
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080167


On 1/7/2025 2:32 AM, Greg KH wrote:
> On Mon, Jan 06, 2025 at 03:02:37PM -0800, Wesley Cheng wrote:
>> Hi,
>>
>> On 12/13/2024 3:53 PM, Wesley Cheng wrote:
>>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
>>
>> Happy new years to everyone.  Before sending out another revision to
>> update the year for the license, did anyone have any feedback yet for
>> the current revision?
> Let's just send a new version and if no one complains, I'll queue it up,
> I feel like this has gone on too long...
>

Sounds good.  Thanks, Greg.  Submitted v32 with the updated year.


Thanks

Wesley Cheng


