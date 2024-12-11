Return-Path: <linux-input+bounces-8489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB7A9EC1DB
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 03:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD01188B700
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 02:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF461FBC86;
	Wed, 11 Dec 2024 02:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kYAjQvzM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A31FA25D;
	Wed, 11 Dec 2024 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733882444; cv=none; b=F+3OLszZnE9sfYn3W8kVJ8DG/VIGi+6w+P7oywILGfCwQZxe3GCNPXvTiaAEYKXRNUJEGCgMb3HVWI/jC8FHMK47adQkGfi0Aw3hoqtJE4zZQPJchDJVH8hYEEr1NjQfd+cxKjLBfrJGQF0C6aLzMYGoyjzLdzuwEOm0kYVWIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733882444; c=relaxed/simple;
	bh=tQmw66eR8RXYovE9PyXHz4mGVai1Hk1iAlAaPKqFXtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=laRK8jduT3Z3HDJGVDzG81wtM+eragb18z3jFkRvto64MFq4pecKhq0FbQHsl417cMvUFsvE9/U4oJapgOEs07pJGfSxlGetglXIMWCKifBJEb4uG9hXhd14ZH+GEdIienZJ89vK7JrCl4zVrD/lI2OlwH4Et4hpsLod2XNt1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kYAjQvzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADFXPt019472;
	Wed, 11 Dec 2024 02:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1hIFjvV5WKQJt6B6MFLaU2NvCADjnnIFHht+ldnWM8=; b=kYAjQvzMcGcR6SK2
	jCFDPomEV8fkaluWiDqqOmkDYmjO10sDtZSpTABncL+Y7/bceBCD8TiiekJ+393c
	isP/zX7vOHv3fLnzW/n7mSZdB5axEOXRIl6dYjqg7EZxV2yX5mvpeBcVVqOuWaZT
	l/iZmulsVs34+gbYR+Z53Hq0woRIPgwx0fhwVgQTao1g9LndiTWAdGpa6BnknBwr
	+AQXDA85dZ091FD/IyXBQMdlDO++qxOQYpzEiX4dDFjGHbmjc7CUFxuDQP7byVnM
	gOStLhiKuTJfVbXJkWqu9BRCREYl8qrMHTf+a9vkgTId5RfB2H7wowP9CL1J6ks5
	dy8m9w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341d55w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 02:00:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB20EVZ019497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 02:00:14 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 18:00:14 -0800
Message-ID: <03c79eca-f79b-4008-9037-ea96e18f093f@quicinc.com>
Date: Tue, 10 Dec 2024 18:00:13 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Takashi Iwai <tiwai@suse.de>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Cezary Rojewski
	<cezary.rojewski@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
 <4C900353-B977-451C-B003-BAA51E458726@linux.dev>
 <e7b8f141-efd4-4933-b074-641638914905@intel.com>
 <4E9925AF-F297-42A5-9CB8-F8568F0A5EDF@linux.dev>
 <0a36814a-5818-493a-a9e3-b1a1e9559387@quicinc.com>
 <75e6516f-5cf5-4b0d-ade8-bfbc5632765f@quicinc.com>
 <87y10n3300.wl-tiwai@suse.de>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87y10n3300.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BTnO5BhfzOONhA051ooUPB4oIf-4-_2p
X-Proofpoint-ORIG-GUID: BTnO5BhfzOONhA051ooUPB4oIf-4-_2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110014


On 12/10/2024 8:40 AM, Takashi Iwai wrote:
> On Tue, 10 Dec 2024 01:59:10 +0100,
> Wesley Cheng wrote:
>> On 12/5/2024 4:53 PM, Wesley Cheng wrote:
>>> On 12/4/2024 2:49 PM, Pierre-Louis Bossart wrote:
>>>>>>> UAOL is one of our priorities right now and some (e.g.: me) prefe=
r to not pollute their mind with another approaches until what they have =
in mind is crystalized. In short, I'd vote for a approach where USB devic=
e has a ASoC representative in sound/soc/codecs/ just like it is the case=
 for HDAudio. Either that or at least a ASoC-component representative, a =
dependency for UAOL-capable card to enumerate.
>>>>>> The main difference is that we don=E2=80=99t want the USB audio *c=
ontrol* part to be seen in two places. The only requirement is to stream =
data with an alternate optimized path, but all the volume control and wha=
tnot is supposed to be done using the regular usb-audio card. It would be=
 complete chaos for userspace if the same volume can be represented diffe=
rently.
>>>>>> The comparison with HDaudio is not quite right either. In the case=
 of HDaudio, it=E2=80=99s an all-or-nothing solution. The external device=
 is controlled by one entity, either legacy or ASoC based. That choice is=
 made at driver probe time. In the case of USB, the application needs to =
have the choice of using either the legacy path, or the optimized path th=
at goes through a DSP. I think the last thing you want given this context=
 is to make the USB audio device an ASoC codec.
>>>>>> I find it rather interesting that this architectural feedback come=
s at the v30, it=E2=80=99s unfair to Wesley really...
>>>>> Hi Pierre,
>>>>>
>>>>> Obviously I'm late. After scanning the history of this one, indeed =
it's been a while since v1 has been sent. And thus I posted no NACKs. At =
the same time if I am to choose between: provide feedback vs provide no-f=
eedback, I'd rather choose the former even if I'm to be ignored/overridde=
n by a subsystem maintainer.
>>>>>
>>>>> The subsystem maintainers also hold the last word, and I have no pr=
oblem with them merging the patches if they believe its existing shape is=
 good-enough. For example, my team could follow up this implementation ne=
xt year with a patchset expanding/updating the functionality. I see this =
as a viable option.
>>>> That=E2=80=99s what we had in mind before I left Intel. The interfac=
es seen by userspace are PCM devices and kcontrols, it doesn=E2=80=99t ma=
tter too much if there is one card, two cards, and if the implementation =
relies on an ASoC codec, a library or something else.=C2=A0
>>>> The bulk of the work is to enable the USB offload from top to bottom=
, by changing PipeWire/CRAS/HAL to select the new optimized path when ava=
ilable and deal with plug/unplug events.
>>>> Improvements at the kernel level can be done later if required. It=E2=
=80=99s hard to argue that the proposal in this series is fundamentally b=
roken, but as usual it=E2=80=99s likely that some requirements are missin=
g or not known yet. The same thing happened with compressed offload, none=
 one thought about gapless playback until Android made it a requirement. =
Maybe what we=E2=80=99d need is a =E2=80=98protocol version=E2=80=99 for =
USB offload so that changes can be tracked and handled?
>>> Thanks for chiming in, Pierre.=C2=A0 So for now, with the next revisi=
on I have prepared, I'm currently adding:
>>>
>>> 1.=C2=A0 Some improvements to xHCI sideband to account for core seque=
nces that need to be notified to the offload driver, ie transfer ring fre=
e
>>>
>>> 2.=C2=A0 Moved the USB SND offload mixer driver into the QC vendor mo=
dule for now, as instructed by Takashi:
>>>
>>> https://lore.kernel.org/linux-usb/87cyiiaxpc.wl-tiwai@suse.de/
>>>
>>> 3.=C2=A0 Added separate kcontrols for fetching mapped PCM device and =
card indexes (versus one that returns a card and PCM device pair [array])=

>>>
>>> 4.=C2=A0 Removed some jack controls (enable/disable) from soc-usb
>>>
>>> 5.=C2=A0 Updated documentation for #3
>>>
>>>
>>> Those are the major changes that will come in the next revision.=C2=A0=
 I'm just trying to figure out who/where the "protocol version" should be=
 checked if we decided to add it.=C2=A0 (or if we need to check for it an=
ywhere...)=C2=A0 From the userspace perspective, it should be agnostic to=
 how we've implemented offloading from the kernel, and I don't see any ma=
jor shifts in how userspace implements things even if we make improvement=
s from kernel.
>>
>> Hi Takashi,
>>
>> Could you possibly help share some direction on what you think of the =
current design, and if you think its detrimental that we make modificatio=
ns mentioned by Cezary?=C2=A0 I have the next revision ready for review, =
but I wanted to get a better sense on the likeliness of this landing upst=
ream w/o the major modifications.
> Honestly speaking, I have no big preference about that design
> question.  The most important thing is rather what's visible change to
> users.  An advantage of the current design (sort of add-on to the
> existing USB-audio driver) is that it's merely a few card controls
> that are added and visible, and the rest is just as of now.  The
> remaining design issue (two cards or single card) is rather
> kernel-internal, and has nothing to do with users.  So I'm fine with
> the current design.
>
> OTOH, if we follow the pattern of HD-audio, at least there will be
> more preliminary changes in USB-audio driver side like we've done for
> HD-audio.  That is, make most of USB-audio code to be usable as (a
> kind of) library code.  It's more work, but certainly doable.  And if
> that can be achieved and there other similar use cases of this stuff
> not only from Qualcomm, it might make sense to go in that way, too.
> That said, it's rather a question about what's extended in future.
> If Intel will need / want to move on that direction, too, that's a
> good reason to reconsider the basic design.
>

So to clarify, what Cezary and I are proposing are actually two different=
 concepts to achieve some sort of offloading for audio data.=C2=A0 In my =
use case, we're trying to leverage as much of the USB SND implementation =
as possible, and only offloading the handling of audio transfers.=C2=A0 E=
verything else is still handled by USB SND, hence the reason for it being=
 an add-on since most of it stays the same.=C2=A0 Unfortunately, I don't =
have any details about the full HW offload design, as public material on =
it is fairly minimal.=C2=A0 So it would be difficult for me to rework my =
series to something I don't have a line of sight into.=C2=A0 Personally (=
and as you can probably tell :)), I would prefer if we could do the refac=
toring in stages (if actually required), since I've been pushing this met=
hod for awhile now, and I'm not sure if I can take up that effort to do t=
hat on my next submission.=C2=A0 At least from the QC perspective if we d=
id move to the HDaudio-type implementation, I think I'd need to also
change up the ASoC design we have currently implemented as well, so it wo=
uldn't be a trivial change.


Thanks

Wesley Cheng


