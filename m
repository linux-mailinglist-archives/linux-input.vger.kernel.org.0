Return-Path: <linux-input+bounces-14935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F599B8BCCD
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 03:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C38A1BC71EC
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 01:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3161D7E5C;
	Sat, 20 Sep 2025 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaSofThA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0892AE99
	for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 01:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332722; cv=none; b=nLd3msZQ8oTpGyfShoTnFeaOKD+wJzllilAadD+GmfW1HKEm+fk8LsubhhvglnhxONW4e+YBHdm3+5q5CxbNDih+neH8OP/KL6kb2Sc7+4oL3j+kbFyrIBSC6NfLBTwYq9iC13SwW5t7AyzSXQdKP2GY1nL5xPVbR849wVfFTwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332722; c=relaxed/simple;
	bh=n+pJatxQUxiLkmZBL2NjODakscY9/Sz9q1h/+tJ3Wq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rCCWJcf9/KQDt1DJTaYetviAwRN1MfAMFBzki5ESR2RjE304eAn+UTdvwk0IAo7D/KNhLrkRxIPnMJDFRyHz2Z19k3AaWrMjHbMWAbNnp1lD6siBTKsYQ+QlGQGeERfKhZd4kKhVZB9+A7tG84if/fhbFFONzzM5fUPViRn/8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaSofThA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77b0a93e067so2384315b3a.2
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 18:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332720; x=1758937520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaDslKzWOATYzqYJokHZic8iJI/8ZjqbD74gr3V2Ay8=;
        b=DaSofThABZx1DnmKMd2GiFYQqiUoz98TzmKSnYvRsfjcGHHeANASV7h+Y4Q6ipec+A
         AWnFsJudlXVvDyWSAOtGgETOpFUNBDUYZU+CX8cf3H2sv0S9bTXF0HmN05u6z94EOtcW
         Qt2zIVC3wRqcU0CoA4JwuxjC0Ub7L/2KYNUnr5SG4kvK2gu1AdrRnIqWhIsuhwIL0OsH
         r/UDvMTOMMeTyYBB3qWI24cGpLLKpAWR+xLoCiu58KbUoMiT7qsViJPQy6UIeX5bu94H
         SLlph1WIKG4ZirgbrO3lww/sXaVwpF9LvCzp/Zs9+oe1KeEDTBx6NiQSRc3sxFANeVEB
         CEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332720; x=1758937520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaDslKzWOATYzqYJokHZic8iJI/8ZjqbD74gr3V2Ay8=;
        b=m85G9DqqK4wEWsHbNoSDnMMByyN8jbnyvWac7iVzrn5duufHFm8hZ4kWyw8GPNf954
         g37ga8vvZyZiPWZyo+gd0cfXTyENfJT4I1WUSvPotQxZOSbRo+u0BNc8QakEbKy7sRAU
         rrXwh51toNpkwBZl0UHRid+SzoI4ZIUK/Lyy/jQd2f9Xfet42U2rgScbubxDSFs47lRl
         xUrw9q5C3LuOAhJ/PQKzAymbmLnmerp5J8zsFLYIE0fKxWR/yZx8H2izt94c7PpsF5q8
         /DrcaFkR+4VxHb9e315RW5ZQJtcpb/JQ5t7aIHeG/RM1o6wgtknkicWabMixHse1Ous8
         Y1jA==
X-Forwarded-Encrypted: i=1; AJvYcCXoJPUr6bY85tYEJjqcmbazq2QY7ZaGlxlIW1kGItxWoZvY2REHU33K1NrCBFrfliWhJxV7WX8TsPgrvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ApMtU0xkjkLArUON8KQ2USqMUHAk16of8D/eUBMFZWjAJONr
	ZufAQtfufK7OBxtTISxl2eokVfmgdiQVnLHdKdwzNvN6Vonj0wObSMtO
X-Gm-Gg: ASbGnctU6O4zm5ZdweUXI8RUobvlkTnpqvCIfQ9tSbzWAmdrMyu0s/ypdt/+oXZfmW3
	IZQbMTpxYCeSgFO6MM8znBW+WcsipMXw27vXNM1yvcPmLWg26fxJL6giqnz0CF92Ow6tAARrl+A
	CcRTgR8rbSYteWWYH5ZKntF9uY/u5HSgbDkX114eT4zEiVvK1ZnmE7wpuThB/6N1hDF4AoWsvyz
	CElFhgdQk6+zS1aiMr6SMc/bVVOlAxkYXWGuhhUsNGnx0zWzTr3F6HHDRUBWvRJM76MBky82dUa
	2VGkchkS8FDXE7K+OGKa1jdzjvGFOraQ8DDmHYPX6M9BgU0RaoCtr4E4wzlkS3DMSDNunlrmgNT
	BuYFflwy8MmyeuIs8HxNI
X-Google-Smtp-Source: AGHT+IHy1IWqfKaCBizs/nvSOu8RxjFT+9KB6OWZv1nW+R2uVqWiQSnwNDGFXduas9VczYkbNIveNw==
X-Received: by 2002:a05:6a00:cc7:b0:776:1804:6fe with SMTP id d2e1a72fcca58-77e4cc3c5e1mr5540071b3a.7.1758332720446;
        Fri, 19 Sep 2025 18:45:20 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f1a72e7afsm529395b3a.92.2025.09.19.18.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:45:19 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Input: add fts2ba61y touchscreen driver
Date: Sat, 20 Sep 2025 01:44:48 +0000
Message-ID: <20250920014450.37787-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset adds support for the ST-Microelectronics FTS2BA61Y,
a capacitive multi-touch touchscreen controller. this touchscreen
is used in many mobile devices, like ones from the Galaxy S22 series
and the Z Fold 5. Ivaylo Ivanov wrote the driver originally,
and I'm upstreaming it on his behalf.

Shortly after this patchset, I'll be sending another one that
enables touchscreen on the Galaxy S22 (r0q) board.

Thanks!

Changes from RFC->v1:
- move unevaluatedProperties to after the required: field
- set Ivaylo as the author of driver commit

Eric Gonçalves (1):
  dt-bindings: input: Add ST-Microelectronics FTS2BA61Y touchscreen

Ivaylo Ivanov (1):
  Input: add support for the STM FTS2BA61Y touchscreen

 .../input/touchscreen/st,fts2ba61y.yaml       |  52 ++
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/fts2ba61y.c         | 588 ++++++++++++++++++
 4 files changed, 652 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/input/touchscreen/st,fts2ba61y.yaml
 create mode 100644 drivers/input/touchscreen/fts2ba61y.c

-- 
2.51.0


