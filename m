Return-Path: <linux-input+bounces-7403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BA99EA57
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 14:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1547B28A9A4
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1D71C07D9;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5gm2GLF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5531C07C4;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996812; cv=none; b=eGXiCnIvbG5U71kPSvosSHJTaoAacCsZNspKKZrKbqsEvAvyn3eKwpd4e+qnSadLCRCKPdH12XnZ6cOaEu/zQ9CO+UdnTkaX5JQNGesXTMy9x2xu+ajHSGRPCCWu7X/5jTeJ5d5uGwi/1ZjhViwvcYmp3wnu/TkerJH2As1H7Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996812; c=relaxed/simple;
	bh=ZKf9/CxVREmj132u1cKYBcG4ddSqcH0nUrjmlXb6ajg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WYmCez6Ava7K/3P1c0g9LeXWb8qxWljxrjOQ4wipImivF0lT79UxKbeRU+pfk/v3EXzuTb8alPjB1Y8xrWp7OfgCF0AMjnx3HvJW0V74Og2OwgVP8GHTKUneHpiXLS5CrALpID04g0rau1fFHuClDXgxLIIUytXiYHQJ/QYNIOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5gm2GLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F33CEC4CEC6;
	Tue, 15 Oct 2024 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728996812;
	bh=ZKf9/CxVREmj132u1cKYBcG4ddSqcH0nUrjmlXb6ajg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=H5gm2GLFdq6bMu2FyuM8677593LfAO53e7QBMwnqvhVxNjuDtQMAg5G78UiA6DEv0
	 /4CHRvC8DqK35jsNbnP7tPGtrrAIvLqrSNaXryxqgJOSq0/dJz01pO1l3JvU+BoXqe
	 Bta7d8xzOVjKuTzzbXYbd4hyTT2RBeSXRXqoqiIyjcO8IwCBG+DKTEa6qTgKUVbNfy
	 d8FIsEO/edvVSQS7LMMxAw1QrtCwdKRy8oaBgkFd6ItmMLyl2Q3dkKkZqsnvoRuuEH
	 u000lyJ+Ioi9dWxqGlrGMe8sZNRzaJ+nJFmhG/TlSFXyATJQq+E27/s/idyH9yoWIZ
	 YjewrCUzFy9rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB459D2169C;
	Tue, 15 Oct 2024 12:53:31 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Subject: [PATCH RFC/RFT 0/3] Add support to Novatek's touch IC nt36xxx
Date: Tue, 15 Oct 2024 20:53:28 +0800
Message-Id: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhlDmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0NT3bwSY7OKigpdA/NUE1OLpEQjC3NzJaDqgqLUtMwKsEnRsbW1AFr
 uf6xZAAAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Del Regno <kholk11@gmail.com>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728996810; l=2271;
 i=gchan9527@gmail.com; s=20241015; h=from:subject:message-id;
 bh=ZKf9/CxVREmj132u1cKYBcG4ddSqcH0nUrjmlXb6ajg=;
 b=S7DiFUAoX5Tavd4PRUkeZlzJGf/fPE5DU3MYMBVaHeQCigqYlYYD5vEs5HinxCLbv3MgupxqE
 9XZQcrs3z+tCypOMVonTRvFsy9GHySqSNuW27mOhh5rqCGptG1iH31T
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=dscYWhT+BiQOBMpPE19NFQAjBBmcpipc6zdf2MTze/U=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20241015 with
 auth_id=248
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

Initially support for nt36xxx series spi device. Below 
list all supported varients:

 - NT36675
 - NT36672A
 - NT36772(?)
 - NT36525
 - NT36676F

I had tested it with Redmi note 9 pro, aka NT36675 chip.

This series is based on my repo below:
https://github.com/99degree/linux/tree/nt36xxx

There is a boot-and-functional tree for miatoll device:
https://github.com/99degree/linux/tree/working-20241015

And the older dev history:
https://github.com/99degree/linux/tree/nt36xxx_old
https://github.com/99degree/linux/tree/working-20230528/drivers/input/touchscreen

This driver is based on 
AngeloGioacchino Del Regno for i2c based drive
https://patchwork.kernel.org/project/linux-input/cover/20201028221302.66583-1-kholk11@gmail.com/#24831734

_AND_
Neil Armstrong for the spi device codes
https://patchwork.kernel.org/project/linux-input/patch/20231213-topic-goodix-berlin-upstream-initial-v13-2-5d7a26a5eaa2@linaro.org/

Download fw function is adapted from original vendor driver
https://github.com/LineageOS/android_kernel_xiaomi_sm6250/tree/lineage-21/drivers/input/touchscreen/nt36xxx_spi/

Panel follower functionality is finally added.

Since the driver is split into core+spi so i2c function is relatively
easily to add.

Signed-off-by: George Chan <gchan9527@gmail.com>
---
George Chan (3):
      dt-bindings: touchscreen: Add binding for Novatek NT36xxx series driver
      [RFC/RFT]Input: Add Novatek NT36xxx touchscreen driver
      dts: sm7125-xiaomi-joyeuse: Sample device tree for reference

 .../bindings/input/touchscreen/nt36xxx.yaml        |   70 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm7125-xiaomi-joyeuse-touch.dts  |  183 +++
 drivers/input/touchscreen/Kconfig                  |   13 +
 drivers/input/touchscreen/Makefile                 |    2 +
 drivers/input/touchscreen/nt36xxx.h                |  142 ++
 drivers/input/touchscreen/nt36xxx_core.c           | 1422 ++++++++++++++++++++
 drivers/input/touchscreen/nt36xxx_spi.c            |  256 ++++
 8 files changed, 2089 insertions(+)
---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20241015-nt36xxx-07e458ba2877

Best regards,
-- 
George Chan <gchan9527@gmail.com>



