Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4EA96310A4
	for <lists+linux-input@lfdr.de>; Sat, 19 Nov 2022 21:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbiKSUTF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Nov 2022 15:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiKSUTE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Nov 2022 15:19:04 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B664BDFA4;
        Sat, 19 Nov 2022 12:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668889131; bh=LAk+H1R5gnXnXPprUdYbEekf5+hAQCqq8cqFRLjw+Vo=;
        h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
        b=IaW2ZAsNrq4vaSDkQMry9sgd5u/Wv4NUdyprJZf/LXCTyc6V1vrXja+SPWRbR2QFl
         voGKWC9ClML6a/Kldv6OfX8iiUysZPTTd4ZJMTWSeFxMkKhyCRXws1jbgX5h43Qmq4
         o3g6dCYf0G7FUsa7G75Xo7er86l8UUCweQlAqWbYROvL4rHeIUyCIJAIkj0i999Jx4
         InkDvefgtmwPEPZwRwhJbEKRbxONfx1R0SNdFn4Njs71JovMKawz1Wp0Ta1f2vN9Ei
         IUvSmbijRnke5LqStuj9lvdkVPXjovSnfZU5M3X1a/VzKnLdkH0KSUJtztsGvqupKm
         WN2gp+N2odwvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from 9300 ([93.221.18.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1ozNku3NZy-016uFz; Sat, 19
 Nov 2022 21:18:50 +0100
Date:   Sat, 19 Nov 2022 21:18:49 +0100 (CET)
From:   Andreas Bergmeier <abergmeier@gmx.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: Litra Glow on Linux
In-Reply-To: <CAO-hwJJDE-8TL2MbTX2xX3RfKEeh8H5h24UkcZJJhH5ptdpRaQ@mail.gmail.com>
Message-ID: <e6cb795-e8c4-4570-7a7b-3bbd133b98cb@9300>
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com> <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com> <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com> <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com> <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com> <CABfF9mO3SQZvkQGOC09H5s7EEd2UGhpE=GYB46g_zF3aEOVn=Q@mail.gmail.com>
 <CABfF9mNbpTdAnChkZNKFed6C7n=Hyq-69rMUeDENE8ptLjJMSw@mail.gmail.com> <CAO-hwJ+PysPKFG=a9+L8vwhiw4uY3F3DZmg4FwgPWGZ7LPt4EA@mail.gmail.com> <2a20d7d1-55df-4861-5cf1-dee19536ed5@9300> <CAO-hwJJDE-8TL2MbTX2xX3RfKEeh8H5h24UkcZJJhH5ptdpRaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:wBDNEoFViwb29axc/Oe+H41pU2QrLBFyS5gdJp4tD7BsUWQ6IS7
 Uk/CG8RQpc8Dcm2GFvAXUeZM1wz+7jpkMQoQU0wcruT2u+Nx6rakTpiOrUHvULTNUkjq50u
 hCXZEDuY2OAkzJOI9W6QL9fpuymdmPdYY8mkI7mbYggbayKp2zgdR/rZeCa3dm+hutto/tc
 kzUuZBg2G2VXX1WULVJiA==
UI-OutboundReport: notjunk:1;M01:P0:ZYcOt1efEkM=;TMCn0bKyxeKZyXDZCCEAyOqvPTc
 N9XjZ6rkqlV+fi9ZU8di2FEVsTtKdVp8PSXxAO9umabAt0swzwiQ1ybXbBgxOG8LyGHIt0/7Z
 CSWVPkz6fOP7Y+2IPpROtPGbLEKlveGIReaqcB45wB8CRiSyFfrxCVNYNeANUfHmkEAXkMhvG
 tXmArV/gDrY7sFRd6R+WZQ82ebJ2d9rlFu4FVw0GzWDkcm4PuZ+IF4yvNe6WhccqpJFrmozt1
 /FO/MaqkEqMDMnhKsykbkEiqtz5JrpKwQHaNhsvcyiU32YMZKXbvwDrGf3qvEHXPiQvFSRwml
 l6kUo0mO1rARJPQA/4xZJueyIchAkPVXnEp6mEQZm5rbBNCaODTH8DuH29mxslYEnMGKn5I+m
 /pD8IoSJMfNW+MCmieLHjg92EBgy2pNuNdRzFb/OHwMOsWteppNu1ahV/zV6ueJACnOzOY7Y7
 l8Vbycx/rsPXs/5m/hwr06+W3tldbIqQ/c++JMKR6hlAl9FjVaVno0WwDjlH7EQRhkRsxI7S1
 opXL5L7uoY9nk0TyjVjsfFLSJaudv+gd070iqFonVvwGLissviYNPobJ4vSHoSQePRlCOytrW
 fVb7oKbUrIXiLestrlwoRtkFEAQvfUs3KGy6/IxoNlaN8XcZhbRaJDqFUMQhzaM/e7kE+AB0q
 oXYDBpmr6DIJNpGJvSHRA3kqRpvMOX8ALbjD2d5B0XEVkJ0lYiC2nUbPLjD/6rO5v2NDiitep
 TXrOmJgtvE3sFzWjUc449C0t4VsqSzbgPi8PIU8VAPDIWs+tXaIytmZ/Eo2uSe55907wFriuw
 +JXc9MZmr3MdULR4aCUZR61EgH9dLrFL1O+cAbVqgpcXourppECAYujhyblxrjt/kINfPI3cC
 IO80fq1MG9kBWb0N+oLQ8arPUdraWqnxtKhqGafsmvF06Tz3D1IL8aNIkZi/mL1CXLdvg5Rju
 54Lb9Q==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

So after some tinkering I have code now that succeeds in retrieving state
via sending reports once. After that all following sends time out.
I am at a loss what I am doing wrong, tbh. RFC below.

On Thu, 10 Nov 2022, Benjamin Tissoires wrote:

>
> >
> > I had a look at the hidpp utility
> > sources:
> > https://github.com/cvuchener/hidpp/blob/057407fbb7248bbc6cefcfaa860758=
d0711c01b9/src/libhidpp/hidpp/Device.cpp#L82
> > Which seems to do a similar thing. From the top of my head the only
> > difference seems to be that they are sending `0x1` as a ping value ins=
tead
> > of `0x5a`. Might give that a shot next.
> > Anyway hidpp-list-features successfully reads the protocol version in
> > userspace (4, 2) as seen here:
> > https://github.com/abergmeier/litra_glow_linux/blob/main/hidpp-list-fe=
atures
>
> Hmm... It would seem wrong for me if the firmware suddenly expects to
> have a specific ping value.
> If it works in userspace, it might also mean that the timing is not
> right and we are talking to the device too early, and it can't answer
> yet.
I needed to set some specific quirk flags to make communication work. See
below.

RFC on current PATCH:
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index dad953f66996..78265f7235ce 100644
=2D-- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -856,6 +856,7 @@
 #define USB_DEVICE_ID_MX5500_RECEIVER_MOUSE_DEV		0xc71c
 #define USB_DEVICE_ID_DINOVO_MINI_RECEIVER_KBD_DEV	0xc71e
 #define USB_DEVICE_ID_DINOVO_MINI_RECEIVER_MOUSE_DEV	0xc71f
+#define USB_DEVICE_ID_LOGITECH_LITRA_GLOW   0xc900
 #define USB_DEVICE_ID_LOGITECH_MOMO_WHEEL2	0xca03
 #define USB_DEVICE_ID_LOGITECH_VIBRATION_WHEEL	0xca04

diff --git a/drivers/hid/hid-logitech-hidpp.c
b/drivers/hid/hid-logitech-hidpp.c
index 71a9c258a20b..949fd09d2b43 100644
=2D-- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/usb.h>
 #include <linux/hid.h>
@@ -99,6 +100,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL	BIT(7)
 #define HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL	BIT(8)
 #define HIDPP_CAPABILITY_HIDPP10_FAST_SCROLL	BIT(9)
+#define HIDPP_CAPABILITY_ILLUMINATION_LIGHT		BIT(10)

 #define lg_map_key_clear(c)  hid_map_usage_clear(hi, usage, bit, max,
EV_KEY, (c))

@@ -206,7 +208,10 @@ struct hidpp_device {
 	struct hidpp_battery battery;
 	struct hidpp_scroll_counter vertical_wheel_counter;

-	u8 wireless_feature_index;
+	union {
+		u8 wireless_feature_index;
+		u8 illumination_feature_index;
+	};
 };

 /* HID++ 1.0 error codes */
@@ -355,15 +360,16 @@ static int hidpp_send_fap_command_sync(struct
hidpp_device *hidpp,
 }

 static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
-	u8 report_id, u8 sub_id, u8 reg_address, u8 *params, int
param_count,
+	u8 sub_id, u8 reg_address, u8 *params, int param_count,
 	struct hidpp_report *response)
 {
 	struct hidpp_report *message;
 	int ret, max_count;
+	u8 report_id;

-	/* Send as long report if short reports are not supported. */
-	if (report_id =3D=3D REPORT_ID_HIDPP_SHORT &&
-	    !(hidpp_dev->supported_reports &
HIDPP_REPORT_SHORT_SUPPORTED))
+	if (hidpp_dev->supported_reports & HIDPP_REPORT_SHORT_SUPPORTED)
+		report_id =3D REPORT_ID_HIDPP_SHORT;
+	else
 		report_id =3D REPORT_ID_HIDPP_LONG;

 	switch (report_id) {
@@ -544,7 +550,6 @@ static int hidpp10_set_register(struct hidpp_device
*hidpp_dev,
 	u8 params[3] =3D { 0 };

 	ret =3D hidpp_send_rap_command_sync(hidpp_dev,
-					  REPORT_ID_HIDPP_SHORT,
 					  HIDPP_GET_REGISTER,
 					  register_address,
 					  NULL, 0, &response);
@@ -557,7 +562,6 @@ static int hidpp10_set_register(struct hidpp_device
*hidpp_dev,
 	params[byte] |=3D value & mask;

 	return hidpp_send_rap_command_sync(hidpp_dev,
-					   REPORT_ID_HIDPP_SHORT,
 					   HIDPP_SET_REGISTER,
 					   register_address,
 					   params, 3, &response);
@@ -653,7 +657,6 @@ static int hidpp10_query_battery_status(struct
hidpp_device *hidpp)
 	int ret, status;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_REGISTER,
 					HIDPP_REG_BATTERY_STATUS,
 					NULL, 0, &response);
@@ -705,7 +708,6 @@ static int hidpp10_query_battery_mileage(struct
hidpp_device *hidpp)
 	int ret, status;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_REGISTER,
 					HIDPP_REG_BATTERY_MILEAGE,
 					NULL, 0, &response);
@@ -777,7 +779,6 @@ static char *hidpp_unifying_get_name(struct
hidpp_device *hidpp_dev)
 	int len;

 	ret =3D hidpp_send_rap_command_sync(hidpp_dev,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_LONG_REGISTER,
 					HIDPP_REG_PAIRING_INFORMATION,
 					params, 1, &response);
@@ -811,7 +812,6 @@ static int hidpp_unifying_get_serial(struct
hidpp_device *hidpp, u32 *serial)
 	u8 params[1] =3D { HIDPP_EXTENDED_PAIRING };

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_LONG_REGISTER,
 					HIDPP_REG_PAIRING_INFORMATION,
 					params, 1, &response);
@@ -862,6 +862,8 @@ static int hidpp_unifying_init(struct hidpp_device
*hidpp)
 #define CMD_ROOT_GET_FEATURE				0x00
 #define CMD_ROOT_GET_PROTOCOL_VERSION			0x10

+#define HIDPP_FEATURE_TYPE_HIDDEN 0x70
+
 static int hidpp_root_get_feature(struct hidpp_device *hidpp, u16
feature,
 	u8 *feature_index, u8 *feature_type)
 {
@@ -893,9 +895,8 @@ static int hidpp_root_get_protocol_version(struct
hidpp_device *hidpp)
 	int ret;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-			REPORT_ID_HIDPP_SHORT,
 			HIDPP_PAGE_ROOT_IDX,
-			CMD_ROOT_GET_PROTOCOL_VERSION,
+			CMD_ROOT_GET_PROTOCOL_VERSION |
LINUX_KERNEL_SW_ID,
 			ping_data, sizeof(ping_data), &response);

 	if (ret =3D=3D HIDPP_ERROR_INVALID_SUBID) {
@@ -1729,6 +1730,361 @@ static int hidpp_set_wireless_feature_index(struct
hidpp_device *hidpp)
 	return ret;
 }

+/*
=2D-----------------------------------------------------------------------=
--
*/
+/* 0x1990: Illumination Light
*/
+/*
=2D-----------------------------------------------------------------------=
--
*/
+
+#define HIDPP_PAGE_ILLUMINATION_LIGHT 0x1990
+
+#define HIDPP_ILLUMINATION_FUNC_GET 0x00
+#define HIDPP_ILLUMINATION_FUNC_SET 0x10
+#define HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS_INFO 0x20
+#define HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS 0x30
+#define HIDPP_ILLUMINATION_FUNC_SET_BRIGHTNESS 0x40
+
+/* Not yet supported
+#define HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS_LEVELS 0x50
+#define HIDPP_ILLUMINATION_FUNC_SET_BRIGHTNESS_LEVELS 0x60
+*/
+
+#define HIDPP_ILLUMINATION_FUNC_GET_COLOR_TEMPERATURE_INFO 0x70
+#define HIDPP_ILLUMINATION_FUNC_GET_COLOR_TEMPERATURE 0x80
+#define HIDPP_ILLUMINATION_FUNC_SET_COLOR_TEMPERATURE 0x90
+
+/* Not yet supported
+#define HIDPP_ILLUMINATION_FUNC_GET_COLOR_TEMPERATURE_LEVELS 0xA0
+#define HIDPP_ILLUMINATION_FUNC_SET_COLOR_TEMPERATURE_LEVELS 0xB0
+*/
+
+#define HIDPP_ILLUMINATION_EVENT_CHANGE 0x00
+#define HIDPP_ILLUMINATION_EVENT_BRIGHTNESS_CHANGE 0x10
+#define HIDPP_ILLUMINATION_EVENT_COLOR_TEMPERATURE_CHANGE 0x20
+
+#define HIDPP_ILLUMINATION_CAP_EVENTS BIT(0)
+#define HIDPP_ILLUMINATION_CAP_LINEAR_LEVELS BIT(1)
+#define HIDPP_ILLUMINATION_CAP_NON_LINEAR_LEVELS BIT(2)
+
+struct control_info {
+	u16 min;
+	u16 max;
+	u16 res;
+	u8 capabilities;
+	u8 max_levels;
+};
+
+struct led_data {
+	struct led_classdev cdev;
+	struct hidpp_device *drv_data;
+	struct hid_device *hdev;
+	u16 feature_index;
+	bool on;
+	u16 brightness;
+	struct control_info brightness_info;
+	struct control_info color_temperature_info;
+	char dirname[256];
+	bool removed;
+};
+
+/* kernel led interface designates 0 as off. To not lose the ability to
chose
+ * minimal brightness, we thus need to increase the reported range by 1
+ */
+static unsigned device_to_led_brightness_value(struct led_data* led, u16
device_brightness) {
+	u16 relative =3D device_brightness - led->brightness_info.min;
+	u16 step =3D relative / led->brightness_info.res;
+	return step + 1;
+}
+
+static unsigned device_to_led_brightness(struct led_data* led) {
+	return device_to_led_brightness_value(led, led->brightness);
+}
+
+static u16 led_to_device_brightness_value(struct led_data* led, unsigned
led_brightness) {
+	unsigned step =3D led_brightness - 1;
+	unsigned relative =3D step * led->brightness_info.res;
+	return led->brightness_info.min + relative;
+}
+
+static enum led_brightness led_brightness_get(struct led_classdev
*led_cdev)
+{
+	struct led_data *led =3D container_of(led_cdev, struct led_data,
cdev);
+	struct hidpp_device *hidpp =3D led->drv_data;
+	u8 params[1] =3D { 0 };
+	struct hidpp_report report;
+	int ret;
+	u16 be_brightness;
+
+
+	ret =3D hidpp_send_fap_command_sync(hidpp,
+
hidpp->illumination_feature_index,
+					  HIDPP_ILLUMINATION_FUNC_GET,
params,
+					  0, &report);
+	if (ret) {
+		hid_err(hidpp->hid_dev, "Getting Illumination failed\n");
+		goto exit;
+	}
+
+
+	led->on =3D report.fap.params[0] & 0x01;
+	if (!led->on) {
+		return LED_OFF;
+	}
+
+	ret =3D hidpp_send_fap_command_sync(
+		hidpp, hidpp->illumination_feature_index,
+		HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS, params, 0,
&report);
+	if (ret) {
+		hid_err(hidpp->hid_dev,
+			"Getting Illumination Brightness failed\n");
+		goto exit;
+	}
+
+	be_brightness =3D (report.fap.params[0] << 8) |
+			(report.fap.params[1] << 0);
+	led->brightness =3D be16_to_cpu(be_brightness);
+exit:
+	return device_to_led_brightness(led);
+}
+
+static void led_brightness_set_dummy(struct led_classdev *led_cdev,
+			enum led_brightness brightness) {
+}
+
+static int led_brightness_set_sync(struct led_classdev *led_cdev,
+			       enum led_brightness brightness)
+{
+	struct led_data *led =3D container_of(led_cdev, struct led_data,
cdev);
+	struct hidpp_device *hidpp =3D led->drv_data;
+	u16 be_brightness;
+	struct hidpp_report report;
+	u8 params[2];
+	int params_count =3D sizeof(params) / sizeof(*params);
+	int ret;
+
+
+	be_brightness =3D cpu_to_be16(led->brightness);
+	led->on =3D brightness !=3D 0;
+	if (led->on) {
+		led->brightness =3D led_to_device_brightness_value(led,
brightness);
+	}
+
+	memzero_explicit(params, params_count);
+	params[0] =3D led->on ? 0x01 : 0x00;
+	ret =3D hidpp_send_fap_command_sync(hidpp,
+
hidpp->illumination_feature_index,
+					  HIDPP_ILLUMINATION_FUNC_SET,
params,
+					  params_count, &report);
+	if (ret) {
+		hid_err(hidpp->hid_dev, "Setting Illumination failed\n");
+		return ret;
+	}
+
+	if (!led->on)
+		return 0;
+	params[0] =3D (be_brightness & 0xFF00) >> 8;
+	params[1] =3D (be_brightness & 0x00FF) >> 0;
+	ret =3D hidpp_send_fap_command_sync(
+		hidpp, hidpp->illumination_feature_index,
+		HIDPP_ILLUMINATION_FUNC_SET_BRIGHTNESS, params,
params_count,
+		&report);
+	if (ret) {
+		hid_err(hidpp->hid_dev,
+			"Setting Illumination Brightness failed\n");
+		return ret;
+	}
+	return ret;
+}
+
+static int get_brightness_info_sync(struct hidpp_device *hidpp,
+				    struct control_info *info)
+{
+	struct hidpp_report resp;
+	int ret =3D hidpp_send_fap_command_sync(
+		hidpp, hidpp->illumination_feature_index,
+		HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS_INFO, NULL, 0,
&resp);
+	if (ret) {
+		hid_err(hidpp->hid_dev,
+			"get_brightness_info_sync failed with %d\n", ret);
+		return ret;
+	}
+
+	info->capabilities =3D resp.fap.params[0];
+	info->min =3D
+		be16_to_cpu(resp.fap.params[1] << 8 | resp.fap.params[2]
<< 0);
+	info->max =3D
+		be16_to_cpu(resp.fap.params[3] << 8 | resp.fap.params[4]
<< 0);
+	info->res =3D
+		be16_to_cpu(resp.fap.params[5] << 8 | resp.fap.params[6]
<< 0);
+	info->max_levels =3D resp.fap.params[7];
+	return 0;
+}
+
+static int get_color_temperature_info_sync(struct hidpp_device *hidpp,
+					   struct control_info *info)
+{
+	struct hidpp_report resp;
+	int ret =3D hidpp_send_fap_command_sync(
+		hidpp, hidpp->illumination_feature_index,
+		HIDPP_ILLUMINATION_FUNC_GET_COLOR_TEMPERATURE_INFO, NULL,
0,
+		&resp);
+	if (ret) {
+		hid_err(hidpp->hid_dev,
+			"get_color_temperature_info_sync failed with
%d\n",
+			ret);
+		return ret;
+	}
+
+	info->capabilities =3D resp.fap.params[0];
+	info->min =3D
+		be16_to_cpu(resp.fap.params[1] << 8 | resp.fap.params[2]
<< 0);
+	info->max =3D
+		be16_to_cpu(resp.fap.params[3] << 8 | resp.fap.params[4]
<< 0);
+	info->res =3D
+		be16_to_cpu(resp.fap.params[5] << 8 | resp.fap.params[6]
<< 0);
+	info->max_levels =3D resp.fap.params[7];
+	return 0;
+}
+
+static int register_led(struct hidpp_device *hidpp)
+{
+	char buf[256];
+	int ret;
+	unsigned brightness_range, r =3D 0, w =3D 0;
+	struct led_data *led =3D devm_kzalloc(&hidpp->hid_dev->dev,
sizeof(struct led_data),
+			  GFP_KERNEL);
+
+	if (!led)
+		return -ENOMEM;
+
+	ret =3D get_brightness_info_sync(hidpp, &led->brightness_info);
+	if (ret)
+		goto cleanup;
+
+	ret =3D get_color_temperature_info_sync(hidpp,
+
&led->color_temperature_info);
+	if (ret)
+		goto cleanup;
+
+	led->drv_data =3D hidpp;
+	led->removed =3D false;
+	memzero_explicit(buf, 256);
+	strscpy(buf, hidpp->name, 256);
+	while (w !=3D 256) {
+		char c =3D buf[r];
+		if (c =3D=3D '\'' || c =3D=3D '\"') {
+			if (r !=3D 255) {
+				r++;
+			}
+			continue;
+		}
+		buf[w] =3D buf[r];
+		w++;
+		if (r !=3D 255) {
+			r++;
+		}
+	}
+	strreplace(buf, ' ', '_');
+	snprintf(led->dirname, sizeof(led->dirname) /
sizeof(*led->dirname),
+		 "%s::illumination", buf);
+	led->cdev.name =3D led->dirname;
+	led->cdev.flags =3D LED_HW_PLUGGABLE | LED_BRIGHT_HW_CHANGED;
+	led->cdev.max_brightness =3D device_to_led_brightness_value(led,
led->brightness_info.max);
+	if (brightness_range =3D=3D 0) {
+		/* According to docs set value is not supported under
these
+		 * conditions.
+		 * LED interface enforces a set function.
+		 */
+		led->cdev.brightness_set =3D led_brightness_set_dummy;
+	} else {
+		led->cdev.brightness_set_blocking =3D
led_brightness_set_sync;
+	}
+	led->cdev.brightness_get =3D led_brightness_get;
+
+	ret =3D devm_led_classdev_register(&hidpp->hid_dev->dev,
&led->cdev);
+	if (ret < 0) {
+		goto cleanup;
+	}
+	hidpp->private_data =3D led;
+	return 0;
+cleanup:
+	devm_kfree(&hidpp->hid_dev->dev, led);
+	return ret;
+}
+
+static int hidpp_initialize_illumination(struct hidpp_device *hidpp)
+{
+	int ret;
+	unsigned long capabilities =3D hidpp->capabilities;
+
+	if (hidpp->protocol_major >=3D 2) {
+		u8 feature_index;
+		u8 feature_type;
+
+		ret =3D hidpp_root_get_feature(hidpp,
+
HIDPP_PAGE_ILLUMINATION_LIGHT,
+					     &feature_index,
&feature_type);
+		if (!ret && !(feature_type & HIDPP_FEATURE_TYPE_HIDDEN)) {
+			hidpp->capabilities |=3D
+				HIDPP_CAPABILITY_ILLUMINATION_LIGHT;
+			hidpp->illumination_feature_index =3D feature_index;
+			hid_dbg(hidpp->hid_dev,
+				"Detected HID++ 2.0 Illumination
Light\n");
+			return 0;
+		}
+	}
+
+	if (hidpp->capabilities =3D=3D capabilities)
+		hid_dbg(hidpp->hid_dev,
+			"Did not detect HID++ Illumination Light hardware
support\n");
+	return 0;
+}
+
+static int hidpp20_illumination_raw_event(struct hidpp_device *hidpp, u8
*data,
+					  int size)
+{
+	struct led_data *led =3D (struct led_data *)hidpp->private_data;
+	struct hidpp_report *report =3D (struct hidpp_report *)data;
+	switch (report->report_id) {
+	case REPORT_ID_HIDPP_LONG:
+		/* size is already checked in hidpp_raw_event.
+		 * only leave long through
+		 */
+		break;
+	default:
+		return 0;
+	}
+
+	if (report->fap.feature_index !=3D
hidpp->illumination_feature_index) {
+		return 0;
+	}
+
+
+	if (report->fap.funcindex_clientid =3D=3D
HIDPP_ILLUMINATION_EVENT_CHANGE) {
+		led->on =3D report->fap.params[0] & 0x1;
+		if (led->on) {
+			unsigned led_brightness =3D
device_to_led_brightness(led);
+			led_classdev_notify_brightness_hw_changed(
+				&led->cdev, led_brightness);
+		} else
+
led_classdev_notify_brightness_hw_changed(&led->cdev,
+
LED_OFF);
+		return 0;
+	}
+
+	if (report->fap.funcindex_clientid =3D=3D
+	    HIDPP_ILLUMINATION_EVENT_BRIGHTNESS_CHANGE) {
+		unsigned led_brightness;
+		u16 brightness =3D be16_to_cpu(report->fap.params[0] << 8 |
+					     report->fap.params[1] << 0);
+		led->brightness =3D brightness;
+		led_brightness =3D device_to_led_brightness(led);
+		led_classdev_notify_brightness_hw_changed(&led->cdev,
+							  led_brightness);
+		return 0;
+	}
+
+	return 0;
+}
+
 /*
=2D-----------------------------------------------------------------------=
--
*/
 /* 0x2120: Hi-resolution scrolling
*/
 /*
=2D-----------------------------------------------------------------------=
--
*/
@@ -2929,7 +3285,6 @@ static int m560_send_config_command(struct
hid_device *hdev, bool connected)

 	return hidpp_send_rap_command_sync(
 		hidpp_dev,
-		REPORT_ID_HIDPP_SHORT,
 		M560_SUB_ID,
 		M560_BUTTON_MODE_REGISTER,
 		(u8 *)m560_config_parameter,
@@ -3468,7 +3823,6 @@ static int hidpp_initialize_hires_scroll(struct
hidpp_device *hidpp)
 		struct hidpp_report response;

 		ret =3D hidpp_send_rap_command_sync(hidpp,
-						  REPORT_ID_HIDPP_SHORT,
 						  HIDPP_GET_REGISTER,

HIDPP_ENABLE_FAST_SCROLL,
 						  NULL, 0, &response);
@@ -3648,6 +4002,12 @@ static int hidpp_raw_hidpp_event(struct
hidpp_device *hidpp, u8 *data,
 			return ret;
 	}

+	if (hidpp->capabilities & HIDPP_CAPABILITY_ILLUMINATION_LIGHT) {
+		ret =3D hidpp20_illumination_raw_event(hidpp, data, size);
+		if (ret !=3D 0)
+			return ret;
+	}
+
 	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS) {
 		ret =3D hidpp10_wheel_raw_event(hidpp, data, size);
 		if (ret !=3D 0)
@@ -3972,6 +4332,7 @@ static void hidpp_connect_event(struct hidpp_device
*hidpp)

 	hidpp_initialize_battery(hidpp);
 	hidpp_initialize_hires_scroll(hidpp);
+	hidpp_initialize_illumination(hidpp);

 	/* forward current battery state */
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
@@ -3994,6 +4355,14 @@ static void hidpp_connect_event(struct hidpp_device
*hidpp)
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HI_RES_SCROLL)
 		hi_res_scroll_enable(hidpp);

+	if (hidpp->capabilities & HIDPP_CAPABILITY_ILLUMINATION_LIGHT) {
+		ret =3D register_led(hidpp);
+		if (ret) {
+			hid_err(hdev, "Registering leds failed.\n");
+			return;
+		}
+	}
+
 	if (!(hidpp->quirks & HIDPP_QUIRK_NO_HIDINPUT) ||
hidpp->delayed_input)
 		/* if the input nodes are already created, we can stop now
*/
 		return;
@@ -4187,12 +4556,16 @@ static int hidpp_probe(struct hid_device *hdev,
const struct hid_device_id *id)
 	if (hidpp->quirks & HIDPP_QUIRK_UNIFYING)
 		hidpp_unifying_init(hidpp);

-	connected =3D hidpp_root_get_protocol_version(hidpp) =3D=3D 0;
+	ret =3D hidpp_root_get_protocol_version(hidpp);
+	connected =3D ret =3D=3D 0;
 	atomic_set(&hidpp->connected, connected);
 	if (!(hidpp->quirks & HIDPP_QUIRK_UNIFYING)) {
 		if (!connected) {
+			if (ret =3D=3D -ETIMEDOUT)
+				hid_err(hdev, "Device connection timed
out");
+			else
+				hid_err(hdev, "Device not connected");
 			ret =3D -ENODEV;
-			hid_err(hdev, "Device not connected");
 			goto hid_hw_init_fail;
 		}

@@ -4357,6 +4730,9 @@ static const struct hid_device_id hidpp_devices[] =
=3D
{
 		.driver_data =3D HIDPP_QUIRK_CLASS_G920 |
HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
 	{ /* Logitech G Pro Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
+	{ /* Logitech Litra Glow over USB*/
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
USB_DEVICE_ID_LOGITECH_LITRA_GLOW),
+		.driver_data =3D HIDPP_QUIRK_DELAYED_INIT |
HIDPP_QUIRK_FORCE_OUTPUT_REPORTS },

 	{ /* MX5000 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 50e1c717fc0a..0332662692d2 100644
=2D-- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -491,6 +491,7 @@ static const struct hid_device_id
hid_have_special_driver[] =3D {
 #endif
 #if IS_ENABLED(CONFIG_HID_LOGITECH_HIDPP)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
USB_DEVICE_ID_LOGITECH_G920_WHEEL) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
USB_DEVICE_ID_LOGITECH_LITRA_GLOW) },
 #endif
 #if IS_ENABLED(CONFIG_HID_MAGICMOUSE)
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGICMOUSE) },

