Return-Path: <linux-input+bounces-6711-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676BA986355
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 17:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B0A21C2798B
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE8F142E6F;
	Wed, 25 Sep 2024 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ks+QM/hh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA026286;
	Wed, 25 Sep 2024 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276714; cv=none; b=luBU95mCMvRywEmKVRPpU+psK2EA8EMohdkOQY92DH3ZTYcIKckD0dFPs7Bbm2h1bJlPlKZLja1/x8pB6voXSl4K0PeXweh5yTt/4+5Jh4brBf89W4OzI+PS1Ppfo+7pSB5hFVLIceOyL75l+g0UPfh1UsekVyk1nwn9T8Hp3LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276714; c=relaxed/simple;
	bh=T2zrorYH38ZeDMov/K20BC/o421pWzvHIB0IRUXQoGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8D3BW5305Jzml+StmdKgBAGlQFNKRPD8Mf3PVbohad3CmNCAEnO9yke/SiLcxWWYdeoWGipjyEcGGPIWMPFQvShDOci1LcLX5Vx/G8eBZnyANm8loIVFtp0aE4w+VRIFvzx0MPXghCLHa9CJnW3/hUah6eYpnO2U1sA4giQWEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ks+QM/hh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276713; x=1758812713;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T2zrorYH38ZeDMov/K20BC/o421pWzvHIB0IRUXQoGU=;
  b=ks+QM/hhaf1WUtBHoJ+RUOYoprDLkBqL/Uwf7uJVQXLG35LEclETvLGe
   Zy4vEYDSHKonKsVAguASqN0sG9Iz6EDj2/5mbr2uy+x37YhX9goLO9kkU
   2u256LKWajNN4x4r2NKc1VG4QzcFDtd9607LKgpdOYCh675g27Mkltd1H
   YGicwrcEhUtlpAnsZjMEOahT4DbHTNKQSCvHiI+HcGaeP25S/Syo3rNp6
   C2VENOb9npmU+e7uxLKUa7YFzzsbbZWQIBL71FscyMxLkaeLlBZz46SlU
   3/IPVsBxuWR9+vA5dNN5iRMGF38+wazYM1YF+49XOuajWi46hdci8+uTQ
   A==;
X-CSE-ConnectionGUID: zSbyeRstQ2ir3NfzqlFjtA==
X-CSE-MsgGUID: Rjv4HdsKTXKREES34Ld1/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482893"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26482893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:13 -0700
X-CSE-ConnectionGUID: IjO7nbUrSZOqVow0coJEug==
X-CSE-MsgGUID: VVIHvXAeRGu7a+YerlxuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76317677"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30]) ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:07 -0700
Message-ID: <86c557ca-2b86-4334-bc42-40dfe8203b71@linux.intel.com>
Date: Wed, 25 Sep 2024 16:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 18/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +	int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +					struct snd_soc_jack *jack)
> +..
> +
> +  - ``component``: ASoC component to add the jack
> +  - ``jack``: jack component to populate
> +
> +**snd_soc_usb_setup_offload_jack()** is a helper to add a sound jack control to
> +the platform sound card.  This will allow for consistent naming to be used on
> +designs that support USB audio offloading.
> +
> +Returns 0 on success, negative otherwise.
> +
> +.. code-block:: rst
> +
> +	int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
> +..
> +
> +  - ``component``: ASoC component to disable the jack
> +
> +**snd_soc_usb_disable_offload_jack()** is a helper to disable a sound jack control
> +on the platform sound card.

is disable_offload_jack() the companion operation to setup_offload_jack()?

it's not clear to me if there's any relationship between the two.

> +
> +Returns 0 on success, negative otherwise.
> +
> +.. code-block:: rst
> +
> +	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +					     int direction, long *route)
> +..
> +
> +  - ``dev``: USB device to look up offload path mapping
> +  - ``card``: USB sound card index
> +  - ``pcm``: USB sound PCM device index
> +  - ``direction``: direction to fetch offload routing information
> +  - ``route``: mapping of sound card and pcm indexes for the offload path.  This is
> +	       an array of two integers that will carry the card and pcm device indexes
> +	       in that specific order.  This can be used as the array for the kcontrol
> +	       output.
> +
> +**snd_soc_usb_update_offload_route()** calls a registered callback to the USB BE DAI
> +link to fetch the information about the mapped ASoC devices for executing USB audio
> +offload for the device. ``route`` may be a pointer to a kcontrol value output array,
> +which carries values when the kcontrol is read.
> +
> +Returns 0 on success, negative otherwise.

please clarify what happens if there is no offloaded device for a
specific USB card. from [2] below it looks like the intended behavior
for a device without offload capabilities would be to return 0 but the
mapping would use the -1 magic value to state there is no offload?


> +**snd_soc_usb_free_port()** frees a SOC USB device.
> +
> +.. code-block:: rst
> +
> +	void snd_soc_usb_add_port(struct snd_soc_usb *usb);
> +..
> +
> +  - ``usb``: SOC USB device to add
> +
> +**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
> +Once added, this device can be referenced by further operations.
> +
> +.. code-block:: rst
> +
> +	void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
> +..
> +
> +  - ``usb``: SOC USB device to remove
> +
> +**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
> +After removing a device, any SOC USB operations would not be able to reference the
> +device removed.

I don't think the last sentence is correct, below [1] you show an
example where the free_port() routine is required...


> +
> +	static void q6usb_component_remove(struct snd_soc_component *component)
> +	{
> +		...

[1]

> +		snd_soc_usb_remove_port(data->usb);
> +		snd_soc_usb_free_port(data->usb);
> +	}
> +
> +	static const struct snd_soc_component_driver q6usb_dai_component = {
> +		.probe = q6usb_component_probe,
> +		.remove = q6usb_component_remove,
> +		.name = "q6usb-dai-component",
> +		...
> +	};
> +..
> +
> +BE DAI links can pass along vendor specific information as part of the
> +call to allocate the SOC USB device.  This will allow any BE DAI link
> +parameters or settings to be accessed by the USB offload driver that
> +resides in USB SND.
> +
> +USB Audio Device Connection Flow
> +--------------------------------
> +USB devices can be hotplugged into the USB ports at any point in time.
> +The BE DAI link should be aware of the current state of the physical USB
> +port, i.e. if there are any USB devices with audio interface(s) connected.
> +connection_status_cb() can be used to notify the BE DAI link of any change.
> +
> +This is called whenever there is a USB SND interface bind or remove event,
> +using snd_soc_usb_connect() or snd_soc_usb_disconnect():
> +
> +.. code-block:: rst
> +
> +	static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
> +	{
> +		...
> +		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
> +		...
> +	}
> +
> +	static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
> +	{
> +		...
> +		snd_soc_usb_disconnect(usb_get_usb_backend(chip->dev), dev->sdev);
> +		...
> +	}
> +..
> +
> +In order to account for conditions where driver or device existence is
> +not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
> +connect events for any identified USB audio interfaces.  Consider the
> +the following situation:
> +
> +	**usb_audio_probe()**
> +	  | --> USB audio streams allocated and saved to usb_chip[]
> +	  | --> Propagate connect event to USB offload driver in USB SND
> +	  | --> **snd_soc_usb_connect()** exits as USB BE DAI link is not ready
> +
> +	BE DAI link component probe
> +	  | --> DAI link is probed and SOC USB port is allocated
> +	  | --> The USB audio device connect event is missed
> +
> +To ensure connection events are not missed, **snd_usb_rediscover_devices()**
> +is executed when the SOC USB device is registered.  Now, when the BE DAI
> +link component probe occurs, the following highlights the sequence:
> +
> +	BE DAI link component probe
> +	  | --> DAI link is probed and SOC USB port is allocated
> +	  | --> SOC USB device added, and **snd_usb_rediscover_devices()** runs
> +
> +	**snd_usb_rediscover_devices()**
> +	  | --> Traverses through usb_chip[] and for non-NULL entries issue
> +	  |     **connection_status_cb()**
> +
> +In the case where the USB offload driver is unbound, while USB SND is ready,
> +the **snd_usb_rediscover_devices()** is called during module init.  This allows
> +for the offloading path to also be enabled with the following flow:
> +
> +	**usb_audio_probe()**
> +	  | --> USB audio streams allocated and saved to usb_chip[]
> +	  | --> Propagate connect event to USB offload driver in USB SND
> +	  | --> USB offload driver **NOT** ready!
> +
> +	BE DAI link component probe
> +	  | --> DAI link is probed and SOC USB port is allocated
> +	  | --> No USB connect event due to missing USB offload driver
> +
> +	USB offload driver probe
> +	  | --> **qc_usb_audio_offload_init()**
> +	  | --> Calls **snd_usb_rediscover_devices()** to notify of devices
> +
> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.
> +
> +Implementation
> +--------------
> +
> +**Example:**
> +
> +  **Sound Cards**:
> +
> +	::
> +
> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
> +						Plantronics Plantronics Blackwire
> +						3225 Seri at usb-xhci-hcd.1.auto-1.1,
> +						full sp
> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +  **USB Sound Card** - card#2:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> +
> +The above example shows a scenario where the system has one ASoC platform card
> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
> +the available kcontrols for each USB audio device, the following kcontrol lists
> +the mapped offload path for the specific device:
> +
> +	``USB Offload Playback Route#*``
> +
> +The kcontrol is indexed, because a USB audio device could potentially have
> +several PCM devices.  The above kcontrols are defined as:
> +
> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
> +    card and PCM device index.  The output **"0, 1"** (card index, PCM device index)
> +    signifies that there is an available offload path for the USB SND device
> +    through card#0 - PCM device#1.  If **"-1, -1"** is seen, then no offload path is
> +    available for the USB SND device.

[2]

maybe I got this wrong but you may want to clarify that the kcontrol is
always created, but the values indicate if the offload support is real
or not?


> +
> +USB Offload Playback Route Kcontrol
> +-----------------------------------
> +In order to allow for vendor specific implementations on audio offloading device
> +selection, the SOC USB layer exposes the following:
> +
> +.. code-block:: rst
> +
> +	int (*update_offload_route_info)(struct snd_soc_component *component,
> +				int card, int pcm, long *route);
> +..
> +
> +These are specific for the **USB Offload Playback Route PCM#** kcontrol.
> +
> +When users issue get calls to the kcontrol, the registered SOC USB callbacks will
> +execute the registered function calls to the DPCM BE DAI link.
> +
> +**Callback Registration:**
> +
> +.. code-block:: rst
> +
> +	static int q6usb_component_probe(struct snd_soc_component *component)
> +	{
> +	...
> +	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
> +	if (IS_ERR(usb))
> +		return -ENOMEM;
> +
> +	usb->connection_status_cb = q6usb_alsa_connection_cb;
> +	usb->update_offload_route_info = q6usb_get_offload_dev;
> +
> +	ret = snd_soc_usb_add_port(usb);
> +..
> +
> +Existing USB Sound Kcontrol
> +---------------------------
> +With the introduction of USB offload support, the above USB offload kcontrol
> +can be added to the pre existing list of kcontrols identified by the USB sound

is this 'can be added' or 'will be added'? The latter seems more correct
to me, I don't see anything optional or conditional in the description
and the example below.

> +framework.  These kcontrols are still the main controls that are used to
> +modify characteristics pertaining to the USB audio device.
> +
> +	::
> +
> +	  Number of controls: 9
> +	  ctl     type    num     name                                    value
> +	  0       INT     2       Capture Channel Map                     0, 0 (range 0->36)
> +	  1       INT     2       Playback Channel Map                    0, 0 (range 0->36)
> +	  2       BOOL    1       Headset Capture Switch                  On
> +	  3       INT     1       Headset Capture Volume                  10 (range 0->13)
> +	  4       BOOL    1       Sidetone Playback Switch                On
> +	  5       INT     1       Sidetone Playback Volume                4096 (range 0->8192)
> +	  6       BOOL    1       Headset Playback Switch                 On
> +	  7       INT     2       Headset Playback Volume                 20, 20 (range 0->24)
> +	  8       INT     2       USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +Since USB audio device controls are handled over the USB control endpoint, use the
> +existing mechanisms present in the USB mixer to set parameters, such as volume.


