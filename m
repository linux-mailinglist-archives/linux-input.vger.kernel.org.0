Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6740942867
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 16:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437004AbfFLOJC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 10:09:02 -0400
Received: from mout.gmx.net ([212.227.15.18]:58977 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436722AbfFLOJB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 10:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560348540;
        bh=NvcCbtzx411aDDq6p/x++NbuHwp0vPYykyPBqyzTXdo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=JAj6hWom3G0AW7N/n9i/bla5sjTZYroeigS4FWQbsxhRiDD6Mo2KhiGIDrm16JV5F
         V0U7TItkj91LwsyLQQ8sNOjue/h03sftfbG10FKerCUbx2xiqAQV2mAqY0Zi5+tfrf
         HLm1gGBnBL4XIbK4VDqlEZlGYHvjqBpk/eIQXb7M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from b450.lan ([79.195.235.197]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Mb7lL-1hvD4y3XBr-00Kfie; Wed, 12
 Jun 2019 16:08:59 +0200
From:   Tim Schumacher <timschumi@gmx.de>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        timschumi@gmx.de
Subject: [PATCH resend] Input: iforce - Add the Saitek R440 Force Wheel
Date:   Wed, 12 Jun 2019 16:09:03 +0200
Message-Id: <20190612140903.20058-1-timschumi@gmx.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DkjaIw6wDT3Xc+d7JtT/GaIRv489Y0suNvC0UFtBPFjp1A/jMQX
 kzJQqyT0mDv49Gw153+FpsfuC4mp11vYjwRqno9eBt8RReT1N/OrwoEiFqRwrQH5A4TgXt5
 LSBOvJfcD/q/8qNggxSdj5qfbibi8PXiXHKIhR80UWXbm55KrfBhdI39LWUvFz3C2r/ARcu
 /5I9u/ugzVnkKJhOqrTTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D7U24nUWfy8=:KrdX7FauEncvLYAaKRpznB
 0b9xpZqtA8i8WqrccSIk6YIvFRltb8L32AdRczCe9AGzwZdTol0HHyUOWYezgV/OkT0NQsQYK
 E0PISpz7av7dW5ZwZfzf0L88TI9fQRG8FfxME7tnIbc+yYjPoa/Sq5OQ8XIvY1Gx6KkkWGisc
 N9ok7YxiLIPZvG4Qa//M2v7siTotSpEpKo5Xf+rFcJWuMvke5FeALDV6JxK8nuS+QyaGbP5mo
 DIvF7zZuPcBVLRR2iBuq8ga4iJSX5d+7Ji++NOz4ea+vyDgnRIpwFKto8tW3tlmYP/+dUPev4
 FymPxVrgQHzWPF/aXZjEik+g9FrPW+DakPW+DQ6KJcFz+/MOP3JC6HPgxAw+/6gP68ZFX+aOJ
 EXU7jZ8BHWMuO/XFUceQqKXAezF5eCTeicaYUaYTiJVMN471UMCHtB1hBCUCbrKorqfNeBI7b
 TFts/AMyxrJEIE+DvfGUO9JdeetWdmP1oWXGOUWZpbL8FUcdDH6A3MkQC5PwLQ+7YuXltCEoo
 HcoYYPaqhW/x4mAzL3nvQouOXyokNZI43ANZYFQ/xA6C1Q16Ev6CbmGGcdyaDwjZsGiwTfgIN
 kyNHY558/8UNpmYUJ/yPeB9PSaQFQoKcMzii8cG4Rp1pAW1uVoOs8KWz2B4nGpzlmvFd7K7mg
 twIaclS026uplJ7OTO+A9BSPtf3i1+XAy1Awp5aPHFg6mdbsqeP98L/p5TjcdbGlaNHnh4cve
 2vBCairLM99es+vmzNpRFStDryStPzxi39OLhUgNZ2RGZgaLrMyCYaZqNASGQSt+W37zv+rGG
 XroGgC/eAiupie3KfMazn2AqM6E3NaaH1Ao9aZVeVG4XzR2uvNmomjh9RBFmXmHBj9kOb2RiS
 zEzhhvYCcQuRK33Y8wx4HyEMhEga2b2/nE6W6Z9NzPm+IENN09uJAi4c2ytAEhsMf1WzwvA3/
 b2TyOfERReaPMshf4H87HCIbOU2piNS0=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Tim Schumacher <timschumi@gmx.de>
=2D--
Please note that I do NOT own this device.

I'm adding this based on the fact that this is an iforce-based
device and that the Windows driver for the R440 works for the
Logitech WingMan Formula Force after replacing the device/vendor
IDs (I got the vendor/device IDs from there as well).

Please don't add this patch if adding devices based on that is
not ok.

This patch is a resend of the patch I sent back in November,
which apparently went unnoticed.
=2D--
 drivers/input/joystick/iforce/iforce-main.c | 1 +
 drivers/input/joystick/iforce/iforce-usb.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/j=
oystick/iforce/iforce-main.c
index 55f5b7bb4cac..e000e7d5b4c1 100644
=2D-- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -55,6 +55,7 @@ static struct iforce_device iforce_device[] =3D {
 	{ 0x05ef, 0x8888, "AVB Top Shot Force Feedback Racing Wheel",	btn_wheel,=
 abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc0a4, "ACT LABS Force RS",                          btn_whee=
l, abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc084, "ACT LABS Force RS",				btn_wheel, abs_wheel, ff_iforc=
e },
+	{ 0x06a3, 0xff04, "Saitek R440 Force Wheel",			btn_wheel, abs_wheel, ff_=
iforce }, //?
 	{ 0x06f8, 0x0001, "Guillemot Race Leader Force Feedback",	btn_wheel, abs=
_wheel, ff_iforce }, //?
 	{ 0x06f8, 0x0001, "Guillemot Jet Leader Force Feedback",	btn_joystick, a=
bs_joystick_rudder, ff_iforce },
 	{ 0x06f8, 0x0004, "Guillemot Force Feedback Racing Wheel",	btn_wheel, ab=
s_wheel, ff_iforce }, //?
diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/jo=
ystick/iforce/iforce-usb.c
index f1569ae8381b..afbcd1a522d4 100644
=2D-- a/drivers/input/joystick/iforce/iforce-usb.c
+++ b/drivers/input/joystick/iforce/iforce-usb.c
@@ -202,6 +202,7 @@ static const struct usb_device_id iforce_usb_ids[] =3D=
 {
 	{ USB_DEVICE(0x05ef, 0x8888) },		/* AVB Top Shot FFB Racing Wheel */
 	{ USB_DEVICE(0x061c, 0xc0a4) },         /* ACT LABS Force RS */
 	{ USB_DEVICE(0x061c, 0xc084) },         /* ACT LABS Force RS */
+	{ USB_DEVICE(0x06a3, 0xff04) },		/* Saitek R440 Force Wheel */
 	{ USB_DEVICE(0x06f8, 0x0001) },		/* Guillemot Race Leader Force Feedback=
 */
 	{ USB_DEVICE(0x06f8, 0x0003) },		/* Guillemot Jet Leader Force Feedback =
*/
 	{ USB_DEVICE(0x06f8, 0x0004) },		/* Guillemot Force Feedback Racing Whee=
l */
=2D-
2.22.0

