Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D748F1373C0
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 17:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgAJQej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 11:34:39 -0500
Received: from hermes.aosc.io ([199.195.250.187]:50546 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728174AbgAJQei (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 11:34:38 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 61F3E46F40;
        Fri, 10 Jan 2020 16:27:22 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 1/3] dt-bindings: input: touchscreen: add compatible string for Goodix GT917S
Date:   Sat, 11 Jan 2020 00:26:06 +0800
Message-Id: <20200110162608.1066397-2-icenowy@aosc.io>
In-Reply-To: <20200110162608.1066397-1-icenowy@aosc.io>
References: <20200110162608.1066397-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1578673646;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=TK+NyESN/Ep9ZZLYo5jYOpPJ8VYhZVrLGzGek6/8uLo=;
        b=pHTCdmoCBw3ZkjvG1gChvmwGxFIm3WDdAB9zy7igDfAWX98lLulOd4lT2vmCWA5AEULJaf
        awYCgqkmugx5Mnh3JYasnhL0OOxklRMkN607yrloFvEpM7cdIZkIym5XLvepZwlcVYAdUz
        gBiXmb+9slgj251ASfLtGO36nu7TKWU=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix GT917S is a new touchscreen chip from Goodix.

Add its compatible string to the device tree binding.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
index fc03ea4cf5ab..c5447b136eb3 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
@@ -8,6 +8,7 @@ Required properties:
 				 or "goodix,gt911"
 				 or "goodix,gt9110"
 				 or "goodix,gt912"
+				 or "goodix,gt917s"
 				 or "goodix,gt927"
 				 or "goodix,gt9271"
 				 or "goodix,gt928"
-- 
2.23.0

