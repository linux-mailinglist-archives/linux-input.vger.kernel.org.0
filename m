Return-Path: <linux-input+bounces-10543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A53C1A4F0B3
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 23:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3925188D55A
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 22:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605A41FF7BF;
	Tue,  4 Mar 2025 22:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D/jcaYBg"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7D1F4611;
	Tue,  4 Mar 2025 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741128415; cv=none; b=J8RYXTSXzjqwvVnlcboyfnC2lDveBwG4xnancIVJb++yTybgMNrJz9+KfE4EfZjPE2Tpu8wZYeTtdCJ+myV6YlLnEXLM3lVbrZPlyaHxmEyM1+Gn1nzhli/ZJIVx6mMqoLpUXzx28b15RZCKZaDxVRJmzJvt52ehecV0RPkDoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741128415; c=relaxed/simple;
	bh=v0g4BhzX+oxQUTu43WMPEeP6GZ8btdAYmtKYz+4cFHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QhEEVd3O4uE2VW8LaXmYOyvFK+XPWpPff7r+4LS9ErBEdwkfpqnbmAeaP09A2N4gZHZYrAsjY9mm9hWhybhQXgjDLeEiu18AZtFRsTlaPC/WF/jNSQ41rKLSIVUg+QAEavL6LQMgvZaphNMyYFcY9U6St6OkiG5o8ajtU7WQyrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D/jcaYBg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524Kio0i000988;
	Tue, 4 Mar 2025 22:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3NwIGTcVv3klJr/RLcrTlS8Yu+Du9AxTXUb6muo8eOw=; b=D/jcaYBgLoLOBV00
	30atQphosIV3bb+gin5IEbuDqLl9VQzDD0IXU8mQz+cOy8eFei7LqghxLy8V4aEO
	8tThITjPrIJkzmj4eI1uQNEch495xGUyYS59cOmWWXOl2C5QO3leyUAEzpUzVVcR
	ccekj81muoEpnd3kKbdMuB5rK+3oaRrs6J32K6iYw5Fe5pr6AXtO1Pm+7Gn3M6yw
	hIvZjrr1cj+sAjFnv0Mt+nEG8DWASyD0n9qPdHqJoqJPBt9hVMlcrcKlO0SZvx8f
	RitwiINpVd9iq4MSNY+OSHnuMmS9FxYxQLIef9EtaPdbPNRgE39G0vbxVRTBOJJ2
	ybPkYA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vkf5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 22:46:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524MkYrs002179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 22:46:34 GMT
Received: from [10.71.114.206] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 14:46:33 -0800
Message-ID: <ee5cb6bc-963a-4e31-8ac4-07120fb9ff70@quicinc.com>
Date: Tue, 4 Mar 2025 14:46:28 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v35 00/31] Introduce QC USB SND audio offloading support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Greg KH <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250219004754.497985-1-quic_wcheng@quicinc.com>
 <Z7W_Vz_kVDjIcp5N@linaro.org>
 <82ce69a3-d248-494f-6ddb-098f392c78a0@quicinc.com>
 <Z8a4WYq4GqWBVNyX@linaro.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z8a4WYq4GqWBVNyX@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Lbil9AyCLexrYewfigB777EYp9i9QjEK
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c782cb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=OF3dkDXz7wlyf22mrvMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Lbil9AyCLexrYewfigB777EYp9i9QjEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040181

Hi Stephan,

On 3/4/2025 12:22 AM, Stephan Gerhold wrote:
> On Mon, Mar 03, 2025 at 06:39:52PM -0800, Wesley Cheng wrote:
>>
>>
>> On 2/19/2025 3:24 AM, Stephan Gerhold wrote:
>>> On Tue, Feb 18, 2025 at 04:47:23PM -0800, Wesley Cheng wrote:
>>>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
>>>>
>>>> Several Qualcomm based chipsets can support USB audio offloading to a
>>>> dedicated audio DSP, which can take over issuing transfers to the USB
>>>> host controller.  The intention is to reduce the load on the main
>>>> processors in the SoC, and allow them to be placed into lower power modes.
>>>> There are several parts to this design:
>>>>   1. Adding ASoC binding layer
>>>>   2. Create a USB backend for Q6DSP
>>>>   3. Introduce XHCI interrupter support
>>>>   4. Create vendor ops for the USB SND driver
>>>>
>>>>       USB                          |            ASoC
>>>> --------------------------------------------------------------------
>>>>                                    |  _________________________
>>>>                                    | |sm8250 platform card     |
>>>>                                    | |_________________________|
>>>>                                    |         |           |
>>>>                                    |      ___V____   ____V____
>>>>                                    |     |Q6USB   | |Q6AFE    |
>>>> |     |"codec" | |"cpu"    |
>>>>                                    |     |________| |_________|
>>>>                                    |         ^  ^        ^
>>>>                                    |         |  |________|
>>>>                                    |      ___V____    |
>>>>                                    |     |SOC-USB |   |
>>>>    ________       ________               |        |   |
>>>>   |USB SND |<--->|QC offld|<------------>|________|   |
>>>>   |(card.c)|     |        |<----------                |
>>>>   |________|     |________|___     | |                |
>>>>       ^               ^       |    | |    ____________V_________
>>>>       |               |       |    | |   |APR/GLINK             |
>>>>    __ V_______________V_____  |    | |   |______________________|
>>>>   |USB SND (endpoint.c)     | |    | |              ^
>>>>   |_________________________| |    | |              |
>>>>               ^               |    | |   ___________V___________
>>>>               |               |    | |->|audio DSP              |
>>>>    ___________V_____________  |    |    |_______________________|
>>>>   |XHCI HCD                 |<-    |
>>>>   |_________________________|      |
>>>>
>>>
>>> As I noted on v34 [1], this version is still missing instructions and
>>> changes needed for testing this series. The device tree changes don't
>>> need to be part of the same series, but there should be at least a link
>>> provided to give other people the chance to provide Tested-by tags.
>>>
>>> IMO we shouldn't merge this series without those instructions, otherwise
>>> we risk that this just ends up being dead code that no one can use.
>>>
>>> Can you please share the device tree changes for a board upstream and
>>> any other changes needed to be able to test this series? E.g. for
>>> sm8250-mtp.dts, based on the examples in your cover letter.
>>>
>>
>> To clarify I'm testing this on sm8350 in recent times, but utilizing sm8250
>> definitions for the ASoC platform card, as the platform sound card is more
>> or less the same between the two SoCs.  Back
>> when I started this series, sm8350 was missing a bunch of dependent
>> components, such as aDSP not being loaded, and missing platform sound card
>> definition, so I had to define and enable those on my own, which required a
>> slew of new DT nodes, hence why it wasn't as straight forward to include
>> the DT definitions yet for sm8350.  Not thinking that this series would
>> take as long as it did, I was planning on separating out the DT changes in
>> a different series to enable offloading for the devices I have tested with.
>> (sm8150, sm8250 and sm8350)
>>
>> There's still a pretty big chunk of dependencies missing from sm8350, so
>> those would also be handled in the follow up DT submission.  For now, its a
>> much bigger hurdle to get the main/functional changes in, and that was
>> taking a significant amount of time from my end to manage.
>>
>> If you want, I can give you the changes I have offline to enable this for
>> sm8350, since I haven't spent time formatting/prepping the changes for
>> submission yet.
>>
> 
> Can you push it to a public branch somewhere (e.g. on CodeLinaro)? I was
> talking to some people from the community about testing this on some of
> the smartphones we have in upstream, so it wouldn't help if I just have
> the changes privately.

Which CLO project/branch did you want me to push it to?  Sorry, I haven't
worked too much with the CLO open branches.  I have an account though.

Thanks
Wesley Cheng

