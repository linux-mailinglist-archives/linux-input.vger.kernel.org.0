Return-Path: <linux-input+bounces-7923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC879BF71B
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 20:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2C9284978
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 19:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D158C212D16;
	Wed,  6 Nov 2024 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zz8agE8c"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBCD20EA5F;
	Wed,  6 Nov 2024 19:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921697; cv=none; b=Ga/b321gnBfo6iGPmQ4ve1LGi9uCWCqn5VHR6TUlbMRqZMMqcGWd7mmaS3Q1uedpsV39YpPoO1NTswLfOG5EuLlW5DauLp7gnTiO3IrYVDJIZERePHKghSQ7kxd5pdCFvfviXJY1MT64JbdTQto28820FCas9jXD4+tIyjr73C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921697; c=relaxed/simple;
	bh=SRJsVhulmlSq1Uzokh47KkyteTQIV5JP4y/QcmI6sk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPYiOvQo823LIZSXtxGVX8qfSx7QtAR1oN+y88MKfXp+dgipnA/H8wi5iFHriMeCQso9vinLfIY+qitzXI84K+W+dhs3vAvyByck8A6TfiE43VY8aVQA5a/UTxHzsCvteIVEqE8WLYy/6DFZxGssNNl418Y7QdSEijGWDMWmq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zz8agE8c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6AVE5v002942;
	Wed, 6 Nov 2024 19:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0C6moVkVDGYPQe6drSrN0mAgk6N09S7YyiwB3qU+YA=; b=Zz8agE8c2QJ397TT
	RVKXgmIo2qHtUPAJv+wLxm+3DwnsQQfph/DQ5anGmAjZvHfDrUvMY8royVhvTyMz
	MoRhm7lR6Wxm3owZfC+A8qjdWXHDPKBjqEoG68aa/ABys3mynpEgpPZ8RjSGq1Iw
	TB/9YbJhAqs5ouly2T24DSc8dT5lRBVMN7Jq8miU+cEiyE7Gem4mZZiVmMD3e9Bv
	Rj5YgOGiHZtMXg8JotzEJNJ1qRdmvHuLEy0C/kOhJ1OhQ3kiVDBQRXM3lLFUDWVV
	YLyADF8B6KAfYcbp0EZU1qh5Iigu5yS5iWPuBtYkIf5faN4e2Q6xoYTtdzSZb0O5
	9FwFaQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qvhd2y94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 19:34:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6JYXSI027644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 19:34:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 11:34:33 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v30 16/30] ASoC: doc: Add documentation for SOC USB
Date: Wed, 6 Nov 2024 11:33:59 -0800
Message-ID: <20241106193413.1730413-17-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2GMqb-wbJ-aphP3ZYnFiWLpRADipPyFL
X-Proofpoint-GUID: 2GMqb-wbJ-aphP3ZYnFiWLpRADipPyFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411060149

With the introduction of the soc-usb driver, add documentation highlighting
details on how to utilize the new driver and how it interacts with
different components in USB SND and ASoC.  It provides examples on how to
implement the drivers that will need to be introduced in order to enable
USB audio offloading.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 Documentation/sound/soc/index.rst |   1 +
 Documentation/sound/soc/usb.rst   | 491 ++++++++++++++++++++++++++++++
 2 files changed, 492 insertions(+)
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
index 000000000000..3a8c69050886
--- /dev/null
+++ b/Documentation/sound/soc/usb.rst
@@ -0,0 +1,491 @@
+================
+ASoC USB support
+================
+
+Overview
+========
+In order to leverage the existing USB sound device support in ALSA, the
+ASoC USB APIs are introduced to allow the subsystems to exchange
+configuration information.
+
+One potential use case would be to support USB audio offloading, which is
+an implementation that allows for an alternate power-optimized path in the audio
+subsystem to handle the transfer of audio data over the USB bus.  This would
+let the main processor to stay in lower power modes for longer duration.  The
+following is an example design of how the ASoC and ALSA pieces can be connected
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
+designs that support USB audio offloading.  Additionally, this will enable the
+jack to notify of changes.
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
+	int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
+					struct snd_soc_jack *jack)
+..
+
+  - ``component``: ASoC component to enable the jack
+  - ``jack``: jack component to populate
+
+**snd_soc_usb_enable_offload_jack()** is the opposing function to the disable jack
+API. (**snd_soc_usb_disable_offload_jack()**)  This will re-enable a specified
+jack to start generating events for changes occurring on the USB port.
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
+  - ``route``: mapping of sound card and pcm indexes for the offload path.  This is
+	       an array of two integers that will carry the card and pcm device indexes
+	       in that specific order.  This can be used as the array for the kcontrol
+	       output.
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
+USB devices can be hotplugged into the USB ports at any point in time.
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
+  **PCM Devices**:
+
+	::
+
+	  card 0: SM8250MTPWCD938 [SM8250-MTP-WCD9380-WSA8810-VA-D], device 0: MultiMedia1 (*) []
+	  Subdevices: 1/1
+	  Subdevice #0: subdevice #0
+	  card 0: SM8250MTPWCD938 [SM8250-MTP-WCD9380-WSA8810-VA-D], device 1: MultiMedia2 (*) []
+	  Subdevices: 1/1
+	  Subdevice #0: subdevice #0
+	  card 1: Seri [Plantronics Blackwire 3225 Seri], device 0: USB Audio [USB Audio]
+	  Subdevices: 1/1
+	  Subdevice #0: subdevice #0
+	  card 2: C320M [Plantronics C320-M], device 0: USB Audio [USB Audio]
+	  Subdevices: 1/1
+	  Subdevice #0: subdevice #0
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
+    available for the USB SND device.  This kcontrol exists for each USB audio
+    device that exists in the system, and its expected to derive the current status
+    of offload based on the output value for the kcontrol.
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
+
+Existing USB Sound Kcontrol
+---------------------------
+With the introduction of USB offload support, the above USB offload kcontrol
+will be added to the pre existing list of kcontrols identified by the USB sound
+framework.  These kcontrols are still the main controls that are used to
+modify characteristics pertaining to the USB audio device.
+
+	::
+
+	  Number of controls: 9
+	  ctl     type    num     name                                    value
+	  0       INT     2       Capture Channel Map                     0, 0 (range 0->36)
+	  1       INT     2       Playback Channel Map                    0, 0 (range 0->36)
+	  2       BOOL    1       Headset Capture Switch                  On
+	  3       INT     1       Headset Capture Volume                  10 (range 0->13)
+	  4       BOOL    1       Sidetone Playback Switch                On
+	  5       INT     1       Sidetone Playback Volume                4096 (range 0->8192)
+	  6       BOOL    1       Headset Playback Switch                 On
+	  7       INT     2       Headset Playback Volume                 20, 20 (range 0->24)
+	  8       INT     2       USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
+
+Since USB audio device controls are handled over the USB control endpoint, use the
+existing mechanisms present in the USB mixer to set parameters, such as volume.

