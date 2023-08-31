Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B6E78EE22
	for <lists+linux-input@lfdr.de>; Thu, 31 Aug 2023 15:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjHaNJo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Aug 2023 09:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbjHaNJo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Aug 2023 09:09:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BA9CF3
        for <linux-input@vger.kernel.org>; Thu, 31 Aug 2023 06:09:41 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so14922271fa.2
        for <linux-input@vger.kernel.org>; Thu, 31 Aug 2023 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693487379; x=1694092179; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :reply-to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czSxBm00FJHQ40s9tokxAl8adQLNz+vfwfAqH/mohSE=;
        b=NfuCQVqxbgPFOKr6KiAc1J7Mn/k6h3N+KFHNfJNHhWnEoApFodT9j+UWr6whdgtw4u
         EaHxoM8r7vwNRoR565mrr+obaLsm8urgy/zXF/6zLvtt6sa3uTSmfwgxvwuukViH/Vd3
         iYRYbTPeROXb9pItfhdEgRVYGynepgNk+AMTfppUXsyKjtKoY36XiQbukCqPKz9ng/gR
         iFtXjLiUSSbEhIjpyrA71r6VU7zbhxcbQQlwMEswTKPTVLx4StE5iT/AoZCyzb1NhG7q
         VZ2UdlfzKsSyYcTSlNBBTm6WbBocRAIgqr991kk1W2MPFb/pztiuJQKS6KdfxdTogQfr
         YeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693487379; x=1694092179;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :reply-to:from:subject:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czSxBm00FJHQ40s9tokxAl8adQLNz+vfwfAqH/mohSE=;
        b=hurE1EOsWfFDZpJcHjZeNNmbWDTt6axVzn32cWXHL+RWtan6EqmcUGlasYp625ku9w
         2Q5JcFXMVMRruxREjYFHIkMmz8/6Qd/AxfeyYDnaiHdWCHDYOhBlKUg+qKfESRa8NcXD
         w29uLDvpxGcKlyYhYSTVWFJHgkoOmaB2wjxLRWdsUwh+Ta75WoQsy414ufSDosZLjer1
         EnT9Fh2MMVrcltzRjKxvjbeoPAUfFPzVAXxkvfTDpbk6pWmk5XgRPB7dG/X1yDNvX3hU
         OFYrmq3UeLC+3muixJVUSpWviNTC5UN//U4CFyNzTG+SBfGFe5rvGFsZsN1F0lAgNBKg
         9WSg==
X-Gm-Message-State: AOJu0Yz0XZUkscnbF422gHM/qsswMxYMwFwuRPmVoIOTMWDc227XZEOC
        k4ugdWN6x3Ssmt3HzihuvKNSvg4HFTfCmU+8QqY=
X-Google-Smtp-Source: AGHT+IHd7rr1o5/DM8MaSOY1Xm6sDHQFIzoJ4MgQEyjQu1bB5P2eRjAlweIAdPWb5cqMRT++IOnlNA==
X-Received: by 2002:a2e:880a:0:b0:2bb:aa37:6517 with SMTP id x10-20020a2e880a000000b002bbaa376517mr4183616ljh.6.1693487379225;
        Thu, 31 Aug 2023 06:09:39 -0700 (PDT)
Received: from [192.168.0.11] ([94.180.116.119])
        by smtp.gmail.com with ESMTPSA id m18-20020a2eb6d2000000b002b9ff8450aesm307433ljo.91.2023.08.31.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 06:09:38 -0700 (PDT)
Message-ID: <cbae0c4d5fab4991f827fa1954adeb7182493d4b.camel@gmail.com>
Subject: [PATCH] Adding quirk for Betop Titanwolf Hotas Bundle
From:   Anton <llancelot7@gmail.com>
Reply-To: llancelot7@gmail.com
To:     benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Date:   Thu, 31 Aug 2023 20:09:24 +0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Patch for enabling quirk for Betop Titanwolf Hotas Bundle joystick where mi=
ssing one axis and second Hat


diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8a310f8ff20f..3d5abb9b2891 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -249,6 +249,7 @@
 #define USB_VENDOR_ID_BETOP_2185PC	0x11c0
 #define USB_VENDOR_ID_BETOP_2185V2PC	0x8380
 #define USB_VENDOR_ID_BETOP_2185V2BFM	0x20bc
+#define USB_DEVICE_ID_BETOP_TWOLF_HOTAS_BUNDLE 0x5608
=20
 #define USB_VENDOR_ID_BIGBEN	0x146b
 #define USB_DEVICE_ID_BIGBEN_PS3OFMINIPAD	0x0902
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 3983b4f282f8..6d5e5e9f637a 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -206,6 +206,7 @@ static const struct hid_device_id hid_quirks[] =3D {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP, USB_DEVICE_ID_QUAD_USB_JOYPAD),=
 HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_XIN_MO, USB_DEVICE_ID_XIN_MO_DUAL_ARCADE),=
 HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_GROUP_AUD=
IO), HID_QUIRK_NOGET },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_BETOP_2185PC, USB_DEVICE_ID_BETOP_TWOLF_HO=
TAS_BUNDLE), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
=20
 	{ 0 }
 };

