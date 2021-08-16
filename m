Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDFD3EDFD9
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 00:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbhHPWUz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 18:20:55 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:58840 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbhHPWUs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 18:20:48 -0400
Date:   Mon, 16 Aug 2021 22:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1629152414;
        bh=h0qgj0HbOeQZsB6OsW+kcp12M6YNiIgJG6sV7vtbGpY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=JbhU9p6aLkJaI1BDSxaECLS5gWQGelTkSm8oO3iV/W9m/np7Edf9SudPAjfSkUne4
         i53WR+qqCaLSrb0tQp4q+CP33EK3FI+oGApFC4hRNll7IWQFUclb1LRl5bEr+odFAK
         zsUNnYJJROFqBekoZi99SRRxdsLEL3v1RRqKMYHg=
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
Subject: [PATCH v3 4/6] arm64: dts: qcom: sdm845-oneplus-common: add haptics
Message-ID: <20210816221931.1998187-5-caleb@connolly.tech>
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

Enable the pmi8998 SPMI haptics driver and configure the play rate for the
hardware.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 4d052e39b348..05e1f90c4f02 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -441,6 +441,12 @@ pinconf {
 =09};
 };

+&pmi8998_haptics {
+=09status =3D "okay";
+
+=09qcom,wave-play-rate-us =3D <4255>;
+};
+
 &qupv3_id_1 {
 =09status =3D "okay";
 };
--
2.32.0


