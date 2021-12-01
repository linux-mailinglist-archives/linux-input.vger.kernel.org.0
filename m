Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37E1465428
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 18:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244018AbhLARnh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 12:43:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34047 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231499AbhLARnh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Dec 2021 12:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638380415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rqx3VhOWP4ZwNNKJfE8OLeuDnLjQUfNrptoI6CXAo98=;
        b=V3xSkymwS0cvi+xiomyGrLIyLDGqkYNWzzcgLt5NDVXz+s8XQSu/WrbO4/AicV+QBJ0feU
        tC3igSx0gInQdat6jjCYUPHu8ben3fEuqvncCh2x1LWzNrr+EY1lVnHzGMhCnQL7k7WWpb
        w4aTnyJJGEUbrcdzMuG1SX/wTnwGVsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-ajkKwEF6PC-hxh3TyONxVw-1; Wed, 01 Dec 2021 12:40:12 -0500
X-MC-Unique: ajkKwEF6PC-hxh3TyONxVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0694B874984;
        Wed,  1 Dec 2021 17:40:11 +0000 (UTC)
Received: from [10.39.192.102] (unknown [10.39.192.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F22C55D6BA;
        Wed,  1 Dec 2021 17:40:08 +0000 (UTC)
Message-ID: <575b12be-fec6-522f-0bc9-f62077d57a81@redhat.com>
Date:   Wed, 1 Dec 2021 18:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] HID: check for valid USB device for many HID
 drivers
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20211201163816.2219291-1-gregkh@linuxfoundation.org>
 <20211201163816.2219291-3-gregkh@linuxfoundation.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
In-Reply-To: <20211201163816.2219291-3-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/1/21 17:38, Greg Kroah-Hartman wrote:
> Many HID drivers assume that the HID device assigned to them is a USB
> device as that was the only way HID devices used to be able to be
> created in Linux.  However, with the additional ways that HID devices
> can be created for many different bus types, that is no longer true, so
> properly check that we have a USB device associated with the HID device
> before allowing a driver that makes this assumption to claim it.
> 
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Michael Zaidman <michael.zaidman@gmail.com>
> Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: holtek_kbd_probe() changes to test for USB device before calling
>      hid_probe() and dereferenced the usb interface pointer based on
>      Benjamin's review.
> 
>   drivers/hid/hid-chicony.c         |  3 +++
>   drivers/hid/hid-corsair.c         |  7 ++++++-
>   drivers/hid/hid-elan.c            |  2 +-
>   drivers/hid/hid-elo.c             |  3 +++
>   drivers/hid/hid-ft260.c           |  3 +++
>   drivers/hid/hid-holtek-kbd.c      |  9 +++++++--
>   drivers/hid/hid-holtek-mouse.c    |  9 +++++++++
>   drivers/hid/hid-lg.c              | 10 ++++++++--
>   drivers/hid/hid-prodikeys.c       | 10 ++++++++--
>   drivers/hid/hid-roccat-arvo.c     |  3 +++
>   drivers/hid/hid-roccat-isku.c     |  3 +++
>   drivers/hid/hid-roccat-kone.c     |  3 +++
>   drivers/hid/hid-roccat-koneplus.c |  3 +++
>   drivers/hid/hid-roccat-konepure.c |  3 +++
>   drivers/hid/hid-roccat-kovaplus.c |  3 +++
>   drivers/hid/hid-roccat-lua.c      |  3 +++
>   drivers/hid/hid-roccat-pyra.c     |  3 +++
>   drivers/hid/hid-roccat-ryos.c     |  3 +++
>   drivers/hid/hid-roccat-savu.c     |  3 +++
>   drivers/hid/hid-samsung.c         |  3 +++
>   drivers/hid/hid-thrustmaster.c    |  3 +++
>   drivers/hid/hid-uclogic-core.c    |  3 +++
>   22 files changed, 87 insertions(+), 8 deletions(-)

Sorry I haven't spotted this in the earlier versions: hid-sony also
needs a fix:

---
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index d1b107d547f5..c186af552129 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -3000,7 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
  	sc->quirks = quirks;
  	hid_set_drvdata(hdev, sc);
  	sc->hdev = hdev;
-	usbdev = to_usb_device(sc->hdev->dev.parent->parent);
  
  	ret = hid_parse(hdev);
  	if (ret) {
@@ -3043,6 +3042,11 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
  	}
  
  	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
+		if (!hid_is_usb(hdev))
+			return -EINVAL;
+
+		usbdev = to_usb_device(sc->hdev->dev.parent->parent);
+
  		sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
  		if (!sc->ghl_urb)
  			return -ENOMEM;
---


With that patch and the bigbenff which is not USB related, the hid-tools
test suite manages to inject all the declared USB devices.

Cheers,
Benjamin

> 
> diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
> index ca556d39da2a..f04d2aa23efe 100644
> --- a/drivers/hid/hid-chicony.c
> +++ b/drivers/hid/hid-chicony.c
> @@ -114,6 +114,9 @@ static int ch_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
>   	int ret;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
>   	ret = hid_parse(hdev);
>   	if (ret) {
> diff --git a/drivers/hid/hid-corsair.c b/drivers/hid/hid-corsair.c
> index 902a60e249ed..8c895c820b67 100644
> --- a/drivers/hid/hid-corsair.c
> +++ b/drivers/hid/hid-corsair.c
> @@ -553,7 +553,12 @@ static int corsair_probe(struct hid_device *dev, const struct hid_device_id *id)
>   	int ret;
>   	unsigned long quirks = id->driver_data;
>   	struct corsair_drvdata *drvdata;
> -	struct usb_interface *usbif = to_usb_interface(dev->dev.parent);
> +	struct usb_interface *usbif;
> +
> +	if (!hid_is_usb(dev))
> +		return -EINVAL;
> +
> +	usbif = to_usb_interface(dev->dev.parent);
>   
>   	drvdata = devm_kzalloc(&dev->dev, sizeof(struct corsair_drvdata),
>   			       GFP_KERNEL);
> diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
> index 021049805bb7..3091355d48df 100644
> --- a/drivers/hid/hid-elan.c
> +++ b/drivers/hid/hid-elan.c
> @@ -50,7 +50,7 @@ struct elan_drvdata {
>   
>   static int is_not_elan_touchpad(struct hid_device *hdev)
>   {
> -	if (hdev->bus == BUS_USB) {
> +	if (hid_is_usb(hdev)) {
>   		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
>   
>   		return (intf->altsetting->desc.bInterfaceNumber !=
> diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
> index 383dfda8c12f..8e960d7b233b 100644
> --- a/drivers/hid/hid-elo.c
> +++ b/drivers/hid/hid-elo.c
> @@ -230,6 +230,9 @@ static int elo_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   	int ret;
>   	struct usb_device *udev;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 4ef1c3b8094e..183eeb3863b3 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -915,6 +915,9 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   	struct ft260_get_chip_version_report version;
>   	int ret;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
>   	if (!dev)
>   		return -ENOMEM;
> diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
> index 0a38e8e9bc78..403506b9697e 100644
> --- a/drivers/hid/hid-holtek-kbd.c
> +++ b/drivers/hid/hid-holtek-kbd.c
> @@ -140,12 +140,17 @@ static int holtek_kbd_input_event(struct input_dev *dev, unsigned int type,
>   static int holtek_kbd_probe(struct hid_device *hdev,
>   		const struct hid_device_id *id)
>   {
> -	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
> -	int ret = hid_parse(hdev);
> +	struct usb_interface *intf;
> +	int ret;
> +
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
>   
> +	ret = hid_parse(hdev);
>   	if (!ret)
>   		ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>   
> +	intf = to_usb_interface(hdev->dev.parent);
>   	if (!ret && intf->cur_altsetting->desc.bInterfaceNumber == 1) {
>   		struct hid_input *hidinput;
>   		list_for_each_entry(hidinput, &hdev->inputs, list) {
> diff --git a/drivers/hid/hid-holtek-mouse.c b/drivers/hid/hid-holtek-mouse.c
> index 195b735b001d..b7172c48ef9f 100644
> --- a/drivers/hid/hid-holtek-mouse.c
> +++ b/drivers/hid/hid-holtek-mouse.c
> @@ -62,6 +62,14 @@ static __u8 *holtek_mouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>   	return rdesc;
>   }
>   
> +static int holtek_mouse_probe(struct hid_device *hdev,
> +			      const struct hid_device_id *id)
> +{
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +	return 0;
> +}
> +
>   static const struct hid_device_id holtek_mouse_devices[] = {
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT,
>   			USB_DEVICE_ID_HOLTEK_ALT_MOUSE_A067) },
> @@ -83,6 +91,7 @@ static struct hid_driver holtek_mouse_driver = {
>   	.name = "holtek_mouse",
>   	.id_table = holtek_mouse_devices,
>   	.report_fixup = holtek_mouse_report_fixup,
> +	.probe = holtek_mouse_probe,
>   };
>   
>   module_hid_driver(holtek_mouse_driver);
> diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
> index d40af911df63..fb3f7258009c 100644
> --- a/drivers/hid/hid-lg.c
> +++ b/drivers/hid/hid-lg.c
> @@ -749,12 +749,18 @@ static int lg_raw_event(struct hid_device *hdev, struct hid_report *report,
>   
>   static int lg_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
> -	struct usb_interface *iface = to_usb_interface(hdev->dev.parent);
> -	__u8 iface_num = iface->cur_altsetting->desc.bInterfaceNumber;
> +	struct usb_interface *iface;
> +	__u8 iface_num;
>   	unsigned int connect_mask = HID_CONNECT_DEFAULT;
>   	struct lg_drv_data *drv_data;
>   	int ret;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
> +	iface = to_usb_interface(hdev->dev.parent);
> +	iface_num = iface->cur_altsetting->desc.bInterfaceNumber;
> +
>   	/* G29 only work with the 1st interface */
>   	if ((hdev->product == USB_DEVICE_ID_LOGITECH_G29_WHEEL) &&
>   	    (iface_num != 0)) {
> diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
> index 2666af02d5c1..e4e9471d0f1e 100644
> --- a/drivers/hid/hid-prodikeys.c
> +++ b/drivers/hid/hid-prodikeys.c
> @@ -798,12 +798,18 @@ static int pk_raw_event(struct hid_device *hdev, struct hid_report *report,
>   static int pk_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
>   	int ret;
> -	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
> -	unsigned short ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
> +	struct usb_interface *intf;
> +	unsigned short ifnum;
>   	unsigned long quirks = id->driver_data;
>   	struct pk_device *pk;
>   	struct pcmidi_snd *pm = NULL;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
> +	intf = to_usb_interface(hdev->dev.parent);
> +	ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
> +
>   	pk = kzalloc(sizeof(*pk), GFP_KERNEL);
>   	if (pk == NULL) {
>   		hid_err(hdev, "can't alloc descriptor\n");
> diff --git a/drivers/hid/hid-roccat-arvo.c b/drivers/hid/hid-roccat-arvo.c
> index 4556d2a50f75..d94ee0539421 100644
> --- a/drivers/hid/hid-roccat-arvo.c
> +++ b/drivers/hid/hid-roccat-arvo.c
> @@ -344,6 +344,9 @@ static int arvo_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-isku.c b/drivers/hid/hid-roccat-isku.c
> index ce5f22519956..e95d59cd8d07 100644
> --- a/drivers/hid/hid-roccat-isku.c
> +++ b/drivers/hid/hid-roccat-isku.c
> @@ -324,6 +324,9 @@ static int isku_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
> index ea17abc7ad52..76da04801ca9 100644
> --- a/drivers/hid/hid-roccat-kone.c
> +++ b/drivers/hid/hid-roccat-kone.c
> @@ -749,6 +749,9 @@ static int kone_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-koneplus.c b/drivers/hid/hid-roccat-koneplus.c
> index 0316edf8c5bb..1896c69ea512 100644
> --- a/drivers/hid/hid-roccat-koneplus.c
> +++ b/drivers/hid/hid-roccat-koneplus.c
> @@ -431,6 +431,9 @@ static int koneplus_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-konepure.c b/drivers/hid/hid-roccat-konepure.c
> index 5248b3c7cf78..cf8eeb33a125 100644
> --- a/drivers/hid/hid-roccat-konepure.c
> +++ b/drivers/hid/hid-roccat-konepure.c
> @@ -133,6 +133,9 @@ static int konepure_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-kovaplus.c b/drivers/hid/hid-roccat-kovaplus.c
> index 960012881570..6fb9b9563769 100644
> --- a/drivers/hid/hid-roccat-kovaplus.c
> +++ b/drivers/hid/hid-roccat-kovaplus.c
> @@ -501,6 +501,9 @@ static int kovaplus_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-lua.c b/drivers/hid/hid-roccat-lua.c
> index 4a88a76d5c62..d5ddf0d68346 100644
> --- a/drivers/hid/hid-roccat-lua.c
> +++ b/drivers/hid/hid-roccat-lua.c
> @@ -160,6 +160,9 @@ static int lua_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-pyra.c b/drivers/hid/hid-roccat-pyra.c
> index 989927defe8d..4fcc8e7d276f 100644
> --- a/drivers/hid/hid-roccat-pyra.c
> +++ b/drivers/hid/hid-roccat-pyra.c
> @@ -449,6 +449,9 @@ static int pyra_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-ryos.c b/drivers/hid/hid-roccat-ryos.c
> index 3956a6c9c521..5bf1971a2b14 100644
> --- a/drivers/hid/hid-roccat-ryos.c
> +++ b/drivers/hid/hid-roccat-ryos.c
> @@ -141,6 +141,9 @@ static int ryos_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-roccat-savu.c b/drivers/hid/hid-roccat-savu.c
> index 818701f7a028..a784bb4ee651 100644
> --- a/drivers/hid/hid-roccat-savu.c
> +++ b/drivers/hid/hid-roccat-savu.c
> @@ -113,6 +113,9 @@ static int savu_probe(struct hid_device *hdev,
>   {
>   	int retval;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	retval = hid_parse(hdev);
>   	if (retval) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-samsung.c b/drivers/hid/hid-samsung.c
> index 2e1c31156eca..cf5992e97094 100644
> --- a/drivers/hid/hid-samsung.c
> +++ b/drivers/hid/hid-samsung.c
> @@ -152,6 +152,9 @@ static int samsung_probe(struct hid_device *hdev,
>   	int ret;
>   	unsigned int cmask = HID_CONNECT_DEFAULT;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	ret = hid_parse(hdev);
>   	if (ret) {
>   		hid_err(hdev, "parse failed\n");
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index d44550aa8805..0c92b7f9b8b8 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -274,6 +274,9 @@ static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_i
>   	int ret = 0;
>   	struct tm_wheel *tm_wheel = 0;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	ret = hid_parse(hdev);
>   	if (ret) {
>   		hid_err(hdev, "parse failed with error %d\n", ret);
> diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
> index 6a9865dd703c..d8ab0139e5cd 100644
> --- a/drivers/hid/hid-uclogic-core.c
> +++ b/drivers/hid/hid-uclogic-core.c
> @@ -164,6 +164,9 @@ static int uclogic_probe(struct hid_device *hdev,
>   	struct uclogic_drvdata *drvdata = NULL;
>   	bool params_initialized = false;
>   
> +	if (!hid_is_usb(hdev))
> +		return -EINVAL;
> +
>   	/*
>   	 * libinput requires the pad interface to be on a different node
>   	 * than the pen, so use QUIRK_MULTI_INPUT for all tablets.
> 

