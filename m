Return-Path: <linux-input+bounces-3561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF098BE67C
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51EF01F2564E
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B3F168AF1;
	Tue,  7 May 2024 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcvRtjQi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA5161915;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=uOJ6whi7n87NAkvbIkp9ZmatZIV6lN/H7uwJgQPV92LFI0TXEZ/CWOCIkznNf1zSVrbFUZTzDXq248pJnVTOpX56fiMXSf3lxqQu0CX4lUUNxyJ1OexDPnrlG0C/uuFSp0jcSZGPu+mpdvxHq0h9nEkEg4O5bJPUt3hEK+JB/NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=Him/mGIj3I301yB+D6WucDHFkIiyFtUIv20skypew9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1+7UqJH9O9+gc0fkA4ZJmihFDuWNCMdnVyuVEDgWFArK0XlWddL5uHqZTJ+xo5cQnR1AvJXrL69jFoaWqh57KoqTvX0hHixaZemYL7pR2huhi7B+g+OVGeBvEhXn3uw9rTyj4+s6+8GIkqCsOOj+oyes64YPctyxjMXTv5lf/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcvRtjQi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E36C4DDFA;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=Him/mGIj3I301yB+D6WucDHFkIiyFtUIv20skypew9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hcvRtjQifaNSUhMmdYSt45yob5sV2a/OgqGwU1EgQsClbBbqU8tyqNBOLWfHLvTk6
	 6Rlc7J2H/mUOLZv8anlI/tFv6CHKcL6Bk8gaCpNNRG/VynA+o2R9CVB29udJbhugMr
	 pJ2/06axKVn+qP2MfM9QSCVMfYSKABjGqNNrl145WrDwPSD3NuM+Cti96ROj5Iqvot
	 QZ2G0hjY11AqHRbkFm4nyuWQipXXTjoCkc9Ku0flWNS+oZSenB40mX7f08WS286LAj
	 cTVVhoGB9pseFko2pY695Uyn6oLbjGL5eTpCGusYxaTHTeMC7gYuKeAxEi2jO2OjWL
	 Wk5AYz8lcI5Ng==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7g-000000003D0-3Ozv;
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
Subject: [PATCH v2 7/7] arm64: defconfig: enable Elan i2c-hid driver
Date: Tue,  7 May 2024 16:48:21 +0200
Message-ID: <20240507144821.12275-8-johan+linaro@kernel.org>
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

Enable the Elan i2c-hid driver which is needed for the touchscreen on
machines like the Lenovo ThinkPad X13s.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ac6fb3de1e3a..56fb9725d7c0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD2=m
 CONFIG_HID_MULTITOUCH=m
 CONFIG_I2C_HID_ACPI=m
 CONFIG_I2C_HID_OF=m
+CONFIG_I2C_HID_OF_ELAN=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.43.2


