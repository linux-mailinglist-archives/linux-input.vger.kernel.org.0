Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895A53EDFDB
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 00:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234222AbhHPWU5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 18:20:57 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:54440 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbhHPWUu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 18:20:50 -0400
Date:   Mon, 16 Aug 2021 22:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1629152417;
        bh=/kJzNtX9uX5VLvPNqLVdpy1Sm9tQvwqR3FoaD4TJ8QU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ZdeEBvRais7p0tmielk5t2PZI0oQbOTQEv/8ab2nZebCxCRQ38Q+NhuGJ1T1yOad0
         +1x/yPm/o0DuFVUMOB7Lcx1EDo+3HdqCD9UtBFwGS4QC5HA1Dwbfy7ZOUbYJRccuut
         VT8fESeTBTdHDilhujYdLnym/XsWsbTgUD/1eV2k=
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
Subject: [PATCH v3 5/6] arm64: dts: qcom: sdm845-xiaomi-beryllium: add haptics
Message-ID: <20210816221931.1998187-6-caleb@connolly.tech>
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

From: Joel Selvaraj <jo@jsfamily.in>

Enable the pmi8998 SPMI haptics driver and configure the play rate for the
hardware.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/ar=
m64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index c60c8c640e17..b6ce5d0f4966 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -335,6 +335,11 @@ dai@2 {
 =09};
 };

+&pmi8998_haptics {
+=09status =3D "okay";
+=09qcom,wave-play-rate-us =3D <4878>;
+};
+
 &qupv3_id_0 {
 =09status =3D "okay";
 };
--
2.32.0


