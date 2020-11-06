Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C032A952A
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 12:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgKFLYw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 06:24:52 -0500
Received: from mout.gmx.net ([212.227.15.15]:37413 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgKFLYw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Nov 2020 06:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604661879;
        bh=cFCPptnJXya4GUiuIySWp5MfhmM2iBoNEec6dECH9H0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QwIt2jZk6Eo1/eyr2eqqDhlgem8D38WPIBK29RhGzkM1xbTcglsBdPwOsqPYAkVhW
         TyjkkO7fTn9bERkn+QCeRtImnsKuEWC38zy8V+d3e5b2V8c8/i7jBtqbJkspfFlZzj
         zGYXHa+hNBEnNju785muA/IXRqL3T1PW1dpjRSc4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1kdTlU2YAd-0036B7; Fri, 06
 Nov 2020 12:24:39 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: input: ektf2127: Add elan,ektf2132 compatible string
Date:   Fri,  6 Nov 2020 12:24:10 +0100
Message-Id: <20201106112412.390724-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106112412.390724-1-j.neuschaefer@gmx.net>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4f+4lN6aFD4xVqcbbZvUlpkETQNlpqMXx8TzWIHiaMK30V9eAKn
 JSohfohl4DPU6+vdbCBv1mHZqhYKd6vo1t7vRwKX3k4to/t0KXo12DlaSz9cBrQftYp11RL
 EE0s74xE+xdHBF/W0u7ZAwuVKZLx7cYMmzbzmTg0tzDPY2Wm3gr726VBUJkFogOGbQjtzzo
 lRpQwZNIUpuG89WWj6/xA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iCEoGSGAZYU=:06hNXa6r/RlLDeEc2FR+9f
 e0V70uOTNpPf4YtKr+ss85pDfxdy13nUdtLBW1fv9cCvH2g62HiV7VGV+HKy+tcik94kue4lm
 gekaFK0IkXtwNYzq1F367Z4V68rPQ1vecHSfE8sPaMKsX5CmMPwgvkaey3GKmUwpQUWuQo0d5
 3L85YuULTpcixjF1EJjagW67O4Z9vPYOgPIYKii7wYQfz84Fn0rO/QVbaMFZLEMW1tfhAVM56
 jbcEIVxbOrbcRalqgxI4mMiZo60CUhcMZ1b+1h2wo1Z3aAI/xv7wNNey4VEbdmwxD8SSMXyoV
 6yDYGaWzkKc5bf3tLbwa4ujO0sZRB2QdQ7iESkHrI0Xg4gFu5RyXOOFgZGM/KX6XZA9r5zH4C
 H4IZDC+bchC9htyXa9PfACWKSDvNSUn1upuzyRKVJkvKv4WTEHCmShMQkGbIvH666/NRZOpyZ
 kkXIt763JJEaJIGx+zZa8OgsBIpQeDsioG/zs9+0ze0wWnjV2Cna4KAQce5h7+iKPZSi7P7cy
 LmM8Qzid4J3Elpw4Tkf/GDMNY63hS0MwyjOSWO71/y2f/8u0iSvkLZxH5ZXIodGNklvRt6Tl0
 O3ta7HQG9RQ8TgK6CHH8Z6umWIAyhMhWui8rAxX1dU8OIi+Ct427LftzGRgr6ugBKeDyLwV1o
 JwMUtGdxHgFnLPXjk6se9jKSfE2WXeYYNdN5DNQMt7QuQK9f7sfgfrPtyL9tUdBR1xkfk8rRe
 QIdG7cO8vGGFvmGwOzS07wt2yuSJSfWAiU8qUPhXvGw4yca5KrZx08HM578fFD08NBBYXGsHz
 8UJ2Oa671Ng2k9SZ58ClbCyS9StbmN5d5LzD9iUJqsXhIMMMDjbWdQ1Gr8BzfdqwKFTOxytJD
 9lnhZga5JDbuBYnlXW8ENXs4td7OB0z+A87FCarf4=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The eKTF2132 is a touchscreen controller found, for example, in the Kobo
Aura ebook reader. It is similar to the ektf2127, but it uses a different
packet type to report touch events.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/input/touchscreen/ektf2127.txt          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ektf2127.=
txt b/Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
index 94c4fc6449407..5eef5e7d6aae1 100644
=2D-- a/Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
@@ -1,7 +1,7 @@
 * Elan eKTF2127 I2C touchscreen controller

 Required properties:
- - compatible		  : "elan,ektf2127"
+ - compatible		  : "elan,ektf2127" or "elan,ektf2132"
  - reg			  : I2C slave address of the chip (0x40)
  - interrupts		  : interrupt specification for the ektf2127 interrupt
  - power-gpios		  : GPIO specification for the pin connected to the
=2D-
2.28.0

