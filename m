Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64BBB172489
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 18:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgB0RHj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 12:07:39 -0500
Received: from mout.gmx.net ([212.227.15.19]:50063 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729382AbgB0RHi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 12:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582823252;
        bh=Zb0cpGY5979XVir3SW4/XvgaLWpiRVc0awjhmaXpE38=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=QR4MXkAemQqcaKG57/JmvWW5uqe8rp2HgSaaPb1MpKx9CDf0IljrCRVkK0ZfA5ud2
         ocoMXyDYrHyMUw6dAP/ETnhEe3xEkTFSAfl2em05LmGceS3CAiagcqOv8+kFCxzye7
         UEuJ1Ltvgddl5QVADZG51WpdTjs6kpil6RTjr90U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.162]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Qr-1jfb3X2zAp-00aGpS; Thu, 27
 Feb 2020 18:07:32 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     devicetree@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: Fix typo in file name of twl-familly.txt
Date:   Thu, 27 Feb 2020 18:07:01 +0100
Message-Id: <20200227170702.4582-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tIcRwH00gj+4vKzcC1Ct9adpzROq1V35GkFIucElVSbqgod5Mqe
 0+1GjTfQQR8VG+YH8a79ByQEsstpHDdrkPQv++D4SqKlb8LgGyRl0gBbXuq4C0gKyzUo88C
 et/M8/5TGvgqb1W6tTCThLNRguFIJiwuQMvoj+lL9rigd6QGvklsPqk9Vbdz6MUI5bXm933
 /wVx7EwSe/8WMCho5GvbA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7i6SF/cOIBk=:yTQ2KJ8n+TE2ntZtfO97t1
 JN3eSKl8ljhj8iKnheTkUY5iMHxLl952hEQnU139MxPFMBNktOyOa5Pl/caDffmBBM4upmSWd
 waZRalC9phCIVu704YtdYuQaWlbt9/kbiTmbvp+g3tnWfeXUZMgaibZH79vhVtQDbbnrxLHDh
 thBoiWqOl2+WQeEvmFu1QcAXdo+Dw4PqDLs3CjWEtBlhed+uPb641YEZ23qY5K//6XzMdhgQR
 dbKdLfaZ7kZen0TBJwNe4tizu72wKQWkBsEkpwxU87VkKIjL49M3FMUqC+qh728QiHDM9xSD+
 F8ZCfnUY8RnWG+Se4XzalejWbacFums1OA5hMyrjyXx32HdGW+gDBwjcB982hpIkZo+7QmbVz
 EUP0cKpipaX5po7aibWhtvTKXOAJdqpinK6leO5OH/poxide73ezZOfFaQa1eTJxyMa8HBK9E
 Wnm3sNBIym9GKVdeW6DszMSnsWHUGGGJmj5F/ZTBseYORg7PvriWvr1JdymrnP120fM5dGzf5
 sDRucq6ywKWZC0gRO4q4ppP5nbwKiqrC4Ky9DRMdayLJ7k8Qu+iuizGtDTr19I5ThXg4coBFZ
 uQB5Vi50Uol5Av0wvmju7IyZVUByTRhinmkE6ZXmyRh40rIJGggsWhkB6lcTR84jqV9UPNLdQ
 fdH4+Iy9KmA+G5shyAVYV9RGIHP2iSnFhJYfbUmstd5NhbO0Z5atyHne2ga6uXtiF1nhgMWba
 DUG1Kg3OxikyZLserKaCVAz6EmDZqXgEd1ckmuy/07hxaI5xiCBkKh9lDzqlgnDUqDZFFA2HU
 Qc1kDaXuUWXtwsjpQyRc1ZTg/mm6POqyDnX7enXzVJAHrbhQ+8eMADFBKcddUmcsgpw0HWLcW
 Y6QlthymNSHgUYj/gDa50nc4dCKLbn0f66/6XAtsJMOeVsyxg+nh4ILMPjxe2zszX1iNYx2ju
 vDBY3RxCA44uGONloGdY9mAZISVn8m3HyTkkDpFoUGxI0jJ3DkKpahHyH4snW/A6DJqti4Quc
 nDdraBUzgpXFjhH9RQCv1j1jmUFIJwOYddHtm18pQZScmOoROzT496KSVgmTKZYG0+UuFTpT2
 7nGgTEoCA4TwRExZWDFPQ9f4M7HWDAvE2JdEyoYaQkwRn20MFnqZrRYzUypAXtfTaMBK+pOiq
 1gkkDeMJ9GJJrAD3aae4FlaoiVCJz4Fjhs107C1YUXypWbEZ76dZiNHcS6oYEsxvnmnqSmKHx
 8E+air0/Z/PjdfHf0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/devicetree/bindings/input/twl4030-pwrbutton.txt   | 2 +-
 .../devicetree/bindings/mfd/{twl-familly.txt =3D> twl-family.txt} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/mfd/{twl-familly.txt =3D> twl-fa=
mily.txt} (100%)

diff --git a/Documentation/devicetree/bindings/input/twl4030-pwrbutton.txt=
 b/Documentation/devicetree/bindings/input/twl4030-pwrbutton.txt
index c864a46cddcf..f5021214edec 100644
=2D-- a/Documentation/devicetree/bindings/input/twl4030-pwrbutton.txt
+++ b/Documentation/devicetree/bindings/input/twl4030-pwrbutton.txt
@@ -1,7 +1,7 @@
 Texas Instruments TWL family (twl4030) pwrbutton module

 This module is part of the TWL4030. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/twl-familly.txt.
+chip see Documentation/devicetree/bindings/mfd/twl-family.txt.

 This module provides a simple power button event via an Interrupt.

diff --git a/Documentation/devicetree/bindings/mfd/twl-familly.txt b/Docum=
entation/devicetree/bindings/mfd/twl-family.txt
similarity index 100%
rename from Documentation/devicetree/bindings/mfd/twl-familly.txt
rename to Documentation/devicetree/bindings/mfd/twl-family.txt
=2D-
2.20.1

