Return-Path: <linux-input+bounces-8148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6D9D2D07
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 18:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33FC8280FBB
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 17:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C441D2F56;
	Tue, 19 Nov 2024 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="psOrmQmI"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921F1D2F4E;
	Tue, 19 Nov 2024 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732038690; cv=none; b=X4BHJwEp8uIgZCpsXSSMTlj7uttqoJM5ZLq8fw0K/g2xYKHltnhJc9LLuAuQiYMP0W9rDhBwIjA/Q895dLbw8TWMg4QvalhAMTmleIbnRunjzA6zAtxpbt47jnclV9L9VbPEasq+iPQWwGQke0wO06kK/U7w5t7iUcvXrVa37ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732038690; c=relaxed/simple;
	bh=xBMFegjNkus0JpTIZETJYTQf6n/Qx03PTCo1stoNYy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pOMZAZe2PPNy43PiXEZWSgBbM59JXMCkNFszDxG0kD1UzBbhFoUGU7pDFfiTGIqwq0nUvP9SjVE3VVo1mHLkq6nvE1y7Xfj+Ozg+UrqVSHhYDn1zF8GAmaZjabdqLaq1wdUfjKfolZvR8AXzVMv4IybFqesDr1IHPba07XJmg8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=psOrmQmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJHer60028573;
	Tue, 19 Nov 2024 17:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xBMFegjNkus0JpTIZETJYTQf6n/Qx03PTCo1stoNYy0=; b=psOrmQmIPUJpFanx
	fv4M0ZXCaOrz8LfH1A6TWiUxzOowcMO3EdJsD+c6vQTbL4H91kf6jhITuuBAcVM6
	Udt0ZfsVoNwpiTmBJq2DO9/r1TR41Xwbzz7PZJgKNj2VLQCMJZCP3WHfQmTtYh9y
	iMybl1jFMLzUlfd+yzQqgp6P6R4QlTsbJhXpom+TZcBcq23LtJHpDICdX5gQDI1Z
	69UCGEsl94dbN51/CUqb5b8B1eyzZEhO6XuRe5EPGwZ3vTkdDzh8z3Eydu6qlEvD
	VXLETdBLpYFe7gCYUBPJnsiz0e6ZCgX/1ZGCwSqmAWOfXIe2xKcRgUI8TzBAba+h
	mxZXrg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y5uc1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:51:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJHp7F2025626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:51:07 GMT
Received: from [10.110.84.1] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 09:50:54 -0800
Message-ID: <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
Date: Tue, 19 Nov 2024 09:50:52 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2024111655-approve-throwback-e7df@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pKjXw9S6mKWpmx0A5iA_3JA36dS7lRls
X-Proofpoint-ORIG-GUID: pKjXw9S6mKWpmx0A5iA_3JA36dS7lRls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=936 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190132


On 11/15/2024 11:42 PM, Greg KH wrote:
> On Fri, Nov 15, 2024 at 02:42:47PM -0800, Wesley Cheng wrote:
>> Hi,
>>
>> On 11/6/2024 11:33 AM, Wesley Cheng wrote:
>>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
>> Are there any more clarifications that I can help with to get this
>> series going?  I know its been a long time coming, so folks may have
>> lost context, but if there are any points that might be blocking the
>> series from getting merged, please let me know.
> I would like others to review this (xhci maintainer for one), to give
> their blessing before I even consider this.

Thanks, Greg...Yes, I was hoping to see if I could clarify any points for Mathias and Takashi if they had any concerns.  Just so folks are also aware, we did deploy a portion of the series (specifically the XHCI sec interrupter and USB SND core changes) into devices on the market, if that adds any confidence into those changes.  For the most part, there were no major issues within those drivers, and the single minor bug (in the XHCI sec intr) that we did catch was fixed in previous submissions, and should be highlighted in the change revision list.

Thanks

Wesley Cheng


