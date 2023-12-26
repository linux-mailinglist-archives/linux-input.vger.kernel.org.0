Return-Path: <linux-input+bounces-1012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E881E496
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 03:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D691F224CB
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 02:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A23EDB;
	Tue, 26 Dec 2023 02:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="o8Ol0Rmc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C06ED8
	for <linux-input@vger.kernel.org>; Tue, 26 Dec 2023 02:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bb53e20a43so3128567b6e.1
        for <linux-input@vger.kernel.org>; Mon, 25 Dec 2023 18:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1703558271; x=1704163071; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7688HJ/rcUi3p00pdT4WrWHdJeyn0WG00Iltm/DVmAw=;
        b=o8Ol0RmcMNsjfIySNP35q3kiYJVN3MWlnfe7Op6NCGsUqFoRMbwRPMJ6oyRRXkIpmM
         6bfiMuHFgVIUr8vfcSd/NfwXYmokflWvscbS0x8jPB7eMv/xKFe+0RcXRsaXxRTWRvcf
         tu3bPBF6+IiSWy8w0TRQAG4ir1K3+ky2quiutWyNROXh+zp1zpzI3hA57FyQpsaZ/4NO
         lj2+FTJbrTaev5OMwI8jESRhNCqaFY1QWh/2Aku46urt0RpXIcrkR13Uv/7pnCSAUjJc
         WU0yDiKzhm1PrHhW1El7VPteAMVf3iA6yEAODwr40/ad38Jfhb55e64oJkn66LKHlveX
         nLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703558271; x=1704163071;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7688HJ/rcUi3p00pdT4WrWHdJeyn0WG00Iltm/DVmAw=;
        b=lIsBt0c+IWoNuVQuI0ShvPMZu9rZb2xFXFpZ93GobI2xHRvc5FVEZ/pl/wd8eb+1Rp
         uwUM3WL/RoO9xKzM59IjYahs5iQCGWJIzbpqVAni++Y48FOg5VNTUoy3l5I9ek3MhjlH
         LYWzz3bqOlQ7TiHZnvTuc4XJa5Kn1fo6z8U976HbKYdvVVtTaj6h5VmklbViCpzLUY69
         t8VUWRfchegXYQFziQmSN491D19FtwrvCEz0nK4gB1EgOEJzgi3R1ehBqSjwTnJwn7Pe
         nfi6Erj/UBgGrzAT2ql9MBlm4NRCWP12k8ihYoomCIx66wwLcS/G15vENNBq7ERuinAv
         wMqA==
X-Gm-Message-State: AOJu0YxZa4lYWTmJU2xBcQYxnpK0tqANZhwnnO/40Yz13R8jnoKcE7uU
	gLk/VT3cX8+bARh6e2Lk3oQqo0nkHMT9SXufza5l+deUfIk=
X-Google-Smtp-Source: AGHT+IFLfchui9buIYuRgIzZ5I2RBFLDU6NLV2WfH5+BDv5h7cOk/TH7yU/SdXaP1bLR+zOV/ac//w==
X-Received: by 2002:a05:6808:1a06:b0:3b8:b063:6ba8 with SMTP id bk6-20020a0568081a0600b003b8b0636ba8mr8926977oib.87.1703558271056;
        Mon, 25 Dec 2023 18:37:51 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id b11-20020a17090a8c8b00b0028c2de909e4sm5083190pjo.50.2023.12.25.18.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 18:37:50 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	dianders@chromium.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v2 0/2] HID: i2c-hid: elan: Add ili2901 timing
Date: Tue, 26 Dec 2023 10:37:35 +0800
Message-Id: <20231226023737.25618-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

ILI2901 requires reset to pull down time greater than 10ms,
so the configuration post_power_delay_ms is 10, and the chipset
initial time is required to be greater than 100ms,
so the post_gpio_reset_on_delay_ms is set to 100.

Change in v2:
- PATCH 1/2: Modify compatible properties values
- PATCH 2/2: No change
- Link to v1: https://lore.kernel.org/all/20231225092843.5993-3-xiazhengqiao@huaqin.corp-partner.google.com/

xiazhengqiao (2):
  dt-bindings: HID: i2c-hid: elan: Introduce bindings for Ilitek ili2901
  HID: i2c-hid: elan: Add ili2901 timing

 .../devicetree/bindings/input/elan,ekth6915.yaml          | 5 +++--
 drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.17.1


