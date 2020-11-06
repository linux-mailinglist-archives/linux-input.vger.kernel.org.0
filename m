Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339872A9527
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 12:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgKFLYw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 06:24:52 -0500
Received: from mout.gmx.net ([212.227.15.15]:44167 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgKFLYw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Nov 2020 06:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604661873;
        bh=lhohKOIKXj6+coWa/IJX1bitwsLCvLPmJdHjI+nhsnE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=GJXP6IfKeFDNRJ+XoBldtgS/wBB50nySNORmA3RTL6nS1rVojMCgcAPVidl1rSKjJ
         NCRMidOI8CuJQVWC8m+VTVHX3chqDVaM2nivtP76qATf4Msc4nkI/cHSC7VIy5+s+1
         AnwkrzLVAz152j0OeGdv3cFjMBH+Ap5Hti3wdTQE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsIv-1kImaF3R1r-00svoh; Fri, 06
 Nov 2020 12:24:32 +0100
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
Subject: [PATCH 0/3] Support for ELAN eKTF2132 touchscreens
Date:   Fri,  6 Nov 2020 12:24:09 +0100
Message-Id: <20201106112412.390724-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OmafO1ws4UlwhI8UAMxZtjR30SIUl9Uf9v8vCFwPANj/cHkC1+b
 e5Fq2UrKNM1RLhVM2Gmc5Z3akcX6e8/r4W2A4KM7pae4R9LJ/Dnn7zO0lAtSN6eAySC3kGT
 foMuSzwUOFRij6kkGpoQZKf47B8tVRPRRqRmGjy9Z9vn0sUWrzGyc5ND+jxkbKcX39Ns91B
 +Sgzo/2b3LWvhXUx3Xd6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rcf8h5w3onQ=:b9YeVKlIPWbuKNBSGa+plZ
 Mz6yRbCRDiZx63rgKo/F7ivAgDtdEENdy4Fv3PkpHYEj330yT5NNqDBnZ0s658xumiBHuJfjS
 72SxPHBqtgWA68BCOMddndWjnBKPMI9YY6HguUh8aDP6T87jFDyJZIhLq/L29x+tb6OG/ngHF
 pbg7NLotASkA79F4iIhihMjEHW+hHRzQ/vSIp0UdQRpGViXobh4Fniq8sNsHHn5NdsFOzm+Tl
 u9GrhF5hZRWWRuebc2dcD6XUOnZp5yA4980ZKLbABejGK6Vx6A6Q5FifKJwD6FQ2q6uaQkRb6
 OSVM69z03A/NPBhjYCqLS3X7nXMsGu47Mg4WakUa7mBpv0EYLUTwoPw8UrqOR9nLDRwuZHyIo
 VEARvfeyV1/Fp1hRBQKnf7Rz/bnYJ4owINZ9JV+u/C1m1iLD1c3p58jVfwO/MLdgwaBn0oGqq
 FSCt13/tcSCEx8dUeJ6vxZ5CT8Cx+YW00yD4nc6RsodxU3ClmgI+mAonXErLeHQGAJH7pVwbA
 zG8kue48JIfO5Qt+qjRYvf01zO31cZemAq0KnN72MIPP7SWaafZf+kfOAq90QhHNKuEjt/6+D
 rec91U4AShsy32zm4qq9K5s17Tw9wwIuAaLkNa8LiLf4n8cAPSGPWVu+Am6rgga6KkWP70pkB
 kbEON/e3WHXwDnGiAKGpyDJ2O05a5tyAv3wvAYCLEvtO89hZzbMR6IwMayXDTMtjzl8jTR/QJ
 Nq3OZMz6jJnw8lLO6ZrOnhyeiJU8BvwxTemM/2A6MwcyK/XGCa8SWjzsDwPCcLlZiXGcGuVaZ
 v5syP0HHkNZJciVvRCEfFTm6t9tbZsfa13NS4wuhulSXs2EfyjKoZIbSvH98jJvUxW8Td7F98
 qbsjmKJ9cK8ICxPH6u1/p90WGwC7ZMxbhfMLHrZS4=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds support for the ELAN eKTF2132 touchscreen controller to
the existing ektf2127 driver. It is similar to the eKTF2127, but it uses
a different packet type and format to report touch events.

My understanding of the packet format is based on the Kobo Arua vendor
kernel: https://github.com/neuschaefer/linux/blob/vendor/kobo-aura/drivers=
/input/touchscreen/elan_touch_i2c.c#L237

Jonathan Neusch=C3=A4fer (3):
  dt-bindings: input: ektf2127: Add elan,ektf2132 compatible string
  Input: ektf2127 - Add support for eKTF2132 touchscreen
  ARM: dts: imx50-kobo-aura: Enable eKTF2132 touchscreen

 .../bindings/input/touchscreen/ektf2127.txt   |  2 +-
 arch/arm/boot/dts/imx50-kobo-aura.dts         | 16 +++++++++-
 drivers/input/touchscreen/ektf2127.c          | 32 ++++++++++++++++++-
 3 files changed, 47 insertions(+), 3 deletions(-)

=2D-
2.28.0

