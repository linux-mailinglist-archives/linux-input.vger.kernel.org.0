Return-Path: <linux-input+bounces-5978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 301FA964FB5
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5547C1C2378E
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55491C1AC6;
	Thu, 29 Aug 2024 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mVbN+E8X"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7C1BE860;
	Thu, 29 Aug 2024 19:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960515; cv=none; b=sdGu3twmibrdyznM0NcYxGW1yjSovZp9HR3gGVTZeSxchHbMraddaNUwetmwkRQH1dHmitb6VLwxiK1S8OstDWn5s6FECnqYD6F0padZ/rM9XHVuuE246BiCgQrm1QsxFYNJZz6mXq+RQUERDy5IQpZxeaaB3t/+1cOG5coHSY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960515; c=relaxed/simple;
	bh=1hjYfBhQ6OZ7B4Q3EKa6vQ8VNZoVr5qJloknITFQF/w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZiF3Ct65KvqLI8fh8uOolZkM4EXTm91+nqKtNld6/aVbbkK+a+y10w2YPWtqf8+SFA5WYoDKDD7pPFgyZc19WOdLiqoCUP4+UZfXkLutAG/g81EbOtbFcd58yEddJpdYYWt7pxiFph+vrJvNRZK0xyPDw8Be9bJr834/D/bF//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mVbN+E8X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THWFFh026564;
	Thu, 29 Aug 2024 19:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCECqi0Kh7pKNJmpMfebINOukTeD856OBuL+DamaEr0=; b=mVbN+E8XD5KbDjrC
	2a90FwtTy81YXNCnV26MLQPJX1lFaF/x5eB0zgTsYSlaqYqdGfgBqLQhzdDPFMNb
	FXhkdDRS5GImiytbUtE2Wgiyr6CxTnlsiCVsseE9C46u5xcsNmyeS1F6VT9dnJeK
	kl3sDhLu0xUSLQ0YRC9pfc7y2PNjcHMdi/JOjSvJhK+2aHQaIoorMDhitAkebD29
	95ma86F3vU/EUYLumRpUSjrUQAcIDftMZltbl01U2/EYbTlPTHQ0HMj09JXbiucL
	ghqBuHyW4U013AaOMg5vjVW9TI3/j7n5M086Myfo7XmTHYLXhAsLHdf5vHvuRWzz
	WE37LQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puvefye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TJfTQW016273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:29 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:28 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 16/33] ASoC: doc: Add documentation for SOC USB
Date: Thu, 29 Aug 2024 12:40:48 -0700
Message-ID: <20240829194105.1504814-17-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 36bj6kef-_9Mk1wIf-ueW8K-ucCGjCXo
X-Proofpoint-GUID: 36bj6kef-_9Mk1wIf-ueW8K-ucCGjCXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290139

With the introduction of the soc-usb driver, add documentation highlighting
details on how to utilize the new driver and how it interacts with
different components in USB SND and ASoC.  It provides examples on how to
implement the drivers that will need to be introduced in order to enable
USB audio offloading.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 Documentation/sound/soc/index.rst |   1 +
 Documentation/sound/soc/usb.rst   | 429 ++++++++++++++++++++++++++++++
 2 files changed, 430 insertions(+)
 create mode 100644 Documentation/sound/soc/usb.rst

diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
index e57df2dab2fd..8bed8f8f48da 100644
--- a/Documentation/sound/soc/index.rst
+++ b/Documentation/sound/soc/index.rst
@@ -18,3 +18,4 @@ The documentation is spilt into the following sections:-
    jack
    dpcm
    codec-to-codec
+   usb
diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
new file mode 100644
index 000000000000..bd3d9eb86b07
--- /dev/null
+++ b/Documentation/sound/soc/usb.rst
@@ -0,0 +1,429 @@
+================
+ASoC USB support
+================
+
+Overview
+========
+In order to leverage the existing USB sound device support in ALSA, the
+ASoC USB APIs are introduced to allow for the entities to communicate
+with one another.
+
+One potential use case would be to support USB audio offloading, which is
+an implementation that allows for an external DSP on the SoC to handle the
+transfer of audio data over the USB bus.  This would let the main
+processor to stay in lower power modes for longer duration.  The following
+is an example design of how the ASoC and ALSA pieces can be connected
+together to achieve this:
+
+::
+
+               USB                   |            ASoC
+                                     |  _________________________
+                                     | |   ASoC Platform card    |
+                                     | |_________________________|
+                                     |         |           |
+                                     |      ___V____   ____V____
+                                     |     |ASoC BE | |ASoC FE  |
+                                     |     |DAI LNK | |DAI LNK  |
+                                     |     |________| |_________|
+                                     |         ^  ^        ^
+                                     |         |  |________|
+                                     |      ___V____    |
+                                     |     |SOC-USB |   |
+     ________       ________               |        |   |
+    |USB SND |<--->|USBSND  |<------------>|________|   |
+    |(card.c)|     |offld   |<----------                |
+    |________|     |________|___     | |                |
+        ^               ^       |    | |    ____________V_________
+        |               |       |    | |   |IPC                   |
+     __ V_______________V_____  |    | |   |______________________|
+    |USB SND (endpoint.c)     | |    | |              ^
+    |_________________________| |    | |              |
+                ^               |    | |   ___________V___________
+                |               |    | |->|audio DSP              |
+     ___________V_____________  |    |    |_______________________|
+    |XHCI HCD                 |<-    |
+    |_________________________|      |
+
+
+SOC USB driver
+==============
+Structures
+----------
+``struct snd_soc_usb``
+
+  - ``list``: list head for SND SOC struct list
+  - ``component``: reference to ASoC component
+  - ``connection_status_cb``: callback to notify connection events
+  - ``update_offload_route_info``: callback to fetch selected USB sound card/PCM
+    device
+  - ``priv_data``: driver data
+
+The snd_soc_usb structure can be referenced using the ASoC platform card
+device, or a USB device (udev->dev).  This is created by the ASoC BE DAI
+link, and the USB sound entity will be able to pass information to the
+ASoC BE DAI link using this structure.
+
+``struct snd_soc_usb_device``
+
+  - ``card_idx``: sound card index associated with USB sound device
+  - ``chip_idx``: USB sound chip array index
+  - ``cpcm_idx``: capture pcm device indexes associated with the USB sound device
+  - ``ppcm_idx``: playback pcm device indexes associated with the USB sound device
+  - ``num_playback``: number of playback streams
+  - ``num_capture``: number of capture streams
+  - ``list``: list head for the USB sound device list
+
+The struct snd_soc_usb_device is created by the USB sound offload driver.
+This will carry basic parameters/limitations that will be used to
+determine the possible offloading paths for this USB audio device.
+
+Functions
+---------
+.. code-block:: rst
+
+	int snd_soc_usb_find_supported_format(int card_idx,
+			struct snd_pcm_hw_params *params, int direction)
+..
+
+  - ``card_idx``: the index into the USB sound chip array.
+  - ``params``: Requested PCM parameters from the USB DPCM BE DAI link
+  - ``direction``: capture or playback
+
+**snd_soc_usb_find_supported_format()** ensures that the requested audio profile
+being requested by the external DSP is supported by the USB device.
+
+Returns 0 on success, and -EOPNOTSUPP on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+..
+
+  - ``usbdev``: the usb device that was discovered
+  - ``sdev``: capabilities of the device
+
+**snd_soc_usb_connect()** notifies the ASoC USB DCPM BE DAI link of a USB
+audio device detection.  This can be utilized in the BE DAI
+driver to keep track of available USB audio devices.  This is intended
+to be called by the USB offload driver residing in USB SND.
+
+Returns 0 on success, negative error code on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+..
+
+  - ``usbdev``: the usb device that was removed
+  - ``sdev``: capabilities to free
+
+**snd_soc_usb_disconnect()** notifies the ASoC USB DCPM BE DAI link of a USB
+audio device removal.  This is intended to be called by the USB offload
+driver that resides in USB SND.
+
+.. code-block:: rst
+
+	void *snd_soc_usb_find_priv_data(struct device *usbdev)
+..
+
+  - ``usbdev``: the usb device to reference to find private data
+
+**snd_soc_usb_find_priv_data()** fetches the private data saved to the SOC USB
+device.
+
+Returns pointer to priv_data on success, NULL on failure.
+
+.. code-block:: rst
+
+	int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+					struct snd_soc_jack *jack)
+..
+
+  - ``component``: ASoC component to add the jack
+  - ``jack``: jack component to populate
+
+**snd_soc_usb_setup_offload_jack()** is a helper to add a sound jack control to
+the platform sound card.  This will allow for consistent naming to be used on
+designs that support USB audio offloading.
+
+Returns 0 on success, negative otherwise.
+
+.. code-block:: rst
+
+	int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
+..
+
+  - ``component``: ASoC component to disable the jack
+
+**snd_soc_usb_disable_offload_jack()** is a helper to disable a sound jack control
+on the platform sound card.
+
+Returns 0 on success, negative otherwise.
+
+.. code-block:: rst
+
+	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+					     int direction, long *route)
+..
+
+  - ``dev``: USB device to look up offload path mapping
+  - ``card``: USB sound card index
+  - ``pcm``: USB sound PCM device index
+  - ``direction``: direction to fetch offload routing information
+  - ``route``: mapping of sound card and pcm indexes for the offload path
+
+**snd_soc_usb_update_offload_route()** calls a registered callback to the USB BE DAI
+link to fetch the information about the mapped ASoC devices for executing USB audio
+offload for the device. ``route`` may be a pointer to a kcontrol value output array,
+which carries values when the kcontrol is read.
+
+Returns 0 on success, negative otherwise.
+
+.. code-block:: rst
+
+	struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+			void *data);
+..
+
+  - ``component``: DPCM BE DAI link component
+  - ``data``: private data
+
+**snd_soc_usb_allocate_port()** allocates a SOC USB device and populates standard
+parameters that is used for further operations.
+
+Returns a pointer to struct soc_usb on success, negative on error.
+
+.. code-block:: rst
+
+	void snd_soc_usb_free_port(struct snd_soc_usb *usb);
+..
+
+  - ``usb``: SOC USB device to free
+
+**snd_soc_usb_free_port()** frees a SOC USB device.
+
+.. code-block:: rst
+
+	void snd_soc_usb_add_port(struct snd_soc_usb *usb);
+..
+
+  - ``usb``: SOC USB device to add
+
+**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
+Once added, this device can be referenced by further operations.
+
+.. code-block:: rst
+
+	void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
+..
+
+  - ``usb``: SOC USB device to remove
+
+**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
+After removing a device, any SOC USB operations would not be able to reference the
+device removed.
+
+How to Register to SOC USB
+--------------------------
+The ASoC DPCM USB BE DAI link is the entity responsible for allocating and
+registering the SOC USB device on the component bind.  Likewise, it will
+also be responsible for freeing the allocated resources.  An example can
+be shown below:
+
+.. code-block:: rst
+
+	static int q6usb_component_probe(struct snd_soc_component *component)
+	{
+		...
+		data->usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
+		if (!data->usb)
+			return -ENOMEM;
+
+		usb->connection_status_cb = q6usb_alsa_connection_cb;
+
+		ret = snd_soc_usb_add_port(usb);
+		if (ret < 0) {
+			dev_err(component->dev, "failed to add usb port\n");
+			goto free_usb;
+		}
+		...
+	}
+
+	static void q6usb_component_remove(struct snd_soc_component *component)
+	{
+		...
+		snd_soc_usb_remove_port(data->usb);
+		snd_soc_usb_free_port(data->usb);
+	}
+
+	static const struct snd_soc_component_driver q6usb_dai_component = {
+		.probe = q6usb_component_probe,
+		.remove = q6usb_component_remove,
+		.name = "q6usb-dai-component",
+		...
+	};
+..
+
+BE DAI links can pass along vendor specific information as part of the
+call to allocate the SOC USB device.  This will allow any BE DAI link
+parameters or settings to be accessed by the USB offload driver that
+resides in USB SND.
+
+USB Audio Device Connection Flow
+--------------------------------
+USB devices can be hotplugged into the USB root hub at any point in time.
+The BE DAI link should be aware of the current state of the physical USB
+port, i.e. if there are any USB devices with audio interface(s) connected.
+connection_status_cb() can be used to notify the BE DAI link of any change.
+
+This is called whenever there is a USB SND interface bind or remove event,
+using snd_soc_usb_connect() or snd_soc_usb_disconnect():
+
+.. code-block:: rst
+
+	static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
+	{
+		...
+		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
+		...
+	}
+
+	static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
+	{
+		...
+		snd_soc_usb_disconnect(usb_get_usb_backend(chip->dev), dev->sdev);
+		...
+	}
+..
+
+In order to account for conditions where driver or device existence is
+not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
+connect events for any identified USB audio interfaces.  Consider the
+the following situation:
+
+	**usb_audio_probe()**
+	  | --> USB audio streams allocated and saved to usb_chip[]
+	  | --> Propagate connect event to USB offload driver in USB SND
+	  | --> **snd_soc_usb_connect()** exits as USB BE DAI link is not ready
+
+	BE DAI link component probe
+	  | --> DAI link is probed and SOC USB port is allocated
+	  | --> The USB audio device connect event is missed
+
+To ensure connection events are not missed, **snd_usb_rediscover_devices()**
+is executed when the SOC USB device is registered.  Now, when the BE DAI
+link component probe occurs, the following highlights the sequence:
+
+	BE DAI link component probe
+	  | --> DAI link is probed and SOC USB port is allocated
+	  | --> SOC USB device added, and **snd_usb_rediscover_devices()** runs
+
+	**snd_usb_rediscover_devices()**
+	  | --> Traverses through usb_chip[] and for non-NULL entries issue
+	  |     **connection_status_cb()**
+
+In the case where the USB offload driver is unbound, while USB SND is ready,
+the **snd_usb_rediscover_devices()** is called during module init.  This allows
+for the offloading path to also be enabled with the following flow:
+
+	**usb_audio_probe()**
+	  | --> USB audio streams allocated and saved to usb_chip[]
+	  | --> Propagate connect event to USB offload driver in USB SND
+	  | --> USB offload driver **NOT** ready!
+
+	BE DAI link component probe
+	  | --> DAI link is probed and SOC USB port is allocated
+	  | --> No USB connect event due to missing USB offload driver
+
+	USB offload driver probe
+	  | --> **qc_usb_audio_offload_init()**
+	  | --> Calls **snd_usb_rediscover_devices()** to notify of devices
+
+USB Offload Related Kcontrols
+=============================
+Details
+-------
+A set of kcontrols can be utilized by applications to help select the proper sound
+devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
+callback that designs can use to ensure that the proper indices are returned to the
+application.
+
+Implementation
+--------------
+
+**Example:**
+
+  **Sound Cards**:
+
+	::
+
+	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
+						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
+	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
+						Plantronics Plantronics Blackwire
+						3225 Seri at usb-xhci-hcd.1.auto-1.1,
+						full sp
+	  2 [C320M          ]: USB-Audio - Plantronics C320-M
+                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
+
+  **USB Sound Card** - card#1:
+
+	::
+
+	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
+
+  **USB Sound Card** - card#2:
+
+	::
+
+	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
+
+The above example shows a scenario where the system has one ASoC platform card
+(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
+the available kcontrols for each USB audio device, the following kcontrol lists
+the mapped offload path for the specific device:
+
+	``USB Offload Playback Route#*``
+
+The kcontrol is indexed, because a USB audio device could potentially have
+several PCM devices.  The above kcontrols are defined as:
+
+  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
+    card and PCM device index.  The output **"0, 1"** (card index, PCM device index)
+    signifies that there is an available offload path for the USB SND device
+    through card#0 - PCM device#1.  If **"-1, -1"** is seen, then no offload path is
+    available for the USB SND device.
+
+USB Offload Playback Route Kcontrol
+-----------------------------------
+In order to allow for vendor specific implementations on audio offloading device
+selection, the SOC USB layer exposes the following:
+
+.. code-block:: rst
+
+	int (*update_offload_route_info)(struct snd_soc_component *component,
+				int card, int pcm, long *route);
+..
+
+These are specific for the **USB Offload Playback Route PCM#** kcontrol.
+
+When users issue get calls to the kcontrol, the registered SOC USB callbacks will
+execute the registered function calls to the DPCM BE DAI link.
+
+**Callback Registration:**
+
+.. code-block:: rst
+
+	static int q6usb_component_probe(struct snd_soc_component *component)
+	{
+	...
+	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
+	if (IS_ERR(usb))
+		return -ENOMEM;
+
+	usb->connection_status_cb = q6usb_alsa_connection_cb;
+	usb->update_offload_route_info = q6usb_get_offload_dev;
+
+	ret = snd_soc_usb_add_port(usb);
+..

