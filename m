Return-Path: <linux-input+bounces-8433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ACB9E85D1
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 16:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029C3164DD4
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 15:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3897E14F9F8;
	Sun,  8 Dec 2024 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPunAfzV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8083F17BA5;
	Sun,  8 Dec 2024 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733671424; cv=none; b=Z+QSQjyptIQRy5BCic1vWS9ekz3CXkSV5Pxn1pa2RahyLiY7BOs+31HU088BipvtzQl20NTQzRFcJqf2VSGkTwkR02TZPOCrInVwa1sZZTV3p1UklT4Bg7IlAidHKrdUiNzYDpoJnv4lOFp+tDNI8JjufnYwSiQMHl/ZqncJHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733671424; c=relaxed/simple;
	bh=ATxMHiAAigkqnW9ELJJ98ffzaepWpnW7NoaIpnsIOps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W79PTzktp+IcKhswHkSUGkNUoRDhnfW2YUpgkIwCmXhCDCzcp4mvzo+tU3TQd+hKtAzZtPwCwA+tXzhdzFFAGtMZ82rmq4NSButWjJmW1oENVTI4hmcncl8WEbLvZQlj1mc8BPpNiACfIGeBxS8jXIm8Z+Mlmg6zjwFlLcSxoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPunAfzV; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8419d05aa66so252259539f.0;
        Sun, 08 Dec 2024 07:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733671421; x=1734276221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoK1VarcjX6N4sOA/y2XuyRKOGAm8RijqbZp/9raoaM=;
        b=TPunAfzV+LJsFg0oj1K6qaP7n+hvI8PAA3BXE0kwB/hH66PrKZ7WRjITEao8Ea1iaD
         CkGOvCtnazRA0a/Ndo14Nx3abZcZyrt7vqm+9BxJePXLOsnhhwI5YBLnqm7qHGJIWs6c
         nBD2XkqZscOe5+gqNKcrIK6+7pnOdAwr0UMOddIYWyuCEgUmR5ytXj9p8Vy0x1szpSQV
         yQIwwFKv1eTtKdQPI5EFkhye9Qs02QPPlwmHAXARpJqV5a2NkuzrlTIWWKfY7VB2FAPb
         iW1B6xX+fVB0KZU52eQOn9VvERgDsJ5wUyBAVQ7Bg2PwAJ92cv4ocEGapxIgZyQUnlSC
         fQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733671421; x=1734276221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoK1VarcjX6N4sOA/y2XuyRKOGAm8RijqbZp/9raoaM=;
        b=aCEmPlYzPh9HHUG9yIxXnLP3RqmuX79gd659UNDlhAfGSxT+iIN0PO+DteCC891r/t
         v3ycvcPkpBwDarx+dYI+Zk1i7rTnJmusKkw7gQRV2TccxzqtrQgVVfdksS0wKqmnUi4Z
         cQwSNtmBPQfaVmddS8h218ImJ6WUTHHpb2RhK6X6m2NvUTON6FuTqA7MFAyxLFFI6QMX
         iawpgJen4rsKE+xtM4LR8MxJ8t28+e3Gr6TTsiqcttPIRwQgs0CSiiFxTZYI+lF2mIRm
         dRd+h/IhKML3rzZIzvw0z5nhe3gEfeAe1H9vqtxPmhSvOKCzR7mzIXOrwye46Xo11oGe
         Gguw==
X-Forwarded-Encrypted: i=1; AJvYcCUnBL7Qnr8DEwqnt55vvZj0pY6PYZSYlw+HY6/b9DI6AOQQG2bwNQMKnqt6N92onPnnZFEs4r1FC3Okz34B@vger.kernel.org, AJvYcCWmJqJc/lnHbshZlO6Bf/GnbHBzEOOs8itZpUidcA9GtvcBBvyJrJYLW2a57XuaKBjHtmv5C91UNRT6GtY=@vger.kernel.org, AJvYcCXmO8FlcbD0XllwI6GqsnArtMsEOo40o3x5KFXYgWDUzvRwGoUrMUX5KM7szgugeFRzvhIE0YA1kyCV@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWnReZRQmb6QRWOc28La38US1rUnckDFbQe9Js6K0olU0fEtU
	mJGls+IwdZZ/54CXu4E2NOtRj0OMkT1qIDEHs6b+iSVCVeCJSgW0
X-Gm-Gg: ASbGnctQ+FAHdjaMM4Y0yMpKQAi6mnM2pekhKE9RnBpKZclcR8TrfLMc7KpgGdtKSgA
	mkrmy+2ou8PFwJJ2qGw1q3OFpj/PAYy8PMqz6OFnLcBcakCbaMTSx1cEyAwRJj2m6+G0wHanEVx
	MPY7SsY3UDHaGjOJQmY/9xFt0+mg33t3MSji5ggLTl98Iw7dJPeKO1fnPoSAZg5ZjIP8ve2OuD6
	cTX2gc5GWtzSqV3qPdx5+YGrZECbwIYLEB1blf5
X-Google-Smtp-Source: AGHT+IHCtVgsyZKNyYGaz9eJkSEHH/Ewc7d7rJ+SPJKR1buiJNuTlkPLu8xh4X5MENIDiAV0erJL7g==
X-Received: by 2002:a92:c24b:0:b0:3a7:88f2:cfa9 with SMTP id e9e14a558f8ab-3a811db7a78mr85637355ab.11.1733671421611;
        Sun, 08 Dec 2024 07:23:41 -0800 (PST)
Received: from [192.168.1.109] ([2a02:6ea0:c603:3558::35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a814fa40d6sm16846805ab.57.2024.12.08.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:23:41 -0800 (PST)
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Google-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Date: Sun, 08 Dec 2024 09:23:27 -0600
Subject: [PATCH v2 1/4] dt-bindings: input: touchscreen: edt-ft5x06: add
 panel property
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241208-pocof1-touchscreen-support-v2-1-5a6e7739ef45@joelselvaraj.com>
References: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
In-Reply-To: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733671419; l=1031;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=ATxMHiAAigkqnW9ELJJ98ffzaepWpnW7NoaIpnsIOps=;
 b=RBjO4XFZHjoa8OYSPlUdi/END++G/Hlfs+/r7+S5SXZL8OIZ9ZULoW9KgdyAxpxKT38CMv5gA
 3tErvQMyL06A1rP9EXXzRvZDtGT4GC7gyDHqr+0GKmUEfZidyKVXkWB
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=

In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
FT8719 touchscreen is integrally connected to the display panel
(EBBG FT8719) and thus should be power sequenced together with display
panel for proper functioning. Add the panel property which optionally
allows to link panel to the touchscreen.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 70a922e213f2a..35a6ac4ded7c7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -103,6 +103,7 @@ properties:
     minimum: 0
     maximum: 255
 
+  panel: true
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-fuzz-x: true

-- 
2.47.1


