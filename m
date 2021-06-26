Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A3E3B4D40
	for <lists+linux-input@lfdr.de>; Sat, 26 Jun 2021 08:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhFZG4y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Jun 2021 02:56:54 -0400
Received: from mout.gmx.net ([212.227.15.15]:41927 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229518AbhFZG4x (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Jun 2021 02:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1624690469;
        bh=kFRlnSJzJgyhHhg4Rh+NKUGJzI3tZPEzSxXMORNGKAI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=gw+xeMkL7ByA81cMQ8atBe9aIElg+n8ztBhgkpYzTfAOWlQmwL02asgemU4Cks+qI
         KvnH7fxx5Xh5FU28eBPr5z92o597U0MB5d6ft262MDohRZeR+EQ/jjQfzjTV/Ra1Ns
         rJNFPYBzg2j1Gxj3F5Tt3mdFkPv/hy3O+laiQRQ8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from surftab ([77.20.254.179]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1lX4JP2RUE-00m7IU; Sat, 26
 Jun 2021 08:54:29 +0200
From:   Julian Schulte <schu.ju@gmx.net>
To:     hadess@hadess.net, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Julian Schulte <schu.ju@gmx.net>
Subject: [PATCH] fix Touchscreen X Axis inversion on Trekstor Surftab W1
Date:   Sat, 26 Jun 2021 08:54:17 +0200
Message-Id: <20210626065417.8818-1-schu.ju@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KqVF4NJWDk8WXtlIu49CD/DAkXvqF85E720jguRJxxomufRNTFz
 O2MqC43/MkGvPDw6YhEricxYabzKF9Fo7kJBT600cbGwN8ubWsT1D2AYVirn0Ht8YBp0nWl
 v3MglQAT9Nf1sTtr8qWL0mcob848I5I3RCIHH/brY/WqfknnpHWlURSujDS+kbF3MxtTNp1
 mebizRxoo0rqmQfrgMmtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3+pNHCt4Py0=:f5vK/oADrqumpX4ktCEm72
 +6sfKlar6oXkuR7kCXJOwjFAYEbr4O9NUzugMgIZHQ6MKI8Au3KNB15M/z/AIEV5DvDHYoRWC
 KX99G2+LBBxRfyn04a0/QArBGWQxbrhV6Svm00W02ZyIGx6OfC9di1cg84t55fOIVYqN1VNrN
 Q7jhJf1x5GlckpgtWc5k+nME+fqZTyANOJVXDmuwhP3bl9qZPYxk30kjfLFE9yr1aRu8Q8ts6
 Q/5Q7pOCDoU6+QVSg8ebFTlfik+le4Iy3aQO75NFpvPAXN14yF3RRN6z6eMSogNsu3QIoTqCi
 4/CkVHWk2EYrEP53Gk15NJUj7JX+OBJKijtEmZNOMLwCYSyavmnyb5vP5Xb+aWcbQzM4uLmuY
 SKxKHUE42VRkzvwBZni5L7YKGcaLcMXPj+KpjcGFfEoZx7Kv/LnhfdPDjch83MIX1+nmmUt4P
 3cxz7ismJfng1yACl8d7FOP9++HasauNvWMpeCJcLd77uQdxnNupWC2hItV3eEzQtWF5R60fB
 DLKAtWB9mdSRju+gNJSSg6eC5lHUu2BrEtGb2QH9E1sZOk2hDTi/hr95BbXn+VjioMWMFbtdA
 w1n7uuSmeH1lDNj/OnEk7MRroSF1XwZDxGSYsGOXot8F2GDMLBXlfVLRmZNpLXBqR5Td0lZFd
 xBa2wvcf94XU5sWDWkUsEoEGlAKDzw5XPgHi+EAZyda4wB6fVB4tC8u0XbkBq4VMKXrTheFSx
 eOEbEW6Cs+hOJO/MpiaILgWxX95R0EPdalClzCjDTiMmYfSxx2mkUQSFiMVa/haN1lQhKTsFW
 ZX5kyefVi9462Gcea+2RF2JCqLy9tGm77IJYH/Uomr2zFbxRk9F5uoUEPprp0u03OjdQyCqkd
 vaJpLKFoyQSY3RDe9uTEfyUhny1wHPqnda9PFJSKtWLvSNsFvJiSkOEHo5Vy7vT3OWUjXZvW0
 pNeJJ1YNfrTnwSkB7A/qFLYabut2XwaSeyLn1nXDD7psP4km2DQGNnYesDtVSt9ykHTejjLgU
 lQ7Ic+GY2jHIWz21qsl234wGbx0oPcaj3QHWgj0ygfTxOuCtwGUEUvV630DY5vtETJwpEz8dv
 8BLwWrdwmNsxzV4Qb1CgXaqR+xnrr1RqC5m
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Julian Schulte <schu.ju@gmx.net>
=2D--
 drivers/input/touchscreen/goodix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscree=
n/goodix.c
index c682b028f..cec5f7bdc 100644
=2D-- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -248,6 +248,13 @@ static const struct dmi_system_id inverted_x_screen[]=
 =3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "I15-TC")
 		},
 	},
+	{
+		.ident =3D "TrekStor SurfTab duo W1 10.1 (VT4)",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab duo W1 10.1 (VT4)")
+		},
+	},
 #endif
 	{}
 };
=2D-
2.30.2

