Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D312D3432E1
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhCUOLP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:15 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55823 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229904AbhCUOLJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:09 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 73B495C0113;
        Sun, 21 Mar 2021 10:11:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=ozbx/JQs71euy
        yD3wNF0SDO5Kj17AC4ow5F+feJkDnU=; b=TOQq10sdpDReyH0+moqlUBa64Ezmf
        BTgLjQP0qTTnXmEJvHHRqLKRvtwVBJ64zxg3p8YOilZz0XivEwtnWnd/pouiO6et
        8uwJU2K8eJhrX+ariUWNxmCtUPB6cvaYVlnG4cp7LwjpTdR8cjzQJX1luMAo9Fim
        mQlfrmV6tOeBWDSmT5ndodWkY/dlRZXOYdoKHGELma63QDF0QyXCU1i0EqdbTWS8
        iKhkPrYEHmE70C88EZn1CGsJfKPI42fCFbMjX+Ykh/mHjjZXmr5QmGM8CgXBAjeE
        9JdbCKd+vY+FCfMGA4tNISAWKiBoMy8tJvfT8KXfPegt3PjwLYwpexmIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ozbx/JQs71euyyD3wNF0SDO5Kj17AC4ow5F+feJkDnU=; b=di2JMI0M
        qwDO9jwlF5qmfmiI3+ovh1WWvhcowiEsY7Y6YyTeuEoZAv5TmB3g11oCexuuauKM
        c6YZrfZOWnAhG7V7wk0VFILNyoBQdw3K3TtsTd0DuIUwLymm2BuiIw1uPp9ZwbcH
        SztUDz40laVhUVMThI8A4e/nnpUkJsXQF71ym8Khw/RUGC7CsmDRS0zNNa0KJ1un
        ESdg2foMfyLSplmjeYkUbP+Jz4PdxeTER5qWeojZmpvlLPTbeNcxwrX0WJuqSsG/
        dlqbo1lzQaDK73y9yahjLJNNwViDmV/UDv4+iG9wDkYskdi/qjZ9A0B2FpKt8uWs
        JUKSAgUfr4ECwg==
X-ME-Sender: <xms:_FNXYKoyrxSu3pa7PhX_QeSi_Rfn9B4kCp3t4-jMiHZfhwsonYpyqw>
    <xme:_FNXYIpqy56aRvR2iqfJzmM4ur1dV6rKrWGvDs_Ow0o-yzyPLjlkSrSLu0LEVwnQR
    Kp5d6PPWM4ptqASgp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:_FNXYPOw7DhYgd8qdY4M4bLmMkx8g6aEylFrT2epJGKbKcqMgAb8IA>
    <xmx:_FNXYJ4VqQKujwFocvpD4pjMOWpfnf2B2wdwvOoBWU5HkNr5dIAHQw>
    <xmx:_FNXYJ7sVTnHZkT4KoJL9y995grSJeIlqKZgHQ8Q1Uf908llOLGqHg>
    <xmx:_FNXYDkQFCCa3eN1qXcwmcLhw5_eAVoPUKyBDJqORdydotXVlgQybg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7B28F240138;
        Sun, 21 Mar 2021 10:11:07 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 4/9] Input: wacom_i2c - Add touchscren properties
Date:   Sun, 21 Mar 2021 10:10:44 -0400
Message-Id: <20210321141049.148-5-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Connect touchscreen properties to the wacom_i2c.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index fc0bf583d33b..9b2ed0463d09 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/irq.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
@@ -33,6 +34,7 @@ struct wacom_features {
 struct wacom_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct touchscreen_properties props;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -188,6 +190,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	__set_bit(BTN_STYLUS2, input->keybit);
 	__set_bit(BTN_TOUCH, input->keybit);
 
+	touchscreen_parse_properties(input, true, &wac_i2c->props);
 	input_set_abs_params(input, ABS_X, 0, features.x_max, 0, 0);
 	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
-- 
2.30.1

