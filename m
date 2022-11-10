Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8276244A1
	for <lists+linux-input@lfdr.de>; Thu, 10 Nov 2022 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiKJOrx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Nov 2022 09:47:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiKJOrw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Nov 2022 09:47:52 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270CE69DE1;
        Thu, 10 Nov 2022 06:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668091667; bh=bpYJ9YkKNX8WoviwYTZ9tryk6v+46qbustwpE9UpUTI=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=Em+63HnxgO4mXyG9QqIQl392EUlQijez/4mo/Pde5skQV8PM2KtIJJ0UjeyagmZcp
         4tiWcZnxusiz+r6Fd35/djSdnlWqsB8PItTrhya4aiNoYkum5KIm/llwh3M5QOCXWa
         HpGATUSQtMXwkcxRfeDzEg2WDUmP0trqNvaojZSvWdItKces/M0pEVTRdSlQ3o/m5v
         1+dxYlZBrbxkagTNgQYVGTkrf99qvDvYP/1KRqhRkk2YywQxmsIMg7Te3pE4i1rpAn
         Xu2rHP1fKLnjliOqK+FwNNDgE3xB+O5PAuSq1mVQ08uehfdI8/pYi8jzw+H0RtMtFB
         7jEt78f669tTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from 9300 ([93.221.18.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1omJDu1ZmL-00FlFw; Thu, 10
 Nov 2022 15:47:47 +0100
Date:   Thu, 10 Nov 2022 15:47:47 +0100 (CET)
From:   Andreas Bergmeier <abergmeier@gmx.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        USB mailing list <linux-usb@vger.kernel.org>,
        linux-input@vger.kernel.org
Subject: PATCH: Simplify hidpp_send_rap_command_sync calls
Message-ID: <4b871484-b19-95b8-f973-bfebcb5348ab@9300>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:f+3M3pKNUx7pXo9WDtoR5Bhrk2oN923t6QwdI6TxRPF6ZHgjRun
 E0G5rya+Xkh2XRO6df2BLxm20EYwaRyi54Y5IDFhxAVzhQx5ynrrGqTvuVK1bggR+nexY/3
 EFXvBzL2L6d0WYLXwafnQLrJZyGRRI+/QundNWItB4/Git+0mbd8CCMwPoughoMwZe9MFKS
 PYgICFcMIjQUUnQFfTWZA==
UI-OutboundReport: notjunk:1;M01:P0:lnC/lPsLVOs=;BToMMPeISI7pFR39Tg/8YEvBpf6
 /dZkMec8JO5x1/waEoP/V1dygRS+Dx+VnZ6hLuuVMZNrSUidTI+G6Layg4YpyU1JhOe78oj6z
 +NvF1K+jUoWXovjAN5XMq+zaleAkG5bYUipL4XPMsbNQ5s/5cLMsTJ1y/vE7wmtemfeuZ2fJ6
 ZvyWZqyO1TROD9rBg+MqDztgjmrdvUtZuV4FJ50X4nLEvkdGj1QrHrUX+cKYhrTwtIHe0g5Z8
 pbU2ZNC1YaDmWGBaTAKfkQ6xL3v28iCW9jcVD+1dNx1IWhHPizPlZv0pg3zNAMG3ZPRQBdcJC
 8RZE+Z0tfPZUQDRUFTvzkbeCy0eHMOl62xW8pUJKShqAb0c7JquErv1Jr2LtUerSTyH0KYoTF
 ysLVs09yHp9LgWpmZtQu1lOE5huFlfmB/RrbjPLnoTp50Gq0dWOuG8s19sGfqKu9Dl24Lm3Jd
 gaNf69nkn+kY9V9p8dVLrab1r9AXgb6C56cEn2OlYHg2tj1e8KYUMIlV56IypgzbeJj+Dc8c8
 Fus4mWLGE2g/Qw+cFj5ujEBwk8wSapZSBkvOIKeCrJfIX4zot2wCxi8Zozwf0koxjhRdjiAIk
 5LqR+37zgcmxKNCtyG0RLvnwTc/9wPMLAGtr1T7Buy/SOmFPhjYdeFVMKBjzM5K3CiiTjrvbQ
 cM+5TzTLNO2vSRnNTXvV8xX+i5yVHgN6uyHf9lscsxmEv9ekFnqnBKyzfakPgw2vL8TTl8h2l
 GU38RQyPdyJx0p/DV4MIs1EKL/JOzzpMw0vbI7AQsXRzC6GfFU1Ivz1eiAUKWGiEdJ0q2ahXq
 MMMlg17D3kNt8xvQcGejTuw77g3pgdNXQ7jqlTLembHWSsR1hEeOAD5RzwzGlyQl3wNT8FvqK
 ZQubf0FEWaVtgps3TC7X5WZDwElwxQRnGAvJYGYEQPWgT/9tthvHx3R3w18qH1M7svnDvKL0b
 XZ334Q==
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

Inside function, report_id might get overwritten.
Only REPORT_ID_HIDPP_SHORT is ever passed in.
So there seems to be no point in passing report_id in the first place.
Just directly evaluate which report_id to use in the function itself.

Signed-off-by: Andreas Bergmeier <abergmeier@gmx.net>

diff --git a/drivers/hid/hid-logitech-hidpp.c
b/drivers/hid/hid-logitech-hidpp.c
index 898691a77a58..20ae7f73ef08 100644
=2D-- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -360,15 +360,16 @@ static int hidpp_send_fap_command_sync(struct
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
@@ -549,7 +550,6 @@ static int hidpp10_set_register(struct hidpp_device
*hidpp_dev,
 	u8 params[3] =3D { 0 };

 	ret =3D hidpp_send_rap_command_sync(hidpp_dev,
-					  REPORT_ID_HIDPP_SHORT,
 					  HIDPP_GET_REGISTER,
 					  register_address,
 					  NULL, 0, &response);
@@ -562,7 +562,6 @@ static int hidpp10_set_register(struct hidpp_device
*hidpp_dev,
 	params[byte] |=3D value & mask;

 	return hidpp_send_rap_command_sync(hidpp_dev,
-					   REPORT_ID_HIDPP_SHORT,
 					   HIDPP_SET_REGISTER,
 					   register_address,
 					   params, 3, &response);
@@ -658,7 +657,6 @@ static int hidpp10_query_battery_status(struct
hidpp_device *hidpp)
 	int ret, status;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_REGISTER,
 					HIDPP_REG_BATTERY_STATUS,
 					NULL, 0, &response);
@@ -710,7 +708,6 @@ static int hidpp10_query_battery_mileage(struct
hidpp_device *hidpp)
 	int ret, status;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_REGISTER,
 					HIDPP_REG_BATTERY_MILEAGE,
 					NULL, 0, &response);
@@ -782,7 +779,6 @@ static char *hidpp_unifying_get_name(struct
hidpp_device *hidpp_dev)
 	int len;

 	ret =3D hidpp_send_rap_command_sync(hidpp_dev,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_LONG_REGISTER,
 					HIDPP_REG_PAIRING_INFORMATION,
 					params, 1, &response);
@@ -816,7 +812,6 @@ static int hidpp_unifying_get_serial(struct
hidpp_device *hidpp, u32 *serial)
 	u8 params[1] =3D { HIDPP_EXTENDED_PAIRING };

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_LONG_REGISTER,
 					HIDPP_REG_PAIRING_INFORMATION,
 					params, 1, &response);
@@ -900,7 +895,6 @@ static int hidpp_root_get_protocol_version(struct
hidpp_device *hidpp)
 	int ret;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-			REPORT_ID_HIDPP_SHORT,
 			HIDPP_PAGE_ROOT_IDX,
 			CMD_ROOT_GET_PROTOCOL_VERSION,
 			ping_data, sizeof(ping_data), &response);
@@ -3180,7 +3174,6 @@ static int m560_send_config_command(struct
hid_device *hdev, bool connected)

 	return hidpp_send_rap_command_sync(
 		hidpp_dev,
-		REPORT_ID_HIDPP_SHORT,
 		M560_SUB_ID,
 		M560_BUTTON_MODE_REGISTER,
 		(u8 *)m560_config_parameter,
@@ -3719,7 +3712,6 @@ static int hidpp_initialize_hires_scroll(struct
hidpp_device *hidpp)
 		struct hidpp_report response;

 		ret =3D hidpp_send_rap_command_sync(hidpp,
-						  REPORT_ID_HIDPP_SHORT,
 						  HIDPP_GET_REGISTER,

HIDPP_ENABLE_FAST_SCROLL,
 						  NULL, 0, &response);

