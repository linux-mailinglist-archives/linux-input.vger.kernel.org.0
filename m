Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7D83EDFDE
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 00:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhHPWVB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 18:21:01 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:45043 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhHPWVA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 18:21:00 -0400
Date:   Mon, 16 Aug 2021 22:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1629152426;
        bh=ovVx5DvDjRArYtTNni2Z0A1mBcd+hxW0bRSODlpBDAo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=R5TPrcnUBuNzo2VYwOXXtsp7U8Uccj83vVGOkPBIYM8isbD6bXQgparLhuuRncs8D
         2QUj26R/nJJvVwdLuBLFFdV9cTDbuhTLag7RobcxlKEGFxcreVhPB4UhaEuL88XuFD
         MWRJcvuy1ARIUe11Cidi+eZ5MzeSp/rtFBOjgrXU=
To:     Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Joel Selvaraj <jo@jsfamily.in>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v3 6/6] arm64: dts: qcom: msm8998-oneplus-common: Enable PMI8998 haptics
Message-ID: <20210816221931.1998187-7-caleb@connolly.tech>
In-Reply-To: <20210816221931.1998187-1-caleb@connolly.tech>
References: <20210816221931.1998187-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jami Kettunen <jami.kettunen@somainline.org>

The OnePlus 5 and 5T both have a haptics engine connected to PMI8998.

Signed-off-by: Jami Kettunen <jami.kettunen@somainline.org>
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/ar=
m64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 0f5c7828a901..4494eb6794b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -257,6 +257,12 @@ pinconf {
 =09};
 };

+&pmi8998_haptics {
+=09status =3D "okay";
+
+=09qcom,wave-play-rate-us =3D <4255>;
+};
+
 &qusb2phy {
 =09status =3D "okay";

--
2.32.0


