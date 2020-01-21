Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA13F143F45
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 15:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgAUOTG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 09:19:06 -0500
Received: from mout.web.de ([217.72.192.78]:39039 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728186AbgAUOTG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 09:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1579616342;
        bh=MdUkYMZtyFfdIN9M9eXhJ33ZqLBdXaWNs9AvLX4Dzw8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Iy6Pi+wIzJXEdQbxn2Bn5Dethd/JP0VUnlKjOZ8v8KTHYtRQXA2kRDAKmDHASfPD6
         8SdegMAq9pRByTws7M++AzDWq0vC1OuWNtACOZBrRjFezv/mT5HdN+hXYSacPxkRuJ
         pfpfkylveh3Go8aM03Rg9YO2lqD0oQPwCkq+jAkA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from LaptopNick.fritz.box ([79.227.106.217]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0M2uj4-1jjGfT3Vgs-00si7a; Tue, 21 Jan 2020 15:19:01 +0100
From:   Nick Reitemeyer <nick.reitemeyer@web.de>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     stephan@gerhold.net, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nick Reitemeyer <nick.reitemeyer@web.de>
Subject: [PATCH 2/3] dt-bindings: input: add Coreriver TC360 binding
Date:   Tue, 21 Jan 2020 15:15:25 +0100
Message-Id: <20200121141525.3404-2-nick.reitemeyer@web.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200121141525.3404-1-nick.reitemeyer@web.de>
References: <20200121141525.3404-1-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6sX1kR2dv4gmfrQvCBnMZCU5faUd40Pfw/cNMHOBXaAYvw4wTig
 jgav/qxXLrT1K5Q2qKS4Y02NGXfZOH1NUIdJkhq55IMNNVyqGgz0+0uJ8N8d/vgl583mF9R
 57L9Hdnw5fqh3CfkZvV3eJouOLJyWVe0Ekl6Fep0om4pfEEUC4hgq+DuNzRCSb1ku0S8wmO
 fyVvTZgSzcbCidYuE9dUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MptSEcWn4Nw=:3hjcNa1SfGd4pYCGaov5n7
 xeaOqtBXdB4WQP/qWKeYTAM60v3jOhZpyF0ONp0EGLbPoDtLiau0BO6hax2CJo3JwTz4HWmTy
 ESRJqZSeKpZ+AgkiFWKeGsER3oHH2kIIG1hso842s6J2jcKnsndbnqe37H4/mb6s9v5veWxxY
 31X/YIoKiMTFa728HTQ6XV7DMhWr/jahwRtenE3zz+Wm9DYiTU2cBz/VJhYbO5255Ux3drk7O
 0PASmPzIqrN+c5SMVv+HZ6kkHBN3kzcXK4wLL2kwJt0u2ikEk9TQCYB0s+v4Np28REgsGwYif
 IeuUMEr+M+EBBdC8SqG2BDEc+nAFfw7G5P01uqEunjclePw/5TlIIMdq0pFtgJvRPhLlkhyEx
 q+EvZ76f1hPRSKoV5az365A936rR4a/YZ091jxnCInPWfTLczv4PtQ+adr5pXZ68GH1jmlPq2
 DY73MHhSRAtdyC6VjnHFxOLVUXGePSoesxWcz9E/92IC8VqQI4oIDi5ht8yqhwNt7QbqvYUwD
 iEGz88Ao9X+VvJbXiKk1HTxZ5h/OV8NgPHrIYwPnDr0LmfWaACnf67hPoJ4OqX5ejYFdrtNL4
 55/9ofklsgNKC2Jj5cYVPYadlBUvWDpIPGmhYv3afm2PcOSVdQqyu3KH3JwRYMWebZwpekXEZ
 vJYa0MPg8dutGB+5s8B0iEJv0syP8LWg5bUxPCU1C4GTyvco15WUzQSqnqBWQa2LZENSzur45
 loyxNUUq3KdotIOyF29FXqcSVagwlc1Z6gSvjWJxaHRSLmcK3fc47VMnd7o9TsC4QXTBIyVsb
 R6Jbb9g3RWzFND9ufSa3ZuRsVKHm+HdyWo9pZ4MohN90JDQ4AgsjrGMsA4Ysfp0QVC6rKU/ae
 OjK8OhpWnOk1a9G6zGZl27S4plJEgUB5hdn3/MH2BpVT3grYt3On6NGJKnfLEq3tsGdufD4Xa
 6g9oI19AWFlLPJPenr3Bs/n6l/1rBzo7iRQTeqvtGcJVqSkby02sum95ZYCv5yXg8VIAnofuC
 cYvrQygEceR1tiqvTNIOvBs5m8P1OGBtdBFebr5Pfl3K3kKTLxVx3z3Fu1NLc/XDHJzisZqCn
 +0Zo6KtvhcE+erndzKGlUHx8LxGBggLVqzw1ej4fCmoQ4njxVEMetILk3s8+xZTiABpaVXaxd
 HSgEUIIGN8Rll3gCrIPcOPgnpKKvcMEGa1tgLnw6dyav3OIlvlchvW6MyIgQrmenhquQL5Vec
 /ZnTL3hS2ollhIboFRN/+fMNrnQxyQW3Gtac77JQFxqNX2lE7UQLz5qQ87rg=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>
=2D--
 Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.=
txt b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
index ef2ae729718f..921172f689b8 100644
=2D-- a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
+++ b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt
@@ -5,6 +5,7 @@ Required properties:
     * "cypress,tm2-touchkey" - for the touchkey found on the tm2 board
     * "cypress,midas-touchkey" - for the touchkey found on midas boards
     * "cypress,aries-touchkey" - for the touchkey found on aries boards
+    * "coreriver,tc360-touchkey" - for the Coreriver TouchCore 360 touchk=
ey
 - reg: I2C address of the chip.
 - interrupts: interrupt to which the chip is connected (see interrupt
 	binding[0]).
=2D-
2.23.0

