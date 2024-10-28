Return-Path: <linux-input+bounces-7747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C499B38D9
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 19:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9DEF1C217B8
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 18:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8931DFE00;
	Mon, 28 Oct 2024 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SZRcYieq"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B31DF749;
	Mon, 28 Oct 2024 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730139157; cv=none; b=hr9TfUuu7LCB9J+N9ZHqziRY0N5XhvfrasVqX+G+eum7Ou8G3Kkt3w472Vdgm/kooZi7VVdzhywNSHtnABHjTOoqViqn5+dmW3v1AqFqNIVKL1xu0t7ycrkO96JPBq6tjeyp+IcuozGbEbcTWZAG8IybDRC8krQbZ0XbryMbaHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730139157; c=relaxed/simple;
	bh=sEUoxC02iCpTxcYJhl7YWFX1HCD6NzBw0eWUjpJiVwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sKCeEubkksHf8hNBZ2PXE5tnDu33GGCN1VlKiZPUyUVJAJFqUC23J6yB9tRoaL5oOTy8labF863NY5NMxBr7e20RU3Q6VcCd94j5pNfNL2GFG1hGqI85ubNE15dXUMzp8qUFSh8rtjJRIu5hbZeOzm8Cy9s7W4voZP2p7wl9qBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SZRcYieq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SAv1pG005093;
	Mon, 28 Oct 2024 18:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEUoxC02iCpTxcYJhl7YWFX1HCD6NzBw0eWUjpJiVwg=; b=SZRcYieqr1duO6jN
	yNPU+IPfmU5epd+/o81r40LC4ldLZCIxxkZjlAkUm0IpqlMxvPWXcCU1XBkzNRaC
	TP7nTfoabSBoIEFd9oUJxyH8ssxT3RMVVy6b1jtpFrGzR4Qr9S53G356VCRfaWGR
	e0AnvtjH6VYpYYPfGf1XC09U3+7KSWJYNeVHPyXSb/F5vqb519sM99cu5UY56mKi
	nLQWpX+LNtMePMDN4WQu5efqc5IUJX7MFL7F5AKVFzVhpOnpRjh5Yo1iOH3bw7nE
	D/KHDSkVLNE3b5W37aYUqFwulXlJTuqei1PCdAs0SH8ah1ZumWVhoYwIz0PpMB8r
	sMF64w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8dw7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 18:12:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SIC861013622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 18:12:08 GMT
Received: from [10.110.31.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 11:12:07 -0700
Message-ID: <8f6e35c0-8cd6-495d-92ad-21d76a726785@quicinc.com>
Date: Mon, 28 Oct 2024 11:12:07 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation IMOD
 for secondary interrupters
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>
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
 <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
 <2024101824-hammock-elastic-8d38@gregkh> <87wmi02qcj.wl-tiwai@suse.de>
 <2024102240-gag-famished-245c@gregkh>
 <8795c4ad-e3ac-47aa-92dd-f899042cefc0@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <8795c4ad-e3ac-47aa-92dd-f899042cefc0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3VvqAHZW17ni7Z9fnrpLfG7y2SqeBCje
X-Proofpoint-ORIG-GUID: 3VvqAHZW17ni7Z9fnrpLfG7y2SqeBCje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280143


On 10/22/2024 8:04 AM, Amadeusz Sławiński wrote:
> On 10/22/2024 4:02 PM, Greg KH wrote:
>> On Tue, Oct 22, 2024 at 03:56:44PM +0200, Takashi Iwai wrote:
>>> On Fri, 18 Oct 2024 07:52:35 +0200,
>>> Greg KH wrote:
>>>>
>>>> On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
>>>>> Hi Greg,
>>>>>
>>>>> On 10/16/2024 11:40 PM, Greg KH wrote:
>>>>>> On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
>>>>>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>>
>>>>>>> Allow creators of xHCI secondary interrupters to specify the interrupt
>>>>>>> moderation interval value in nanoseconds when creating the interrupter.
>>>>>>>
>>>>>>> If not sure what value to use then use the xhci driver default
>>>>>>> xhci->imod_interval
>>>>>>>
>>>>>>> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
>>>>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>>> ---
>>>>>>>   drivers/usb/host/xhci-mem.c | 8 +++++++-
>>>>>>>   drivers/usb/host/xhci.c     | 4 ++--
>>>>>>>   drivers/usb/host/xhci.h     | 5 ++++-
>>>>>>>   3 files changed, 13 insertions(+), 4 deletions(-)
>>>>>> This is already in 6.12-rc1, which makes me confused as to what tree you
>>>>>> made this series against.
>>>>>
>>>>> Sorry, I didn't fetch the latest changes from usb-next.
>>>>
>>>> It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
>>>> based this on :(
>>>>
>>>>> In this case, should I rebase and resbumit?
>>>>
>>>> As the series can't be applied as-is, probably.  But I think you might
>>>> want to collect some acks from the sound people and xhci developers, as
>>>> I can't do anything with this until they look at the changes.
>>>
>>> Honestly speaking, I couldn't follow fully the discussions about the
>>> fundamental design -- IIRC, Pierre and others had concerns to the way
>>> to manage the offload device via kcontrols.  Did we get consensus?
>>
>> I don't think so.

As mentioned by Amadeusz, the overall USB offload concept hasn't changed significantly since the initial series, and will rely on having two sounds cards, ie leaving the one created by USB SND untouched (and still usable), while creating a path to an ASoC based platform card, which handles the offload path.

The follow ups that I've had with Pierre was more towards how the offload parameters are going to be exposed to userspace, so that it can be properly utilized.  I think for the most part, we've agreed that the set of kcontrols we have now are sufficient, and there is proper controls for userspace to know which devices to use.

>>
>>> I believe that's the biggest obstacle in the audio side, i.e. what's
>>> visible to users.  The kernel internals can be corrected at any time
>>> later.
>>
>> I would like to see that agreed on before I even look at the usb side.
>
> My main concern is still that one USB audio device can be accessed via two different cards exposed in userspace. Usual USB one, and the one from device which does "offload". Suggested implementation achieves it by adding additional controls, which need to be set in specific way to achieve offload. Overall while I understand the mechanism, I'm not exactly convinced that it is the best way from end user point of view.
>
> "Implementation" part in Documentation added in patch 19 shows how it looks in userspace now.
>
> If you don't mind two sound cards being used to access same piece of HW, current implementation looks ok to me.
>
@Takashi, this was something we discussed really early on, even before the series was made, and I think it was agreed upon to avoid doing this with a single card.  I remember putting in the initial work to scope out this path, but it was going to require significant/major modifications to USB SND core, hence why we decided on the path to have two sound cards. (USB SND legacy path still usable)

Thanks

Wesley Cheng 

> See also:
> https://lore.kernel.org/linux-sound/75ffde3a-7fef-4c15-bfc8-87756e1c3f11@linux.intel.com/
> where I described how I would prefer it to look.

