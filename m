Return-Path: <linux-input+bounces-4176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C08FF45C
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 20:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1751F2551C
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 18:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE08199383;
	Thu,  6 Jun 2024 18:10:45 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from forward100c.mail.yandex.net (forward100c.mail.yandex.net [178.154.239.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DE7198E77;
	Thu,  6 Jun 2024 18:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697445; cv=none; b=sk0nk9bxxRh5axfcwSpz6dm8zMtF6xf6oYseGRsFDQnSjaDT/jfnqNiPPN9IoHbOxlX1L9FSuw31lcYcxqXggNxS89MGJWb2ZsGqD7fk4aktj0FOLHasuI02/Qi0+Kn8zrIwtteeQFyoSQRmsxjOvZeGMQluzOVs/IxmCrhDTEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697445; c=relaxed/simple;
	bh=52LjFDx2UnKsDrChCuy7Bg9nNgeFFHZSfU13BKjLK74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIdKXKFl9rQuSdDLb2GJFdsnNdJPOgGXRt/bbyRFn5mf2F1+Boi+qWsciseMJVerTadLSFbvlf4zdLSG5G7Tn4DUwtEUHCa9Qbb3gDyRpq7aHoKR5UhWZHXzSxCf0xVMchitjq2+9Vg4Qhj+V/1P7DcWeBpCcLD0v3CNfNeAT1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:5c02:0:640:1c2d:0])
	by forward100c.mail.yandex.net (Yandex) with ESMTPS id 06EA460B2B;
	Thu,  6 Jun 2024 21:10:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id SAexc4cOm4Y0-PWs1ce6a;
	Thu, 06 Jun 2024 21:10:34 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 0/2] Add vibrator support for PM6150 PMIC
Date: Thu,  6 Jun 2024 20:10:25 +0200
Message-ID: <20240606181027.98537-1-adrian@travitia.xyz>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds vibrator support for PM6150. Was tested on SM7150
(xiaomi-davinci).

To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jens Reidel <adrian@travitia.xyz>

Jens Reidel (2):
  dt-bindings: input: qcom,pm8xxx-vib: Document PM6150 compatible
  arm64: dts: qcom: pm6150: Add vibrator

 .../devicetree/bindings/input/qcom,pm8xxx-vib.yaml          | 1 +
 arch/arm64/boot/dts/qcom/pm6150.dtsi                        | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.45.1


