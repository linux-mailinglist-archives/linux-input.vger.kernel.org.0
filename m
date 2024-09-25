Return-Path: <linux-input+bounces-6716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B6986705
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 21:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2EA11C213C2
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 19:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29D71448E6;
	Wed, 25 Sep 2024 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OdC+XLrF"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6823145323;
	Wed, 25 Sep 2024 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727293092; cv=none; b=FIlsM1vzxt9uqToLZ+kOKZmK9SwfMGBn/EKW/LDasug1Tm/LxGTl/NwyoH2MCNLnx8Vj2DTUIUxvJV8WUqKnokjp2cmpu7PwKgIgCcKmnX+4bncuX0XC1CQ569QvJo2gBmohBkpVLe4tOhZK5+k6jgcmqwiXzULhUB+cooK7N3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727293092; c=relaxed/simple;
	bh=L9UkjFM/t+HZ0+yEiCMKoS3dswfBRu7l2ZkM2TfB1OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FLfJRlQAs/XPkyYysDmgSKqWZfUURe9BDH9t6TS5j5nq4swFV5M6lhvXKAo/2bDmWCER4aKeRh6ttRze2OvlS++z9LDXjOictinnSIIaSrJBUK+IsoZvhmiEjuoMo+88LIpGG3g4JbZd0mNAagnUc6xt+yTNTB29kaOQ1xs/8fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OdC+XLrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5Khx032247;
	Wed, 25 Sep 2024 19:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3AUR6RT3W7ulZeQVB8mK8Whtlk2Nz8uCdeZZVxJqR0=; b=OdC+XLrF6+MAEd4I
	UdBLUurgC2n9ERvqbhydfmELwTI1Zl47ONV5wHIouDAUvPWYSh8sGjIlM+PmC5Dq
	UKPlqraCjBdyht+iZ/NVu+LOLfIoQM8gIjuHM4UJW27rolrkYT/+9UWb1VTWy7U9
	WJeOJTPgNyymyodDOxC8LzfaA3mTewzXHsi3CKIcPufUWd1zYfcpKlyPRqGonBVZ
	0iVbOy4LoxyL5IoolwDtm1TY/XS6dgJKWk++AwOSuonGlNn3g23y1jIZwKTPcao6
	jIMPKqL6WcFg7TFt6WwcPVmheVtmDyweq6Sjt+9Suf+y0vZJTHziGuqhDpKhUczO
	epgKuw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7unf8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 19:37:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PJbkX3019291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 19:37:46 GMT
Received: from [10.71.115.66] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 12:37:46 -0700
Message-ID: <818bb1b9-facc-4d2a-9959-5e1b4befafbd@quicinc.com>
Date: Wed, 25 Sep 2024 12:37:45 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 30/32] ALSA: usb-audio: Add USB offload route kcontrol
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-31-quic_wcheng@quicinc.com>
 <8bb65adc-e995-443e-80c9-36e9b5d8eee3@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <8bb65adc-e995-443e-80c9-36e9b5d8eee3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J5pod1Ub2q3G-aVUEEhvipnr7QZjPzhz
X-Proofpoint-ORIG-GUID: J5pod1Ub2q3G-aVUEEhvipnr7QZjPzhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409250139

Hi Pierre,

On 9/25/2024 7:54 AM, Pierre-Louis Bossart wrote:
>
>
>> +static int
>> +snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
>> +			  struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
>> +	int ret;
>> +
>> +	ret = snd_soc_usb_update_offload_route(sysdev,
>> +					       CARD_IDX(kcontrol->private_value),
>> +					       PCM_IDX(kcontrol->private_value),
>> +					       SNDRV_PCM_STREAM_PLAYBACK,
>> +					       ucontrol->value.integer.value);
>> +	if (ret < 0) {
>> +		ucontrol->value.integer.value[0] = -1;
>> +		ucontrol->value.integer.value[1] = -1;
>> +	}
> well this invalidates again what I understood from the last patch and
> goes back to what I understood initially: the error code is never
> returned to higher levels - when offload is not supported the kcontrol
> values are encoded to the -1 magic value.
Yes, higher levels won't get an error code when they try to fetch for the kcontrol value, and if say...there is no callback to update the offload route then the -1 values are passed back.  I don't think we would want to return an error code.  We just want to communicate the current mapping of the offload path.
>> +	return 0;
> and this begs the question if this helper should return a void value.
This is the registered callback for the .get() call for the kcontrol, so it has to follow the definition below:
    typedef int (snd_kcontrol_get_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_elem_value * ucontrol)
>> +}
>> +
>> +static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
>> +				      struct snd_ctl_elem_info *uinfo)
>> +{
>> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
>> +	uinfo->count = 2;
>> +	uinfo->value.integer.min = -1;
>> +	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
>> +	uinfo->value.integer.max = 0xff;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
>> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
>> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
>> +	.info = snd_usb_offload_route_info,
>> +	.get = snd_usb_offload_route_get,
>> +};
>> +
>> +/**
>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>> + * @chip - USB SND chip device
>> + *
>> + * Creates a sound control for a USB audio device, so that applications can
>> + * query for if there is an available USB audio offload path, and which
>> + * card is managing it.
>> + */
>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>> +{
>> +	struct usb_device *udev = chip->dev;
>> +	struct snd_kcontrol_new *chip_kctl;
>> +	struct snd_usb_substream *subs;
>> +	struct snd_usb_stream *as;
>> +	char ctl_name[37];
> that's quite a magic value.

Ah, will fix this.  Should be 34 ("USB Offload Playback Route PCM#" [31] + max pcm index[3]).  From past discussions, technically there isn't an upper limit defined for PCM devices, but the above snd_usb_offload_route_info() has it set to 0xff, so I'll be consistent here as well and assume that if we have more than 255 PCM devices for one device, then we won't create further kcontrols. (probably still overkill, but who knows what USB audio devices are out there)

Thanks

Wesley Cheng


>> +	int ret;
>> +
>> +	list_for_each_entry(as, &chip->pcm_list, list) {
>> +		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
>> +		if (!subs->ep_num)
>> +			continue;
>> +
>> +		chip_kctl = &snd_usb_offload_mapped_ctl;
>> +		chip_kctl->count = 1;
>> +		/*
>> +		 * Store the associated USB SND card number and PCM index for
>> +		 * the kctl.
>> +		 */
>> +		chip_kctl->private_value = as->pcm_index |
>> +					  chip->card->number << 16;
>> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
>> +			as->pcm_index);
>> +		chip_kctl->name = ctl_name;
>> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
>> +				  udev->bus->sysdev));
>> +		if (ret < 0)
>> +			break;
>> +	}
>> +
>> +	return ret;
>> +}

