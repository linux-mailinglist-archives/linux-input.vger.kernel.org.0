Return-Path: <linux-input+bounces-15009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A7B965A3
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 16:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1005442CDC
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD9C263F38;
	Tue, 23 Sep 2025 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HXcs6ix/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAEC25CC74
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638278; cv=none; b=mAvWdH1R8HNBHQgIkBiT7OftpsyT0cMZpP7cQKs5b8pHXV0i3xlDI+Exswlp66M+m2UnVRrkFIiJZ7k2I39UqGn5zzqaRjIVPEGBZS+0/vVspiFYcPJ3LPE266e4oiwMgAvO2MywJmLdzJtRQIo35CNwIz2Xm/wKGruw+58mp3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638278; c=relaxed/simple;
	bh=3buR37RHWH5jCD3qcphvLVRnK0S9wHhdzCbVgwoftyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qM6jexI02xpsaRXW3DBgvRRdi+32bC7aCikgMawfOgGYHjXq8k1Df4q0xQcDzqsEJucDO/qXZAjJUpfhDHcR4SUvgt9JskXhQeyog++BzW8H0ep1W50ZPHVT3FOSdgamZ+82duY4IBwLyOKAMTE8LgKMia1x+mvRQ0ai9I9fXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HXcs6ix/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b07c28f390eso1035743266b.2
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638274; x=1759243074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqtR7I2mLZ8IDYwsm1m36JqptxBkiaofBPM08P2A3KM=;
        b=HXcs6ix/9x8Ds8D/JbXCnefYVM73sP9Ixs49M55Egz2qqgzv6u8x/dsYYoOp99zX7s
         ZJHyGtGIz5JHEdzT3O/2wXv9ELsfXb7Z30L44LhPmIvIGc9Ka9s4/FSw2W/p5mj9gZHG
         IkFUI/U1y0ncXNHM53laZ8XGZuuStqZb9HJ+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638274; x=1759243074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqtR7I2mLZ8IDYwsm1m36JqptxBkiaofBPM08P2A3KM=;
        b=niGeHeyDTzVnqI5893ZZI+BNzpaanhi06BWvik4J2rpfDwH1TLD10KjJsh/TrjmtsS
         FIUQWdv9KRVZr3D5V4j47iysdOAIfnOOXHe6xkyvgQy85njuln2DJs8MEWhr5eb/Ow/7
         lgD33J9O2S4UEntpsALg9SZvPVYK/wsi15VRDfuAdFcKWnOT7zhoORTmODqrKsjoVIaF
         PoZChAfAUHxTPcY0HGl8QucVfWujog3FE/Kk3+USU7kU+88VbGfhUMbvCWdXRcBBrY9K
         3qxee+bvkivfaC6QakBVztFViS+B7L5kBmkfTzf0i3TRVSVLumWst1OzntAKLZZoija7
         ZS7w==
X-Forwarded-Encrypted: i=1; AJvYcCXk8mOrbtQ0YCf2QQ+oYkz88S3xTlTuaIwAXVl7p4APrlw7ocwdxgBjW41coya7qGx5lI2qxoO10CBg4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdLLj0o7zXVEbrYR2O34q0V4SxGjsB3Ckt4bkmRiJfIDc9OQT
	Z5tVFCDgihAiMoA8QJ8hKaO7Ed1X6kMIQGxVpFLeu3gb1atrmbMwy4gAk7YdZL7zndU=
X-Gm-Gg: ASbGnctWJ3yE4fxvIdzHc7vuEQWIqS8U7j/F33HUwR3CuKC9EXyX/C4KFkcFtNdNDSp
	pKbxlXNFKk7t4ASki/3gH7Jh9sNO0IuXO2H6+pIf6HCmxCrh4huhhltdvjLFyC8UonN8AGJ1pZh
	dTdEsCVk6na4gXg5/CenDh8CLGagnVdoozNvGYPTP0VhV/CeiaKyaKjpBf5hQCJdWlf6IMN2vtA
	VhufZ8nKtxAhSvgnq+AabmD6yT2mmEsc5oIDL8LJtVZjTlu+5U38e0QO42vAu8JPSxDq8NbFM5y
	wcap2/df95khPAK9Vma05gn8Mw/4hxtgQtwANQcNKQV9DC6Gugd4MGuvr5HQeZtaOWtBBMNM7q0
	d+fWpS5LfbpuJiHutaKY469y1co5rVdwflaK/zNP5fF+LLghDvnl8H+OPBe83sKEa9pSYMns5IL
	WO3uQlVARXg1Il763zJl8ibbPpvZN+/ujm810hg8wfpwYyGHu6XLYsKykswLg/PAgl
X-Google-Smtp-Source: AGHT+IE9RNVNWhfVu5pqINRm6zp/ZDRtUIbE5h4ZceOxySmsxSTDc7+ivdeXCI0Sc/ctW+qK1d4qXA==
X-Received: by 2002:a17:907:980c:b0:b04:760d:1162 with SMTP id a640c23a62f3a-b302ac40ba3mr251539866b.47.1758638274273;
        Tue, 23 Sep 2025 07:37:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v6 3/6] dt-bindings: touchscreen: add debounce-delay-us property
Date: Tue, 23 Sep 2025 16:37:34 +0200
Message-ID: <20250923143746.2857292-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for glitch delay configuration. A detected signal is valid
only if it remains stable longer than the configured delay; otherwise,
it is considered a glitch.

This property was introduced for the i.MX6UL touchscreen controller (TSC),
which provides a hardware deglitch filter with four thresholds depending
on the IPG clock frequency. In this use case, the IPG clock rate is 66 MHz,
resulting in thresholds of 124 µs, 62 µs, 31 µs, and 15 µs, which requires
a property with microsecond-level resolution.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v6:
- Rename touchscreen-glitch-threshold-ns to debounce-delay-us.
- Update and improve the commit message

Changes in v5:
- Add Acked-by tag of Conor Dooley

Changes in v2:
- Added in v2.

 .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 3e3572aa483a..7023e8c73a7b 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -206,6 +206,10 @@ properties:
 
         unevaluatedProperties: false
 
+  debounce-delay-us:
+    description: Minimum duration in microseconds a signal must remain stable
+      to be considered valid.
+
 dependencies:
   touchscreen-size-x: [ touchscreen-size-y ]
   touchscreen-size-y: [ touchscreen-size-x ]
-- 
2.43.0


