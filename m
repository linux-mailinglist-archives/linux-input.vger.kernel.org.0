Return-Path: <linux-input+bounces-16684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316BCDCAC0
	for <lists+linux-input@lfdr.de>; Wed, 24 Dec 2025 16:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2515130000A8
	for <lists+linux-input@lfdr.de>; Wed, 24 Dec 2025 15:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8567B335567;
	Wed, 24 Dec 2025 15:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fDin6/Aq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907833FE01
	for <linux-input@vger.kernel.org>; Wed, 24 Dec 2025 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589766; cv=none; b=b7qMerZ2lScLOVk3q6P130p+EH9ZItjQYajwwkvZYzCA6/fLWBAhHAIZbxFq+8BzSB0WWpUk7dwG0p4T5eI77JtLSRNYjCDQ4FRfI8qMMfNFHauwhZGDzuxG7Oou4lg35GzT8R4uNTpzpUS3RrRXKo66hgT+1paZzBXsWrvh9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589766; c=relaxed/simple;
	bh=zALY9dlsMwzl/dAwtyaG4mXGxZf+fv84QQNolu1ZQYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sxO/laqZLmSAkJN5y3t+Q/IZaY92Ob30+oWTvj1p5TCpd6ROeSjQmVr22xTRzM0Y4xlJQ/4coy4dEfGCpgoo0QHQTZBjZft9V6TglIpAaloS1fDbifqTApYyP9Kt+yB+wNWek/QAfZLzodH8ZAswCCpWPQWw83oOX14vwiKfiNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fDin6/Aq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327778df7fso119054f8f.3
        for <linux-input@vger.kernel.org>; Wed, 24 Dec 2025 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766589761; x=1767194561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PADMdGxAb/N51/r8LkdN24AdvAbRzLZVqXNmvAQV5oU=;
        b=fDin6/Aql/LKoPKw3qbSEoYNq+sEn+df6TydOvyaKbf5PeO3NPJt12ZkDZa6y6Y1BX
         eIhI5HjObJD46bYrao5B2UUhBXvZA70ni2xAQypjLoLhISQZ4ZUESDLlu06VtV8O1AcR
         x/pik9HNDMe6fNOF/PAtQfdM+fK63BeJoixhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589761; x=1767194561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PADMdGxAb/N51/r8LkdN24AdvAbRzLZVqXNmvAQV5oU=;
        b=CxCXmWrXmiLGr6v9raEl1f7EbI5RIfucILWdlKmcKw6p6qaHKbF7PQDjRRngjmc4lL
         3rsM0E/PJH3sREiOPBIPVSTUP0xbrueQmw6azMqJHHYUWkyLT57S4qMo+Opaj/tUvvgA
         NytiTKBY/3hVhX19tWz1zwZVLLysGioSJaiQ7oSeaUgrbae16XhTWfKqZvt9W7iwxWvh
         uu84afLo3uFOcvVJCXqWaCZmF0j3wDJaJ4jS5J4cIACatLP618LfNzR3dM6ZM+MMHOSK
         w6TanrRnpT7Hrif1mF8ZgdFp+vTSaggcwLV1mPZESGDRw7AnneRmCSis52NINgQMONDK
         RWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9cTCPoD8SJ/g7/qwGlAFM70/7cUTDrsXcT9gLVR0KZ9S5EiEP5TOy41iJaBumcOSSYUWW+lwqOWcdtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHuxfi34lsT1TeTyU+BXDAgmZIaamsb96sbJdPp8NztDsp4JyP
	Ssck4MU8//hT8/j3bd23Vb+xuGBHf9ou61708YQbqLFwUjjy9viVh2Gwff9GVny9NA==
X-Gm-Gg: AY/fxX457AX7NxLz5D4ToYO1QySrNdUAvtcMBuJZyfIpA7+OgobS8vINK9SPdvkE4yC
	8vcEZMEWmaoATm6Ot58TPUWcAGi1P2Kc2sGylJNyP8dOO9sT8xHjd9CNSzocoxx/xiOhoWo+iA9
	5u70h7Aa64ZnirbS/jp9pc57DrnsqIRYVI1WhOTXgEfpX/i6Wn/TgDCAR22L2/pZt7XpJLwHyLN
	yXpG4BCbHCXoIJ/F14u6a8tEVt0gPsewJEC9CNDpANRTLHdnbfYl95sTNCkCFgnR+KBXCiVbZZ9
	GbW1kCN+zZAcz5YKByUFIcNSBe8Zkqme103yy9M3Ze0eVIVg5JjLwwCio4OHkpo8FwtyGd0p600
	OUsAomEpB9ZSGaHQ5AA5x4feKZ+La5BJQlIyfer94S7/N5hKJMf1ixPHk4tYrDX5kSfBOOrXpgA
	2ObYUoNlpSMZj5bwBGiZOSBgfMpw==
X-Google-Smtp-Source: AGHT+IFYkk1rgHyu9nVNfjejw5HKRK1BJ+Hu+T0J0cFClraYCSLWRZJM/CdbzE8a+VtE+OxWg9t4JQ==
X-Received: by 2002:a05:6000:1a89:b0:431:2ff:12ab with SMTP id ffacd0b85a97d-4324e704914mr19472833f8f.61.1766589761125;
        Wed, 24 Dec 2025 07:22:41 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm34307363f8f.0.2025.12.24.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:22:40 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Input: cros_ec_keyb: add function key support
Date: Wed, 24 Dec 2025 15:22:36 +0000
Message-ID: <20251224152238.485415-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, v2 of the cros-ec-keyb fn key support, reworked the whole
configuration to use an overlay map doubling the row key size as
suggested and handled other comments.

Changes from v1:
  - change struct to short types
  - refactored the fn key handling in its own function
  - changed props to use the google, prefix
  - reworked the properties to use an overlay map rather than a
    dedicated one

Fabio Baltieri (2):
  Input: cros_ec_keyb - add function key support
  dt-bindings: google,cros-ec-keyb: add use-fn-overlay prop

 .../bindings/input/google,cros-ec-keyb.yaml   |  25 ++++
 drivers/input/keyboard/cros_ec_keyb.c         | 120 +++++++++++++++---
 2 files changed, 129 insertions(+), 16 deletions(-)

-- 
2.52.0.351.gbe84eed79e-goog


