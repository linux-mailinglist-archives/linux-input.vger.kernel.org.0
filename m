Return-Path: <linux-input+bounces-6115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00996ACB8
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 01:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2013128692B
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EB81D58B3;
	Tue,  3 Sep 2024 23:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cn0TfoFN"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA304126C07;
	Tue,  3 Sep 2024 23:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725405628; cv=none; b=DBPgGr+b3lLMRZTLGsqwraq1XVnnCI/qWrMpisdUgkraw17RL3Uhjs05k4AQ8eTqxqeB1MIoe7+CN+lbDFA5lrUreaPbhpopSv9BOmlhmBL++h0S8H6cN/6X9Xpu8o3Dvl6XB3gHGirGtuqT4bkrCfRWE9W7I9oGlGdbGFDtK0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725405628; c=relaxed/simple;
	bh=4Z3ozeviRatS93zCqmOEXUHdfvAfceFr0UYbAscwrBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U/stG067i4RI6zk3wJW7hwiafvQyPptu5gSaCWkQHv6aiqc5YnL66s2YLdcTXAhOBkcIiyqJADAMeJMyR+1A17DYHUYrwpHP908sL2SHrMV3Cn4D5Oz+oh/PLBZhMA32Gmgclaf2MfBP8aFpu3jX39wYGdKOzS2U0yLHUxrbCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cn0TfoFN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LjZFX031912;
	Tue, 3 Sep 2024 23:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+nwjH+5HRTBxo4oY6wX0HYfuZukdXAoqF0xzNCPEJ0=; b=Cn0TfoFNDyR0GlaP
	c+sRtEBWfDZdscCKKt/PCtFGbxfY0LAjC1CPtxR+xsgOFiLipgnJ4/sIJl9bcOl6
	VLv2ZasfZo5IZg4etHtcj7WIXN9cP3urlmBfroCD4Izl84aWAdsW3XfSTEzAjPGQ
	M4np++5Ca0JZA0vCj43fcC83Uh1ileopxXFJis958eef5kjdcZuXX5D2fx1C2UpV
	lQRzRoag/UtlOQ+oe4A1Rg7DT2NAMKvZY1jg8G3h2qjxDv18fAAc8+ZeEh3U89xt
	7A2PdU2ls7gN4bYFZD1Jrx0VFcgY84FzLrUbwTyFX4L+quaAilKsrdQwdj/DUtZ6
	FRb0Cg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt67132b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 23:20:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483NK58d013896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 23:20:05 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 16:20:04 -0700
Message-ID: <c9908207-d208-405d-a58d-ab2872adb4f1@quicinc.com>
Date: Tue, 3 Sep 2024 16:20:03 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 24/33] ALSA: usb-audio: Introduce USB SND platform op
 callbacks
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
 <20240829194105.1504814-25-quic_wcheng@quicinc.com>
 <63b679c8-48f1-4251-8b7e-d38b605e5089@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <63b679c8-48f1-4251-8b7e-d38b605e5089@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6xtnjrseX5vOTfg5gQ6jv1TmZOBm_H-9
X-Proofpoint-GUID: 6xtnjrseX5vOTfg5gQ6jv1TmZOBm_H-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030186

Hi Pierre,

On 8/30/2024 2:38 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
>> Allow for different platforms to be notified on USB SND connect/disconnect
>> sequences.  This allows for platform USB SND modules to properly initialize
>> and populate internal structures with references to the USB SND chip
>> device.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/card.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  sound/usb/card.h | 10 +++++++++
>>  2 files changed, 63 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 1f9dfcd8f336..7f120aa006c0 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>>  static DEFINE_MUTEX(register_mutex);
>>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>  static struct usb_driver usb_audio_driver;
>> +static struct snd_usb_platform_ops *platform_ops;
>> +
>> +/*
>> + * Register platform specific operations that will be notified on events
>> + * which occur in USB SND.  The platform driver can utilize this path to
>> + * enable features, such as USB audio offloading, which allows for audio data
>> + * to be queued by an audio DSP.
>> + *
>> + * Only one set of platform operations can be registered to USB SND.  The
>> + * platform register operation is protected by the register_mutex.
>> + */
>> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
>> +{
>> +	guard(mutex)(&register_mutex);
>> +	if (platform_ops)
>> +		return -EEXIST;
>> +
>> +	platform_ops = ops;
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
>> +
>> +/*
>> + * Unregisters the current set of platform operations.  This allows for
> Unregister?
Will fix.
>> + * a new set to be registered if required.
>> + *
>> + * The platform unregister operation is protected by the register_mutex.
>> + */
>> +int snd_usb_unregister_platform_ops(void)
>> +{
>> +	guard(mutex)(&register_mutex);
>> +	platform_ops = NULL;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>>  
>>  /*
>>   * Checks to see if requested audio profile, i.e sample rate, # of
>> @@ -946,7 +982,11 @@ static int usb_audio_probe(struct usb_interface *intf,
>>  	chip->num_interfaces++;
>>  	usb_set_intfdata(intf, chip);
>>  	atomic_dec(&chip->active);
>> +
>> +	if (platform_ops && platform_ops->connect_cb)
>> +		platform_ops->connect_cb(chip);
>>  	mutex_unlock(&register_mutex);
>> +
>>  	return 0;
>>  
>>   __error:
>> @@ -983,6 +1023,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
>>  	card = chip->card;
>>  
>>  	mutex_lock(&register_mutex);
>> +	if (platform_ops && platform_ops->disconnect_cb)
>> +		platform_ops->disconnect_cb(chip);
>> +
>>  	if (atomic_inc_return(&chip->shutdown) == 1) {
>>  		struct snd_usb_stream *as;
>>  		struct snd_usb_endpoint *ep;
>> @@ -1130,6 +1173,11 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
>>  		chip->system_suspend = chip->num_suspended_intf;
>>  	}
>>  
>> +	mutex_lock(&register_mutex);
>> +	if (platform_ops && platform_ops->suspend_cb)
>> +		platform_ops->suspend_cb(intf, message);
>> +	mutex_unlock(&register_mutex);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1170,6 +1218,11 @@ static int usb_audio_resume(struct usb_interface *intf)
>>  
>>  	snd_usb_midi_v2_resume_all(chip);
>>  
>> +	mutex_lock(&register_mutex);
>> +	if (platform_ops && platform_ops->resume_cb)
>> +		platform_ops->resume_cb(intf);
>> +	mutex_unlock(&register_mutex);
>> +
>>   out:
>>  	if (chip->num_suspended_intf == chip->system_suspend) {
>>  		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
>> diff --git a/sound/usb/card.h b/sound/usb/card.h
>> index 4f4f3f39b7fa..23d9e6fc69e7 100644
>> --- a/sound/usb/card.h
>> +++ b/sound/usb/card.h
>> @@ -207,7 +207,17 @@ struct snd_usb_stream {
>>  	struct list_head list;
>>  };
>>  
>> +struct snd_usb_platform_ops {
>> +	void (*connect_cb)(struct snd_usb_audio *chip);
>> +	void (*disconnect_cb)(struct snd_usb_audio *chip);
>> +	void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
>> +	void (*resume_cb)(struct usb_interface *intf);
>> +};
>
> You're using the same mutex to protect all four callbacks, so how would
> things work if e.g. you disconnected a device during the resume operation?

We actually might be able to remove the mutex locks from the suspend and resume callbacks.  From looking at the USB core driver, whenever the USB interface is unbounded, it ensures that it is in an active/resumed state before the disconnect() is called:

static int usb_unbind_interface(struct device *dev)
{
..
    /* Autoresume for set_interface call below */
    udev = interface_to_usbdev(intf);
    error = usb_autoresume_device(udev);
..

    driver->disconnect(intf);

So this will ensure that there won't be a condition where an interface disconnect routine could run in parallel to the interface's runtime resume or runtime suspend.

Thanks

Wesley Cheng


