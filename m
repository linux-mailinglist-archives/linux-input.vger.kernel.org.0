Return-Path: <linux-input+bounces-5362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 365C6948551
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 00:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F34F01C21CF8
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 22:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD56516C69C;
	Mon,  5 Aug 2024 22:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jK7k/jKt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3116EB5B
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722895919; cv=none; b=furTI5r/q5EPqSASH4SXbZta0AnWDnxh/asly9Va7Qs665d/YYl6m6+LI5FfcMVsfjoYgZVIzO6ylcXxcUWd+V+1KJUDR7AocRGihSztUwlNwx7tIBxv+ZLyhQaCQE+foS58caiHgte7oBeKXINmVh8WOmSxuLfoA7Q6FBWmPSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722895919; c=relaxed/simple;
	bh=wUv7KoMG4BlstrV2UeTWbuMhxDqmikm2NZZlSyckfmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lt0NUn0P7+CiZoSwYbT0MlSyrpn+Zm0jFwqLqOnzIzif8oXkVz9ud03mJg2LDBF6qD5qhidOv5t4vRyZsUpThRSZCev9vzFsWawCKEXQq/WJJc9C5JjW2ebAS8cX9ZSVdITbPMAz5U2uaDhtRHORvWn1twLFbt3dGE5f8BtN7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jK7k/jKt; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f025bc147so15284e87.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722895916; x=1723500716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6M+A5HwfYmqdINZQMPskJ6euYSYvWIWyaceeU/RXKd4=;
        b=jK7k/jKtKVZFEB5GwpZu8BJUYnfGkB6PLG1Cr1+V6cNtEZR/KSmzCIQojCrQwiYpI/
         u8tQXTVSavHeRWjtuq27RRVQRJbyMTPBOcQnxToIT8EtYUOe5/+OObAGBZBVbcxrGYMG
         UKZt3ErN+4Asw19gkh88BVCwtm6jwG5KYgJhAPjgaU2aFXyNuyM2umA4yRhsdCaCjeqf
         nitJBDzkR5dGeTWuTaONH/lczImci+APuMi/7hVtsWcgtko1w29TZGugg+cPxA4/HeIH
         A2CZj+OokWze7iUKwr8yqthe/0XoAWQPdhzdXL+tI5itAfbKNB1HiWl+CbRCkibiyoVq
         KEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722895916; x=1723500716;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M+A5HwfYmqdINZQMPskJ6euYSYvWIWyaceeU/RXKd4=;
        b=FwTAUEtAv0wFwkZnt/s3WLI+ePCJ0uB4oTa0yTktZUS0jCMj29dkFXrzk/qWlu5NJx
         +RThZEE4aZMywqdG14zRfO4qCufnPw+PVKCFCeA8d5Mhf45W2CtazwFXe1gbnN+/AlcC
         NgWIHbKolCIc9GVAK05PJAa5kOBSG/M0XJWbg9o3NDk4iwonsk8PuZs+h7I6EoWX3Izw
         MfF0Ck+brgpuycOAkJO9zuwLFY8regnpsJL9f3rHCYMjDDCIegQQKkR9iX3g+fYJvJSE
         PEdzQ3UA+BJIb1mcgH9abn0x0ZzmHM3YF9GJiSUJKucexHkmM2BmdYVoXYL3T7IeB43v
         COZA==
X-Gm-Message-State: AOJu0Yz015pE5lSewMHPtuLTvId89kSZL4HJWe+OdQ7YjHo7chlSvzZG
	D6b3hhL7lqV12z8AqljUvynztU/NQ0SwqCHeA0r5fnLlhVErejr5nMiMcuWmo9w=
X-Google-Smtp-Source: AGHT+IFp14vvqz2YxVCoCphMMw7p4nIfhXiAInksfRtGn4p9h/lcu354kL4E8qTyMcuA593E7fTldw==
X-Received: by 2002:a05:6512:12d2:b0:530:ab68:25e6 with SMTP id 2adb3069b0e04-530bb395e96mr8568181e87.48.1722895915536;
        Mon, 05 Aug 2024 15:11:55 -0700 (PDT)
Received: from Fecusia.lan (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba3cb61sm1268590e87.245.2024.08.05.15.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 15:11:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] Input: zinitix - Handle chip revisions for touchkeys
Date: Tue, 06 Aug 2024 00:11:37 +0200
Message-Id: <20240806-zinitix-tk-versions-v1-0-63ef79c7f2a1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlOsWYC/x2MQQqAIBAAvxJ7bkElovpKdNDcagksVEKS/p51H
 JiZDIE8U4ChyuDp4sCHKyDrCuZNu5WQbWFQQjWiEy3e7DhywrjjRf7TA/ZGdkYJMlpbKOXpaeH
 0X8fpeV7MbkD9ZQAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Nikita Travkin <nikita@trvn.ru>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The registers containing the touchkey status varies between
different chip revisions for the Zinitix touchscreens.

This series address the problem by reading out some chip
revision and firmware data so we can take different runtime
paths in different chip versions.

Also read out firmware and register version as this may
prove helpful to similar situations in the future.

This applies on top of Nikitas series to handle touchkeys
that was recently merged.

After this my BT404 touchkeys work.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      Input: zinitix - Read and cache device version numbers
      Input: zinitix - Varying icon status registers

 drivers/input/touchscreen/zinitix.c | 59 +++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)
---
base-commit: 669e9cb5f59903fbb1649660f3cb04e5217a7e58
change-id: 20240806-zinitix-tk-versions-9b18b20ebaad

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


