Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24192E0959
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 12:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgLVLJ4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Dec 2020 06:09:56 -0500
Received: from mout.gmx.net ([212.227.15.15]:39793 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgLVLJ4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Dec 2020 06:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608635300;
        bh=w3eF+si7e98IAYsFaPGDgdO3+FGxhhiRKm/JCEsQt9c=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=VN5NKVL6axuhBcpBY5CpatnyuAFi8vs0AyHQZ5NSf+FnSTgyujP3eTn5PYaW4VdWc
         aQnW2SKMIdO/ERI/ROme1V2Z4wtbsQ338nIjjMgPyy1b+O1pU2nrAxK5taOR416gTo
         s9snhap9UOLCQ4NyFs4x/NuZlZzwP1BBjvT8N1TM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.246.89]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N5GDv-1jsjEf1R25-011E7m; Tue, 22
 Dec 2020 12:08:20 +0100
From:   Heinrich Schuchardt <xypron.glpk@gmx.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] dt-bindings: adc-keys.txt: clarify description
Date:   Tue, 22 Dec 2020 12:08:15 +0100
Message-Id: <20201222110815.24121-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T38j14BVNR123t6GreLXV8CdLOXYQXkS20/t6TpFp9eD1nXX81+
 VROophO1u084jvi68NSWgY5pmoIj0Cj7qfrNKOzu1mr425XhIk0R0wsT6tdR2xi4VFhL4YE
 jLs9HWBU62cBB7Eb7JWFfJaHEltKxgpAiB9357UtI+xr2Ye/FOJuNyqqeHAxZsQGJhhKEIH
 BjV9NXXyoTC/TH2R1+xoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iYz9xFU/6DE=:Kqj9JaHSVuDM58CIrnF0R0
 /u7fUe8WrAOTZC2v7tRR8BX6HdFKu5+Jp49FH+1EGkiEQ6R1qXXYqD6zsnU1/H3XwVDiRcR0v
 +/xm/vc16BCVx7VK5xrhsSrHlLIh9NjmdAW2TtUokzquqlgPgG0CJWKdps8g56r8ho18A5MhL
 /OctsokZH7q5WjQzEzrxsC9znf+xTynXxYs2wq2MlmZceS/dWzfNYfODpp+e0pDUA5Te+vc30
 lpVmjPQUgKXllXveZA0PaGyEjTiQ3T/UxZoCqGWgfya0GCAbdWZrhJBCcDGhowOvfEb2M+QoH
 lxIGmybBXLjxctNhVpOW06z0Ipt5a5q/dWx216BER3A71yZ0ieaSscrlZz4wm1DqFY1j9hqWP
 ujIDkahZTgvFL8p/FiI7VNExIBz6g8S5VQq4PZmOUvsjm/IuxHxkcctXx5VBNzKPjr2QYbKUq
 zvPbZ3/9pdajEbry6X9l+0QWJ94Ajw0omeITm99oUE8ugzY8E4X1d3dhNJFdQhE217OYD9eV0
 yAsYSQeOqIOXyFZ9iX7+mPA8zMy7EAaPZenZ7t5/MILXOBJxsPB+T6L53ljGH1P2B6fsC3cMn
 5qEL4E1ILDDRc2pusB6G8m+6bRUoO/4ZGo3SqIJ1CtD0USzWXY74MQxKNVt22rdXGIupnomS2
 RY9NA4GWuQ5Zf0jI0nJqpn0YVRdmTWmgyRYjmZKyBjHi/2mKchbp4XvXI3jU1gsl5DDB8gHm2
 fsEFEn2C3cdyFDEAesiwyfKY6LdKABc+0olaMJBFOZBaCYqEctbsfNX7+5K45htIjEYqgl0RM
 NOQtvLCjts4woj/see8sGn5kOajOhzyb8MM+qxiFMvuIBh8ZnJHYy2tTiEOnBGKjqKv3zNq2x
 aLHcRo3nyv/C9cOSQLcg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The current description of ADC keys is not precise enough.

"when this key is pressed" leaves it open if a key is considered pressed
below or above the threshold. This has led to confusion:
drivers/input/keyboard/adc-keys.c ignores the meaning of thresholds and
sets the key that is closest to press-threshold-microvolt.

This patch nails down the definitions and provides an interpretation of th=
e
supplied example.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
I know that this file needs to be converted to YAML. But lets first get th=
e
text right.
=2D--
 .../devicetree/bindings/input/adc-keys.txt    | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adc-keys.txt b/Docume=
ntation/devicetree/bindings/input/adc-keys.txt
index e551814629b4..6c8be6a9ace2 100644
=2D-- a/Documentation/devicetree/bindings/input/adc-keys.txt
+++ b/Documentation/devicetree/bindings/input/adc-keys.txt
@@ -5,7 +5,8 @@ Required properties:
  - compatible: "adc-keys"
  - io-channels: Phandle to an ADC channel
  - io-channel-names =3D "buttons";
- - keyup-threshold-microvolt: Voltage at which all the keys are considere=
d up.
+ - keyup-threshold-microvolt: Voltage above or equal to which all the key=
s are
+			      considered up.

 Optional properties:
 	- poll-interval: Poll interval time in milliseconds
@@ -17,7 +18,12 @@ Each button (key) is represented as a sub-node of "adc-=
keys":
 Required subnode-properties:
 	- label: Descriptive name of the key.
 	- linux,code: Keycode to emit.
-	- press-threshold-microvolt: Voltage ADC input when this key is pressed.
+	- press-threshold-microvolt: voltage above or equal to which this key is
+				     considered pressed.
+
+No two values of press-threshold-microvolt may be the same.
+All values of press-threshold-microvolt must be less than
+keyup-threshold-microvolt.

 Example:

@@ -47,3 +53,15 @@ Example:
 			press-threshold-microvolt =3D <500000>;
 		};
 	};
+
++--------------------------------+------------------------+
+| 2.000.000 <=3D value             | no key pressed         |
++--------------------------------+------------------------+
+| 1.500.000 <=3D value < 2.000.000 | KEY_VOLUMEUP pressed   |
++--------------------------------+------------------------+
+| 1.000.000 <=3D value < 1.500.000 | KEY_VOLUMEDOWN pressed |
++--------------------------------+------------------------+
+|   500.000 <=3D value < 1.000.000 | KEY_ENTER pressed      |
++--------------------------------+------------------------+
+|              value <   500.000 | no key pressed         |
++--------------------------------+------------------------+
=2D-
2.29.2

