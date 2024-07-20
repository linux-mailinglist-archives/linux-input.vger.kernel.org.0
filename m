Return-Path: <linux-input+bounces-5104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE48A937E7C
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 02:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E781B2101A
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 00:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C853217FD;
	Sat, 20 Jul 2024 00:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naC5W4Sg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A404EDE;
	Sat, 20 Jul 2024 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721435235; cv=none; b=IYxN1ng9kZZ25+uI0hs544vB1A38h0xDJUtztpDN49YrlM1LNSZphHmTMsXri9fxuN3yen19R+TJ2OBacVmEs1ow9G3NpviEZIBewj0FyZrRtrLdM7t1btTPqyU6ulapOxB3q5vpVnLAD2k25zepWCE5m2Zae2dsynAah+0Xyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721435235; c=relaxed/simple;
	bh=Yk5IZN4jcIK4bBd4/ZlYZvUu+5SHki9fqROOBZDCbyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mc6rwwBkChycqofkFHxV33wkXk+am1SXfb9NLBBftryZeoRlyk1B6BfLfylZFAQ2h1F+aMe6BE0T+VUuvrC1uteox2Kr4FzPygzZdYKm9ZmVOz1cYgwrJ8qCU6XqHlRi2bK6XKkyIgbtfczAHmqg99Rji2ODM6HfxCNjBwxD6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naC5W4Sg; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70cdc91b227so1084904b3a.2;
        Fri, 19 Jul 2024 17:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721435233; x=1722040033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=St64n0nCIlW7LycJiRnviwrANNzTbw81MJ+Wji9zxl8=;
        b=naC5W4SgJGnmz8RBjLvCIbKfXSvreCPvxKD5qC1t+WxiDAluXI9+8X1pxZlOAZh/jK
         /pX4gbBo7o3AX/G9aU2pfwDF2iDt1qt5RQ+wb/gwMVVOXXnahiekkXo1Ac18itFyB+B3
         ja73gxz8MfpDxPpX3zZL2LtASVSuzMH+d5x2qXwr/Fy9SDFYYByZ4Ngo5mmzlCVtyaoj
         D7A24y98hb6aTamZgazbIN9yo6ShzC1gBFxj0IjzVBBU/sLmlPRLdn94O582eysYfZxU
         RbPZ6uQ7oX3i72thVSyBpfdEVWt0rvkOuZlobo3pENCGcJnDK3ZP1/nhdjJYRnlCmajg
         ajGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721435233; x=1722040033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St64n0nCIlW7LycJiRnviwrANNzTbw81MJ+Wji9zxl8=;
        b=qj54l5UXZDV5/FQnY0PoDk6ySEF/BXOM7wE4rIHBurV0IRQpmts8ZW/ucWNWmFGZwx
         e/CazlhtGJcmyAA97EzmEySVfSFmmed9oCEODtUUbNGwAHBJx1Bb6KCkDR6rbuwtqKL4
         GzcjsDak93qdp9fV7C6A+eZZ11nlhSEzeAFDAf9dIwfsP+xgoRwVvQzp3gFXugOtlldo
         ZsVqIv8HXg3ZJHlKMRD+NnEBrx6OMRCIuhpz8RStIqmGVUfkxBiN0906aMpnZvRGU4mt
         JC+5HlD9BkUh8xSAPVb+jb5bAxFQAW4HMduxJuaaqad1X3mGpDoXSTeVyfx45domHvDR
         4J4A==
X-Forwarded-Encrypted: i=1; AJvYcCV0tZiVI1zSznfmgKJENXQoS0A6lNMVobG9t3M0wY/Lln5pothrV2o+WHnw73gw1vgM8dlyEUm8lFRz0KJNzWYaA11nh/MUVCTmEoZAseHzdKz0vZqtNCgJyCe7JZTvGlde1MI/8Wn/RFSSBHFDTiwYBEgZ1rNw3w3mMogrIL0IuUXYA4P/
X-Gm-Message-State: AOJu0Yzv4CSa9/p4fsChel6ixm7lEFppafNI7xiiqBQQdNEcWseKfHO4
	SHkubu6uOZevI+42wgK4xspLGP4Q9BglZD9N7T/QDHBsSMG1GN3E
X-Google-Smtp-Source: AGHT+IEhiEVIfv33XZcfGWjD1kgVAQ0NQfN9itlC3XUfGS3jZu1j8RYbHSgWjpHF6XVZ1BPAgyJLMg==
X-Received: by 2002:a05:6a20:841e:b0:1c2:961c:b2ea with SMTP id adf61e73a8af0-1c42298e44amr2131009637.49.1721435233233;
        Fri, 19 Jul 2024 17:27:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1cb1:21f9:91f1:d0ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb772c1acesm3513706a91.2.2024.07.19.17.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 17:27:12 -0700 (PDT)
Date: Fri, 19 Jul 2024 17:27:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: input: zinitix: Document touch-keys
 support
Message-ID: <ZpsEXogXPcTa0OGC@google.com>
References: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
 <20240717-zinitix-tkey-v5-1-52ea4cd4bd50@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-zinitix-tkey-v5-1-52ea4cd4bd50@trvn.ru>

On Wed, Jul 17, 2024 at 06:55:33PM +0500, Nikita Travkin wrote:
> In some configurations the touch controller can support the touch-keys.
> Document the linux,keycodes property that enables those keys and
> specifies the keycodes that should be used to report the key events.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Applied, thank you.

-- 
Dmitry

