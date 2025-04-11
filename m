Return-Path: <linux-input+bounces-11737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD6A863B3
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 18:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B5D16ECF0
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 16:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A125821D5A2;
	Fri, 11 Apr 2025 16:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jzvR40yO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD72719CC36;
	Fri, 11 Apr 2025 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390095; cv=none; b=Ako4ptKoMjV84kNq2ddpnuOnyT0foArWVFnfxvHojC034I1iiOqG4ueFntKOF5r65BcFqgtRzbMJ0g6LrKT/mYCQbnwOdZVQhqH0AsHHv6vM1W+PF4QXfKn2VTn+9uugfrjhx+sJOHhcLHNlonK4UfWzq0kehuQhY+NYH+No0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390095; c=relaxed/simple;
	bh=wa+AVNQk+IQmGfijqRyLsj77653kD6hhJ1b2CemESKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uKeLR8VzpEDBlvpsxVarVqWfpkEzJ87yPX3M0TqjHxyXuHU5GPFm6b05BZyA65qN3IQWLtbP9gQ3aYn2R8tq70qnOZ+aq/Gcg0qdHmHb/qlUqbm0bn+bXCAjwtuqjYv2cxkoRVrEoj/Syw4cPqb8r4fbdgiRqNvJalEvCtX+ZqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jzvR40yO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFaraB032525;
	Fri, 11 Apr 2025 16:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxSIL024YDdH3noxg9Rt5OG8c1CjMIkSVCfzMQ9iUAo=; b=jzvR40yOJgbc1vTZ
	T40ditOiQkBc5zCStqPVrNyTCEcd1lFiqbYYU0KHUu6n1IMm/q1vztooHJqhQ4Sw
	dys5WnAJ9UI4RKuD1DUaCeZnQXGLJqNYxFadHtaMYbFmngeOOKkN9abBDsg21eQ/
	p2dq6NZ5025Dua/XroA/8ZtChOw9AeEbCIo1Vkn7gslRIOUjv1h1ed5DfEaS7oQH
	wd1yfrCWyh4bu9Tfp1hg+TZzHQCpze8dV+aq4wUQYz6lW4km+GlPpjf8WA7Th7+j
	ChkD/9+aAiDZZPKNQXKftZbZd41ToyYEGuVZL5TP+A8mLLT3yu766aBn+YyyCPfZ
	d88eJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfktusf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 16:47:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BGlsqu029526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 16:47:54 GMT
Received: from [10.71.112.82] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 09:47:53 -0700
Message-ID: <2efdc7ef-adc1-4316-adbc-ef25db7c7612@quicinc.com>
Date: Fri, 11 Apr 2025 09:47:50 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
To: Greg KH <gregkh@linuxfoundation.org>,
        Stephan Gerhold
	<stephan.gerhold@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <2025041029-oval-cavity-7896@gregkh>
 <2025041144-imitation-reappear-a0d9@gregkh> <Z_kNr52hM-iWUgyZ@linaro.org>
 <2025041152-eternal-harmonize-d608@gregkh>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2025041152-eternal-harmonize-d608@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1a38mqELc9Yx_-XevlOZ1O78PQHDv81z
X-Proofpoint-ORIG-GUID: 1a38mqELc9Yx_-XevlOZ1O78PQHDv81z
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f947bb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=5j0JM0_CJDOIDA5IkhwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=711 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110106

Hi Greg,

On 4/11/2025 5:54 AM, Greg KH wrote:
> On Fri, Apr 11, 2025 at 02:40:15PM +0200, Stephan Gerhold wrote:
>> Hi Greg,
>>
>> On Fri, Apr 11, 2025 at 01:04:37PM +0200, Greg KH wrote:
>>> On Thu, Apr 10, 2025 at 09:11:42AM +0200, Greg KH wrote:
>>>> On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
>>>>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
>>>>
>>>> let me give it some 0-day bot testing to see how that goes...
>>>
>>> All looks good, so let me go apply this to my usb-next branch now.
>>>
>>> Thanks for sticking with this, I think it deserves the "most versions ever"
>>> of a patch series award.
>>>
>>
>> I have honestly no intention of blocking this series any longer, but the
>> comments I raised on PATCH 26/31 are likely valid and suggest the series
>> wasn't fully tested on v38. So I would personally prefer to get fixes
>> and confirmation on that from Wesley and then merge v39. It doesn't feel
>> like the kind of thing to fix incrementally on top, since the commit
>> message is also misleading now.
> 
> I think a fixup is probably sufficient, especially as I can't rebase my
> tree, and reverting all of these is just a mess.
> 

Sure I will submit a fix up today.  Thanks Greg, Stephan for the feedback
and help with the overall progress of the series.

Thanks
Wesley Cheng

