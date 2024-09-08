Return-Path: <linux-input+bounces-6301-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA1A9709AF
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 22:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524B11C20B7C
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 20:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D1117839E;
	Sun,  8 Sep 2024 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtWCMkS1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AA4085D;
	Sun,  8 Sep 2024 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827122; cv=none; b=A8Vgb0PLECN1Kny/z+eiEOhwH83ZfUCQZtwWr9Ess3hFj+iSgB8HqO5LPrBf+XdVy/lIcz2VwZkVn8mmXTyUmk1sVmO5R42VXhfjp0idsxXjPEqlcR8Wg32x6VSm0iBV6JmQidAwhDF88PlHSHOV1K8I2l7SS1mL0FJBbQmCvs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827122; c=relaxed/simple;
	bh=0VRhpP5xdkxgmvVcGZ2MfZKlfoCzgv0FqivnGSj9w0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hwtBag968Td+vyltFZEU9DA4n9vn3d2XPtdTvwwbZZD7Kmxo5JRVMbltJKIBYCsmkCDgSwu/inZNxhLUpN7xgMyOb/gMTBjtbmv5pK2a8WxWm/z9lqb5vbGk/kBxOHvfgdXn09kDjUWkbiEiOIFTJyLFo0xDYKkPNUQkGU0cfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtWCMkS1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C86C4CEC3;
	Sun,  8 Sep 2024 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725827122;
	bh=0VRhpP5xdkxgmvVcGZ2MfZKlfoCzgv0FqivnGSj9w0k=;
	h=From:Date:Subject:To:Cc:From;
	b=PtWCMkS1uSVfB7yhehAn9xtCo9+2VTbRkYvVLL7i7bhF+glgLJNwgAQyl/HdoAiNU
	 CScWu9iiHV+WZrxOT6hj4XdkF/LbLz/b67TkL5eQ2coDO1Hn4xzmdTiAgk2O4dxsbg
	 tMUNySXfaBbtHN9wE4P8ibHvRgN1Qdn25woMeolWiEj4XCT9HdFc9BHqPDujNYeJsk
	 9N0C8+RSJWqn1jOni7smEDl4IqHXmiVfwOfs72AqDGZ5vlmglFG7GMOjTXKMLuCS7C
	 m6j9nbsK6D4GL2aaLR0ZSu/KbMh1rGeQNVHa6aSkDM2ScgCIitQEvHucO+n0/F4MhL
	 VukTGIGfdw5bg==
From: Simon Horman <horms@kernel.org>
Date: Sun, 08 Sep 2024 21:25:16 +0100
Subject: [PATCH] dt-bindings: input: update reference to m8921-keypad.yaml
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-keypad-wakeup-ref-v1-1-762e4641468a@kernel.org>
X-B4-Tracking: v=1; b=H4sIACsI3mYC/x2MSQqAMAwAvyI5G6hVcPmKeIg11SBoaXGj+HeLx
 xmYiRDYCwfosgieTwmybwmKPAOz0DYzypQYtNKValWDKz+OJrxo5cOhZ4vKaDvWZUvEBlLnkpT
 7f/bD+34Hz4BmYwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.14.0

commit 53ed3233e6b5 ("dt-bindings: input: qcom,pm8921-keypad: convert to
YAML format") resulted in a renaming of the output .txt file from
qcom,pm8xxx-keypad.txt to qcom,pm8921-keypad.yaml.

This patch makes a corresponding update to the link to that .txt file
in wakeup-source.txt.

Flagged by make htmldocs:
Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

Signed-off-by: Simon Horman <horms@kernel.org>
---
 Documentation/devicetree/bindings/power/wakeup-source.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
index a6c8978964aa..128b55be67b7 100644
--- a/Documentation/devicetree/bindings/power/wakeup-source.txt
+++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
@@ -26,7 +26,7 @@ List of legacy properties and respective binding document
 3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 				Documentation/devicetree/bindings/mfd/tc3589x.txt
 				Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
-4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
+4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
 5. "linux,input-wakeup"		Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
 6. "nvidia,wakeup-source"	Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
 


