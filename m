Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F0D349F1D
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhCZBxN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34971 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229893AbhCZBwp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:45 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id BF1915C00C3;
        Thu, 25 Mar 2021 21:52:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=zRycIHAo8ReW9
        IJaApWlLXkdnyCmXW/us1FFMU8uDn8=; b=Fqc9Sk82yzbHF+Ny5wUJVPXvC/2xL
        1s+wSWAoa8JQcZj2GeRMrueQcVfDJAgkhFwcBzJFztbqmamd9LL4tkUxVE19NU2n
        X1nCTAGPfqbw+B5MccgMBzmsiNt5yFlPdXQnPVw8J2ei3LRvncbO6xmFCts7lCo0
        1jQjW18FhV6BOM72NvlfEfN2jXHHcB6FiAY7Et1pTvbK4ywhr6zeHpWczPNnr9/e
        n5vyInVQQFyVwZs61enuJywSa9uD7JsFJBBybc+59yZ0uosq5Cr+3cRbjp05ZyVo
        MaQrVwqRNhMDcA+0safVcfJ8Ea6+XLkqtCiAOt7XbuD9AiJKhTnXbg+ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=zRycIHAo8ReW9IJaApWlLXkdnyCmXW/us1FFMU8uDn8=; b=UzfKeDIP
        0sV5wiBET9FQr8la43FFTH4nSxCnKl6a/qRhWsCx/eNTJy4OCWCBxXhOOe3dK48E
        903iNiL2S4MRWoVT+N4Gf0nMBLYmGcO+fKtiWFRWYAb4IFhsEsHBOwVKSFBbpe9E
        XpMP12GCLs7wN+WueaAiUxPG7/pTMpYkoUfeY1wKNEgJ7Aelp94z1ynyubcIgWDQ
        EzCKw7X3sEwQP5sHxaTntDe1P6AZ+RwiXf2xgp5nhXyv9Q/7TZ/7Kvkzji+SdCqW
        vovv2fjV1dGsjQvCX1QuzcSqQ//UYInghJm+f0onT2rFPlK9fzRtSJiEaFr/PViu
        nReWkTV6TVGhjw==
X-ME-Sender: <xms:bD5dYFF8gpoF-b1kfdEfZTovk1iZsA1Czze3X6EWdVtet8JTsykp4A>
    <xme:bD5dYKXQ4SUHPe55Ka_ZiQ6--KQMbfxN4VZlZ5CwTWZIxqVQp4ncTQ1VL01Sa-o9Q
    UqSTVIm6KX01Up8IQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:bD5dYHJsFmihzsNc9NMYQWMyZIYG3MQ55OV5UeJP3EFJZO3cWqKMRg>
    <xmx:bD5dYLEE9pCQYFjQTfFeB301iwMrG2OPXihYFTYA1zLPaNxLnOwooQ>
    <xmx:bD5dYLXJZs5tU1R8Pqnq4LHgvi8OAs1QKYhhOjyT3ULKlcRjyWDcxA>
    <xmx:bD5dYGSLO2xYoCDl8G5OFUhVExdFOiOQITqlQ-0u4cLzllCQTZPkMg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id D458B108005C;
        Thu, 25 Mar 2021 21:52:43 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 04/10] Input: wacom_i2c - Add touchscren properties
Date:   Thu, 25 Mar 2021 21:52:24 -0400
Message-Id: <20210326015229.141-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Connect touchscreen properties to the wacom_i2c.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
v4:
 - Add touchscreen_report_pos() as well

 drivers/input/touchscreen/wacom_i2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index eada68770671..ee1829dd35f4 100644
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
@@ -188,6 +190,9 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	__set_bit(BTN_STYLUS2, input->keybit);
 	__set_bit(BTN_TOUCH, input->keybit);
 
+	touchscreen_parse_properties(input, true, &wac_i2c->props);
+	touchscreen_report_pos(input, &wac_i2c->props, features.x_max,
+			       features.y_max, true);
 	input_set_abs_params(input, ABS_X, 0, features.x_max, 0, 0);
 	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE,
-- 
2.31.0

