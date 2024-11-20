Return-Path: <linux-input+bounces-8179-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297579D4460
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 00:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74C51B23657
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 23:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F391C7B79;
	Wed, 20 Nov 2024 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ibo4fAAD"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8A27447;
	Wed, 20 Nov 2024 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732144713; cv=none; b=gPr9HY+Da8Fou/QGFI645me1XutXYSIw+/15TuV1MrLy9cnivl6u9XuHMPY38mdBGyJPUgBzZDjqmxCQumj/oKEfccHsfkABd35EeBBF/jrGy678EgJwTyktW00L9aH5tTkvAf8er2uyZV7/ot7cdr4IXu9WzcgyS9ddCwWbwI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732144713; c=relaxed/simple;
	bh=SVAHyeGTzoghoI1kXDg2gcjhAZXFJM9LY16aIDIrBCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sL5Y5h0jro62tOD2eyMgSafR0Cua6pUTKTyU4oKiff3B244h5OWWCDBSf/aMJBuMMvpiRuYfKW7ANLuwQn6a2YN+xb8A5mjNozFN6CFTsYTjNaLrxqTErWCUhp6WWcVrWXrrW5HObKgVVNPwOkPcT6xEWziEbqOwDJIKrP5JS8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ibo4fAAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLNB3d003945;
	Wed, 20 Nov 2024 23:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lanws6Yx3ikB7msfjQOOsmduMmYwECqYx43uI2TK1no=; b=Ibo4fAADwmwti8Rd
	dqa17jA8omDgxnj3+QoHhRaVx5TIpePypG0rZNAchheHpXLd+ATN/13qsYvwROqc
	6YFzfzUXBqhscSNc7rfbxlOjVfaOYhuw18ix5s4AWZ8V6VPmtTHRPGWH6CF26BCw
	O6fqCBqG04155VJG4B9pYMaQfg+9vdA3eZgbyklYy8a5RqJhy19f+mjitzuzXj/5
	m8OnhXYIwGbVOVPp9JpGFeuIjB247Zx89l+oNQhoE/l7qiNv+mB9sQXlwJzjWLaI
	fSBRw9k1miT7nRD0IZ7YqFLSYW4YyaElCvfHI1RfXAHlSHsmeGqLQ3n58mea3MH9
	c/BzMQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3a42s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 23:18:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKNI9I4029347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 23:18:09 GMT
Received: from [10.110.30.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 15:18:08 -0800
Message-ID: <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
Date: Wed, 20 Nov 2024 15:18:07 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Takashi Iwai <tiwai@suse.de>
CC: Greg KH <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.dev>, <Thinh.Nguyen@synopsys.com>,
        <tiwai@suse.com>, <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <875xoi3wqw.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CyBvhwumMXz5hdJs_nJXfcoj34E6y-gX
X-Proofpoint-ORIG-GUID: CyBvhwumMXz5hdJs_nJXfcoj34E6y-gX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200162


On 11/20/2024 4:39 AM, Takashi Iwai wrote:
> On Tue, 19 Nov 2024 18:50:52 +0100,
> Wesley Cheng wrote:
>>
>> On 11/15/2024 11:42 PM, Greg KH wrote:
>>> On Fri, Nov 15, 2024 at 02:42:47PM -0800, Wesley Cheng wrote:
>>>> Hi,
>>>>
>>>> On 11/6/2024 11:33 AM, Wesley Cheng wrote:
>>>>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
>>>> Are there any more clarifications that I can help with to get this
>>>> series going?  I know its been a long time coming, so folks may have
>>>> lost context, but if there are any points that might be blocking the
>>>> series from getting merged, please let me know.
>>> I would like others to review this (xhci maintainer for one), to give
>>> their blessing before I even consider this.
>> Thanks, Greg...Yes, I was hoping to see if I could clarify any points for Mathias and Takashi if they had any concerns.  Just so folks are also aware, we did deploy a portion of the series (specifically the XHCI sec interrupter and USB SND core changes) into devices on the market, if that adds any confidence into those changes.  For the most part, there were no major issues within those drivers, and the single minor bug (in the XHCI sec intr) that we did catch was fixed in previous submissions, and should be highlighted in the change revision list.
> Well, from the sound subsystem side, the only concerns are the design
> issues: namely, whether the implementations with two cards are
> acceptable, and whether the current control of PCM mapping is OK from
> the user POV.  IIRC, there were discussions with Intel people and
> others, and I haven't followed whether we got consensus.
> If we reached some agreement, it'd be appreciated if you can put acks
> from them in the patches, too.

I believe Amadeusz was still against having the two card design, and wants the routing to automatically happen when playback happens on the sound card created by the USB SND layer.  However, even with that kind of implementation, the major pieces brought in by this series should still be relevant, ie soc-usb and the vendor offload driver.  The only thing that would really change is adding a path from the USB SND PCM ops to interact with the ASoC entities.  Complexity-wise, this would obviously have a good amount of changes to the USB SND/ASoC core drivers.  Some things I can think of that we'd need to introduce:

1.  Exposing some of the ASoC PCM (soc-pcm) APIs to be able to be called by soc-usb (to mimic a FE open from ASoC), so we can trigger ASoC DAI ops when USB SND FE is opened.

2.  Proper fallback mechanism in case offload path enablement fails to the legacy USB SND path.

3.  Master kcontrol to disable offload logic for each USB SND device.

IMO, both the points you mentioned correspond to the same topic.  If we go with having offload being operated on one FE, then there is no need for the kcontrol of PCM mapping.  If we have two cards, then we will need the control for offload device mapping.  Can't speak for Pierre, but at least with my discussions with him, I don't think he's against the two card design, just as long as we have the proper kcontrol that notifies userspace of how to utilize the offload path.

> The internal implementation details can be adjusted later, but those
> two must be set in stone after merging the stuff to the upstream.
>
> (BTW, the mail address of Pierre changed; I corrected in this mail.)
>
Thanks for updating the email address.

Thanks

Wesley Cheng


