Return-Path: <linux-input+bounces-8905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7857A01B93
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89CF13A2FE5
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C47189B83;
	Sun,  5 Jan 2025 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAC+H1Gw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015C143725
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105877; cv=none; b=S9yi1x4ut4Dmh5YL4lcHqP8AU1YMVvf17T97lRzoNhxlCbCRs3hdgPsJBfqoeW+/9dimNVOPLt/tswiWPVjU90R7dJ0shlmgRGxCUFyyBIIxtVQOm7bEctQ4VN242ovbHN6Tj0fStjny/OevU4KyyoIiZ6ziPX508mOoIcHIxkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105877; c=relaxed/simple;
	bh=ErU/DnQIYPKhx9Fs4shOM6YJWPXtqcb6DIcnHWPUfig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BPrlpZwmJzKQzlJOkEvCYFlo8DPmg8Q2qdWZO0154HBeqj55qN8chlN04XdcQ/o802dShFTFR7Dup5VGHM3MAueY+0lzQjJT5IT1nUiCeiLUZIebp0vVO0/6ec+TAxFIofBYHseEE2LdzH/cZ08ENkx+iVKbUOGEAZEeSaF0UMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAC+H1Gw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4368a293339so103510175e9.3
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105874; x=1736710674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6TxJLHHU+ZTLWDTVySi7IfsLvqybUhHeB+Gg2eRh0Hk=;
        b=YAC+H1GwUfIq7LIjP8uOtckG13stcbWH9lMnFVKwaKaRv5jbA33C2qmJEKle1ySkHK
         xg+cflb2e0IasV60X0dL04RrR4rcxIApP0PXNBHPY608BhsAyvaX14s7mOLugbhbOZhh
         X1K61Xzv2bzANv6mjC7GooG9BJdDc7P1wmlJT2rcDlS/4bTyyQrIEsUOxX0g+jm3wqOE
         KsFb6njA6X4uPb3XKf24MpmaASF6Y5lBUzy77RjNmNGjAtVf9l9yL+eTFqqu3JCXw97q
         Au05A7PYCtVuBE8neNewE62sEcNDzRF79iIV1927C7NGFfo4gJk3DgClWPcQHlMl1SEI
         44Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105874; x=1736710674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TxJLHHU+ZTLWDTVySi7IfsLvqybUhHeB+Gg2eRh0Hk=;
        b=D91CwITQcXuDkgMjKAsN7CuqrVmkh5woDaBexkrYJJJufkVgweRKcmcxgwo2GWDLmY
         PL9CoRiyCOygAg1JFenXVR6xEuRlbXyNaOGxsMabL7Z1OmafQpKCFbqm/2jepVTeSZoW
         yd6eG2mBdf063fGZS7oFUvCCCu02jIsAp2jJgXQnhpkIIxbdbBMjQi6jdC5Hf2t+P+9A
         T8MyyP38XHNju7Sk2pv8sz5gMTwgoN5UqpjpDkzZzqfdV+ZfT3bsKU7nnHVBsoRocA8q
         qAeWekkRmePzpXuIgudtWuFsRF9YrBwiKg8zU6jYXAdih0SvHPqJSUZttjVfJIWuspnZ
         z/QA==
X-Gm-Message-State: AOJu0YwH/PGcOTsIgle5Z8oMVfyPBp365uIMQfq6Wi/rICSw1F3d+QtN
	+uZa1u19x4vhLs3cPWVf5J1PzOMDdNIpcWVHQIUf/DQoykNDOL4nfGvj7bnLC+d2lA==
X-Gm-Gg: ASbGnctgmH+Amf2Zw87wWJSeAR4JQlNGE7t2lqI2CelEChSEQaw2KFqnkqyY2ug+Y7A
	WHsYWLsIP/gsgqk6onT3zat0TBiQ3ZFnQZekuHif44KQuSt67rlkEbZE7IVn7aV4YpEb63FgDVu
	YcASjWg+XGJk6RERngZbFgsmsgrUiKDMKhMpXZQ2m4KnS1OtJlEi4ppLaqcrBK35OEU77riqHcu
	QwUW3ynfvq29LVBL6kSZjHMFvAqt2ZztkRupGFk8VDrTGsU3BFfbLYLl0mgkJa3xUZG
X-Google-Smtp-Source: AGHT+IGVJy2esj3jxy8hbCO6LNxk8TRAEiNCE19T8CSupuF1P8C7yAp8bkqINr3khhHWDBM2CjsmGA==
X-Received: by 2002:a05:6000:70a:b0:386:459f:67e0 with SMTP id ffacd0b85a97d-38a221f12a0mr55129139f8f.21.1736105874106;
        Sun, 05 Jan 2025 11:37:54 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:37:53 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 00/13] Input: xpad - sync with github fork
Date: Sun,  5 Jan 2025 20:37:37 +0100
Message-ID: <20250105193750.91460-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavel Rojtberg <rojtberg@gmail.com>

This updates the list of supported devices as contributed on github.

Andrei Ilyashenko (1):
  Input: xpad - add support for Xbox ONE liquid metal controller

Fernando Petros (1):
  Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING

Greg Savage (1):
  Input: xpad - add support for PDP Mirror's Edge controller

Jack Greiner (1):
  Input: xpad - add support for wooting two he (arm)

Javier Zepeda (1):
  Input: xpad - add support for Nacon Pro Compact Model NC7271

Jocelyne Jones (1):
  Input: xpad - add support for SCUF Instinct

Kikismine (1):
  Input: xpad - add Hori Racing Wheel Overdrive for Xbox Series X

Leonardo Brondani Schenkel (1):
  Input: xpad - improve name of 8BitDo controller 2dc8:3106

Martin Stolpe (1):
  Input: xpad - add USB ID for Nacon Revolution5 Pro

Matheos Mattsson (1):
  Input: xpad - add support for Nacon Evol-X Xbox One Controller

Thijs Reus (1):
  Input: xpad - added Turtle Beach Recon support

Tobias Görgens (1):
  Input: xpad - add Black Shark Green Ghost controller support

jdarn (1):
  Input: xpad - add support for 8BitDo Ultimate bluetooth/hall effect
    variant

 drivers/input/joystick/xpad.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
2.43.0


