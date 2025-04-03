Return-Path: <linux-input+bounces-11502-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D0A7B0B2
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 23:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91BB417BA72
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 21:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B33B1E1DE7;
	Thu,  3 Apr 2025 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WhAqgcoq"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC019EED2;
	Thu,  3 Apr 2025 21:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714061; cv=none; b=XsoFbn5tNAxkUYVS1HlniDvpcICajDQzjf7OLKY6pFYbL20PFdDTd9uAeuQh5+tTXlQwXkMXlqDhOwDFR/lpwuGRB6skGypFgqe2pOKqb1bWM4ZSgoTSKZov8ZFxmlZK4U0wFlKYgc4QtrM/e6kBhQzsKL6CP+XfVejXJfv2ujk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714061; c=relaxed/simple;
	bh=B085EWWX5gFYWgynI0EZlqmMdz5HDcR3MAu4aMcHvSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LkTWtagv2YO71VojtLvizseVoowK5El6c2iHLswQOWf5+H83qkV/bYV5Y83T5xxzRV/R++HB5zvyLsqTiIg/G9NvrslGeUJfOngfUTJWe2xy2BHsAmQ16W0qKiY3jXB4JnUlWvzP7DMK1jEP8Emm8eJ8VD6eHYsIC/y/J3BnSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WhAqgcoq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533Jhcwi013182;
	Thu, 3 Apr 2025 21:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3lw9JY2tZNb0wqxI4HGqbaQXkvStcLSoePS2IwZaGo=; b=WhAqgcoqaB2dTh9E
	kiy99wuEsiHjvrV1p+0ooC1WB8WY83T9K+8HUv6RLo5q6FzyArAso4pVUSG/4Czy
	KLbPQjy0maT+B2glqj8BEyMxJoYE952IyYRYoUfsmUkfmdEvk7GKRWGTsrbvKkYj
	9+W/k2oqRDnHNCFNpkmBfwM9F7ftHhYJB/vPMcSYj0WlrXYkZOh+7dLZUBLFl0I3
	h+wCVzxGByJHLBWN54mc1vMjjJ8lBYqC5RirqGf6l9EQDEypzlFr0dx+PAP/udVl
	nd9ORlWoKJ4aLChI6l1YOa3j7YrujgbCI2o56y05X7AuJTzxEVgKHV/iohaXXvLu
	+fGQKA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc7x38wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 21:00:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 533L0ZRD032394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 21:00:35 GMT
Received: from [10.110.110.182] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Apr 2025
 14:00:34 -0700
Message-ID: <e5b95522-baa1-414b-b16a-fe82e887a5de@quicinc.com>
Date: Thu, 3 Apr 2025 14:00:33 -0700
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
References: <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
 <Z-PPlRD7gcUcNvNv@linaro.org>
 <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>
 <Z-ug3YFwff8hWIRl@linaro.org>
 <378af3f1-b5b0-4f7a-ab62-f5c891feb7b5@quicinc.com>
 <Z-1MtJjfVbUQFron@linaro.org>
 <7d5fd3bf-c33e-4274-938b-2fb93c4b39d8@quicinc.com>
 <a9e281d6-59c0-3615-9851-c33752b0620f@quicinc.com>
 <Z-6Q_gaWsWyZcpLz@linaro.org>
 <e1eac325-233e-43eb-9ca0-9746893462d7@quicinc.com>
 <Z-7M1IeKNk6ZBayS@linaro.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z-7M1IeKNk6ZBayS@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: npZwLy4X00mIJ7RH5NbZ7QPK_DAas2YR
X-Authority-Analysis: v=2.4 cv=XamJzJ55 c=1 sm=1 tr=0 ts=67eef6f3 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=5dSfeLAkA3Y8wAJoHGcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: npZwLy4X00mIJ7RH5NbZ7QPK_DAas2YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030111



On 4/3/2025 11:00 AM, Stephan Gerhold wrote:
> On Thu, Apr 03, 2025 at 08:58:11AM -0700, Wesley Cheng wrote:
>> On 4/3/2025 6:45 AM, Stephan Gerhold wrote:
>>> On Wed, Apr 02, 2025 at 05:54:45PM -0700, Wesley Cheng wrote:
>>>> On 4/2/2025 5:23 PM, Wesley Cheng wrote:
>>>>> On 4/2/2025 7:41 AM, Stephan Gerhold wrote:
>>>>>> On Tue, Apr 01, 2025 at 04:47:41PM -0700, Wesley Cheng wrote:
>>>>>>> On 4/1/2025 1:16 AM, Stephan Gerhold wrote:
>>>>>>>> On Mon, Mar 31, 2025 at 12:52:19PM -0700, Wesley Cheng wrote:
>>>>>>>>> On 3/26/2025 2:57 AM, Stephan Gerhold wrote:
>>>>>>>>>> On Tue, Mar 25, 2025 at 04:18:03PM -0700, Wesley Cheng wrote:
>>>>>>>>>>> On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
>>>>>>>>>>>> On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
>>>>>>>>>>>>> The QC ADSP is able to support USB
>>>>>>>>>>>>> playback endpoints, so that the main
>>>>>>>>>>>>> application processor can be placed into
>>>>>>>>>>>>> lower CPU power modes.  This adds
>>>>>>>>>>>>> the required AFE port configurations and
>>>>>>>>>>>>> port start command to start an
>>>>>>>>>>>>> audio session.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Specifically, the QC ADSP can support
>>>>>>>>>>>>> all potential endpoints that are
>>>>>>>>>>>>> exposed by the audio data interface. 
>>>>>>>>>>>>> This includes isochronous data
>>>>>>>>>>>>> endpoints, in either synchronous mode or
>>>>>>>>>>>>> asynchronous mode. In the latter
>>>>>>>>>>>>> case both implicit or explicit feedback
>>>>>>>>>>>>> endpoints are supported.  The size
>>>>>>>>>>>>> of audio samples sent per USB frame
>>>>>>>>>>>>> (microframe) will be adjusted based on
>>>>>>>>>>>>> information received on the feedback endpoint.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Some pre-requisites are needed before
>>>>>>>>>>>>> issuing the AFE port start command,
>>>>>>>>>>>>> such as setting the USB AFE dev_token. 
>>>>>>>>>>>>> This carries information about the
>>>>>>>>>>>>> available USB SND cards and PCM devices
>>>>>>>>>>>>> that have been discovered on the
>>>>>>>>>>>>> USB bus.  The dev_token field is used by
>>>>>>>>>>>>> the audio DSP to notify the USB
>>>>>>>>>>>>> offload driver of which card and PCM index to enable playback on.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>   sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
>>>>>>>>>>>>>  
>>>>>>>>>>>>> sound/soc/qcom/qdsp6/q6afe.c            
>>>>>>>>>>>>> | 192 ++++++++++++++++++++++-
>>>>>>>>>>>>>   sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
>>>>>>>>>>>>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
>>>>>>>>>>>>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
>>>>>>>>>>>>>   sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
>>>>>>>>>>>>>   6 files changed, 341 insertions(+), 3 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>> [...]
>>>>>>>>>>>>> diff --git
>>>>>>>>>>>>> a/sound/soc/qcom/qdsp6/q6routing.c
>>>>>>>>>>>>> b/sound/soc/qcom/qdsp6/q6routing.c
>>>>>>>>>>>>> index 90228699ba7d..b7439420b425 100644
>>>>>>>>>>>>> --- a/sound/soc/qcom/qdsp6/q6routing.c
>>>>>>>>>>>>> +++ b/sound/soc/qcom/qdsp6/q6routing.c
>>>>>>>>>>>>> @@ -435,6 +435,26 @@ static struct
>>>>>>>>>>>>> session_data *get_session_from_id(struct
>>>>>>>>>>>>> msm_routing_data *data,
>>>>>>>>>>>>>       return NULL;
>>>>>>>>>>>>>   }
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +static bool is_usb_routing_enabled(struct msm_routing_data *data)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    int i;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    /*
>>>>>>>>>>>>> +     * Loop through current sessions to
>>>>>>>>>>>>> see if there are active routes
>>>>>>>>>>>>> +     * to the USB_RX backend DAI.  The
>>>>>>>>>>>>> USB offload routing is designed
>>>>>>>>>>>>> +     * similarly to the non offload
>>>>>>>>>>>>> path.  If there are multiple PCM
>>>>>>>>>>>>> +     * devices associated with the ASoC
>>>>>>>>>>>>> platform card, only one active
>>>>>>>>>>>>> +     * path can be routed to the USB offloaded endpoint.
>>>>>>>>>>>>> +     */
>>>>>>>>>>>>> +    for (i = 0; i < MAX_SESSIONS; i++) {
>>>>>>>>>>>>> +        if (data->sessions[i].port_id == USB_RX)
>>>>>>>>>>>>> +            return true;
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    return false;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>
>>>>>>>>>>>> What is different about USB_RX compared to
>>>>>>>>>>>> other output ports we have in
>>>>>>>>>>>> Q6AFE? Obviously, we can only play one
>>>>>>>>>>>> stream on an output port. But
>>>>>>>>>>>> doesn't the ADSP mix streams together when
>>>>>>>>>>>> you have multiple routes?
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> This patch will limit the USB_RX from being able
>>>>>>>>>>> to be mixed to multiple
>>>>>>>>>>> q6adm paths.
>>>>>>>>>>>
>>>>>>>>>>>> Also, this doesn't actually check for *active* routes only. It just
>>>>>>>>>>>> looks if any other MultiMedia DAI is
>>>>>>>>>>>> configured to output to USB_RX.
>>>>>>>>>>>> That doesn't mean they will ever be active at the same time.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Yes, the main reason being that that is the
>>>>>>>>>>> mechanism we use to populate
>>>>>>>>>>> the active offload path within the USB SND card mixer.
>>>>>>>>>>>
>>>>>>>>>>>> I might for example want to have MultiMedia1 and MultiMedia2 both
>>>>>>>>>>>> configured to output to USB_RX. Let's assume
>>>>>>>>>>>> MultiMedia1 is a normal PCM
>>>>>>>>>>>> DAI, MultiMedia2 is a compress offload DAI. When I want to playback
>>>>>>>>>>>> normal audio, I go through MultiMedia1, when
>>>>>>>>>>>> I want to play compressed
>>>>>>>>>>>> audio, I go through MultiMedia2. Only one of them active at a time.
>>>>>>>>>>>> Why can't I set this up statically in the mixers?
>>>>>>>>>>>>
>>>>>>>>>>>> If you confirm that it is really impossible
>>>>>>>>>>>> to have multiple streams
>>>>>>>>>>>> mixed together to the USB_RX output in the
>>>>>>>>>>>> ADSP, then this should be a
>>>>>>>>>>>> runtime check instead when starting the stream IMO.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> We can have multiple streams being mixed together, but it will get
>>>>>>>>>>> confusing because it changes the definition that
>>>>>>>>>>> we had discussed about in
>>>>>>>>>>> the past about the overall design for the interaction w/ userspace.
>>>>>>>>>>> Although we (QC) only support a single USB audio
>>>>>>>>>>> device for offloading,
>>>>>>>>>>> there could be other situations where the audio
>>>>>>>>>>> DSP can support multiple
>>>>>>>>>>> devices.  The assumption is that each MM path is
>>>>>>>>>>> assigned to a USB device.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Are you referring to the "USB Offload Playback Route
>>>>>>>>>> PCM#*" mixers here?
>>>>>>>>>> They could just refer to first of the configured MM paths, if someone
>>>>>>>>>> decides to route multiple paths to the USB backend. Looking at
>>>>>>>>>> q6usb_update_offload_route(), I think the implementation does that
>>>>>>>>>> already.
>>>>>>>>>>
>>>>>>>>>> I think it's fine that the userspace API for
>>>>>>>>>> automatically "probing" the
>>>>>>>>>> PCM device supports only a single path to the USB backend. But if
>>>>>>>>>> someone wants to bypass the automatic probing and configure a more
>>>>>>>>>> advanced setup, do we need to forbid that?
>>>>>>>>>>
>>>>>>>>>> Asked differently: what would happen if we remove this check here and
>>>>>>>>>> handle USB_RX like any other Q6AFE output port?
>>>>>>>>>> Would anything break for
>>>>>>>>>> the userspace interface?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> So I took a look at seeing how the Q6ADM/ASM
>>>>>>>>> interactions would work for
>>>>>>>>> the situation where if user tried to start both MM1/2
>>>>>>>>> streams at the same
>>>>>>>>> time over the USB offload path.  In this scenario, we
>>>>>>>>> see that the Q6USB BE
>>>>>>>>> DAI operations, ie startup, hw_params, etc... gets
>>>>>>>>> called one time for the
>>>>>>>>> initial stream.  For example, if I start playback on MM1, then that
>>>>>>>>> triggers the USB BE DAI to be brought up.
>>>>>>>>>
>>>>>>>>> When I start playback on MM2, since MM1 already called
>>>>>>>>> dpcm_be_dai_startup(), then be->dpcm[stream].users will
>>>>>>>>> be greater than
>>>>>>>>> zero.  This would cause the __soc_pcm_open() to be
>>>>>>>>> skipped for the USB BE
>>>>>>>>> DAI, so I wouldn't be able to check the runtime status
>>>>>>>>> at the Q6USB backend
>>>>>>>>> DAI.  However, we do track current streaming sessions
>>>>>>>>> done over Q6 ADM and
>>>>>>>>> it does save the AFE port associated to each COPP
>>>>>>>>> allocation, so I think its
>>>>>>>>> reasonable to see if there is already a COPP entry for
>>>>>>>>> the USB AFE port, to
>>>>>>>>> fail the open() call associated to the FE DAI.
>>>>>>>>>
>>>>>>>>
>>>>>>>> This sounds like a reasonable approach *if* we have to prevent multiple
>>>>>>>> MM DAIs from streaming to the USB AFE port at the same time.
>>>>>>>>
>>>>>>>> It's still unclear to me why we have to introduce this
>>>>>>>> limitation in the
>>>>>>>> first place. I think the questions from my previous email are still
>>>>>>>> open. Can you check them again?
>>>>>>>>
>>>>>>>
>>>>>>> So I checked with our audio DSP folks, and they mentioned there isn't
>>>>>>> technically a limitation from mixing multiple ADM streams from
>>>>>>> their end.
>>>>>>> My observations are as follows:
>>>>>>> - Using tinyplay to open and play on different FE PCM devices
>>>>>>> (ie MM1 and
>>>>>>> MM2), both streams are audible on the USB headset (intermixed).
>>>>>>> - If starting playback on MM1 first, before MM2, then once playback is
>>>>>>> complete on MM1, the ADM close is also affecting the MM2 stream.
>>>>>>> Basically, MM2 stops when the MM1 audio file is completed.
>>>>>>> - Due to the abrupt/incomplete closing of the MM2 ADM stream, looks like
>>>>>>> the audio DSP is not handling that case well, so subsequent
>>>>>>> playbacks fail.
>>>>>>>
>>>>>>
>>>>>> Thanks a lot for testing this!
>>>>>>
>>>>>>> I did find a possible reason for this, and it seems to be due to
>>>>>>> some code
>>>>>>> unrelated to the USB offload path directly.  It looks like the Q6ADM is
>>>>>>> currently built in a way that you can only route streams to a single
>>>>>>> endpoint, even though we do have reference counting for each
>>>>>>> COPP profile.
>>>>>>> So even after the first MM1 ADM stream completes and the PCM device is
>>>>>>> closed, the MM1 ADM close callback will issue a q6adm_device_close() for
>>>>>>> the USB AFE port.
>>>>>>
>>>>>> Yeah, this sounds like a bug to me...
>>>>>>
>>>>>>>
>>>>>>> I made some test changes to account for the refcount before issuing the
>>>>>>> q6adm_device_close(), and that seemed to work.  Once the MM1
>>>>>>> stream closes,
>>>>>>> it allows for the MM2 stream to close/finish before issuing the command,
>>>>>>> and that allows for proper cleanup of the audio data.
>>>>>>>
>>>>>>> IMO, I would like to keep the initial behavior (ie, blocking the
>>>>>>> additional
>>>>>>> stream open from the kernel) until I can get some more testing done, and
>>>>>>> figure out if this is the correct approach.  If it is, I can submit a
>>>>>>> follow up series to address it.
>>>>>>>
>>>>>>
>>>>>> I'm fine with this approach. My only two concerns/comments are:
>>>>>>
>>>>>>   1. Let's make sure we don't waste too much time finding the ideal
>>>>>>      approach to implement the additional blocking, if this will likely
>>>>>>      end up getting removed again anyway.
>>>>>>
>>>>>>   2. How can we justify making this change only for USB? Your analysis
>>>>>>      sounds like the issue applies to all types of output ports. This was
>>>>>>      exactly my main concern with the check you added in this patch:
>>>>>>      I would expect QDSP6 treats all ports exactly the same. This means
>>>>>>      we should add this additional check for all the output ports...
>>>>>>
>>>>>
>>>>> Fair points...I will extend this check across all ports until I get back
>>>>> with seeing how we can address the mixing situation.
>>>>>
>>>>
>>>> Sorry for replying again.  I think I'll at least limit this to the playback
>>>> path only for now.  I'm not sure how the behavior yet is for the record
>>>> path, since I don't really have that use case to test with yet :).  I will
>>>> see how it looks like when the record USB offload is done.
>>>>
>>>
>>> FWIW, I tested this on MSM8916:
>>>
>>>  - MultiMedia1 -> PRI_MI2S_RX
>>>  - MultiMedia3 -> PRI_MI2S_RX
>>>  - TERT_MI2S_TX -> MultiMedia2
>>>  - TERT_MI2S_TX -> MultiMedia5
>>>
>>> 2x speaker-test to MultiMedia1 and MultiMedia3 (pink noise + sine wave):
>>>  -> Audio playback correctly mixed together
>>>  -> Playback aborts for both when stopping one of the processes
>>>       Write error: -5,I/O error
>>>       xrun_recovery failed: -5,I/O error
>>>       Transfer failed: I/O error
>>>  -> Kernel log:
>>>     [  585.679421] q6routing 4080000.remoteproc:smd-edge:apr:service@8:routing: Found Matching Copp 0x0
>>>     [  587.917135] qcom-q6adm aprsvc:service:4:8: cmd = 0x10327 return error = 0x2
>>>     [  587.917378] qcom-q6adm aprsvc:service:4:8: DSP returned error[2]
>>>     [  587.917409] qcom-q6adm aprsvc:service:4:8: Failed to close copp -22
>>>
>>> 2x arecord from MultiMedia2 and MultiMedia5:
>>>  -> Both processes record audio as expected
>>>  -> Recording aborts for both when stopping one of the processes
>>>       arecord: pcm_read:2272: read error: I/O error
>>>  -> Kernel log:
>>>     [  646.125612] q6routing 4080000.remoteproc:smd-edge:apr:service@8:routing: Found Matching Copp 0x0
>>>     [  654.247867] q6asm-dai 4080000.remoteproc:smd-edge:apr:service@7:dais: command[0x10bdb] not expecting rsp
>>>     [  654.815474] q6asm-dai 4080000.remoteproc:smd-edge:apr:service@7:dais: command[0x10bdb] not expecting rsp
>>>     [  654.825568] qcom-q6adm aprsvc:service:4:8: cmd = 0x10327 return error = 0x2
>>>     [  654.825955] qcom-q6adm aprsvc:service:4:8: DSP returned error[2]
>>>     [  654.826013] qcom-q6adm aprsvc:service:4:8: Failed to close copp -22
>>>
>>> => Both playback and recording are affected. As you suspected it's
>>>    unrelated to USB.
>>>
>>
>> Great, thanks for confirming both paths show the same issue :).
>>
>>> This feels like a bug to me rather than an intentional limitation. If
>>> you can share the fix you made I can test it here.
>>>
>>
>> Change I tried was fairly straightforward.  Sharing it below:
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
>> index fe719c4c32b3..7880fbbe815f 100644
>> --- a/sound/soc/qcom/qdsp6/q6adm.c
>> +++ b/sound/soc/qcom/qdsp6/q6adm.c
>> @@ -578,12 +579,13 @@ int q6adm_close(struct device *dev, struct q6copp *copp)
>>      struct q6adm *adm = dev_get_drvdata(dev->parent);
>>      int ret = 0;
>>
>> -    ret = q6adm_device_close(adm, copp, copp->afe_port, copp->copp_idx);
>> -    if (ret < 0) {
>> -        dev_err(adm->dev, "Failed to close copp %d\n", ret);
>> -        return ret;
>> +    if (kref_read(&copp->refcount) == 1) {
>> +        ret = q6adm_device_close(adm, copp, copp->afe_port, copp->copp_idx);
>> +        if (ret < 0) {
>> +            dev_err(adm->dev, "Failed to close copp %d\n", ret);
>> +            return ret;
>> +        }
>>      }
>> -
>>      kref_put(&copp->refcount, q6adm_free_copp);
>>
>>      return 0;
>>
> 
> Hmm, yeah it looks like we need some reference counting for the
> open/close operation. I think checking the refcount like that is going
> to be prone to potential race conditions though. I'm not sure if we can
> guarantee that q6adm_close() isn't called concurrently.
> 

Yeah, I was hoping there was some locking in the ASoC levels, but its going
to be locking based on the runtime PCM stream, so that wouldn't prevent
q6adm_close() running concurrently. (as MM1/2 are different RTDs)

> I played around a bit and came up with the two patches below. I think
> those should be good. Given the "Found Matching Copp" code path, it
> feels like this was the intended behavior all along. I can post these if
> you have no objections. You could then just go ahead with your series by
> removing the check I originally commented on in this patch.
> 

OK, that sounds good to me.  Thanks for helping out with this part of my
series.  Definitely think its a good idea to have an explicit mutex that is
managing the Q6ADM open/close ops.

Thanks
Wesley Cheng

