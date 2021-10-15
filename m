Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D8F42FBE4
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 21:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhJOTXV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 15:23:21 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41599 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230009AbhJOTXU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 15:23:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0C3CD3200EE0;
        Fri, 15 Oct 2021 15:21:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 15 Oct 2021 15:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        michaelcullen.name; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=fm1; bh=yKIcC4xzI9XDV
        mAZ8fUuEbBQ/xHrwJtenXeum8rv6gc=; b=TYnPCAQ7wxKNhcZ1igYkxHmPE6J6u
        5e/6pXsIrjTi6LxQYzvI8otBKV7YxEYzR7Nnky0V7gP0Ep5/gSRbzSkiX4pFnfn2
        l0TiXyz1ZXAhV6XLMJM6YnxsfqaHwXWyVcGcyj2IZMoZjPQeJf0eeDyvznYl/vc0
        +C3MJ2oLIdPGx9EbBfpTXAUpcbmFO161LaodnJnOBLR1LPWzEpzytIYV7gESYq/6
        CoT793mmx0J3zvsIy8binVdisOp0oxjQO6y9REd4Ju0uQstX9WBMxbmT2VkpeHXJ
        UiWsu/rqdUrhJ42T9pez4lTd6kgvW3HlHVVieXq2YVsOYSDh30jEx4RwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yKIcC4xzI9XDVmAZ8
        fUuEbBQ/xHrwJtenXeum8rv6gc=; b=GCykoTkxc5Sss8ZCkM4lKcEzgtT5gRdJr
        3s9Df0VHjXAq66dOUVYB2xJwqq3Lomi72yC/chy2ww+f4lSrzRT5Tj9GCNSxhyu5
        /9AAqzBpdjIKSap9BFYQDYOZYE3+BcCKjJ/H141bWrQFJ7DgD3FgYYATkgovN3+I
        qwI4JSPPbutgKfiUOU0Rp3Dq5bBgTZV5FU5jYw6DKJVaAbhwGDu3i3KO9v9835Zb
        0+YnGMJLYkS9rpvi+PE1GHuW/5e6euwlDrvTgO7cIpMt+YnFJhQXdVh7Au5IesB5
        /bTpSMnZBAyAz/jzO6NpO3fBkBL+pHmWXW9SdkoJuANVbpbFDOYFA==
X-ME-Sender: <xms:qNRpYQ0KpsxWEigvBx2ImWG7N35ICiTkm-7lif-SWm_ZKJZmb6ZtTg>
    <xme:qNRpYbERrCFSgG2SaEBCkIyRh_P53OK_8rn6fvkhik79u4RybXXB3MOaz-A2v7kca
    DXMuICHS_v-JI-4oQ>
X-ME-Received: <xmr:qNRpYY7mtLKkelfzbfuUdSyLC8HY8kqN7WAY26Zo2rZhiQK9UOqhSOyWs70CvozckvZCBn4MSpZ1oiR9QpmuZ2KSI0uUljxHFjqlEYDjM-1cy9OtisfL8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugedgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefoihgthhgrvghlucevuhhllhgvnhcuoehmihgthhgrvghlsehm
    ihgthhgrvghltghulhhlvghnrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffekhfektd
    ejgfekgfffueejhfffvdfhgfeftdekfeffheehueeuleejteehtdfhnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhitghhrggvlhesmhhitg
    hhrggvlhgtuhhllhgvnhdrnhgrmhgv
X-ME-Proxy: <xmx:qNRpYZ0q9ZGtHATd2YhUxIqMrYBQjzVB53s_tSnM1vKMRkrbahboWw>
    <xmx:qNRpYTH3qxQ0ugvZaysFwTNJYN5j_ngtwlDVEK2xrg2mPtyjVz9_xw>
    <xmx:qNRpYS_iYC0LeURQ6ygQbuqVfX15P7Zut5HllshL6q3vGlHS1bhoew>
    <xmx:qNRpYYRZkl54szaf79DXXFzad_6cPKTt_YR-W7iP8ITNTwH-PIjSdQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 15:21:10 -0400 (EDT)
From:   Michael Cullen <michael@michaelcullen.name>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Cullen <michael@michaelcullen.name>
Subject: [PATCH] Input: xpad - Add support for another USB ID of Nacon GC-100
Date:   Fri, 15 Oct 2021 21:20:51 +0200
Message-Id: <20211015192051.5196-1-michael@michaelcullen.name>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Nacon GX100XF is already mapped, but it seems there is a Nacon
GC-100 (identified as NC5136Wht PCGC-100WHITE though I believe other
colours exist) with a different USB ID when in XInput mode.

Signed-off-by: Michael Cullen <michael@michaelcullen.name>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d69d7657ab12..dc74c355012b 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -332,6 +332,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
@@ -449,6 +450,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	{ }
 };
 
-- 
2.31.1

