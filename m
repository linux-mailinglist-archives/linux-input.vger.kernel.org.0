Return-Path: <linux-input+bounces-3554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC78BE669
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0234D1C23519
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34E016079C;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2RQZtN8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980FC15FCF9;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=jAcg27GMJ6RMBomQvAElMjoeWnCpysBxLCpdgOfrALmYp4wX8v13JOUhhA288fXfVSdzgM2WIKXGmpbTL+UgciIONSw5XzIia8+y5/k+HnHl2+GqMOqTczUKh5fCk685ggs2wwXUxUCZh8cclLFy+wAn/5fA8fd2mn2zvVeknbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=QQXWL5yR1HiJCZ+WQ5ZsByv2gulWkZie9+fjYZTlccQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlHqJ8bYftSNHT2EClGCrAAyTEGCMstfoDcu7YLjTjmaewuYDjX968ANfa9bkECeXOM6VTRUyaR9xY2CKK6yrU2N1T+kn4wbH/7BYwpi9Qg5gQZM57GhbT/TwUeB2fyuhnnmndgVPK5ocQIIB+8HrCNyEAHbUwwcryy3AHCOYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2RQZtN8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC73C4AF67;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=QQXWL5yR1HiJCZ+WQ5ZsByv2gulWkZie9+fjYZTlccQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X2RQZtN8yZACEp4+OiKlSwk+eVhqNdNjAlU+SeIL43oJzchRfChl70dJNU4Srjpn1
	 lHcJOv7oZpQdfaZERMioiHR7SP7n0Ptnl6+zoQQeBJJ3/+s1PXgll1kn50aPtOzuAt
	 whwa0fz9qLL04/pE0KLiZCa83kKWhwwBdz8BoMAM9OTh+hZXGE04aBuomgwKNmI2Qr
	 o4aLXBLYbd18K75b6F+2jQyGMtNerWvBcQFfd3WP+1PiWJIwMMvAY0BEUsiju4B0Nt
	 40lRrRMKHQIzvpIrHvzEVXjDdfu3BWNfthN+ZImdaD7flZy0ucSrLAv5AzRzaYs+O+
	 44PuGGbMu1RfA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7g-000000003Cy-34Ll;
	Tue, 07 May 2024 16:48:52 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 6/7] arm64: dts: qcom: sc8280xp-crd: use external pull up for touch reset
Date: Tue,  7 May 2024 16:48:20 +0200
Message-ID: <20240507144821.12275-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The touch controller reset line is currently not described by the
devicetree except in the pin configuration which is used to deassert
reset.

As the reset line has an external pull up to an always-on rail there is
no need to drive the pin high so just leave it configured as an input
and disable the internal pull down.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 41215567b3ae..372b35fb844f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -977,8 +977,7 @@ int-n-pins {
 		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
-			output-high;
-			drive-strength = <16>;
+			bias-disable;
 		};
 	};
 
-- 
2.43.2


