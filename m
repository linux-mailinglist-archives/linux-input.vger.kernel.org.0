Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A077143F47
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 15:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbgAUOTH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 09:19:07 -0500
Received: from mout.web.de ([212.227.17.12]:43631 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728916AbgAUOTG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 09:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1579616341;
        bh=oyW5kwO8xJarn3kuEr7zxq2OV3sMcoGNfUpvTIw+h1I=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=ge+UGsfNGl/VEaZcZ0OgqBVZhh/ZI3W7At+AAqbBiRTZlVfI5q9K6HFzFnEoO90tk
         mBGYKmxmqFNZLI+xaYIBI6L5zDUN7+8r7aYnTgxMXg3QaLgaPoxkx+50vLqsE2J1SN
         i0w16UmYQvVLtFON3DbxUxfyYlcKq3mcbn5F/AmU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from LaptopNick.fritz.box ([79.227.106.217]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lrs70-1jch6R1qH8-013gUQ; Tue, 21 Jan 2020 15:19:01 +0100
From:   Nick Reitemeyer <nick.reitemeyer@web.de>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     stephan@gerhold.net, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nick Reitemeyer <nick.reitemeyer@web.de>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Coreriver vendor prefix
Date:   Tue, 21 Jan 2020 15:15:24 +0100
Message-Id: <20200121141525.3404-1-nick.reitemeyer@web.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kN2/uaHHSicxe1V/hz2OieOJKKx6B1Tx95Yd9/Hcpu+4ZaYbfCC
 MURnyZ/iITvdW7N9MebmFc3hYjHnU9VnU7gCDQWr+8ejMzOPnwqhW6GQfQpnMc9bB8Cesbs
 xNueTWr/vApeW15xL/RBk754nGsZhJYFzySU543HKJj2K06MUdND69ddPOLESF8TZ9o4M5S
 /bMjdqS2ae+09FNu60NpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9n/+EnS/cGo=:p+dN9YhqwwgZJL0dDuKZTm
 vDixCZcj9T0pjsh+/iBTXgExtMt7TceuOdMcN87Z4mg2ZBq8uSUIFm7eJ0hlHY9ytJXB9HlVg
 lXm0PZznTVS4Jd9A/idT5Tbo7dmXnHYxyglva48b6/8X5mN9dmvr7S2omgVn03PvfznJ22uvk
 kqk8VehRGQDze2yZX4lUs68GkCKb5eucdN/Cmqi8oWzC1RdJGXhRqifwgyCw0t4h217Js5KIT
 4fqgVn1jZ+vlMXnP4dlOKwC39et6eDsbeqXNLtDCzVhTUbnTBrRJDyoDrlk7ygcrnALC3fF9M
 /dNXBrS8l4nYEHQBSe/SXBtfYTOKUtG/jxcEzkGskpS9uj92RZu37jrFsltnL1TdHyvtvyORL
 qw7DnYIwbpt4gCh/5+TM+hFfcjpuhv6aXig7ItdKL4ZCz/JPVXEn6w1f4Q6iB9VK2p91LDBY/
 Ov+TczC4Z+O4i2X+D1qVIzmNwT+TXs9CgG0eYfU4jpnv0NZQi4u/cCF64acdub31iW1gB3frD
 /Og7POQ2q3YBf4RwHVPXmjyP6uU0k/sE+h+3gX29oCFac4JoqbvT9SBMvLyTrovbnZAzFrik7
 BIyeDjrVbjZDTEH6QsbojNO4FAj9oQzoTczlqid/VMhg2f6sSwDniPF3kecHwmrrJfOT59cur
 jqpztsBq/tT+6pbUjwYjv9m/tJ46v7TNNSO2HilGr7NcBb1KhCyNK2lhlcTLiXWYO3T+72M2v
 668lkqTZc4y2NeTHA6rJhsedVOm9gVbQF3dUqkmPECrbEVvzlpI7a5QYGyyOf9LWxApgd646U
 wQb6pzH0lfjYlQzQl+Hbgi27qPkWSv58jHwEycthjiK/DJMaM5J6+8SQJ0dHgBESfOdth8z5L
 6hNWXBV5/jnIEyOa3Ob+mJtX8BxwpqO/XRY3HdunesoASR/ccblr7uyZOisoNO6uPRnEgSAYI
 sPldtj7Hc1kBQIvTAhhFWvspSTLY3bkfkEJAk+UyGTGVlmZ3pXgzWoKjr/lqCB2TykhO9iKUx
 ZsKJ1zxr5aryuQ+9pnpFC/1UYyY2OPnedHe6rcrIbEIEin25B1EXX/3QOBPomK25WlzcTcIrm
 w8O7nGq4lW+O9oQDUliyMWaHAhSIuwq+JxqLVv9swIERwHObuppT6bVMl3HC5cF2ZWEfgTQ4P
 an35sIgRuAnhhhSlDEpBwFB5qbRRM1U7zfdtXZ2tXt1/dCMu/ZGQ5SYkeDNskKIx/aqHkFln3
 74y+Cfv2Uvd2Zb45BKti4TSfYJeeT69l2EqKrIUCn/+eEslicPw1Zid3xmYw=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Coreriver is a South Korean microcontroller manufacturer: http://coreriver=
.com

Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>
=2D--
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docu=
mentation/devicetree/bindings/vendor-prefixes.yaml
index 6046f4555852..77fb3c453014 100644
=2D-- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -199,6 +199,8 @@ patternProperties:
     description: Colorful GRP, Shenzhen Xueyushi Technology Ltd.
   "^compulab,.*":
     description: CompuLab Ltd.
+  "^coreriver,.*":
+    description: CORERIVER Semiconductor Co.,Ltd.
   "^corpro,.*":
     description: Chengdu Corpro Technology Co., Ltd.
   "^cortina,.*":
=2D-
2.23.0

