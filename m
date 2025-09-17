Return-Path: <linux-input+bounces-14788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C1B7EB43
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBBEA1C0427B
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 08:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E02306B1E;
	Wed, 17 Sep 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RPVvRIyz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA37A305977
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096342; cv=none; b=pwSEOin/Us6QUAMDAZds8wsAUusYnK7mvIMgIFWqLo3HRCnZGz2sZY/41R/pYmNcYMr87HcJSQMnEuNHecxyAYOpFeYYsZQTmfcbPgkqM7XkUhc2fjvojoMdruX31PdWDBfUE29L/PksO/uBlwHuqSN6lgRFi+IPmI7Fc2Yevjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096342; c=relaxed/simple;
	bh=gDFOJLDzxUDcqovn2642JdV5yxcGbUHiv+uQIwqON84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QlTI8nvpBTgUnH3ehpQJEaY1SRboxgtT6Ijwd7G/yOHTh1eZT69hO5V95kt0inwk6uI06rL3SejE5nsINQDSjhy4QaH5Zn9a43TRjswQ1CapcEqfJttf99tO2qHeZzCmLdWX7OGwqWllPTByhpHeugOGDKrZDAkf//x/k8YnDSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RPVvRIyz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0418f6fc27so1083524366b.3
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096338; x=1758701138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPuegdZHn6x7l8oR57Kwdwve5Qd3dUF765nGwdELATA=;
        b=RPVvRIyz0Po+TpogKbe/ED501XtNnZxe+SMBAB8282cQcwXjdIp9JTIT4dNOFTLJDz
         YQwTXN5edzdwAli8bqm+ElRnJHbWlTRyrE3AoyfFtZuiII7wQ4n5yuTKWCatuQbKhklS
         HIQdhKk8wLJB8za2zfRY6qrGnN+GNWXQHzcnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096338; x=1758701138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPuegdZHn6x7l8oR57Kwdwve5Qd3dUF765nGwdELATA=;
        b=SnXZJeLKHpzm+6J5FEvfawhaRxBfNZ2f8QoaBmjrFCIQ1PEw8aFicFJo0aJ56y8eRz
         ttlWVOXioia/XOM5QoeaQ7mOWpiFzpgNcqBI6QXM/Z8gCRma8Uk1X7MQuXuNBXpbykJR
         AEH1FssiA3+bBOiqsv/wEdvPXKkMJanQ45qZ01YMD6ZiEdURx6XNIoh9N77qGPK7CFnZ
         lX5CXgMuUjsEvUheEAitZHhn9FvrcHUDcn9a3E+zFtMxp1JCyUSpvH7u5IuIggVcREm9
         4Eq99YnFdCP7tqIuIUlZw+pkOzmWnza+W0hnfPd9wHObSOoP8ZmjZ84pM19MUSig4ZxR
         m2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUnRDkuwUM9gPztnkHbvdbybf5DpzETw+fnAMX2MvoKn8AoNBtGktxWuTzQGAA1xPWh2+QMdaNqBWvuAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qFJYznyBKzQVQ2Fh1AQ9jGCe9iN3lQThj/qOFvUW0dncakAK
	duXDaYOTAkDevCX4Sv5YfqcnxeU0qOx1vg8sydz8HzqGKWHepYjifoF8j9rtZDVbqzI=
X-Gm-Gg: ASbGncv37/pBauSGOKQJVhnXDJbZuYm0BSivF3rhOfGkIh7HHXE3u+VQH8Xx3b7bM5Z
	teXIHLoc0w72IotaLdFmMzYxJ6m0bg5wgGIOxiSzNZhQeeD/gPGGFCvM9/hWAd8mMag8Es+p1eM
	mUrbG06b8RCLUQBVVzN6ObG26X/tDrEjspHfZjUeCmxJzHW/KPYeT2GQNVKbBPwz/DbrpdosC0f
	zOThm4Tx6piky7a1Uoj8DLaALOXGk2pcJt8oiFa+m0kWeCsB5NRVkWZAhQHRgjqz5ohAhqQtkTU
	Te+evB9wWVnXzNGer5aS/njPxoWcP0rL53ayOf7pArG/uuc9ssbaYcxhZR88nzyDBmrNT1ZKXOi
	Tp2xHvX/Pjm1PfiqTzk43FU8GrkmQEHSkDSEYxfYIhNA0jWjvDd8jXYYE69Lkg4JwFfbiBQ==
X-Google-Smtp-Source: AGHT+IHVO4VaMS/G12IQZgMNriTBY++2CzCi4uYICi3wwhLDtof1MCwW7/7vKBLZtIfrjjavAGmS1g==
X-Received: by 2002:a17:906:d54e:b0:afe:6c9b:c828 with SMTP id a640c23a62f3a-b1bbebbb0famr156412566b.61.1758096337795;
        Wed, 17 Sep 2025 01:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Wed, 17 Sep 2025 10:05:05 +0200
Message-ID: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.

Dario Binacchi (5):
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  14 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 97 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 5aca7966d2a7255ba92fd5e63268dd767b223aa5
branch: tsc_de_glitch

