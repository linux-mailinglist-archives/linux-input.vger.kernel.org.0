Return-Path: <linux-input+bounces-352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD07FE1B4
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 22:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55A628257F
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 21:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB53C61683;
	Wed, 29 Nov 2023 21:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akXMV8uT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E142A10C0;
	Wed, 29 Nov 2023 13:20:05 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-285a64dcf3eso246985a91.1;
        Wed, 29 Nov 2023 13:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701292805; x=1701897605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRzm+EBY8lURs31kY2MOOY72V50zWEq0T4zxegoq0uI=;
        b=akXMV8uT68J1l0UwkXTe6tIUOeJAD9HnzFFsSdbKZ3UfOBJnJjvSoPR89UWNbx+7KU
         t3t1uSaIruVA1L6dqkwEaxZDwTHA0rh/iP2L+t04fRRKKp+hg/IFyPj/0j5xyLcGM3wB
         J1HeJlSY25qam3EN8oHf9F1ew4ustmz9trQwbuRnfqwNEmoNXYF1NPQjB3QY/02wi2at
         9tpPaP6x+PWI9UJIsVA/PYtZ1yFKdmR0EBv8d5MBau6YXEPIvsAWQLJt2etoJMLBM5Dy
         hX3shay+5RdLaX/f3maJzaseZ9yJ9hKkZZb7RahyhKSARMm0wUbPkRp4WVfkzhup4Env
         g/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701292805; x=1701897605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRzm+EBY8lURs31kY2MOOY72V50zWEq0T4zxegoq0uI=;
        b=BojSKmZygW7SaiX99imng+THTaHzW43KdW6timtosh77HnMMIBC/ErP0e/cdQBYcra
         aO2OGy3KbNODniyhSOa7g7u7YAnzNkbxgI8gQHkZVp5JxSOprDl+zICjl7/lGKI0cWB2
         K/r5/q/Joi3cpEy9uDe1W5s9qALeZQwu12TRL09AM2SfwWJ/fzZD/WgJcS5OwygIjTes
         0PHYdEbfnFXBu58Q7+4Y07WA8jtbKrF5shF9K/YYDWLCiLAgtIz/k+O6fEYx/4l+RnYf
         wxU8dRXMx3E4r3u1tborAKkthuvwvbxkCWuahWW0oiqn82UeM14yv8B64LNAg4BVG+Ig
         vL0g==
X-Gm-Message-State: AOJu0YyVzzbJFt7iZ9su1BPIkFHrM8/tCZ2RIsk2mR0l/0gL76LEPbiU
	HMY2C25ai3wUAksZDSllXMU=
X-Google-Smtp-Source: AGHT+IGIE4ijk3eHmnRzx35ZgI1veKT53AndkVUbNYATlXqAIeUX8alKZiZFLlbEiokkL4jkg+JZLw==
X-Received: by 2002:a17:90b:4a8c:b0:285:b8d2:cad4 with SMTP id lp12-20020a17090b4a8c00b00285b8d2cad4mr13229826pjb.17.1701292805224;
        Wed, 29 Nov 2023 13:20:05 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:64f2:7004:43e0:6095])
        by smtp.gmail.com with ESMTPSA id bk8-20020a17090b080800b00285a17f9da1sm1839436pjb.43.2023.11.29.13.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:20:04 -0800 (PST)
Date: Wed, 29 Nov 2023 13:20:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,pmic-keys: Drop incomplete
 example
Message-ID: <ZWerAi4CDFUz4Lk2@google.com>
References: <20231128214816.3975893-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128214816.3975893-1-robh@kernel.org>

On Tue, Nov 28, 2023 at 03:48:16PM -0600, Rob Herring wrote:
> The example for the Mediatek PMIC keys is incomplete as the binding is
> the full PMIC, not just the sub-functions. It is preferred for MFD
> examples to be complete in the top-level MFD device binding rather than
> piecemeal in each sub-function binding.
> 
> This also fixes an undocumented (by schema) compatible warning for
> "mediatek,mt6397".
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

