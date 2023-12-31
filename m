Return-Path: <linux-input+bounces-1061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C9820E1D
	for <lists+linux-input@lfdr.de>; Sun, 31 Dec 2023 21:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAEA828248F
	for <lists+linux-input@lfdr.de>; Sun, 31 Dec 2023 20:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3747BA30;
	Sun, 31 Dec 2023 20:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaYDIHr/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475DBBA22
	for <linux-input@vger.kernel.org>; Sun, 31 Dec 2023 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbd6e377ceso2354096b6e.1
        for <linux-input@vger.kernel.org>; Sun, 31 Dec 2023 12:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704056209; x=1704661009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7D+quK7j346Iy/8rNEmARVzDNz5kllN9zkX0ahJMdUI=;
        b=NaYDIHr/cmigPNE1gR3JWDARH2Euq4oOOKiBYhV4d8YeCLy32GAAPI+fkoq75Jma+X
         btxUd6DzYek7P0H1fcnUmgbay+Hq25/yk4irF3V6fatStRyN15UeLWmg5H9Z0/pEEVck
         YGS1lJMVuZlPbJ1aC/ownjtZNkIb9N/nLhxZWTdOfQl4NnucY+x5RuQi20BolnsUX8jW
         FbPsbucUQ6BoWHNiT3+vAPR1eTpQMTpknH/LEOFIagaQJL8kDnT52aEhHiVN7KBZCoTI
         aWxkJ0rU2q2ltAsp93H1CDsl9ZFPAFFd61w+7wNQCzRk4a/K6OAar+Z7TlfyJW0Z2lmW
         Ml3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704056209; x=1704661009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7D+quK7j346Iy/8rNEmARVzDNz5kllN9zkX0ahJMdUI=;
        b=GODdw3O10PgkbGXRX83deBLdxTQSoQZdB0pGgQiM2V6B+IPdv0hcEyHhw98HLa8BQX
         MleNZosHPsmGcwWCnvXEk/jkQ7K3bO3fdPzEU1lmdk/duDKPwCrFEaliu8rRMrGzC0Jf
         z5GTG0AmKZzFEG8DZsHTISMSTv0JWZhrfN8ZVn2pEPMhmPU45MWML1UA5BgMphE0W0Z7
         QQ0pKpTBIxAeNl7Lr6oeU2A+jBF0oBRa7MtbvrBOrN6ObX1XViG40/ehZ8wL7kyLY6K9
         E38gplGp+KiI2JGFOGcF9u4cLd5n1QqgHYvHjutA0Gcvo9yi4iOdNZ4GotKzRhXdBcJi
         Y3kQ==
X-Gm-Message-State: AOJu0YxuMjETpHans0gEDCt5L8d9hsHJuu6IKIdC9i988XgVtFVNdd5W
	UTFbc7YqAw32tTNhQCB/CLlAGqsP52pN1w==
X-Google-Smtp-Source: AGHT+IEqQzGw+mmQRO0kTDPcqChm1C9eKJxP4vCNrMBO1S+9P2an0Q1PcB01L32h+lmbXvpcK+v0+g==
X-Received: by 2002:a05:6808:1704:b0:3bc:719:f6c with SMTP id bc4-20020a056808170400b003bc07190f6cmr825473oib.108.1704056209052;
        Sun, 31 Dec 2023 12:56:49 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id v1-20020a056870954100b00203d8ce415bsm4843404oal.50.2023.12.31.12.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 12:56:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	paul@crapouillou.net,
	peter.hutterer@who-t.net,
	svv@google.com,
	biswarupp@google.com,
	contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Allow inverted axes for adc-joystick
Date: Sun, 31 Dec 2023 14:56:41 -0600
Message-Id: <20231231205643.129435-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Handle inverted axes in the adc-joystick driver so that reported input
events downstream from the driver conform with assumptions that
abs_min < abs_max. Add a new helper function for inputs so that abs
can be inverted that drivers can use.

Chris Morgan (2):
  Input: add input_invert_abs()
  Input: adc-joystick: Handle inverted axes

 drivers/input/input.c                 | 19 +++++++++++++++++++
 drivers/input/joystick/adc-joystick.c | 13 ++++++++++++-
 include/linux/input.h                 |  1 +
 3 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.34.1


