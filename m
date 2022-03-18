Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281154DE122
	for <lists+linux-input@lfdr.de>; Fri, 18 Mar 2022 19:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbiCRSjJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Mar 2022 14:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235656AbiCRSjI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Mar 2022 14:39:08 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E89C1B84EA
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 11:37:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j18so3214038wrd.6
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:from
         :subject:to:content-transfer-encoding;
        bh=KbMZSg9nS0GByy8L1zoggGE7vzF0q6WGd/3xC9aaYE4=;
        b=E1yHF6XAMgQ9eeXAj2CqYoRqsAKl4NmVXcfnU2cq7mKFprF3GqgCFoZmjPTA37nUbm
         r7hkdV8RsqynwRii+l7v27UNYbD758CGs/5/szfpZqIkLj9FkedxRB8gBHr9XlD2nVst
         ofjT2T2rVf1a7MHAqggZ2nRFjJ318jhph/Tzg/hj1d7UypCqNbjru29cqyLgRlCITCH3
         VCF2OcOfJ30Ex9uxo7owoqgo5nDZrXugsdc4Cx5/W+QWve+160yYP6eHVFO7Z2GsO4nd
         GtHF6LviMQBSFdqm7pND2eI0Vwu9G0ZkPK98QBzar9bRYpM5xI/9a0evckXjMPu0zEmB
         jG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:from:subject:to:content-transfer-encoding;
        bh=KbMZSg9nS0GByy8L1zoggGE7vzF0q6WGd/3xC9aaYE4=;
        b=IPW0wiHDJMKNopjaYfoqUBT0sQ/fs1mVlk9XLXtACd97WyUyDvJ9lOKmqq5YMJhSuH
         SuDVXr78/ENmKYtz2YTW6LFyZK2PtrifzmVmP1pI6v9Hul3Sl5bniMPJTFR0ZbDPgVsi
         mJCGcNb8sjdz1yOkdqGEcmAuFkjAhG3uUbe4xpWJJHXa7ZFRialHoinyCuHAhMBQSpHw
         Rubv58jiGdu84fI+kf2O4eJy9qRjHgN9KN/FPuEZgCUsJhOtgFpvlNer+K63IUDxMqRq
         mZ9Oo5DGgw0qp9M5WN6DApuSgaeO8QgvsBGZ7/vMn6AiuTVqGFkcooq5ITqjeI4X+kvR
         3itA==
X-Gm-Message-State: AOAM531V4DGaDbyR1u3LcJovvt1MXq7TV6NgkZTXUflXaBtrZ1K35SED
        IUGXWZj5NFvgYxhmO+HkVj1MU1/LBx4=
X-Google-Smtp-Source: ABdhPJxaWCNnrGiIK4wgCw9O4mvU1K0AaS9WD3qijdjA6vA5Dot27Fzw63H6aZqwofOLIGGNjCqsDw==
X-Received: by 2002:a5d:584a:0:b0:203:97f6:5975 with SMTP id i10-20020a5d584a000000b0020397f65975mr9058035wrf.612.1647628666901;
        Fri, 18 Mar 2022 11:37:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:6d40:29d:ba85:78f8:3d80:548? ([2a02:810d:6d40:29d:ba85:78f8:3d80:548])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc018000000b0038a18068cf5sm10062234wmb.15.2022.03.18.11.37.45
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 11:37:46 -0700 (PDT)
Message-ID: <b401e453-9c66-15e3-1a1d-21f33b7a64e8@gmail.com>
Date:   Fri, 18 Mar 2022 19:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From:   Stefan Berzl <stefanberzl@gmail.com>
Subject: [PATCH] hid: Add support for the xp-pen deco mini7 tablet
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From f9bb82e400effd3aea37b2be710add9e2bb832da Mon Sep 17 00:00:00 2001
From: Stefan Berzl <stefanberzl@gmail.com>
Date: Fri, 11 Mar 2022 04:04:30 +0100
Subject: [PATCH] hid: Add support for the xp-pen deco mini7 tablet

This device is a bit special in that normal reporting of buttons needs to
be activated through sending a special key packet to a vendor defined
usage (and page). Then we receive sorta an ack packet which must be
caught to prevent it from registering as a button input. The person who
sniffed this out says that a lot of newer xppen tablets act like this,
so I try to make the code reusable and add "xppen_new" to the names.

Signed-off-by: Stefan Berzl <stefanberzl@gmail.com>
---
 drivers/hid/hid-ids.h            |   1 +
 drivers/hid/hid-uclogic-core.c   |   2 +
 drivers/hid/hid-uclogic-params.c | 239 +++++++++++++++++++++++++++++--
 drivers/hid/hid-uclogic-rdesc.c  |  96 +++++++++++++
 drivers/hid/hid-uclogic-rdesc.h  |  14 ++
 5 files changed, 343 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 78bd3ddda442..8d4e28da4449 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1260,6 +1260,7 @@
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540	0x0075
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_G640	0x0094
 #define USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO01	0x0042
+#define USB_DEVICE_ID_UGEE_XPPEN_TABLET_MINI7	0x0928
 #define USB_DEVICE_ID_UGEE_TABLET_G5		0x0074
 #define USB_DEVICE_ID_UGEE_TABLET_EX07S		0x0071
 #define USB_DEVICE_ID_UGEE_TABLET_RAINBOW_CV720	0x0055
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index d8ab0139e5cd..dc76c0424289 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -404,6 +404,8 @@ static const struct hid_device_id uclogic_devices[] = {
 				USB_DEVICE_ID_UGEE_XPPEN_TABLET_G640) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
 				USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO01) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
+				USB_DEVICE_ID_UGEE_XPPEN_TABLET_MINI7) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, uclogic_devices);
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 3e70f969fb84..81087e6a0700 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -122,8 +122,9 @@ static void uclogic_params_pen_cleanup(struct uclogic_params_pen *pen)
 }
 
 /**
- * uclogic_params_pen_init_v1() - initialize tablet interface pen
- * input and retrieve its parameters from the device, using v1 protocol.
+ * uclogic_params_pen_init_v1_with_desc() - initialize tablet interface pen
+ * input and retrieve its parameters from the device, using v1 protocol
+ * and a given report descriptor.
  *
  * @pen:	Pointer to the pen parameters to initialize (to be
  *		cleaned up with uclogic_params_pen_cleanup()). Not modified in
@@ -133,13 +134,20 @@ static void uclogic_params_pen_cleanup(struct uclogic_params_pen *pen)
  *		incompatible). Not modified in case of error. Cannot be NULL.
  * @hdev:	The HID device of the tablet interface to initialize and get
  *		parameters from. Cannot be NULL.
+ * @desc_ptr:	Report descriptor pointer.
+ * @desc_size:	Report descriptor size.
+ * @id:		Report ID used for frame reports, if they should be tweaked,
+ *		zero if not.
  *
  * Returns:
  *	Zero, if successful. A negative errno code on error.
  */
-static int uclogic_params_pen_init_v1(struct uclogic_params_pen *pen,
-				      bool *pfound,
-				      struct hid_device *hdev)
+static int uclogic_params_pen_init_v1_with_desc(struct uclogic_params_pen *pen,
+						bool *pfound,
+						struct hid_device *hdev,
+						const __u8 *template_desc_ptr,
+						size_t template_desc_size,
+						unsigned int template_id)
 {
 	int rc;
 	bool found = false;
@@ -207,8 +215,7 @@ static int uclogic_params_pen_init_v1(struct uclogic_params_pen *pen,
 	 * Generate pen report descriptor
 	 */
 	desc_ptr = uclogic_rdesc_template_apply(
-				uclogic_rdesc_pen_v1_template_arr,
-				uclogic_rdesc_pen_v1_template_size,
+				template_desc_ptr, template_desc_size,
 				desc_params, ARRAY_SIZE(desc_params));
 	if (desc_ptr == NULL) {
 		rc = -ENOMEM;
@@ -221,8 +228,8 @@ static int uclogic_params_pen_init_v1(struct uclogic_params_pen *pen,
 	memset(pen, 0, sizeof(*pen));
 	pen->desc_ptr = desc_ptr;
 	desc_ptr = NULL;
-	pen->desc_size = uclogic_rdesc_pen_v1_template_size;
-	pen->id = UCLOGIC_RDESC_PEN_V1_ID;
+	pen->desc_size = template_desc_size;
+	pen->id = template_id;
 	pen->inrange = UCLOGIC_PARAMS_PEN_INRANGE_INVERTED;
 	found = true;
 finish:
@@ -234,6 +241,33 @@ static int uclogic_params_pen_init_v1(struct uclogic_params_pen *pen,
 	return rc;
 }
 
+/**
+ * uclogic_params_pen_init_v1() - initialize tablet interface pen
+ * input and retrieve its parameters from the device, using v1 protocol.
+ *
+ * @pen:	Pointer to the pen parameters to initialize (to be
+ *		cleaned up with uclogic_params_pen_cleanup()). Not modified in
+ *		case of error, or if parameters are not found. Cannot be NULL.
+ * @pfound:	Location for a flag which is set to true if the parameters
+ *		were found, and to false if not (e.g. device was
+ *		incompatible). Not modified in case of error. Cannot be NULL.
+ * @hdev:	The HID device of the tablet interface to initialize and get
+ *		parameters from. Cannot be NULL.
+ *
+ * Returns:
+ *	Zero, if successful. A negative errno code on error.
+ */
+static int uclogic_params_pen_init_v1(struct uclogic_params_pen *pen,
+				      bool *pfound,
+				      struct hid_device *hdev)
+{
+	return uclogic_params_pen_init_v1_with_desc(
+					pen, pfound, hdev,
+					uclogic_rdesc_pen_v1_template_arr,
+					uclogic_rdesc_pen_v1_template_size,
+					UCLOGIC_RDESC_PEN_V1_ID);
+}
+
 /**
  * uclogic_params_get_le24() - get a 24-bit little-endian number from a
  * buffer.
@@ -824,6 +858,187 @@ static int uclogic_params_huion_init(struct uclogic_params *params,
 	return rc;
 }
 
+/**
+ * uclogic_xppen_new_snd_urb_completion() - The urb completion function for
+ * sending a key to newer xppen tablets.
+ *
+ * @urb:	The urb that has been completed.
+ */
+void uclogic_xppen_new_snd_urb_completion(struct urb *urb)
+{
+	struct hid_device *hdev = urb->context;
+
+	if (urb->status != 0)
+		hid_err(hdev, "sending the xppen key failed, tablet may not work: %d\n", urb->status);
+}
+
+/**
+ * uclogic_xppen_new_rcv_urb_completion() - The urb completion function for
+ * receiving a response after sending a key to newer xppen tablets.
+ *
+ * @urb:	The urb that has been completed.
+ */
+void uclogic_xppen_new_rcv_urb_completion(struct urb *urb)
+{
+	struct hid_device *hdev = urb->context;
+
+	if (urb->status != 0)
+		hid_err(hdev, "receiving the xppen key failed, tablet may not work: %d\n", urb->status);
+}
+
+/**
+ * uclogic_xppen_new_send_key_urb() - Send a certain vendor defined key to the
+ * tablet to switch reports to a more useful structure. Also the tablet will
+ * send a response after receiving the key on the same interface and endpoint
+ * that pen and button reports are sent henceforth. So we need to catch
+ * this first report.
+ *
+ * @hdev:	The HID device of the tablet interface.
+ * @key_ptr:	Pointer to the key.
+ * @key_size:	Size of the key.
+ *
+ * Returns:
+ *	Zero, if successful. A negative errno code on error.
+ */
+int uclogic_xppen_new_send_key_urb(struct hid_device *hdev,
+				   __u8 *key_ptr,
+				   unsigned int key_size)
+{
+	struct usb_device *udev = hid_to_usb_dev(hdev);
+	struct urb *sndUrb = NULL;
+	struct urb *rcvUrb = NULL;
+	__u8 *sndBuf = NULL;
+	__u8 *rcvBuf = NULL;
+	int rc;
+
+	sndBuf = devm_kzalloc(&hdev->dev, key_size, GFP_KERNEL);
+	rcvBuf = devm_kzalloc(&hdev->dev, 12, GFP_KERNEL);
+	if (sndBuf == NULL || rcvBuf == NULL) {
+		rc = -ENOMEM;
+		goto cleanup;
+	}
+
+	sndUrb = usb_alloc_urb(0, GFP_KERNEL);
+	rcvUrb = usb_alloc_urb(0, GFP_KERNEL);
+	if (sndUrb == NULL || rcvUrb == NULL) {
+		rc = -ENOMEM;
+		goto cleanup;
+	}
+
+	memcpy(sndBuf, key_ptr, key_size);
+	usb_fill_int_urb(sndUrb, udev,
+			 usb_sndintpipe(udev, 3),
+			 sndBuf, key_size,
+			 uclogic_xppen_new_snd_urb_completion, hdev,
+			 10);
+
+	/*
+	 * TODO: Setting a low interval value in the receive interrupt
+	 * will slow down the interval persistently and make the device
+	 * less responsive, even though it's only used once for the initial
+	 * tablet-key response. Is there a workaround for this?
+	 * This is the correct value though, so everything is fine.
+	 */
+	usb_fill_int_urb(rcvUrb, udev,
+			 usb_rcvintpipe(udev, 3),
+			 rcvBuf, 12,
+			 uclogic_xppen_new_rcv_urb_completion, hdev,
+			 3);
+
+	rc = usb_submit_urb(rcvUrb, GFP_KERNEL);
+	if (rc != 0)
+		goto cleanup;
+
+	rc = usb_submit_urb(sndUrb, GFP_KERNEL);
+
+cleanup:
+	usb_free_urb(sndUrb);
+	usb_free_urb(rcvUrb);
+	return rc;
+}
+
+/**
+ * uclogic_params_xppen_new_init() - initialize a newer xppen tablet interface
+ * and discover its parameters.
+ *
+ * @params:	Parameters to fill in (to be cleaned with
+ *		uclogic_params_cleanup()). Not modified in case of error.
+ *		Cannot be NULL.
+ * @hdev:	The HID device of the tablet interface to initialize and get
+ *		parameters from. Cannot be NULL.
+ *
+ * Returns:
+ *	Zero, if successful. A negative errno code on error.
+ */
+static int uclogic_params_xppen_new_init(struct uclogic_params *params,
+					 struct hid_device *hdev)
+{
+	struct uclogic_params p = {0, };
+	bool found;
+	struct usb_device *udev;
+	struct usb_interface *iface;
+	__u8 bInterfaceNumber;
+	int rc;
+	__u8 key[] = {
+		0x02, 0xB0, 0x04, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00
+	};
+
+	udev = hid_to_usb_dev(hdev);
+	iface = to_usb_interface(hdev->dev.parent);
+	bInterfaceNumber = iface->cur_altsetting->desc.bInterfaceNumber;
+
+	/* If it's not the vendor interface */
+	if (bInterfaceNumber != 2) {
+		uclogic_params_init_invalid(&p);
+		goto output;
+	}
+
+	rc = uclogic_xppen_new_send_key_urb(hdev, key, ARRAY_SIZE(key));
+	if (rc != 0) {
+		hid_err(hdev, "transmission of xppen key failed: %d\n", rc);
+		goto cleanup;
+	}
+
+	rc = uclogic_params_pen_init_v1_with_desc(
+					&p.pen, &found, hdev,
+					uclogic_rdesc_xppen_new_pen_arr,
+					uclogic_rdesc_xppen_new_pen_size,
+					UCLOGIC_RDESC_XPPEN_NEW_PEN_ID);
+
+	if (rc != 0) {
+		hid_err(hdev, "pen probing failed: %d\n", rc);
+		goto cleanup;
+	}
+
+	rc = uclogic_params_frame_init_with_desc(
+		&p.frame,
+		uclogic_rdesc_xppen_new_frame_arr,
+		uclogic_rdesc_xppen_new_frame_size,
+		UCLOGIC_RDESC_XPPEN_NEW_FRAME_ID);
+
+	if (rc != 0) {
+		hid_err(hdev, "failed creating buttonpad parameters: %d\n", rc);
+		goto cleanup;
+	}
+
+	p.pen_frame_flag = 0x10;
+
+	if (!found) {
+		hid_warn(hdev, "pen parameters not found");
+		uclogic_params_init_invalid(&p);
+	}
+
+output:
+	/* Output parameters */
+	memcpy(params, &p, sizeof(*params));
+	memset(&p, 0, sizeof(p));
+	rc = 0;
+cleanup:
+	uclogic_params_cleanup(&p);
+	return rc;
+}
+
 /**
  * uclogic_params_init() - initialize a tablet interface and discover its
  * parameters.
@@ -1059,6 +1274,12 @@ int uclogic_params_init(struct uclogic_params *params,
 			uclogic_params_init_with_pen_unused(&p);
 		}
 		break;
+	case VID_PID(USB_VENDOR_ID_UGEE,
+		     USB_DEVICE_ID_UGEE_XPPEN_TABLET_MINI7):
+		rc = uclogic_params_xppen_new_init(&p, hdev);
+		if (rc != 0)
+			goto cleanup;
+		break;
 	case VID_PID(USB_VENDOR_ID_TRUST,
 		     USB_DEVICE_ID_TRUST_PANORA_TABLET):
 	case VID_PID(USB_VENDOR_ID_UGEE,
diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index 6dd6dcd09c8b..4bfbaa0ca99f 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -817,6 +817,102 @@ const __u8 uclogic_rdesc_xppen_deco01_frame_arr[] = {
 const size_t uclogic_rdesc_xppen_deco01_frame_size =
 			sizeof(uclogic_rdesc_xppen_deco01_frame_arr);
 
+/* pen report descriptor for newer xppen tablets */
+__u8 uclogic_rdesc_xppen_new_pen_arr[] = {
+	0x05, 0x0D,             /*  Usage Page (Digitizer),                 */
+	0x09, 0x02,             /*  Usage (Pen),                            */
+	0xA1, 0x01,             /*  Collection (Application),               */
+	0x85, 0x02,             /*      Report ID (2),                      */
+	0x09, 0x20,             /*      Usage (Stylus),                     */
+	0xA0,                   /*      Collection (Physical),              */
+	0x14,                   /*          Logical Minimum (0),            */
+	0x25, 0x01,             /*          Logical Maximum (1),            */
+	0x75, 0x01,             /*          Report Size (1),                */
+	0x09, 0x42,             /*          Usage (Tip Switch),             */
+	0x09, 0x44,             /*          Usage (Barrel Switch),          */
+	0x09, 0x46,             /*          Usage (Tablet Pick),            */
+	0x95, 0x03,             /*          Report Count (3),               */
+	0x81, 0x02,             /*          Input (Variable),               */
+	0x95, 0x03,             /*          Report Count (3),               */
+	0x81, 0x03,             /*          Input (Constant, Variable),     */
+	0x09, 0x32,             /*          Usage (In Range),               */
+	0x95, 0x01,             /*          Report Count (1),               */
+	0x81, 0x02,             /*          Input (Variable),               */
+	0x95, 0x01,             /*          Report Count (1),               */
+	0x81, 0x03,             /*          Input (Constant, Variable),     */
+	0x95, 0x01,             /*          Report Count (1),               */
+	0xA4,                   /*          Push,                           */
+	0x05, 0x01,             /*          Usage Page (Desktop),           */
+	0x65, 0x13,             /*          Unit (Inch),                    */
+	0x55, 0xFD,             /*          Unit Exponent (-3),             */
+	0x75, 0x10,             /*          Report Size (16),               */
+	0x34,                   /*          Physical Minimum (0),           */
+	0x09, 0x30,             /*          Usage (X),                      */
+	0x27, UCLOGIC_RDESC_PEN_PH(X_LM),
+				/*          Logical Maximum (PLACEHOLDER),  */
+	0x47, UCLOGIC_RDESC_PEN_PH(X_PM),
+				/*          Physical Maximum (PLACEHOLDER), */
+	0x81, 0x02,             /*          Input (Variable),               */
+	0x09, 0x31,             /*          Usage (Y),                      */
+	0x27, UCLOGIC_RDESC_PEN_PH(Y_LM),
+				/*          Logical Maximum (PLACEHOLDER),  */
+	0x47, UCLOGIC_RDESC_PEN_PH(Y_PM),
+				/*          Physical Maximum (PLACEHOLDER), */
+	0x81, 0x02,             /*          Input (Variable),               */
+	0xB4,                   /*          Pop,                            */
+	0x09, 0x30,             /*          Usage (Tip Pressure),           */
+	0x75, 0x10,             /*          Report Size (16),               */
+	0x27, UCLOGIC_RDESC_PEN_PH(PRESSURE_LM),
+				/*          Logical Maximum (PLACEHOLDER),  */
+	0x81, 0x02,             /*          Input (Variable),               */
+	0x54,                   /*          Unit Exponent (0),              */
+	0x65, 0x14,             /*          Unit (Degrees),                 */
+	0x35, 0xC4,             /*          Physical Minimum (-60),         */
+	0x45, 0x3C,             /*          Physical Maximum (60),          */
+	0x15, 0xC4,             /*          Logical Minimum (-60),          */
+	0x25, 0x3C,             /*          Logical Maximum (60),           */
+	0x75, 0x08,             /*          Report Size (8),                */
+	0x95, 0x02,             /*          Report Count (2),               */
+	0x09, 0x3D,             /*          Usage (X Tilt),                 */
+	0x09, 0x3E,             /*          Usage (Y Tilt),                 */
+	0x81, 0x02,             /*          Input (Variable),               */
+	0x75, 0x08,             /*          Report Size (8),                */
+	0x95, 0x02,             /*          Report Count (2),               */
+	0x81, 0x03,             /*          Input (Constant, Variable),     */
+	0xC0,                   /*      End Collection,                     */
+	0xC0                    /*  End Collection                          */
+};
+
+const size_t uclogic_rdesc_xppen_new_pen_size =
+			sizeof(uclogic_rdesc_xppen_new_pen_arr);
+
+/* button report descriptor for newer xppen tablets */
+__u8 uclogic_rdesc_xppen_new_frame_arr[] = {
+	0x05, 0x01, /*  Usage Page (Desktop),               */
+	0x09, 0x07, /*  Usage (Keypad),                     */
+	0xA1, 0x01, /*  Collection (Application),           */
+	0x85, 0xf7, /*      Report ID (247),                */
+	0x14,       /*      Logical Minimum (0),            */
+	0x25, 0x01, /*      Logical Maximum (1),            */
+	0x05, 0x0D, /*      Usage Page (Digitizer),         */
+	0x09, 0x39, /*      Usage (Tablet Function Keys),   */
+	0xA0,       /*      Collection (Physical),          */
+	0x75, 0x08, /*          Report Size (8),            */
+	0x95, 0x01, /*          Report Count (1),           */
+	0x81, 0x01, /*          Input (Constant),           */
+	0x75, 0x01, /*          Report Size (1),            */
+	0x05, 0x09, /*          Usage Page (Button),        */
+	0x19, 0x01, /*          Usage Minimum (01h),        */
+	0x29, 0x08, /*          Usage Maximum (08h),        */
+	0x95, 0x08, /*          Report Count (8),           */
+	0x81, 0x02, /*          Input (Variable),           */
+	0xC0,       /*      End Collection,                 */
+	0xC0        /*  End Collection                      */
+};
+
+const size_t uclogic_rdesc_xppen_new_frame_size =
+			sizeof(uclogic_rdesc_xppen_new_frame_arr);
+
 /**
  * uclogic_rdesc_template_apply() - apply report descriptor parameters to a
  * report descriptor template, creating a report descriptor. Copies the
diff --git a/drivers/hid/hid-uclogic-rdesc.h b/drivers/hid/hid-uclogic-rdesc.h
index c5da51055af3..1405a4ccffce 100644
--- a/drivers/hid/hid-uclogic-rdesc.h
+++ b/drivers/hid/hid-uclogic-rdesc.h
@@ -139,6 +139,20 @@ extern const size_t uclogic_rdesc_ugee_ex07_buttonpad_size;
 extern const __u8 uclogic_rdesc_xppen_deco01_frame_arr[];
 extern const size_t uclogic_rdesc_xppen_deco01_frame_size;
 
+/* Report ID for newer xppen pen reports (only mini7 now) */
+#define UCLOGIC_RDESC_XPPEN_NEW_PEN_ID 0x02
+
+/* Report ID for newer xppen frame reports (only mini7 now) */
+#define UCLOGIC_RDESC_XPPEN_NEW_FRAME_ID 0xf7
+
+/* Fixed report descriptor for newer xppen tablet pens (only mini7 now) */
+extern __u8 uclogic_rdesc_xppen_new_pen_arr[];
+extern const size_t uclogic_rdesc_xppen_new_pen_size;
+
+/* Fixed report desc for newer xppen tablet frame controls (only mini7 now) */
+extern __u8 uclogic_rdesc_xppen_new_frame_arr[];
+extern const size_t uclogic_rdesc_xppen_new_frame_size;
+
 /* Fixed report descriptor for Ugee G5 frame controls */
 extern const __u8 uclogic_rdesc_ugee_g5_frame_arr[];
 extern const size_t uclogic_rdesc_ugee_g5_frame_size;
-- 
2.35.1

