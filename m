Return-Path: <linux-input+bounces-12629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F00AC7224
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 22:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 956569E68A9
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 20:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C00422127E;
	Wed, 28 May 2025 20:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdJaikkz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8F221281
	for <linux-input@vger.kernel.org>; Wed, 28 May 2025 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463758; cv=none; b=Z6/feDAK8FV5hMScgbBAG2Ncudgm7XfHHgdgsHPn8qgBKfMoYEJUt2AQNeF+Q0d8Ma1Uv4xirelNDNjitgGWsW1YhA5aK5LrwBpIPM2bGe1S2qGx/EmcZYmX6MkRDPXu9mm1sjOE3E6xjdllwcE4z5eColacytnhrBhvZoSeBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463758; c=relaxed/simple;
	bh=KkXe+Lm+rabuheSlfIsCTUsWtN9PJTjQap3jOjZ/bdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdx9JKjmzDmtAW2rYEGCCUprwlTCc7udu3OK6beePY3KbZHm5USIkTV3rjhgCPQUK84JAJzA+9bz3hiHqaDJoUCcXXrlOoSbBs+LoWBsthgpxFEG+45WLxh2H7hwjDy56QASU3plVoh5Q5Lpdnev6lkTBDqjtTPV4j87IEm8Efk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdJaikkz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so1409135e9.3
        for <linux-input@vger.kernel.org>; Wed, 28 May 2025 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748463755; x=1749068555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5CwG2DjF5EIaVt29I4TTm2tkN33VTDrEArKVdA+dcE=;
        b=HdJaikkzyDyByHHxF984kKe8M1erWDtSOsa/LtecJyQQUaQAnv1g6LaCwpsb74+jgE
         zk/WatajVgy2WdXOhC2pduB3CBsh/YfwRxS4J6ZHVF/Adi/3POxRMTxQONTVTSEn2Lls
         Anulpt215clW+kWL9F0E08CRi1ooDYi62T2o5ZfXEjlOz4a/FqVECpHbU04um+YhIThy
         DuPkXnmNTLRRBaoK00Bjj+nkvV9bOuXfzHjvuop3JZceX9WZsvGaFEGojUVrK7Ov6A2t
         y67j0slDEDx0AXmjN4t0HwQhWd5t2Csw18JKiEETuf8bTn1TZyKDzYKlt+HTGycDLmMN
         ZB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463755; x=1749068555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5CwG2DjF5EIaVt29I4TTm2tkN33VTDrEArKVdA+dcE=;
        b=uSByzqURiy6Q6rxPI2fK8P/NetnXg3orkDF5RE0tgF3sofTzTzCllDOHJRMKGO5CPy
         HGXtWVc8eIeBQpVjcI8n/3zY2rGZYbUrWoJRNc4Ldi5FHtwcnmRfC8leLecREFqDuf2U
         Ei1Z7njLUQaQPv2BWML+4KsQZLe+Y5kmTbxWZtnynXokIcTmPVZoA2BpQVqLFn3mTurw
         8AxsHqeMwxV0KoPxxQWE4MaWuURmKM8iwhsbsWkfU/8C2wTlsvOy569hY3RIRX8yhYKF
         YcCeyIRvy82MxJbGuy/awSocsXi2JpTIYjmObFh8v5vbGmXjnO8NTYDs+nr+u4b6skx+
         FTUA==
X-Forwarded-Encrypted: i=1; AJvYcCXAJY7WC3ZomGNb8TiYkyxNNngsJKZy4219JmrVp9VOuMqEmvOlsv1DPUcAa+ZdzIO9Js/Zh+FrkSFDKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsD9js9InRDLpAIpMGGDEEBpd77avYeyteTdV0QFZOFgYKEwgI
	J9OnLb/vOcYN0lyISOxi37SD9ATOMcPGAiYbe3vANjmuXDS8uPLUsiDRA9A9HKUscmg=
X-Gm-Gg: ASbGncsU0r08+zzAZY65NTTSg2vsg+4vxyksoXOfw9qv6T5nFjXso6U/WCw7YnYuDes
	VerxxPW5yvgdZaKnSTXbxuBeoReON0+vSLU8EXvWaJ2dPPv9yQPIpappj+Wnq4dX3wdxA1H9le3
	sN8lVgfi4UpSOzxth/aDqlJzmGHo098pkea806x//W5APFIpvMVt3VOAwLpoNoQ77V2uKO14WZc
	V+Ccbr1xDWRHAsw4fqhfZywqRkxsKQFUhqjAt53CpS72wqDnlTsUHedMwiWJL2Ezed854e5btaB
	hg0D+X72FtuyAE3qIclhoJO+W6/BiL23hSlfktWonziOmEFvQc6iz/lqokdZXhCOOQ==
X-Google-Smtp-Source: AGHT+IHpyf0K/RJnIz9oYa7SCeInqhGIp/UYOUV+jDz2DXQY6iQAbI9UyULPYQBzAB+01wRfsWA8zg==
X-Received: by 2002:a05:600c:4e0a:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-44c91dd158bmr173850615e9.17.1748463755420;
        Wed, 28 May 2025 13:22:35 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc03c93sm1116955e9.15.2025.05.28.13.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:22:34 -0700 (PDT)
Date: Wed, 28 May 2025 23:22:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kees Cook <kees@kernel.org>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: ims-pcu - Check record size in
 ims_pcu_flash_firmware()
Message-ID: <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748463049.git.dan.carpenter@linaro.org>

The "len" variable comes from the firmware and we generally do
trust firmware, but it's always better to double check.  If the "len"
is too large it could result in memory corruption when we do
"memcpy(fragment->data, rec->data, len);"

Fixes: 628329d52474 ("Input: add IMS Passenger Control Unit driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Kees, this is a __counted_by() thing.  Would the checkers catch this?
We know the maximum valid length for "fragment" is and so it's maybe
possible to know that "fragment->len = len;" is too long?

 drivers/input/misc/ims-pcu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index d9ee14b1f451..4581f1c53644 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -844,6 +844,12 @@ static int ims_pcu_flash_firmware(struct ims_pcu *pcu,
 		addr = be32_to_cpu(rec->addr) / 2;
 		len = be16_to_cpu(rec->len);
 
+		if (len > sizeof(pcu->cmd_buf) - 1 - sizeof(*fragment)) {
+			dev_err(pcu->dev,
+				"Invalid record length in firmware: %d\n", len);
+			return -EINVAL;
+		}
+
 		fragment = (void *)&pcu->cmd_buf[1];
 		put_unaligned_le32(addr, &fragment->addr);
 		fragment->len = len;
-- 
2.47.2


