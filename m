Return-Path: <linux-input+bounces-6119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35596AD15
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 01:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A181C244ED
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147031D7996;
	Tue,  3 Sep 2024 23:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pdBZZnyX"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8ED1EBFFA;
	Tue,  3 Sep 2024 23:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725407549; cv=none; b=n30M1jRz+XPUKwgcphFvgQctGoYyKdgnsWfQRrKbOD8DpY/e1bPAPIOxZ5VW/IrzM0oUIASEihWLTf8ARqAYhmGZzdY3XMjkSDTHanPw/1tu07ZjxHKq6ZfPjDgeYCxhf0IOIoNdb7FweAnW0y8TX8h73S0nHoPbUnkxJ7q/DXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725407549; c=relaxed/simple;
	bh=0XKmHDlWBsUkyTDYuieq/MwUxV+7GE7dgLDzIXruJtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kt3moxwQpndLFUkPr3jwVhUfSwDD0BnsBjDoCQPe4oX5kZELeoFlB0zWI1NcS/yOCrkyulhH040oFgZkzV8459QxOYUvnW/rat3OKipNEeQWxg0ZasF+MpDOLuirN0x93cfQYGjlcWteTmkqN/IbZslQFJNkazo14gKdkJvSiWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pdBZZnyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LVZEv000810;
	Tue, 3 Sep 2024 23:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95BPSr22aNtxxkLKJOon+5nTrYaFWvyv57TrPyiflHg=; b=pdBZZnyXcGnQglde
	fWf/+6lf+TZ68nyFbs+mysF7ei+KL7kFUW395VCuDyNQ9aIQjVpf+rWYgeLtYUQ6
	IOhEbSXwzAxZvQ0ka+f2vlyrvHVJ0Lo/08zPyw+Gjoq2XFzLgApKF7xy7OHGa6T9
	pMpmb0fljYLgrq58pKqfOZekWDg5GMoxfhuBR9g5sR9jTBtq5akM0mIBtrRemCbo
	6LrSZZFG5JbpdsJIxiMU2gtHhDSpvN7dND4Hd9ZqU5OS032AFyDqAncjrjI7muZ7
	LYQ9cuM1TgGxyqlFsYmIoher/++bfhof3VW2EghL9oMx0Kt9qCrYnLXOat92buc3
	kBoQrg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe39ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 23:52:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483Nq4Mt002628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 23:52:04 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 16:52:04 -0700
Message-ID: <02cbf2a1-f8e6-4d5a-9d46-5c21f593bcdd@quicinc.com>
Date: Tue, 3 Sep 2024 16:52:03 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 31/33] ALSA: usb-audio: Add USB offload route kcontrol
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
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-32-quic_wcheng@quicinc.com>
 <b682bd8f-2743-42cf-b51f-1444faf4635f@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <b682bd8f-2743-42cf-b51f-1444faf4635f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2RrMypqgf7f696ke8lsoslZaflVIykZD
X-Proofpoint-ORIG-GUID: 2RrMypqgf7f696ke8lsoslZaflVIykZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030190

Hi Pierre,

On 8/30/2024 3:05 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:41, Wesley Cheng wrote:
>> In order to allow userspace/applications know about USB offloading status,
>> expose a sound kcontrol that fetches information about which sound card
>> and PCM index the USB device is mapped to for supporting offloading.  In
>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>> responsible for registering to the SOC USB layer.
>>
>> It is expected for the USB SND offloading driver to add the kcontrol to the
>> sound card associated with the USB audio device.  An example output would
>> look like:
> this is very odd, the offloading driver adds a control to another card?
>
> That seems like a rather important layering violation.
>
> I thought it was done the other way, the USB audio card created a
> control that would point to the other card/device.
The USB SND offloading vendor driver (qc_audio_offload), which technically co-exists with USB SND core, is the entity that will add the offload kcontrol to the USB audio device's sound card.  Initially, I had the kcontrol creation as part of the USB SND mixer, but I believe Takashi preferred if the vendor driver did it instead.
>
>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>> -1, -1 (range -1->255)
>>
>> This example signifies that there is no mapped ASoC path available for the
>> USB SND device.
> but that control would not even exist if the ASoC-based driver isn't probed.
>
> It's become really hard to follow, I've been on all this for 1.5hrs and
> losing track of the design.

Hence why it probably is a good idea to leave it within the USB offload vendor driver.  There are checks to ensure that the ASoC based driver is probed/available before the kcontrols are created for a device.  If there are devices that were identified before the ASoC components were probed, then the snd_usb_rediscover_devices() is triggered as part of soc-usb, and that would call the connect_cb() callback to the USB SND vendor offload driver to create the kcontrol.

Thanks

Wesley Cheng

>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>> 0, 0 (range -1->255)
>>
>> This example signifies that the offload path is available over ASoC sound
>> card index#0 and PCM device#0.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/Kconfig                 |  10 +++
>>  sound/usb/Makefile                |   2 +
>>  sound/usb/mixer_usb_offload.c     | 102 ++++++++++++++++++++++++++++++
>>  sound/usb/mixer_usb_offload.h     |  17 +++++
>>  sound/usb/qcom/Makefile           |   2 +-
>>  sound/usb/qcom/qc_audio_offload.c |   2 +
>>  6 files changed, 134 insertions(+), 1 deletion(-)
>>  create mode 100644 sound/usb/mixer_usb_offload.c
>>  create mode 100644 sound/usb/mixer_usb_offload.h
>>
>> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
>> index 5cc3eaf53e6b..e3fbf9541d0b 100644
>> --- a/sound/usb/Kconfig
>> +++ b/sound/usb/Kconfig
>> @@ -176,10 +176,20 @@ config SND_BCD2000
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called snd-bcd2000.
>>  
>> +config SND_USB_OFFLOAD_MIXER
>> +	tristate "USB Audio Offload mixer control"
>> +	help
>> +	 Say Y to enable the USB audio offloading mixer controls.  This
>> +	 exposes an USB offload capable kcontrol to signal to applications
>> +	 about which platform sound card can support USB audio offload.
>> +	 The returning values specify the mapped ASoC card and PCM device
>> +	 the USB audio device is associated to.
>> +
>>  config SND_USB_AUDIO_QMI
>>  	tristate "Qualcomm Audio Offload driver"
>>  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
>>  	select SND_PCM
>> +	select SND_USB_OFFLOAD_MIXER
>>  	help
>>  	  Say Y here to enable the Qualcomm USB audio offloading feature.
>>  
>> diff --git a/sound/usb/Makefile b/sound/usb/Makefile
>> index 54a06a2f73ca..2f19f854944c 100644
>> --- a/sound/usb/Makefile
>> +++ b/sound/usb/Makefile
>> @@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
>>  
>>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
>>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
>> +
>> +obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
>> new file mode 100644
>> index 000000000000..16e2fd634684
>> --- /dev/null
>> +++ b/sound/usb/mixer_usb_offload.c
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/usb.h>
>> +
>> +#include <sound/core.h>
>> +#include <sound/control.h>
>> +#include <sound/soc-usb.h>
>> +
>> +#include "usbaudio.h"
>> +#include "card.h"
>> +#include "helper.h"
>> +#include "mixer.h"
>> +
>> +#include "mixer_usb_offload.h"
>> +
>> +#define PCM_IDX(n)  ((n) & 0xffff)
>> +#define CARD_IDX(n) ((n) >> 16)
>> +
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
>> +
>> +	return 0;
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
>> +EXPORT_SYMBOL_GPL(snd_usb_offload_create_ctl);
>> diff --git a/sound/usb/mixer_usb_offload.h b/sound/usb/mixer_usb_offload.h
>> new file mode 100644
>> index 000000000000..3f6e2a8b19c8
>> --- /dev/null
>> +++ b/sound/usb/mixer_usb_offload.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0
>> + *
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __USB_OFFLOAD_MIXER_H
>> +#define __USB_OFFLOAD_MIXER_H
>> +
>> +#if IS_ENABLED(CONFIG_SND_USB_OFFLOAD_MIXER)
>> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip);
>> +#else
>> +static inline int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +#endif /* __USB_OFFLOAD_MIXER_H */
>> diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
>> index a81c9b28d484..4005e8391ab9 100644
>> --- a/sound/usb/qcom/Makefile
>> +++ b/sound/usb/qcom/Makefile
>> @@ -1,2 +1,2 @@
>>  snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
>> -obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
>> \ No newline at end of file
>> +obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> index a7ad15404fd1..5b9262a116be 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -36,6 +36,7 @@
>>  #include "../helper.h"
>>  #include "../pcm.h"
>>  #include "../power.h"
>> +#include "../mixer_usb_offload.h"
>>  
>>  #include "usb_audio_qmi_v01.h"
>>  
>> @@ -1703,6 +1704,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>>  		sdev->card_idx = chip->card->number;
>>  		sdev->chip_idx = chip->index;
>>  
>> +		snd_usb_offload_create_ctl(chip);
>>  		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
>>  	}
>>  

