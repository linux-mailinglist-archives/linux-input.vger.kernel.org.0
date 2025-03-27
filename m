Return-Path: <linux-input+bounces-11318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DAA7366C
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 17:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B3C2174297
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 16:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2F819CC11;
	Thu, 27 Mar 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NrShe43z"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9572E19F115;
	Thu, 27 Mar 2025 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091958; cv=none; b=W4vPW93Q2wc7HKZvumauo+N1omzgy9bHZH8tqT2hRaSLlgs6BKVxxOc4Je/j0VajkASfsrVUeSMIRJ0Pw3nyBlm243N6h7G/E1F7Pq8KWnacZ/VIw24XQRFdQztM6exSrm0hdkfntc39fsjkOytZpRtiifl+0rCqSBYD41ZrXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091958; c=relaxed/simple;
	bh=LZ+n3jvrWXEe3JYdA7aqvPpBArjNbfn+MKiS7jovIFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZVZ0m8JwNXEl7XGMfuSKlkyok+naF7dc6FzqfGBpkJJT2KyXOYol0IGscZMUTQfZMgyo5n6BCc8SuT/694eG/EmtgRxGN7cgsO0+r21yB0BQwerwNGQVPQ7kCMpaeYy7uLHCDNpQ6liIu9ZPcNLZWTwlg0i5KFbbHRFk1x2aQAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NrShe43z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REfBhV013285;
	Thu, 27 Mar 2025 16:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iqq5avW0+1sLCZczfNr3CBGpc6aR6FbWfWSBDPMZlsk=; b=NrShe43zwaBLaSpb
	prqGmyqHiJY4waqWGwwqyE3W0OGpMP8CMT3k7GRYxzx30oIQZ94TgiQP2BBwuRrt
	Xxs9k0AbajOR5bz95BgxbpXajDq3htaeJuB2fTZTxN7WN/UBZx2nlFnOeRuc8MB6
	lj6QQEAkhZbLawmUUw90GQx8XWrK0nzp6LWq3HuYxS7Hw++9mfiQKgIuqhCLMA4L
	3BqlmevbB1u8QNcF1jBET+CLsgzNcNc6+UEw7aY5+o/Q11sMoxXqLtqR1I8OgyEH
	hhXkpkJ1G42V2X+IcNEwYH17aZgr8zl4vlGAHhELUE/XpLdrEl0JwQO1yTgQayyy
	Y6ehUA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutkhhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 16:12:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RGCHIe032316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 16:12:17 GMT
Received: from [10.71.114.104] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 09:12:16 -0700
Message-ID: <87746e66-84c1-4ff3-8b69-fbee1664eff6@quicinc.com>
Date: Thu, 27 Mar 2025 09:12:12 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Puma Hsu <pumahsu@google.com>, Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com>
 <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh>
 <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VKu6mly6uDVxrTZ_4qep-1yzn1tKWQKe
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e578e2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ag1SF4gXAAAA:8 a=J1T5opX5dgJ5NFXlbwAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: VKu6mly6uDVxrTZ_4qep-1yzn1tKWQKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_02,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270110



On 3/27/2025 3:14 AM, Puma Hsu wrote:
> On Thu, Mar 27, 2025 at 3:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
>>> Hi,
>>>
>>> We have implemented and verified the USB audio offloading feature with
>>> the xhci sideband driver on our Google Pixel products. We would
>>> appreciate it if this solution can be accepted. Thank you all for the
>>> work!
>>>
>>
>> Great, can you properly send a "Tested-by:" line for this against the
>> 00/XX email so that it will be properly saved?
>>
> 
> We(Google Pixel) only use the xhci sideband related changes and two
> changes in the sound card driver. For the details, what we actually
> tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> send the "Tested-by:" line to the 8 changes above? (I added
> "Tested-by" line for this [01/31] first.)
> 
>> Also, I think a new version of the series is coming, can you test that
>> to verify it works properly?  We have to wait until after -rc1 is out
>> anyway.
>>
> 
> I think this v36 is the last version of the series as I discussed with
> QCOM Wesley. And for sure I will test it if they do have a new
> version.
> 

Hi Puma,

I'm discussing with Stephan on the QC specific stuff, so the common changes
won't change on v37.  Please provide your tested-by tags for each commit,
so I can carry them accordingly on the next submission.  If I do end up
making changes to any of the common patches, I will remove your tested by
tag, which means you might have to test it again.

Thanks
Wesley Cheng


