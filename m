Return-Path: <linux-input+bounces-7564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50A9A5259
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC842821BC
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779154C7D;
	Sun, 20 Oct 2024 04:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kugTu0iE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3A6E567;
	Sun, 20 Oct 2024 04:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397382; cv=none; b=doTJpvgLVyBMXuxOnJBbqPdMqeVQGegijPvOhmRpWAm1n1WQ6jiXO87dQndw7WB1ppVH0KeGo8GUOVJ3VW21pXoXzVLmM/WyB7u5RuXZ4aWXhtHBQziF0vVMDeFcUR7dMVF6TSYAZq8bXSPIpb25wvTm/t+Nwfii2cuFRUq4d+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397382; c=relaxed/simple;
	bh=h+spn2EFfdiVd8hTXlKE8OlUtlr4ystVAw2guLf/6SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrq9lnPEE1TVxNqORq5Gkk1YEhIz4R9QzhOSKt/gX3lYUIMygphaB5bdWgf3vnutCE73mOGFy0+e1jryHMaXX9vGUYL088eu/1wblph3Mqhp+L/cKppbozNyEoGBqpz6BiLo956CD3mbz8uWFxexkpUVVC0Q7jXVCp9DEwEpFJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kugTu0iE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20caccadbeeso38186375ad.2;
        Sat, 19 Oct 2024 21:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397380; x=1730002180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1bGjd1n5rAZCn+evWllm1sc9D7H4aacdgC7A/pNYx8=;
        b=kugTu0iEqZPSjbQNw8E+Iwu8Rds6Ebj0kXNExeLA9zTjX2F9ZiSU5I4locL9Cc5F46
         2TDmikkKJxdf7tVOtIRYaUAnHIXEtLXKB97icsaQdHAGsONYqT8vIwD4+wbURV6lCCpm
         zXAns7DUS+0zgWdye4mayDf6IImb3XEx0quOF3/2gzJA333SivLnRIllkseHlIwHmjfA
         XhnPJahzS0Mqbwb6DzGsPVpX6/s+AIaV33MTXVGoVfTzXIG9NfLiCN4J8ziF2rMArs84
         ugtE/sITmSjmmSuBy9SK+ZZhVI7c4ln2c0Qfr6HdxeKDCLswXEOCtC7NMWep+svdAGSv
         qjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397380; x=1730002180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1bGjd1n5rAZCn+evWllm1sc9D7H4aacdgC7A/pNYx8=;
        b=TTtUV5A+D2N862GZ0XqZNDL5aWyvYcHEafPFX7QwshXoSW1ML9M1Zot29++iq6aOMD
         3D7Sn1pOcnJC0ud8Cz4CAKhICLoTPkSBBDNxajHRHzYQ4KlFeYwHTqjh7fF7SdMEjd8A
         LVE414FiFvxg9NQ2U6uFXfbi0Eu8jxSFb5v2Oo7J8yALSDpPSs/Wf9Cj5yJ5ZIyvIaDA
         9Wt2987gbXVg0l8amVnUMSpwQt+aNkYhRQFkkZYJ5wasbcZfmsc8QYSU9c7lqk9ufo8G
         EukUU7hukrntHq1V3y0bUN6ODtTKnl9YKLBv1/hX9NWZM+HYWxJlDX933ph+J4nn51O6
         iwjA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Y9icNxi1x7cjF5aLyyIrjWICRY2dSasPBSfCxx8LOKbmwZlx4FdVrgK50imKjBvj2opn0+qEonlHpw==@vger.kernel.org, AJvYcCWkoxJT+NVX9gUMJrlyl8qt3NecZMCRcXPqFTwDAR+PyEuht9t5lMmHozTakTfDHFKwBX8kD0InGoIw7d5u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34VYjRIMq107elL3ZgTDnq+0PyR8C3rGFcKtMct3fcvMbAM55
	hRMm7D40UhUAWN3vQn841H0mX/jf0pg4hR4YK0nj6oUcWpPRB3jb
X-Google-Smtp-Source: AGHT+IEc2BHyqmStnpq7KA9tIyD0eDdNvs8sr3XefsuIF66d/cAZosyCaPNYQ6F3nVDJeuBmr4bFWQ==
X-Received: by 2002:a17:903:2447:b0:20c:db77:a4f0 with SMTP id d9443c01a7336-20e5a8e124fmr91966465ad.25.1729397379839;
        Sat, 19 Oct 2024 21:09:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f355csm4248175ad.265.2024.10.19.21.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:09:39 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:09:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] Input: twl6040-vibra - use cleanup facility for
 device_node
Message-ID: <ZxSCgBd6th1i7B4X@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:54PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that the
> device node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

