Return-Path: <linux-input+bounces-4477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427CD90F84D
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 23:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6F0FB24AE6
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 21:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF2115A87E;
	Wed, 19 Jun 2024 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQAdtsMe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05F215A846;
	Wed, 19 Jun 2024 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718831606; cv=none; b=K3TXEa8+sFH1n6ntX8yFlcmSgnxYYwgrWUJbPjc419MhgA6NMRHbakH2pGTrCWkGFlPB3r0+jMJblCOCSBWr11TuvV4rWqhBUD8VHrozVe098doRAhS7NHnkdDSaWSfL2fwW/mxPaN6mjbdTOxTygYOimwdj7wa1kmFo+RVsvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718831606; c=relaxed/simple;
	bh=I/hTuc/zP+bvnQXWL0T7cIQLz1sFe7PWnKke4/qHAeA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YVvBjcMAJPOcYbcLmiEPg6JEAZw960Rydgw4lZ4mFmrsKUQXjtvmfZjN0KvU/iLMYvX1vkEEjD7o97QQ8RhFAgmshW5oMLlWzjfnb2nh7wr1fereCsDsZaHyDISfGZaE0WhkqVwzvxoEqo9ncERwta5E161gIKicaehxraarzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQAdtsMe; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so3920831fa.0;
        Wed, 19 Jun 2024 14:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718831603; x=1719436403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tebfRDKDwaxkvRaUg9Ir9nQNTVbshwJLHwNpt88dOII=;
        b=mQAdtsMeWJ8PO6XD7WN47RG5p9IP75Vl/QCymPfp1P9PcUMcgO+RaSici5nDRiJEtl
         larr5+pkv6sUakJWCJVVhZ9r3cnnaGYkopohEBWBv5VyWSsISx+sFXv/767+jznReHba
         jvvkGL6cbuFWwGj+k17SfG7naN5dYydkh9gsFzuPx4SMIDXg3XmNjkOKYNUkP+Zajzhb
         MsZmJ6MLgXuaimI1zhmBhXSOyHV4XckCFB1PSO7RLkHYpvgoxW1goEyMwTGatGYvj34A
         PffmsvFnOpqpjw1HRz5bj2maHyXt8HnEAROo4ICxOSPHhAsc+kQUPk1+vMxkDyGuN4cq
         mu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718831603; x=1719436403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tebfRDKDwaxkvRaUg9Ir9nQNTVbshwJLHwNpt88dOII=;
        b=xJ23/jlrjdfKidQ8qYbDp07FBqAWXtWqqPQHx0GpEEX7qWk2hN/oPpPIMNFfbuMKRa
         bfJJVxj0ejMaAQTCM9szMHBcfsBLns1Q6vE6xS+8q5GAhFtYHCDWn35ps8JbI8mJ/C6F
         CH64DvUCvzilcp+/Avj3Mn4q+H6BjG13KJYebufGDmkEciMQoe3W9KHAKqAgdD1tOKtF
         1bO+jcWaUOz0x/7/XxSLwTQAFO6wo4xUgrehmVPgiFYfcuTrY2mw/+Wwl2pI3zKjuH4B
         0cJpbbTQEDcUHHDFRD3bVuwjrsANQyq8pH2O1d2OdUmd+Zx+eaW5VGQbGH0OsXKIdkNm
         sXXg==
X-Forwarded-Encrypted: i=1; AJvYcCVMf41kR5/h84ml+82bbpabzT3gQ1EwwjlsBUK53gsOdbn+gybjfutqrYELT00RYI9ZWgFjA426zETcuaSsm/H42/OmhETbkhRrzcSPj5N0L5634BcGSfbq0NH2VMe78kQtdikzG1JpgW7MLmIy
X-Gm-Message-State: AOJu0YxeaA3npvLgDFgVPK+t1aUzks9GCkb+/ouCMbpRn7rxVixVxBJS
	43VjgA6VLUw0edj9PG3SPRDadBbgYyzffxOIkKmEyV2RqfN0Qfonk3vrtfy3
X-Google-Smtp-Source: AGHT+IE7VDhOKX8nAICfRhzVRk8lM5uPHxAy0HhZ8N8AMg6Nt/WT5TPoj42A5OYCKdk4WjaAEsO6zg==
X-Received: by 2002:a2e:98cf:0:b0:2ec:43fa:25ad with SMTP id 38308e7fff4ca-2ec43fa26cemr6643101fa.7.1718831602764;
        Wed, 19 Jun 2024 14:13:22 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41700sm698738166b.152.2024.06.19.14.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 14:13:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] Input: ims-pcu - annotate struct ims_pcu_flash_fmt
 with __counted_by
Date: Wed, 19 Jun 2024 23:13:20 +0200
Message-Id: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBJc2YC/x3MQQ5AMBBA0avIrE3Slmi4iohQU2ahpFUh4u4ay
 7f4/4FAnilAkz3g6eTAm0uQeQZmGdxMyFMyKKFKUckaeQ24m4hmi+6gqR9v1NaqctCFFLqAFO6
 eLF//tO3e9wNMtTSNZAAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718831601; l=776;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=I/hTuc/zP+bvnQXWL0T7cIQLz1sFe7PWnKke4/qHAeA=;
 b=VT0L280BZkvMlEAERFyMG/5nvfVfexUCgDSHGhpjwX/h8hEkIG8tMhPlPWj7oP84sNRLuDTOc
 hhIbbRzr9i1C7qQiKgMwxhoWVaMeELADy3KeHJ6rPW2seEwL8ddHofM
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The length is assigned before the first reference to the data flexible
array (see ims_pcu_flash_firmware()), which allows for a straightforward
annotation without further modifications.

When at it, I also fixed an error message that repeats the word "input".

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      Input: ims-pcu - annotate struct ims_pcu_flash_fmt with __counted_by
      Input: ims-pcu - drop repeated "input" in error message

 drivers/input/misc/ims-pcu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240619-ims-pcu-counted_by-7ff24a731073

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


