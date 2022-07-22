Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15C6F57E9A8
	for <lists+linux-input@lfdr.de>; Sat, 23 Jul 2022 00:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbiGVW2X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jul 2022 18:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236830AbiGVW2X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jul 2022 18:28:23 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A0393686
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 15:28:22 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 0ACBD32007E8;
        Fri, 22 Jul 2022 18:28:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 22 Jul 2022 18:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1658528899; x=1658615299; bh=OSZw0KFN1H
        6SUiJcMwgafzfEW3akd3QpyDNia9JHvcQ=; b=VlqMqV0aas1rTfjw8aoII+ID3M
        iQK/zPwGKvzT/f1yROODw1swqoE1KXlzvw0Zd1V5CVconpXAMtv2/A9OwINOHKfJ
        m6r2YG5US5HCeDw4HXod8bfB3JIJp84NHL+JE5pvPyc05UFY9J9HtrEhMJmteBoX
        3yTF1z9rLHDdN2zCXnZ+DJoJdpTTb5jWLnywfp3/fwDsPvwrz5CUVtnmkP0ow/CS
        D9lqVMcscmXytVfUIcOZRvgpyMgQGueAEaA/SC+XxoiUmezgd3Rcp9YBhAAC2/R1
        1f182LSBHahA+NoosgyIr9m7XkcQE+y4yJAFC1n7dDL5uW7RLuPJ7PIIfBHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1658528899; x=1658615299; bh=OSZw0KFN1H6SU
        iJcMwgafzfEW3akd3QpyDNia9JHvcQ=; b=ve6n/x9oeL+UJ0hKEQQBhkx3VkOqo
        44DpHEWkWoQMtK1NPDY1v2MfjCZJwCezp3OuLdKBGNqaKLdIN/ZQYt66TFqIzkKC
        M8rJouRuFiBjUfs0DqAKhEC4XEvc+/sTLaHerdg4pcUCF80lqLgDjyXfMB4ElH+V
        WTcVUKFBAg0ZRZcgkjRHOX3pGZ66Rnp6B3UW78TGvabyjhKTyyJbWUNz532zwlnm
        NtGUAtbzthHBhtvVn9eC38TdeL0lldOUdrafGUN0XTF8EdPh4a18f8ot4iVkv/cJ
        oVcHXeq5fuaGSx8wZT4LXfdvcLGB2pfUXbeduQ9oRLtZpjkDyX8SL/9LQ==
X-ME-Sender: <xms:gyTbYuuIKMup267iESXuZaNvVhmnEdaGKQB0bA8pzo3sC5Fn7UUH9g>
    <xme:gyTbYjeK3zWV22cbBZU-OsQvMVrVABn9pzeJKrIic1Wt6xlno2IJKKqD7h9_PHEZf
    G33mbUh9jMh1ruSEuY>
X-ME-Received: <xmr:gyTbYpybb9rRwXFWSmNaKSflyGGy2ibsNx9y9cqmMn75-CR8KVr8kboHHD3D_dkcRGymaqcDpKJTaVXaKKkXVlzM_cBJY2DaKltuGMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtfedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkofggtgfgsehtjeertdertddvnecuhfhrohhmpeetnhhvihhn
    ucfrrghulhcuoegrnhhvmhhishgtsehfrghsthhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhephfegfeefheejiedtvefhleegkeevvddukedvhfdtteefvdehieeuheekiefh
    feelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hnvhhmihhstgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:gyTbYpPVBkhjPkCRJYlNswXMHRfgROSp-POkV7D3TCToX8YiKYIWdQ>
    <xmx:gyTbYu_FkmhZ_6AOsDslNrU45IuAMMZ0xGjW0k_Ayz_RucaWnP7R5g>
    <xmx:gyTbYhWdjZ_97Vc_iTd3aOM4H0FoBEpQITxgcB1A0lDDu19Fj1v6XQ>
    <xmx:gyTbYjEQ4gM_-R_HJFFtdzV4CyClEQE3N0aGFkf7BpzkxwRTIpdxUA>
Feedback-ID: if87946f0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Jul 2022 18:28:19 -0400 (EDT)
Date:   Fri, 22 Jul 2022 18:28:18 -0400
From:   Anvin Paul <anvmisc@fastmail.com>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] Input: xpad - add support for ThrustMaster eSwap PRO 
 Controller Xbox for Xbox One
Message-ID: <20220722182818.663816a8@msipc.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


From: Anvin Paul <anvmisc@fastmail.com>

Signed-off-by: Anvin Paul <anvmisc@fastmail.com>

---
 drivers/input/joystick/xpad.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 18190b529bca..537ffbd53c56 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -118,6 +118,7 @@ static const struct xpad_device {
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
+	{ 0x044f, 0xd012, "Thrustmaster, Inc. eSwap PRO Controller Xbox", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0287, "Microsoft Xbox Controller S", 0, XTYPE_XBOX },
@@ -420,6 +421,7 @@ static const struct usb_device_id xpad_table[] = {
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* X-Box USB-IF not approved class */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 Controller */
 	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster X-Box 360 controllers */
+	XPAD_XBOXONE_VENDOR(0x044f),            /* Thrustmaster X-Box One controllers */
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft X-Box 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft X-Box One controllers */
 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech X-Box 360 style controllers */
@@ -554,6 +556,8 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
+	XBOXONE_INIT_PKT(0x044f, 0xd012, xboxone_pdp_init1),
+	XBOXONE_INIT_PKT(0x044f, 0xd012, xboxone_pdp_init2),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
-- 
2.30.2

