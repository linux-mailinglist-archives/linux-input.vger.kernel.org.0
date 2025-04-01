Return-Path: <linux-input+bounces-11468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC5A78554
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 01:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F8EE3A5D1A
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 23:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A59A21859F;
	Tue,  1 Apr 2025 23:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VwGC9kIS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554022AF04;
	Tue,  1 Apr 2025 23:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743551286; cv=none; b=RriGrfXxO1cGPJmvwJP1rta3RpWiExLljk0wHMNg42nA8Nkh/Bku9SkgxA122TuzzvEZOkHUp+GSIxPK4pdRB9sHgLXcisHvKn0lB5lYJzVoHX1HV1xxkdljWP25R0UFzKzQDSxnyt/UDxPBE6Mkb+OW1XsLrF0FU1mB6/cAHzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743551286; c=relaxed/simple;
	bh=yxw4GAsxTIz0ZPwzILFfeGiNouSunPSCuDEUVEeVHeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HcU9GDxM2P0fWIhgtkCaiXUqNNC9XCAxVbMg5wdlQZl6HMeSq0jVSfl3VTtT0xGSem0FSJS8kxie0IxlxmtSTz4qjlDpELGxMDoYhu4crF+QZzAj8l/+lMgJGXR2RwrHyEAWWwrfHg9GWGu16BSPhus1y1BHbtQsuoev7m7ixDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VwGC9kIS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531ExFEA019655;
	Tue, 1 Apr 2025 23:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHda8XH1oJ2eqz4sJm2zLaKcdfTXTUhtDKaiIjH1Qic=; b=VwGC9kISpZMEa3HP
	iMzIBg4OV9hlbxLcAVeu/lXJb3jAJan8KDV4F54+UuLrnFLzLfxgp2lVAwD8k7T1
	jBsU3s1Bvo1sqGF46qdpIZkPYbME7wnBg945k117sCYPbKMBKPDW9rvgtKgJV2Iu
	w+mBQqwUpiKirvSl8GD6kvO7J0vvbBNdt7eTZXTx0oUgLop+29nmOxJJYOX+C9Qe
	BjvwRkfW6DmjMvuzlpbKah+MRh0SlmcQXHB44ghfUl/6sllPj9KiByB0p3qKGk6u
	hWRe31qVbcceAT+VQgLvjguyHx7cbq6SEvF2kjrMeU/lzmj7m9KxQclNkDMwaqN8
	FGgRJw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1vnc29h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 23:47:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 531NlgPa007398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 23:47:42 GMT
Received: from [10.110.126.171] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 16:47:41 -0700
Message-ID: <378af3f1-b5b0-4f7a-ab62-f5c891feb7b5@quicinc.com>
Date: Tue, 1 Apr 2025 16:47:41 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v36 22/31] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
To: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Luca Weiss
	<luca.weiss@fairphone.com>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-23-quic_wcheng@quicinc.com>
 <Z-J2WnrZHP6iMIhT@linaro.org>
 <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
 <Z-PPlRD7gcUcNvNv@linaro.org>
 <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>
 <Z-ug3YFwff8hWIRl@linaro.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z-ug3YFwff8hWIRl@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=UL3dHDfy c=1 sm=1 tr=0 ts=67ec7b1f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Mbssl0DwhmBr3ji8NNQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G8dCmmV6Gxne8J_LUri8VCFWEzqj2R8g
X-Proofpoint-GUID: G8dCmmV6Gxne8J_LUri8VCFWEzqj2R8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_10,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010147

Hi Stephan,

On 4/1/2025 1:16 AM, Stephan Gerhold wrote:
> Hi Wesley,
> 
> On Mon, Mar 31, 2025 at 12:52:19PM -0700, Wesley Cheng wrote:
>> On 3/26/2025 2:57 AM, Stephan Gerhold wrote:
>>> On Tue, Mar 25, 2025 at 04:18:03PM -0700, Wesley Cheng wrote:
>>>> On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
>>>>> On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
>>>>>> The QC ADSP is able to support USB playback endpoints, so that the main
>>>>>> application processor can be placed into lower CPU power modes.  This adds
>>>>>> the required AFE port configurations and port start command to start an
>>>>>> audio session.
>>>>>>
>>>>>> Specifically, the QC ADSP can support all potential endpoints that are
>>>>>> exposed by the audio data interface.  This includes isochronous data
>>>>>> endpoints, in either synchronous mode or asynchronous mode. In the latter
>>>>>> case both implicit or explicit feedback endpoints are supported.  The size
>>>>>> of audio samples sent per USB frame (microframe) will be adjusted based on
>>>>>> information received on the feedback endpoint.
>>>>>>
>>>>>> Some pre-requisites are needed before issuing the AFE port start command,
>>>>>> such as setting the USB AFE dev_token.  This carries information about the
>>>>>> available USB SND cards and PCM devices that have been discovered on the
>>>>>> USB bus.  The dev_token field is used by the audio DSP to notify the USB
>>>>>> offload driver of which card and PCM index to enable playback on.
>>>>>>
>>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>>> ---
>>>>>>  sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
>>>>>>  sound/soc/qcom/qdsp6/q6afe.c             | 192 ++++++++++++++++++++++-
>>>>>>  sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
>>>>>>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
>>>>>>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
>>>>>>  sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
>>>>>>  6 files changed, 341 insertions(+), 3 deletions(-)
>>>>>>
>>>> [...]
>>>>>> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
>>>>>> index 90228699ba7d..b7439420b425 100644
>>>>>> --- a/sound/soc/qcom/qdsp6/q6routing.c
>>>>>> +++ b/sound/soc/qcom/qdsp6/q6routing.c
>>>>>> @@ -435,6 +435,26 @@ static struct session_data *get_session_from_id(struct msm_routing_data *data,
>>>>>>  	return NULL;
>>>>>>  }
>>>>>> +
>>>>>> +static bool is_usb_routing_enabled(struct msm_routing_data *data)
>>>>>> +{
>>>>>> +	int i;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Loop through current sessions to see if there are active routes
>>>>>> +	 * to the USB_RX backend DAI.  The USB offload routing is designed
>>>>>> +	 * similarly to the non offload path.  If there are multiple PCM
>>>>>> +	 * devices associated with the ASoC platform card, only one active
>>>>>> +	 * path can be routed to the USB offloaded endpoint.
>>>>>> +	 */
>>>>>> +	for (i = 0; i < MAX_SESSIONS; i++) {
>>>>>> +		if (data->sessions[i].port_id == USB_RX)
>>>>>> +			return true;
>>>>>> +	}
>>>>>> +
>>>>>> +	return false;
>>>>>> +}
>>>>>
>>>>> What is different about USB_RX compared to other output ports we have in
>>>>> Q6AFE? Obviously, we can only play one stream on an output port. But
>>>>> doesn't the ADSP mix streams together when you have multiple routes?
>>>>>
>>>>
>>>> This patch will limit the USB_RX from being able to be mixed to multiple
>>>> q6adm paths.
>>>>
>>>>> Also, this doesn't actually check for *active* routes only. It just
>>>>> looks if any other MultiMedia DAI is configured to output to USB_RX.
>>>>> That doesn't mean they will ever be active at the same time.
>>>>>
>>>>
>>>> Yes, the main reason being that that is the mechanism we use to populate
>>>> the active offload path within the USB SND card mixer.
>>>>
>>>>> I might for example want to have MultiMedia1 and MultiMedia2 both
>>>>> configured to output to USB_RX. Let's assume MultiMedia1 is a normal PCM
>>>>> DAI, MultiMedia2 is a compress offload DAI. When I want to playback
>>>>> normal audio, I go through MultiMedia1, when I want to play compressed
>>>>> audio, I go through MultiMedia2. Only one of them active at a time.
>>>>> Why can't I set this up statically in the mixers?
>>>>>
>>>>> If you confirm that it is really impossible to have multiple streams
>>>>> mixed together to the USB_RX output in the ADSP, then this should be a
>>>>> runtime check instead when starting the stream IMO.
>>>>>
>>>>
>>>> We can have multiple streams being mixed together, but it will get
>>>> confusing because it changes the definition that we had discussed about in
>>>> the past about the overall design for the interaction w/ userspace.
>>>> Although we (QC) only support a single USB audio device for offloading,
>>>> there could be other situations where the audio DSP can support multiple
>>>> devices.  The assumption is that each MM path is assigned to a USB device.
>>>>
>>>
>>> Are you referring to the "USB Offload Playback Route PCM#*" mixers here?
>>> They could just refer to first of the configured MM paths, if someone
>>> decides to route multiple paths to the USB backend. Looking at
>>> q6usb_update_offload_route(), I think the implementation does that
>>> already.
>>>
>>> I think it's fine that the userspace API for automatically "probing" the
>>> PCM device supports only a single path to the USB backend. But if
>>> someone wants to bypass the automatic probing and configure a more
>>> advanced setup, do we need to forbid that?
>>>
>>> Asked differently: what would happen if we remove this check here and
>>> handle USB_RX like any other Q6AFE output port? Would anything break for
>>> the userspace interface?
>>>
>>
>> So I took a look at seeing how the Q6ADM/ASM interactions would work for
>> the situation where if user tried to start both MM1/2 streams at the same
>> time over the USB offload path.  In this scenario, we see that the Q6USB BE
>> DAI operations, ie startup, hw_params, etc... gets called one time for the
>> initial stream.  For example, if I start playback on MM1, then that
>> triggers the USB BE DAI to be brought up.
>>
>> When I start playback on MM2, since MM1 already called
>> dpcm_be_dai_startup(), then be->dpcm[stream].users will be greater than
>> zero.  This would cause the __soc_pcm_open() to be skipped for the USB BE
>> DAI, so I wouldn't be able to check the runtime status at the Q6USB backend
>> DAI.  However, we do track current streaming sessions done over Q6 ADM and
>> it does save the AFE port associated to each COPP allocation, so I think its
>> reasonable to see if there is already a COPP entry for the USB AFE port, to
>> fail the open() call associated to the FE DAI.
>>
> 
> This sounds like a reasonable approach *if* we have to prevent multiple
> MM DAIs from streaming to the USB AFE port at the same time.
> 
> It's still unclear to me why we have to introduce this limitation in the
> first place. I think the questions from my previous email are still
> open. Can you check them again?
> 

So I checked with our audio DSP folks, and they mentioned there isn't
technically a limitation from mixing multiple ADM streams from their end.
My observations are as follows:
- Using tinyplay to open and play on different FE PCM devices (ie MM1 and
MM2), both streams are audible on the USB headset (intermixed).
- If starting playback on MM1 first, before MM2, then once playback is
complete on MM1, the ADM close is also affecting the MM2 stream.
Basically, MM2 stops when the MM1 audio file is completed.
- Due to the abrupt/incomplete closing of the MM2 ADM stream, looks like
the audio DSP is not handling that case well, so subsequent playbacks fail.

I did find a possible reason for this, and it seems to be due to some code
unrelated to the USB offload path directly.  It looks like the Q6ADM is
currently built in a way that you can only route streams to a single
endpoint, even though we do have reference counting for each COPP profile.
So even after the first MM1 ADM stream completes and the PCM device is
closed, the MM1 ADM close callback will issue a q6adm_device_close() for
the USB AFE port.

I made some test changes to account for the refcount before issuing the
q6adm_device_close(), and that seemed to work.  Once the MM1 stream closes,
it allows for the MM2 stream to close/finish before issuing the command,
and that allows for proper cleanup of the audio data.

IMO, I would like to keep the initial behavior (ie, blocking the additional
stream open from the kernel) until I can get some more testing done, and
figure out if this is the correct approach.  If it is, I can submit a
follow up series to address it.

Thanks
Wesley Cheng

