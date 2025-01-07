Return-Path: <linux-input+bounces-9007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABDFA04A31
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5DE162096
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDBE1F5415;
	Tue,  7 Jan 2025 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhyik2nL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250821F4E53
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278120; cv=none; b=PrwOHl/L5Hj29KnnUMMiibsN8NVP28tZB3xbLHJqRK4Zpt4rGYrd1viftH14CDCd9Ivp3f8ZnwdEpxzPgpdiH+6d/GjL2iAieHcrpPujOCE9BRQ/JAv1Hv0OexXeq86+7EBxTUINol24KHHzMXU+1tAz4RCX9muTd+/qerkp7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278120; c=relaxed/simple;
	bh=CLccwiWjp3og0LiJYcxS6R+F3Knyk8Ypv6ByWu1kEfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8MhYrZR6RYQxPS5wZUCyw0Sr0iF+j/XT5aY9h/80M95cqp0bCrulnacKEjvHmZ7l0oq6D8p/VUNupGK51kgVBNPyCw+FxYt6lwSp0EJuXjVllXjaAT0zbEtYZet8EOBgIGZ2HHBEtf1aockNQg4wWhBrYmTPSxvnAoWZH2rlnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhyik2nL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd730so114377745e9.2
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278115; x=1736882915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzKohZuIthQMOJ5jkTkjNJTU6UC30U7qHLMlw4lau8A=;
        b=bhyik2nLxXxpTC/xtKy+2L5bZP25HfJifuM0l2lYAdS3MiGJwsnCttcmdnSnpWrvJj
         SKGnHoMddb63MQ8ftXxlXXjPcs5fUuzxamvZq8dWo12Ojg8dodcbQPuKDCQx8sDmQvxw
         Bm6kBgvt8Szxtz5MSP5uMEpyblojpo86Z8RLEgoaioy4/Xt5NeuiU73ODAYq8ygkHHzN
         BhJiABBFVW1it497DutcEcJiFmcUDPpfpAxAN7SumpyoCDTmur4VthQvSIc65o5u68f/
         LUb9ngw4lzaDMzbwebjqv0Ldgom1/UbBdVcWVtLsVQxdMzgdnS+sknGekadBpioiKa58
         nmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278115; x=1736882915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzKohZuIthQMOJ5jkTkjNJTU6UC30U7qHLMlw4lau8A=;
        b=SdHlQFSH2kgODzguHsFymE/EBNNXYn9x4Q5/l+K0StI0V+lTLV4q5o/OBK718IxPGt
         lgSDrRjMQDd+cN8xG8hbyR5oWDzgVjuQPW7YUkxLL1+s3xN7aO+j3Ud0zUZUZlz7+zoX
         EkJHMz4+Q19I5ldbacoITHt0Mh1sP/uveekYevri5N68XQJikM5EqzsyQycbrPgGRSsp
         yCO6cUyT+vgkiXiLJQ0X7Qhemw8Bgk54fLUhcmeQRhWV9DJ5fA5C0T9GJ6zIA9d8y/xH
         DkRTRfnGoU8CA2W1eMeuwGtcA0bOyRspVmiaXSAWAt+TGCRU5EwkWlsQzem3AiSiON8O
         T5sA==
X-Gm-Message-State: AOJu0Yzp9CmXTgPN66FYDNVoLtWgjcxpMKLLYW7wJJ5EyoXyKh0xTPk7
	pcZ1MLBi8jPgxKQHTDjHLx9PV/1X+b77DTOzAWA1QNBDcoYAz+bxaQXVvRMGRdzmkw==
X-Gm-Gg: ASbGncsXdFQJ3upGahKyrbKRGGB61vBoI64vbUsewnKjcoYqDdh7alafWWjUWIN722g
	jkEymRkIMiX2HnOBsb8gj7prlINwmsOvQMKe4lrG54wPRBhXLlswsMflBmnwkT+g3b3a98O2Fjl
	vFuHJLIwef7w2enuuUX8kRmF0mXOxPg8aberzKjlUZyLTc8OFFesJ1wQDsdwT3KZAhGYMF9eeMT
	4pyUJOmdxJfoB9v2Q+JGegyU3QtET3czfgpMClzfjX/bQKUDFdFLeHeZhWU/FDG4t0w
X-Google-Smtp-Source: AGHT+IFEEhWc1poozJt6kMyTdhSG3j0tZmztaSn41bOsp8cPqByRWz7TV0Sw5es7fffMDBa35wUvaw==
X-Received: by 2002:adf:ab1a:0:b0:38a:4184:151a with SMTP id ffacd0b85a97d-38a4184166fmr25837292f8f.37.1736278115199;
        Tue, 07 Jan 2025 11:28:35 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:34 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 00/11] Input: xpad - sync with github fork
Date: Tue,  7 Jan 2025 20:28:19 +0100
Message-ID: <20250107192830.414709-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Rojtberg <rojtberg@gmail.com>

This updates the list of supported devices as contributed on github.
Compared to v1 bouncing patches were merged into one
with me as the author.
Compared to v2 all checkpatch.pl errors were fixed.
Also one patch with an correct author was incorrectly squashed in v2.

Andrei Ilyashenko (1):
  Input: xpad - add support for Xbox ONE liquid metal controller

Fernando Petros (1):
  Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING

Greg Savage (1):
  Input: xpad - add support for PDP Mirror's Edge controller

Jack Greiner (1):
  Input: xpad - add support for wooting two he (arm)

Jocelyne Jones (1):
  Input: xpad - add support for SCUF Instinct

Leonardo Brondani Schenkel (1):
  Input: xpad - improve name of 8BitDo controller 2dc8:3106

Martin Stolpe (1):
  Input: xpad - add USB ID for Nacon Revolution5 Pro

Matheos Mattsson (1):
  Input: xpad - add support for Nacon Evol-X Xbox One Controller

Nilton Perim Neto (1):
  Input: xpad - add unofficial Xbox 360 wireless receiver clone

Pavel Rojtberg (1):
  Input: xpad - add multiple supported devices

Thijs Reus (1):
  Input: xpad - added Turtle Beach Recon support

 drivers/input/joystick/xpad.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.43.0


