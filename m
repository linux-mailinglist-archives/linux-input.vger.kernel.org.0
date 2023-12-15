Return-Path: <linux-input+bounces-794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830E5814025
	for <lists+linux-input@lfdr.de>; Fri, 15 Dec 2023 03:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 744961C20362
	for <lists+linux-input@lfdr.de>; Fri, 15 Dec 2023 02:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD2610A34;
	Fri, 15 Dec 2023 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grjy6gBm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FF10787;
	Fri, 15 Dec 2023 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6d9f9fbfd11so213324a34.2;
        Thu, 14 Dec 2023 18:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702608033; x=1703212833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAy9HOADki1NqzxPkJEnFDeCau+SL30IzKiPsljhsOY=;
        b=grjy6gBmEhPYpDNVbXSw1h4Q/tJ2Xobu9HtlhnF5OJfF620f4lb/ed1rCtxD1xuD6a
         ilraIbZ+7XvkY+d6u4epfVlT3rmN/tw2ibxU5ko8VqiKTxFkVs+EVIeqYb70OI4H36Vr
         H/TxKl9CQnkmmKom1RHv4TbD6A3DqrPil62EhaRiPlvUyYZMvlj5dtEFj6Y8LQ/8rv75
         oyG/b9AolXon4+s62ENLCLLK8NUdjOVd/w/2r+Um9W+uKdV5TwGGh4PYpQ2zBgAAGy1j
         dEySFIzOh3sY6RHQQHzxcAeHg/Qj0Hxjl/uTB7isN3BGa1+m1KY8OilckGLYRfBcVaan
         cIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702608033; x=1703212833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAy9HOADki1NqzxPkJEnFDeCau+SL30IzKiPsljhsOY=;
        b=nS5LB8+17+rWjvz+bG3ZmvLjc/oUhiyEFw6tfhouMfUjxLCXUj3bkehfAXODGsSc2g
         6xy5zWGZi7awN35aapwNDUfq2655nqshQvAp1ZRmdxJtMxqeV+5kQ+smQ7RJjgsRH7XW
         PhxweVhbHajnoROiM6jkjhtTHV1XuDctwL7MOIhcYvAxVozWrhQlylUkXhjQ1m8+7tdP
         4p/xEHSWN24EcTJVAP6PX+MTWxWhlWOgb/RVcRuxHsGo+JwUOaVydtcLaKRqypynHIMp
         wPySQyRgRa36KwsyHUYUh4SXUMt76GA4QcdU83TlWXc10pQs646ayNMZzMwxvVoYPfCO
         XdvA==
X-Gm-Message-State: AOJu0YxVlH3cldQkN9SG45EDQEJRk2l4xLIuM6P76lNnpssgUTgnRLwk
	1/wOtEnQWr/Q84soaMx3kkFc5GHYvYc=
X-Google-Smtp-Source: AGHT+IEA9H3uZWt5YJ+QSD4KHD/LU6YkzXNsV/MS3ZwCe+3kw1JIIISR0Tj/o6OFbOJJoaOQrpNR9A==
X-Received: by 2002:a9d:4d94:0:b0:6d9:dbc6:1cea with SMTP id u20-20020a9d4d94000000b006d9dbc61ceamr10035639otk.39.1702608033037;
        Thu, 14 Dec 2023 18:40:33 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id q11-20020a9d4b0b000000b006cdf9935af2sm3436407otf.53.2023.12.14.18.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 18:40:32 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	contact@artur-rojek.eu,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC] dt-bindings: input: Clarify that abs_min must be less than abs_max
Date: Thu, 14 Dec 2023 20:40:22 -0600
Message-Id: <20231215024022.122022-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

uinput refuses to work with abs devices where the min value is greater
than the max value. uinput_validate_absinfo() returns -EINVAL if this
is the case and prevents using uinput on such a device. Since uinput
has worked this way since at least kernel 2.6 (or prior) I presume that
this is the correct way of doing things, and that this documentation
needs to be clarified that min must always be less than max.

uinput is used in my use case to bind together adc-joystick devices
with gpio-keys devices to create a single unified gamepad for
userspace.

Note that there are several boards that will need to be corrected,
all but a few of them I maintain. Submitting as an RFC for now to get
comments from the input team and the original author in case there is
something I am missing.

Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven joystick")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/input/adc-joystick.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
index 6c244d66f8ce..8f5cdd5ef190 100644
--- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
+++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
@@ -73,8 +73,9 @@ patternProperties:
         description: >
           Minimum and maximum values produced by the axis.
           For an ABS_X axis this will be the left-most and right-most
-          inclination of the joystick. If min > max, it is left to userspace to
-          treat the axis as inverted.
+          inclination of the joystick. The axis must always be expressed as
+          min < max, if the axis is inverted it is left to userspace to handle
+          the inversion.
           This property is interpreted as two signed 32 bit values.
 
       abs-fuzz:
-- 
2.34.1


