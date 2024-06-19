Return-Path: <linux-input+bounces-4478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFB90F850
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 23:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75471C23653
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 21:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913EE15B0ED;
	Wed, 19 Jun 2024 21:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO4AMjON"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE315A863;
	Wed, 19 Jun 2024 21:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718831607; cv=none; b=b2rRL41Y7qRr2jCPLhBefynZtMZo3uBXjuuWR8Of/JZhtg16ZanGsT/JO5/JjMBqJ4K1pOKnFy6FoibL/4N+eue2MyuRcOzD+zKPHJbeoD0dFHAs7wr3wvZxfJjFPvz9AATbQjux0t5rHkjCwsyZUNJcwe54bkzAfSfyHhkUVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718831607; c=relaxed/simple;
	bh=zvTtbeaAyONgICOPzhezw+GO8rpkhjCZ3SdmJfMy49E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXRRv/Dj4WC7UU8mizQp+SOwwVvn5UwRwoHZWUE+0GdikKCtS82rJtAGuYZyGhvhRPmv0I0p5tQcWxw2x8O09yMg/NuVgsWtWJKPbcc1fUKsLuDMz9eo51tDi2R/UZQV+UvH8tLj6lUYdZn1KAP8FKPTxkmidpz92uimT7783Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO4AMjON; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso18286466b.0;
        Wed, 19 Jun 2024 14:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718831604; x=1719436404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsQDbQzQVBu7+yQP1ySDnZ1NqGcFTqbtsAzjQXiybgw=;
        b=cO4AMjONRCF6w62hRSj6vcoK4SNmOZjwvvXswxSXmLPnCKjb047mgaLg2f97kgfVg/
         /CZPsE/DBe3JvNdOwWV3ixUlMfptkJa5kJl2siybQ67ajWdlOVE3oL7gw/LgnESfMysA
         Aasafm5J04RziCYZfwuNU4fJu0f+Owg5G9IA3/WpEhkd9NlTYRIosae+KfygvsARGalT
         hCAAfSXygv6eZywcn9NoR9jS34M7dOlwDTKYzd0UaW6kXsZHAIeb2D29UW9YHCmjhBC/
         wCMIptr/t89tKKHUfQNAazOeIRxGpQFWt6hzCCs2tek4U69DkACbfNZfmRRX2aA4KtXc
         91fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718831604; x=1719436404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsQDbQzQVBu7+yQP1ySDnZ1NqGcFTqbtsAzjQXiybgw=;
        b=kRl1Gzfj7DBfjgqeu3nQs5IK1j2Xpen0P9MQEihHQKpDcJq1Z8YHIs8GYkdbZG6Ooz
         EqfrsyFBb7L1vjxpdTxCH+sQkmUalH2kouRhKyTG+D/ffpIMy1b0h1GW3HBGB61MLVV1
         WFF31B3hO3uyPeyZrD5oqgU1/wbTfDTXDj48Vn4QXpOlBxOPXEbRQKhLdVf0NuGSZ6zq
         GjZlZ//9mzoW6fbnjf+2j4ebWL9azdhvfpwNULMUWiZxRwua6QdY4bKKjupLbeduDEGW
         dgBcg1sEh8lZo+tbo7nXucw0A7y5UVBmezfyQ8Bhy9+y4aW6Uzk3WrG/JRXXWaV77c20
         BH9g==
X-Forwarded-Encrypted: i=1; AJvYcCWgxXk+6i71xypRAtaGiLJ+OsaFrSoYW8qhIiJp7Z/2KqtE367tcDQu8wC5rQOhjntEielke6VlE7WQxovT9cOXJW1FJQv/UJJdZUyvfDWMCqllTEcP0nJIhKivvroMpO0WZb26Qd47gKjBZgiF
X-Gm-Message-State: AOJu0Yy+pUBF6gkWe0pBhktd0MYg6FIh1nH204dpykmcPTS5IdIi+LQh
	GXEaSpTOWxUB4x6VnZ3LPU3kLqw41pBH0/qTsfBXgh+kdE9Whn2A
X-Google-Smtp-Source: AGHT+IFsGyT80zKlFXeDTsC6mIPMCTO0pmYzrxX6T59rsL1s9bXHizDcqb4V2aVcc6q/GiCAjeS+Gg==
X-Received: by 2002:a17:906:cb1:b0:a6f:f7c:5c7a with SMTP id a640c23a62f3a-a6fab7cd635mr172253966b.67.1718831604071;
        Wed, 19 Jun 2024 14:13:24 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41700sm698738166b.152.2024.06.19.14.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 14:13:23 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 19 Jun 2024 23:13:21 +0200
Subject: [PATCH 1/2] Input: ims-pcu - annotate struct ims_pcu_flash_fmt
 with __counted_by
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-ims-pcu-counted_by-v1-1-3ee0ead2e57d@gmail.com>
References: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
In-Reply-To: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718831601; l=757;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zvTtbeaAyONgICOPzhezw+GO8rpkhjCZ3SdmJfMy49E=;
 b=kFuza/zoEoIO74C+BCQ7VtOJbFXGxshUt1ziVKZMi1EvyVlZ0fRwlYgZfwAckwthnOu8lyyAD
 rFVqANSLdYbA8rnnuKYpezJN9Csxfl3KRkxFlJQMpfC/Bl2ylyYkJrH
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the __counted_by compiler attribute for the data[] flexible array
member to improve the results of array bound sanitizers.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/ims-pcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 408a586f8c36..91f8ad826238 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -761,7 +761,7 @@ static int ims_pcu_switch_to_bootloader(struct ims_pcu *pcu)
 struct ims_pcu_flash_fmt {
 	__le32 addr;
 	u8 len;
-	u8 data[];
+	u8 data[] __counted_by(len);
 };
 
 static unsigned int ims_pcu_count_fw_records(const struct firmware *fw)

-- 
2.40.1


